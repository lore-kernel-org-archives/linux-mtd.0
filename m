Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aWVq-0005ae-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 05:29:26 +0000
Received: from shell9.ba.best.com ([206.184.139.140] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aWVo-0005aY-00
	for mtd@infradead.org; Wed, 07 Mar 2001 05:29:24 +0000
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200103070528.VAA21767@shell9.ba.best.com>
Subject: JFFS on a powerpc platform.
To: mtd@infradead.org, subodh@best.com, jffs-dev@axis.com
Date: Tue, 6 Mar 2001 21:28:37 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hello,

Question I have is -- has anyone tested JFFS on powerpc platform.

I have retrieved the latest mtd code from CVS repository and 
the data read back from flash is not "correct".

The platform I am running on MPC860 based board having
intel flash  which mtd is able to recognize correctly.

Here are messages during the boot to indicate that cfi probe has
detected the flash. 

JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
physmap.c physmap flash device: size 400000 at address 28000000
cfi_probe_new_chip map->buswidth 4
Custom flash device: Found 2 x16 CFI devices at location 0 in 16 bit mode
JEDEC ID: B0 D0

The /proc/mtd shows following output which matches the partition table I
have setup.

sh-2.04# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "Custom flash device"
mtd1: 00080000 00020000 "Bootrom Area"
mtd2: 00040000 00020000 "Custom Flash Bank #2 2x128KB"
mtd3: 00040000 00020000 "Custom Flash Bank #2 2x128KB"
mtd4: 00300000 00020000 "Custom Flash left overs from 4MB Flash" 

Now I execute command  and I see the following output
 
	mount -t jffs /dev/mtdblock4 /tmp/jffs

	cp /etc/inetd.conf /tmp/jffs/inetd.conf

	sh-2.04# cp /etc/inetd.conf /tmp/jffs
	sh-2.04# ls -l /etc/inetd.conf /tmp/jffs
	-rw-r-xr--   1 root     root         2880 Jan 10  2001 /etc/inetd.conf

	/tmp/jffs:
	total 3
	-rw-r-xr--   1 root     root         2880 Dec 31 16:05 inetd.conf  

However if I try to see contents of this /tmp/jffs/inetd.conf I see 
following output instead of my inetd.conf, 


sh-2.04# more /tmp/jffs/inetd.conf
#
#tenioc.dT      fn sihelifsed birct ses ehivre sectahtliw eb lava bali#
elht            guorht hNI e DTE/PCTs PIrepures .revoT  -er fnocrugi    #
eeht    nur gninENI p DTecor ,sstideiht if s ,elnehtnes ht d    #
eENI    p DTecora ssGIS  PUHngis

Also now if I reboot the system and remount the device /dev/mtdblock4 I 
don't see the file inetd.conf, what am I doing wrong?

/Subodh Nijsure


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
