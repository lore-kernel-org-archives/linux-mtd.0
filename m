Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11BhJ7-0002Kv-00
	for mtd@infradead.org; Tue, 3 Aug 1999 17:20:53 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11BhJ7-0003RK-00; Tue, 3 Aug 1999 17:20:53 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11BhJ7-0000sA-00; Tue, 3 Aug 1999 17:20:53 +0100
To: mtd@infradead.org
Subject: DiskOnChip test.
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-11831931130"
Date: Tue, 03 Aug 1999 17:20:53 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11BhJ7-0000sA-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_-11831931130
Content-Type: text/plain; charset=us-ascii

Please would anyone with a Disk-On-Chip compile and load the attached driver, 
then mail me back it's output, along with a note saying what size of 
Disk-On-Chip you have (and whether it's a 2000 or a Millennium.)

Alternatively, if you have any Disk-On-Chip hardware which isn't being used 
ATM, other than the 4Mb units of which I have two, just send them to me at the 
address below :)

Thanks.




--==_Exmh_-11831931130
Content-Type: text/plain ; name="doc-kernel.c"; charset=us-ascii
Content-Description: doc-kernel.c
Content-Disposition: attachment; filename="doc-kernel.c"


/* Linux driver for Disk-On-Chip 2000       */
/* (c) 1999 Machine Vision Holdings, Inc.   */
/* Author: David Woodhouse <dwmw2@mvhi.com> */
/* $Id: doc-kernel.c,v 1.2 1999/08/03 16:18:51 dwmw2 Exp $ */

#include <linux/kernel.h>
#include <linux/module.h>
#include <asm/errno.h>
#include <asm/io.h>
#include <asm/uaccess.h>
#include <linux/miscdevice.h>
#include <linux/pci.h>
#include <linux/delay.h>

#include <linux/sched.h>

#define DoC_CDSN_IO 0x800

#define DoC_ChipID 0x1000
#define DoC_DOCStatus 0x1001
#define DoC_DOCControl 0x1002
#define DoC_FloorSelect 0x1003
#define DoC_CSDNControl 0x1004
#define DoC_CSDNDeviceSelect 0x1005
#define DoC_ECCConf 0x1006

#define DoC_UnknownCheck 0x1007

#define DoC_CSDNSlowIO 0x100d
#define DoC_ECCSyndrome0 0x1010
#define DoC_ECCSyndrome1 0x1011
#define DoC_ECCSyndrome2 0x1012
#define DoC_ECCSyndrome3 0x1013
#define DoC_ECCSyndrome4 0x1014
#define DoC_ECCSyndrome5 0x1015
#define DoC_AliasResolution 0x101b
#define DoC_ConfigInput 0x101c
#define DoC_ReadPipeInit 0x101d
#define DoC_WritePipeTerm 0x101e
#define DoC_LastDataRead 0x101f
#define DoC_NOP 0x1020

#define DoC_IPLalias 0x1800

#define ReadDOC(adr, reg)      readb(((unsigned long)adr) + DoC_##reg)
#define WriteDOC(d, adr, reg)  writeb(d, ((unsigned long)adr) + DoC_##reg)

#define DOC_MODE_RESET 0
#define DOC_MODE_NORMAL 1
#define DOC_MODE_RESERVED1 2
#define DOC_MODE_RESERVED2 3

#define DOC_MODE_MDWREN 4
#define DOC_MODE_CLR_ERR 0x80

#define DOC_ChipID_Doc2k 0x20
#define DOC_ChipID_DocMil 0x30

#define CSDN_CTRL_FR_B 0x80
#define CSDN_CTRL_WP 8
#define CSDN_CTRL_ALE 4
#define CSDN_CTRL_CLE 2
#define CSDN_CTRL_CE 1

static ssize_t doc_read (struct file *filp, char *buf, size_t count, loff_t *ptr);
static ssize_t doc_write (struct file *file, const char *buf, size_t count, loff_t *ppos);
static int doc_release(struct inode *inode, struct file *file);
static int doc_open(struct inode *inode, struct file *filp);

struct file_operations doc_fops={
	NULL,      /* llseek */
	doc_read,        /* read */
	doc_write,       /* write */
	NULL,           /* readdir */
	NULL,           /* poll */
       	NULL,       /* ioctl */
       	NULL,           /* mmap */
	doc_open,        /* open */
	NULL,           /* flush */
	doc_release,     /* release */
	NULL            /* fsync */
};


struct miscdevice doc_miscdev={
  157,
  "doc",
  &doc_fops
}; 

#define DOCLOC 0xd8000

unsigned long docptr=0;
int doccheck(unsigned long potential);
void docidentify(unsigned long docptr, int chip);

static inline int DoC_WaitReady(unsigned long docptr) 
{
  unsigned long c=0;

  while (!(ReadDOC(docptr, CSDNControl) & CSDN_CTRL_FR_B) && --c)
    printk("Waiting\n");
  
  return (c!=0);
}

static inline int DoC_Command(unsigned long docptr, unsigned char command)
{
 	WriteDOC( /* Doc2000 driver used 0x1d but I don't know what the
		   0x10 bit does */
		 0x10 | CSDN_CTRL_WP | CSDN_CTRL_CLE | CSDN_CTRL_CE,
		 docptr, CSDNControl);

	if (DoC_WaitReady(docptr))
	    return 1;

	WriteDOC(command, docptr, IPLalias);
	//		WriteDOC(0x00, docptr, IPLalias);

	WriteDOC( 0x10 | CSDN_CTRL_WP | CSDN_CTRL_CE, docptr, CSDNControl);
	return DoC_WaitReady(docptr);
}

static inline int DoC_Address (unsigned long docptr, unsigned long ofs)
{
 	WriteDOC( /* Doc2000 driver used 0x1d but I don't know what the
		   0x10 bit does */
		 0x10 | CSDN_CTRL_WP | CSDN_CTRL_ALE | CSDN_CTRL_CE,
		 docptr, CSDNControl);

	if (DoC_WaitReady(docptr))
	    return 1;

	WriteDOC(ofs & 0xff, docptr, IPLalias);
	
	WriteDOC((ofs >> 8) & 0xff, docptr, IPLalias);

	WriteDOC((ofs >> 16) & 0xff, docptr, IPLalias);
	
	WriteDOC( 0x10 | CSDN_CTRL_WP | CSDN_CTRL_CE, docptr, CSDNControl);
	
	return DoC_WaitReady(docptr);
}

static inline int DoC_SelectChip(unsigned long docptr, int chip)
{
  WriteDOC( chip, docptr, CSDNDeviceSelect);
  return DoC_WaitReady(docptr);
}

int init_module(void)
{
  int status;
  
  docptr=(unsigned long)ioremap(0xd8000, 0x2000);
  
  status=doccheck(docptr);
  
  if (status)
    {
      printk("DOC found at 0x%lx\n",docptr);
      docidentify(docptr, 0);
      docidentify(docptr, 1);
      docidentify(docptr, 2);
      docidentify(docptr, 3);
      docidentify(docptr, 4);
      docidentify(docptr, 5);
      docidentify(docptr, 6);
      docidentify(docptr, 7);
      docidentify(docptr, 8);
      docidentify(docptr, 9);
      docidentify(docptr, 10);
      docidentify(docptr, 11);
      docidentify(docptr, 12);
      docidentify(docptr, 13);
      docidentify(docptr, 14);
      docidentify(docptr, 15);
      misc_register (&doc_miscdev); 
      return 0;
    }
  else
    {
      printk("DOC not found at 0x%lx\n", docptr);
      return -ENXIO;
    }
}

void cleanup_module(void)
{
  
  if (docptr)
    iounmap((void *)docptr);
  docptr = 0;
  misc_deregister (&doc_miscdev); 
}

int doccheck(unsigned long potential)
{
  unsigned long window=potential;
  unsigned char tmp, tmp2, ChipID;
  

  /* Routine copied from the Linux DOC driver */

  if (readb(window) != 0x55 || readb(window+1) != 0xaa)
    {
      printk ("Start of window not 0x55 0xaa: %2.2X %2.2X\n", 
	      (unsigned int)readb(window),(unsigned int)readb(window+1));
      return 0;
    }

  tmp2 = ReadDOC(window, DOCControl);
  
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_RESET, 
	   window, DOCControl);
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_RESET, 
	   window, DOCControl);
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_NORMAL, 
	   window, DOCControl);
  WriteDOC(DOC_MODE_CLR_ERR | DOC_MODE_MDWREN | DOC_MODE_NORMAL, 
	   window, DOCControl);
  
  ChipID = ReadDOC(window, ChipID);
  
  switch (ChipID) {
  case DOC_ChipID_Doc2k:
    printk("Disk-On-Chip 2000 (v1) found\n");

    tmp = ReadDOC(window, UnknownCheck) & 4;
    if ((ReadDOC(window, UnknownCheck) & 4) != tmp)
      {
	return 1;
      }
    break;

  case DOC_ChipID_DocMil:
    printk("Disk-On-Chip Millennium (v1) found\n");

    tmp = ReadDOC(window, ECCConf) & 4;
    if ((ReadDOC(window, ECCConf) & 4) != tmp)
      {
	return 1;
      }
    break;

  default:
    WriteDOC(tmp2, window, DOCControl);
    printk("Unrecognised device %2.2X: Family %d, Category %d, Version %d\n",
	   ChipID, ChipID >> 4,( ChipID >> 3) & 1, ChipID & 7);
    return 0;
  }

  printk("Failed TOGGLE test\n");
  WriteDOC(tmp2, window, DOCControl);
  return 0;
}   
  
void docidentify(unsigned long docptr, int chip)
{
  unsigned char mfr, id;

  DoC_SelectChip(docptr, chip);

  DoC_Command(docptr, 0x90);
  
  DoC_Address(docptr, 0);
  
  mfr = ReadDOC(docptr, IPLalias);
  id = ReadDOC(docptr, IPLalias);
  
  if (mfr != 0x98)
    {
      printk("Chip #%d: Unknown manufacturer 0x%2.2X, id %2.2X\n",chip, mfr, id);
      return;
    }
  
  switch (id) {
  case 0x6b: /* Toshiba TC5832DC */
    printk("Chip #%d: Toshiba TC5832DC\n", chip);
    return;
    
  default: 
    printk("Chip #%d: Unknown Toshiba (Chip ID 0x%2.2x)\n",
	   chip, id);
    return;
  }
	
}     

static ssize_t doc_read (struct file *filp, char *buf, size_t count, loff_t *ptr)
{
  size_t di;
  loff_t ofs = *ptr;
  di = 0;                                   
  
  for (ofs = *ptr; ofs < *ptr + count ; ofs++)
    {
      if (!(ofs & 0xf)) {                     
	

	// Tell the thing to latch the address we give it (ALE)

	WriteDOC( /* Doc2000 driver used 0x1d but I don't know what the
		   0x10 bit does */
		 0x10 | CSDN_CTRL_WP | CSDN_CTRL_ALE | CSDN_CTRL_CE,
		 docptr, CSDNControl);

	// NOP? This should do nothing according to the spec.
	//WriteDOC( 1 + ReadDOC(docptr, ChipID), docptr, ChipID);
	DoC_WaitReady(docptr);

	// The Doc2000 driver does both of these. I don't know why. On the
	// Doc2000, only the IPLalias one appears to be needed. 

	// WriteDOC( ofs & 0xff, docptr, CDSN_Slow_IO);
	WriteDOC(ofs & 0xff, docptr, IPLalias);
	
	// WriteDOC( (ofs >> 8) & 0xff, docptr, CDSN_Slow_IO);
	WriteDOC((ofs >> 8) & 0xff, docptr, IPLalias);

	// WriteDOC( (ofs >> 16) & 0xff, docptr, CDSN_Slow_IO);
	WriteDOC((ofs >> 16) & 0xff, docptr, IPLalias);

	// WriteDOC( (ofs >> 24) & 0xff, docptr, CDSN_Slow_IO);
	//WriteDOC((ofs >> 24) & 0xff, docptr, IPLalias);
	

	/* What does the 0x10 bit do? */
	WriteDOC( 0x10 | CSDN_CTRL_WP | CSDN_CTRL_CE, docptr, CSDNControl);

	// NOP? This should do nothing according to the spec.
	WriteDOC( ReadDOC(docptr, ChipID), docptr, ChipID);
	DoC_WaitReady(docptr);

	//	(void)ReadDOC(docptr, CSDNControl);
	
      }

      //(void)readb(docptr + 0x100d);
      buf[di++] = ReadDOC(docptr, IPLalias);
    }
  
  *ptr = ofs;

  return count;
}

static ssize_t doc_write (struct file *file, const char *buf, size_t count, loff_t *ppos)
{
  return -EIO;
}


static int doc_release(struct inode *inode, struct file *file)
{
  return 0;
}

static int doc_open(struct inode *inode, struct file *filp)
{
  return 0;
}





























--==_Exmh_-11831931130
Content-Type: text/plain; charset=us-ascii

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.

--==_Exmh_-11831931130--




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
