Received: from njpmail.satyam.com ([204.179.188.132])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOZez-0007ON-AG
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 07:15:55 -0400
Received: from blr.satyam.com (blr.satyam.com [208.220.245.73])
	by njpmail.satyam.com (8.11.6/8.11.6) with ESMTP id j3LB5uI30971
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2005 07:06:23 -0400
Received: from Disclaimerbng.corp.satyam.ad
	(IDENT:8blVZ8e0ffUXhedaR7sD17a38GjhEIPL@localhost [127.0.0.1])
	by blr.satyam.com (8.11.6/8.11.6) with ESMTP id j3LB7Nx31779
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2005 16:37:23 +0530
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Apr 2005 16:40:50 +0530
Message-ID: <D8595042F3765A4285B848A78A2C2ED1016149@bsdmsg002.corp.satyam.ad>
From: "Vikrant_Basotra" <Vikrant_Basotra@Satyam.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 File System Problem for ST MICRO ELECTRONICS FLASH
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,
My board has one 16-bit flash: ST M29W640DB.

M29W640DB (16 bit bus):=20

0x00000000-0x00700000 : "Root"
0x00700000-0x00720000 : "U-Boot Bootloader"
0x00720000-0x01000000 : "Linux Kernel"

When power on, Linux kernel boots from flash and print out info such as:
"
..............................................
PPP generic driver version 2.4.2
..............................................
EP8248 flash map (size->0x800000 mem->0xFF800000)
Amd/Fujitsu Extended Query Table v1.3 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
Creating 3 MTD partitions on "EP8248 flash memory":
0x00000000-0x00700000 : "Root"
0x00700000-0x00720000 : "U-Boot Bootloader"
0x00720000-0x01000000 : "Linux Kernel"

......................................
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060000: =
0x0020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004: =
0x22df instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006000c: =
0x0008 instead
Further such events for this erase block will not be printed
................................................................
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x003a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0000: =
0x0020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0004: =
0x22df instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c000c: =
0x0008 instead

Further such events for this erase block will not be printed
JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
....................................................................
....................................................................
"
In u-boot, I entered commands to display memory:
u-boot=3D> md 0xff000000=20
The magic number 0x1985 IS here!No 0x0020 exists at all!!=20

It's quite strange!! Why Linux detects 0x0020 instead?


Why U-boot can read the data on flash correctly while linux can't?

Why linux always read all data as 0x0020?

When I simply replace ST M29W640DB with AMD AM29DL640D (the two chips =
are=20
pin-to-pin compatible,) JFFS2 works very fine!

What's the problem? =20

I don't want to use AMD FLASH, can u suggest me what necessary changes =
are to be made in the code so that the ST M29W640DB Flash work,


Regards,
VB






















DISCLAIMER:
This email (including any attachments) is intended for the sole use of =
the intended recipient/s and may contain material that is CONFIDENTIAL =
AND PRIVATE COMPANY INFORMATION. Any review or reliance by others or =
copying or distribution or forwarding of any or all of the contents in =
this message is STRICTLY PROHIBITED. If you are not the intended =
recipient, please contact the sender by email and delete all copies; =
your cooperation in this regard is appreciated.
