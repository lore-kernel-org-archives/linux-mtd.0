Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mfYu-0007gw-00
	for mtd-list@infradead.org; Mon, 09 Apr 2001 18:34:48 +0100
Received: from [63.229.30.68] (helo=seven.phocussystems.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mfYs-0007gq-00
	for mtd@infradead.org; Mon, 09 Apr 2001 18:34:47 +0100
Subject: DOC 2000 Boot Problem
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Apr 2001 10:36:36 -0700
Message-ID: <271FF2B6A3F203418C76438C8A5FDF871992@seven.phocussystems.com>
content-class: urn:content-classes:message
From: "Chris Robson" <robsonc@phocussystems.com>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Are there any issues w/ using a 8MB Disk on Chip 2000 (PN D2200-D08).
I installed Kernel 2.4.3 w/ the MTD image from April 5.  And when the
system boots from the DOC, I see two things:

	During the detection of something at the very start of the
kernel, there is garbage displayed on the 	screen. =20

	When the kernel is done booting, and it goes to mount root as
/dev/nftla1 it says

	"VFS: Cannot open root device "" or 03:05
	Please append a correct "root=3D" boot option
	Kernel panic:  VFS: Unable to mount root fs on 03:05


Now If I take that SAME kernel image, and install on Hard drive I have
attached to the system, boot off of that, and set root to /dev/nftla1.
It boots just fine. =20

	The only other difference is the DOC uses the lilo that comes
with the MTD image, the hard drive uses the lilo that came with my
distribution. Because the one that comes with my distribution does
recognize the DOC. =20

Right now I'm trying to determined if it is hardware or software that is
my problem.  Has anyone else see anything like this.


Chris


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
