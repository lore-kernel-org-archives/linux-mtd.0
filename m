Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12PYNb-0003pk-00
	for mtd-list@infradead.org; Mon, 28 Feb 2000 22:11:03 +0000
Received: from mailgate1.uea.ac.uk ([139.222.230.1])
	by infradead.org with smtp (Exim 3.03 #1)
	id 12PYNY-0003pe-00
	for mtd@infradead.org; Mon, 28 Feb 2000 22:11:00 +0000
Date: Mon, 28 Feb 2000 22:10:49 +0000 (GMT)
From: wbh <W.B.Hill@uea.ac.uk>
To: Dvir Oren <dvir@lucidvon.com>
cc: MTD <mtd@infradead.org>
Subject: RE: Request for kernel with DOC2000
In-Reply-To: <E12O8SI-00023T-00@infradead.org>
Message-ID: <Pine.OSF.4.05.10002282110390.18617-100000@cpca7.uea.ac.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 25 Feb 2000, Dvir Oren wrote:

> If you could please post a patch with whatever you added to the 
> kernel, and whatever you changed in the MTD files (if at all), it 
> could be extremely helpful.
OK - I'm using an Advantech board, so 486-based with a DOC2000.
What I did:
	cd /usr/src
	mv linux linux.orig
	tar Ixvf ~/minimpg/linux-2.0.38.tar.bz2
	cd linux
	unzip ~/minimpg/doclinux_2_0_x_1_21.zip
	tar zxvf driver.tgz
	cat tmp/doc-driver/doc-patch-2.0.35 | patch -p0
	cp usr/src/linux/drivers/block/flash_doc/*  drivers/block/flash_doc/
	# Ensure "M-Systems DiskOnChip" is selected :-)
	# IE CONFIG_BLK_DEV_GENERIC_FLASH_DOC=y
	cd drivers/block/flash_doc
	CC=/usr/bin/gcc272 make
	cd ../../..
	vim Makefile
	# Alter line: CC=$(CROSS_COMPILE)gcc -D__KERNEL__ -I$(HPATH)
	# To CC=$(CROSS_COMPILE)gcc272 -D__KERNEL__ -I$(HPATH)
	make zImage
	cat arch/i386/kernel/zImage > /dev/fd0
	# Stand well back :-)
	
---------------\--------------------------\--------------------------------
W.B.Hill        \  Email: wbh@uea.ac.uk    \                               
492 Earlham Road \  Home: (+44) 1603 455069 \    "Nothing is idiot-proof   
Norwich  NR4 7HP. \  Fax: 0870 054 7508      \    given the right idiot"   
United Kingdom     \  Mobile: 0410 781584     \                           
(+44) 1603 255141   \  Web: http://wbh.org     \ #include <stdisclaimer.h>
---------------------\--------------------------\--------------------------
PGP-Fingerprint:    B3 6F 2E D6 - B6 48 F1 FB -*- 7C AA 28 0C - 96 61 9A B5



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
