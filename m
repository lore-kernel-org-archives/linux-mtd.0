Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10mK6T-0001FD-00
	for mtd@imladris.demon.co.uk; Tue, 25 May 1999 17:30:57 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Tue, 25 May 1999 17:30:57 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 927649794:20:13110:3; Tue, 25 May 99 16:29:54 GMT
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@imladris.demon.co.uk
	id 10mJxs-0008NP-00; Tue, 25 May 1999 17:22:04 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@imladris.demon.co.uk
	id 10mJxs-0006eb-00; Tue, 25 May 1999 17:22:04 +0100
To: mtd@imladris.demon.co.uk
Subject: Large Disk-On-Chip devices.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 May 1999 17:22:04 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10mJxs-0006eb-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

It occurs to me that the larger Disk-On-Chip devices have an address space 
larger than 24 bits.

Could anyone with a DoC2000 larger than 16Mb please either send it to me or 
try the following driver with varying values for the SELECT_FLOOR and 
SELECT_CHIP macros at about line 120/121?


Make a character device with major 10, minor 157, and use dd to read some data
from the device, and see what it looks like.

The beginning of the first chip should look something like...

0000000 353   -   U 252   ` 037 020  \0 016   s 001  \n   S   P   L   _
0000020   f   o   r   _   D   O   C   _   2   0   0   0       (   c   )
0000040   1   9   9   8       M   -   s   y   s   t   e   m   s  \0   U
0000060 213 354   P   S   Q   R   V   W 036 006 234 016 037 213   F 004


#include <linux/kernel.h>
#include <linux/module.h>
#include <asm/errno.h>
#include <asm/io.h>
#include <asm/uaccess.h>
#include <linux/miscdevice.h>
#include <linux/pci.h>
#include <linux/delay.h>

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

int init_module(void)
{
  int status;
  
  docptr=(unsigned long)ioremap(0xd8000, 0x2000);
  
  status=doccheck(docptr);
  
  if (status)
    {
      printk("DOC found at 0x%lx\n",docptr);
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
  unsigned char tmp, tmp2;
  

  /* Routine copied from the Linux DOC driver */

  if (readb(window) != 0x55 || readb(window+1) != 0xaa)
    {
      printk ("Start of window not 0x55 0xaa: %2.2X %2.2X\n", (unsigned int)readb(window),(unsigned int)readb(window+1));
      return 0;
    }

  tmp2 = readb(window+0x1002);
  
  writeb(0x84, window+0x1002);
  writeb(0x84, window+0x1002);
  writeb(0x85, window+0x1002);
  writeb(0x85, window+0x1002);
  
  if (readb(window+0x1000) != 0x20)
    {
      writeb(tmp2, window+0x1002);
      return 0;
    }
  
  tmp = readb(window+0x1007) & 4;
  
  if ((readb(window+0x1007) & 4) != tmp)
    {
      return 1;
    }
  
  writeb(tmp2, window+0x1002);
  return 0;
}     

#define SELECT_FLOOR(x) writeb(x,docptr + 0x1003)
#define SELECT_CHIP(x) writeb(x,docptr + 0x1005)

static ssize_t doc_read (struct file *filp, char *buf, size_t count, loff_t *ptr)
{
  size_t di;
  loff_t ofs = *ptr;
  
  di = 0;                                   
  
  // SELECT_FLOOR(0);
  // SELECT_CHIP(0);

  for (ofs = *ptr; ofs < *ptr + count ; ofs++)
    {
      if (!(ofs & 0xf)) {                     
	
	writeb(0x1d, docptr+ 0x1004);              // Set to 'set address' mode?
	writew( 1+ readw(docptr + 0x1000), docptr + 0x1000);

	//writeb( ofs & 0xff, docptr+ 0x100d);
	writeb( ofs & 0xff, docptr+ 0x1800);
	
	//writeb( (ofs >> 8) & 0xff, docptr + 0x100d);
	writeb( (ofs >> 8) & 0xff, docptr + 0x1800);
	
	//writeb( (ofs >> 16) & 0xff, docptr + 0x100d);
	writeb( (ofs >> 16) & 0xff, docptr + 0x1800);
	
	writeb ( 0x19, docptr + 0x1004);           // Set to 'read' mode?
	writew( 1 + readw(docptr + 0x1000), docptr + 0x1000);   

	while ( !(readb(docptr + 0x1004) & 80) ) 
	  printk("waiting...\n");      // Wait for ack?
	(void)readw(docptr + 0x1004);
	
	/* The while() loop above never actually seems to wait.
	   We need this udelay() to get consistent results. */

	udelay(5);
      }

      //(void)readb(docptr + 0x100d);
      buf[di++] = readb(docptr + 0x1800);
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



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
