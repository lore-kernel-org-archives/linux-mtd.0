Received: from [203.125.206.118] (helo=exchangeserver.smartbridges.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aq7T7-0001rw-N9
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2004 09:12:42 +0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
content-class: urn:content-classes:message
Date: Mon, 9 Feb 2004 17:14:03 +0800
Message-ID: <B2221ABD2C9465418B330C8EB8A8F8262E72B7@exchangeserver.smartbridges.com>
From: "Munro Biswal" <munro.biswal@smartbridges.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: MTD compilation problem with mtd.h
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Ppl,

Iam a MTD newbie.
Iam facing this strange problem while compiling my own code in the util =
directory of MTD.The compilation of my file which looks like this:

#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
//#include <upgradeflash.h>
#include "upgradeflash.h"
#include <linux/mtd/mtd.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <stdarg.h>
#include <string.h>


/* GLobal FIle & Device Desc */
static int FileDesc =3D -1, DeviceDesc =3D -1;=20

/*
static void PrintLog (u32 Debuglevel,const u8 * fmt,...)
{
   FILE *fp =3D Debuglevel =3D=3D LOG_NORMAL ? stdout : stderr;=09
   va_list ap;
}  =20
*/   =20

void write_to_flash(u8 * Devicename,u8 * Filename)
{
   int i ,written ;

   /* Size of file in bytes */
   int size ;

   /* Return value for a single  read */
   ssize_t Result;
  =20
   /* Mtd and file device structs */
   struct mtd_info_user  Mtd;
   struct stat Filestat;

   /* Buffer for reading */
   u8 buf[BUFSIZE];

   /* Open MTD device for writing */
   DeviceDesc =3D open(Devicename,O_RDWR|O_SYNC);
   if (ioctl (DeviceDesc,MEMGETINFO,&Mtd) < 0)=20
   {
        printf("ioctl():Not a valid MTD device \n");
	      exit (0);
   }

   /* Open file for reading */=20
   FileDesc =3D open(Devicename,O_RDONLY);
  =20
   if (fstat (FileDesc, &Filestat) < 0)
   {
           printf(" ERROR While trying to get the file status of %s =
\n",Filename);
           exit (0);
   }

  =20
  /* Does it fit into the device/partition? */
  if (Filestat.st_size > Mtd.size)
  {
      printf ("\nERROR won't fit into it!\n");
      exit (0);
  }

  /* Start writing into  the MTD */
   size =3D Filestat.st_size;
   i =3D BUFSIZE;
   written =3D 0;
  =20
   while (size)
   {
		if (size < BUFSIZE)=20
		   i =3D size;
=09
		/* Read from filename */
		read (FileDesc, buf, i);

		/* Write to device */
		Result =3D write (DeviceDesc,buf,i);
	=09
		if ( i !=3D Result)
		  {
		=09
			  if ( i !=3D Result)=20
			  {
			       printf ("written %d into %s ",written + i,Devicename);
			       exit (0);
			   }
			   printf ( " Writing to  %d bytes written to %s\n",  written + i, =
Devicename);
			   exit (0);
		  }

		written +=3D i;
		size -=3D i;
	 }
}=20
=20

void copyallbin(void)
{
   system("cp -av /usr/* /tmp  ");
   system("cp -av /bin/* /tmp  ");
}

=09
int main (int argc,char *argv [])
{
 /* File name and device name eg /dev/mtd1 etc*/
 u8 * Devicename , * Filename;
 u8 * Updatepath =3D "/update";

 system (" KERNEL_DEVICE =3D /dev/mtd2 ");
 system (" JFFS_DEVICE =3D /dev/mtd3 ");
 system (" mkdir -p /var/tmp ");
 system (" ln -s /var/tmp/ /tmp ");
 system (" mount -t tmpfs tmpfs /var -o size=3D512k ");=20
 =20
 /* Copy all the necessary binaries to tmpfs ; */
 copyallbin();

/*  if (!(dir =3D opendir(Updatepath)))
 {
    perror("opendir");
    fprintf(stderr, "Opendir() failed! (%s)\n", path);
    exit(1);
 }
=20
 chdir(dir);
*/

 chdir ("/update ");
 /* Main routine  for  updating the kernel & filesystem() */
=20
 while(1)
 {
   /* Interrupt */
   usleep(TIME_TO_WAIT);=20
   system (" find / -name *.tgz -exec tar -zxvf ;rm -rf *.tgz ");
   strcpy (Filename, argv[0]);
   strcpy (Devicename, argv[1]);
   /* Check for the consistency of the tar file */
   /*******TBD ****************/

   system(" eraseall $KERNEL_DEVICE ");
   system(" eraseall $FS_DEVICE ");

   /* write to destined partitions : FIlename could be jffs2 image or =
the kernel img*/
  =20
   write_to_flash(Devicename, Filename);
  =20
   /* Finally mount the root filesystem as jffs2 */
=20
 } =20
 return 0;
} =20




gcc -I../include -O2 -Wall -Wstrict-prototypes -Wshadow   -c -o =
upgradeflash.o upgradeflash.c
In file included from upgradeflash.c:11:
../include/linux/mtd/mtd.h:25: warning: useless keyword or type name in =
empty declaration
../include/linux/mtd/mtd.h:25: two types specified in one empty =
declaration
  =20

>>Iam using the arm-linu-gcc  cross compiler.

Any help wld be greatly appreciated.

Regds,
Munro

-----Original Message-----
From:	linux-mtd-bounces@lists.infradead.org on behalf of =
linux-mtd-request@lists.infradead.org
Sent:	Sun 2/8/2004 8:00 PM
To:	linux-mtd@lists.infradead.org
Cc:=09
Subject:	linux-mtd Digest, Vol 11, Issue 8
Send linux-mtd mailing list submissions to
	linux-mtd@lists.infradead.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.infradead.org/mailman/listinfo/linux-mtd
or, via email, send a message with subject or body 'help' to
	linux-mtd-request@lists.infradead.org

You can reach the person managing the list at
	linux-mtd-owner@lists.infradead.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-mtd digest..."


Today's Topics:

   1. Re: JFFS2 NAND support - Mount failure on "good" filesystem
      (Thomas Gleixner)
   2. Re: JFFS2 corruption (David Woodhouse)
   3. Re: JFFS2 corruption (David Woodhouse)
   4. Re: JFFS2 corruption (Florian Schirmer)
   5. Re: JFFS2 corruption (David Woodhouse)


----------------------------------------------------------------------

Message: 1
Date: Sun, 08 Feb 2004 09:58:58 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 NAND support - Mount failure on "good" filesystem
To: Joshua Wise <joshua@joshuawise.com>, linux-mtd@lists.infradead.org
Message-ID: <200402080958.58584.tglx@linutronix.de>
Content-Type: text/plain; charset=3Diso-8859-1

On Sunday 08 February 2004 07:13, Joshua Wise wrote:
> Hi all,
>
> I am trying to get NAND flash working on the ipaq h1910.
>
> <7>jffs2_get_sb(): dev_name "/dev/mtdblock/1"
> <7>jffs2_get_sb(): path_lookup() returned 0, inode c9f411c0
> <7>jffs2_get_sb_mtd(): New superblock for device 1 ("h1910 NAND =
Flash")
> <7>JFFS2 using software ECC
> <7>Allocating readbuf of 16384 bytes
> <7>jffs2_scan_eraseblock(): Scanning block at 0x0
> <4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00000000, =
fail
> count:175 <5>JFFS2: Erase block at 0x00000000 is not formatted. It =
will be
> erased <7>jffs2_scan_eraseblock(): Scanning block at 0x4000
> <4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00004000, =
fail
> count:0 <5>JFFS2: Erase block at 0x00004000 is not formatted. It will =
be

Seems like you managed to corrupt the OOB area, as all your blocks are =
marked=20
as bad. Your programming algorithm has to take care of the OOB data !
There are some slightly outdated docs on linux-mtd.infradead.org

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de



------------------------------

Message: 2
Date: Sun, 08 Feb 2004 10:37:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 corruption
To: Florian Schirmer <jolt@tuxbox.org>
Cc: linux-mtd@lists.infradead.org
Message-ID: <1076236627.12587.212.camel@imladris.demon.co.uk>
Content-Type: text/plain

On Thu, 2004-02-05 at 14:15 +0100, Florian Schirmer wrote:
> Hi,
>=20
> i'm having a strange problem with a JFFS2 filesystem: I always get =
messages
> about incorrect CRC values while mounting the filesystem. What i did:

Please set CONFIG_JFFS2_FS_DEBUG=3D1, then reproduce this with full
logging -- you'll need to do it over a serial console to make sure you
catch everything.

--=20
dwmw2




------------------------------

Message: 3
Date: Sun, 08 Feb 2004 11:28:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 corruption
To: Florian Schirmer <jolt@tuxbox.org>
Cc: linux-mtd@lists.infradead.org
Message-ID: <1076239710.12587.231.camel@imladris.demon.co.uk>
Content-Type: text/plain

On Thu, 2004-02-05 at 14:15 +0100, Florian Schirmer wrote:
> i'm having a strange problem with a JFFS2 filesystem: I always get =
messages
> about incorrect CRC values while mounting the filesystem. What i did:

Also apply this.

Index: fs/jffs2/write.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/fs/jffs2/write.c,v
retrieving revision 1.80
diff -u -p -r1.80 write.c
--- fs/jffs2/write.c	27 Jan 2004 13:21:50 -0000	1.80
+++ fs/jffs2/write.c	8 Feb 2004 11:29:14 -0000
@@ -97,6 +97,12 @@ struct jffs2_full_dnode *jffs2_write_dno
 	int retried =3D 0;
 	unsigned long cnt =3D 2;
=20
+	if (data && datalen &&=20
+	    (je32_to_cpu(ri->data_crc) !=3D crc32(0, data, datalen))) {
+		    printk(KERN_CRIT "Eep. Data CRC not correct in =
jffs2_write_dnode()\n");
+		    BUG();
+	}
+
 	D1(if(je32_to_cpu(ri->hdr_crc) !=3D crc32(0, ri, sizeof(struct =
jffs2_unknown_node)-4)) {
 		printk(KERN_CRIT "Eep. CRC not correct in jffs2_write_dnode()\n");
 		BUG();

--=20
dwmw2




------------------------------

Message: 4
Date: Sun, 8 Feb 2004 12:38:44 +0100
From: Florian Schirmer <jolt@tuxbox.org>
Subject: Re: JFFS2 corruption
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Message-ID: <200402081238.45099.jolt@tuxbox.org>
Content-Type: text/plain;  charset=3D"utf-8"

Hi,

> > i'm having a strange problem with a JFFS2 filesystem: I always get
> > messages about incorrect CRC values while mounting the filesystem. =
What i
> > did:
>
> Please set CONFIG_JFFS2_FS_DEBUG=3D1, then reproduce this with full
> logging -- you'll need to do it over a serial console to make sure you
> catch everything.

Thanks for your suggestion. I'm a little bit further finding this =
problem. It=20
turns out to be a cmdset2 issue and not a jffs2 problem. I'm still =
digging=20
what is going on.

What i've got so far is: jffs2_read_flash returns bogous data. In the =
case of=20
a bad crc the last odd byte is wrong. Looks like a byte access instead =
of a=20
word access. (Buswidth of the flash: 2)  If you look at this:

<7>Node at 000bfbd4 (0) is a data node
<7>version 269, highest_version now 274
<4>crc'ing unpointed
<4>Node data dump (66 bytes)
<4>0x0000: 0x78 (0x78)
<4>0x0001: 0x5E (0x5E)
<4>0x0002: 0x72 (0x72)
<4>0x0003: 0x72 (0x72)
<4>0x0004: 0x1A (0x1A)
<4>0x0005: 0x05 (0x05)
<4>0x0006: 0xA3 (0xA3)
<4>0x0007: 0x21 (0x21)
<4>0x0008: 0x30 (0x30)
<4>0x0009: 0x1A (0x1A)
<4>0x000A: 0x02 (0x02)
<4>0x000B: 0xC3 (0xC3)
<4>0x000C: 0x31 (0x31)
<4>0x000D: 0x04 (0x04)
<4>0x000E: 0x00 (0x00)
<4>0x000F: 0x02 (0x02)
<4>0x0010: 0x68 (0x68)
<4>0x0011: 0xD4 (0xD4)
<4>0x0012: 0x4F (0x4F)
<4>0x0013: 0xA3 (0xA3)
<4>0x0014: 0x21 (0x21)
<4>0x0015: 0x30 (0x30)
<4>0x0016: 0x1A (0x1A)
<4>0x0017: 0x02 (0x02)
<4>0x0018: 0xC3 (0xC3)
<4>0x0019: 0x23 (0x23)
<4>0x001A: 0x04 (0x04)
<4>0x001B: 0x00 (0x00)
<4>0x001C: 0x02 (0x02)
<4>0x001D: 0x68 (0x68)
<4>0x001E: 0xD4 (0xD4)
<4>0x001F: 0x17 (0x17)
<4>0x0020: 0xA3 (0xA3)
<4>0x0021: 0x21 (0x21)
<4>0x0022: 0x30 (0x30)
<4>0x0023: 0x1A (0x1A)
<4>0x0024: 0x02 (0x02)
<4>0x0025: 0x43 (0x43)
<4>0x0026: 0x36 (0x36)
<4>0x0027: 0x04 (0x04)
<4>0x0028: 0x00 (0x00)
<4>0x0029: 0x02 (0x02)
<4>0x002A: 0x68 (0x68)
<4>0x002B: 0xD4 (0xD4)
<4>0x002C: 0xE1 (0xE1)
<4>0x002D: 0xA3 (0xA3)
<4>0x002E: 0x21 (0x21)
<4>0x002F: 0x30 (0x30)
<4>0x0030: 0x1A (0x1A)
<4>0x0031: 0x02 (0x02)
<4>0x0032: 0x43 (0x43)
<4>0x0033: 0x29 (0x29)
<4>0x0034: 0x04 (0x04)
<4>0x0035: 0x00 (0x00)
<4>0x0036: 0x02 (0x02)
<4>0x0037: 0x68 (0x68)
<4>0x0038: 0x84 (0x84)
<4>0x0039: 0xB8 (0xB8)
<4>0x003A: 0x15 (0x15)
<4>0x003B: 0x20 (0x20)
<4>0x003C: 0xC0 (0xC0)
<4>0x003D: 0x00 (0x00)
<4>0x003E: 0x0F (0x0F)
<4>0x003F: 0x3C (0x3C)
<4>0x0040: 0x20 (0x20)
<4>0x0041: 0x20 (0x3D)
<5>jffs2_get_inode_nodes(): Data CRC failed on node at 0x000bfbd4: Read=20
0xc073b413, calculated 0xa375d8ca
<7>Obsoleting previously unchecked node at 0x000bfbd4 of len 88: =
Dirtying

you will see that the last byte (offset 0x41) mirrors byte at offset =
0x40. So=20
i suspect a bug in the cmdset2 driver here. The third value is the value =

received by directly accessing the flash using the memory address and is =

always correct. If the node data size is odd then the 2nd byte from =
behind is=20
affected:

<4>0x002F: 0x0F (0x0F)
<4>0x0030: 0x3C (0x3C)
<4>0x0031: 0x3C (0x20)
<4>0x0032: 0x3D (0x3D)

Am still collecting patterns to determine wether it is really a bug in =
the mtd=20
core or just a cache issue or whatever.

BTW: Is %zd a leagal printk formatting tag? Doesn't seem to work for me. =
I can=20
commit a fix (removing the z) for that if you want.

Regards,
   Florian


------------------------------

Message: 5
Date: Sun, 08 Feb 2004 11:53:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 corruption
To: Florian Schirmer <jolt@tuxbox.org>
Cc: linux-mtd@lists.infradead.org
Message-ID: <1076241213.12587.240.camel@imladris.demon.co.uk>
Content-Type: text/plain

On Sun, 2004-02-08 at 12:38 +0100, Florian Schirmer wrote:
> Hi,
>=20
> > > i'm having a strange problem with a JFFS2 filesystem: I always get
> > > messages about incorrect CRC values while mounting the filesystem. =
What i
> > > did:
> >
> > Please set CONFIG_JFFS2_FS_DEBUG=3D1, then reproduce this with full
> > logging -- you'll need to do it over a serial console to make sure =
you
> > catch everything.
>=20
> Thanks for your suggestion. I'm a little bit further finding this =
problem. It=20
> turns out to be a cmdset2 issue and not a jffs2 problem. I'm still =
digging=20
> what is going on.
>=20
> What i've got so far is: jffs2_read_flash returns bogous data. In the =
case of=20
> a bad crc the last odd byte is wrong. Looks like a byte access instead =
of a=20
> word access. (Buswidth of the flash: 2)  If you look at this:

Interesting. That would be a problem in map_copy_from(), which is either
just memcpy_fromio() or a function provided by your map driver,
depending on whether you have CONFIG_MTD_COMPLEX_MAPPINGS enabled.

Can you check what memcpy_fromio() does directly? Try changing the
definition of map_copy_from() in include/linux/mtd/map.h or
drivers/mtd/maps/map_funcs.c or your map driver (depending on your
configuration) to copy a byte at a time, and see if that fixes it.

The '%zd' modifier is the correct way to print a size_t; the old %Z was
a gcc-ism. It's supported by the 2.6 and I thought also the current 2.4
kernels; what kernel are you using, precisely? It's a trivial patch to
add it.

--=20
dwmw2




------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 11, Issue 8
****************************************
