Received: from securedesign.net ([216.99.200.242] helo=firewall.sdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14v4eq-00086M-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 22:59:40 +0100
Message-ID: <000f01c0d353$7c5d27c0$160aa8c0@gumby>
From: "Stephen Herzog" <mtd@sdesign.com>
To: <linux-mtd@lists.infradead.org>
Subject: DoC, NFTL, partitions
Date: Wed, 2 May 2001 15:01:48 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Greetings,

I am currently working on a project using a single DoC Millennium 8M=20
for boot, os, and data collection.  I currently have a system configured
with a single nftl filesystem, and then devided it into a 6M (OS) and 2M
(log file) partitions nftla1 and nftla2.  Both have ext2 file systems on
it.  Boot is achived by using the msystems bios and modified lilo.=20

My problem is this: the 2M log file partition gets corrupted with=20
unscheduled power down.=20

I have read a large amount of information and source code and one of=20
the best solution I have seen was suggested by dwmw2 at =20
http://mhonarc.axis.se/jffs-dev/msg00411.html  where I would place
two nftl filesystems on the DOC, and then use ext2 on the first,=20
and jffs on the second.=20

I have made a few attempts at this, however I am not succeeding=20
at it and decided to ask for some help. I am using kernel 2.4.3=20
with mtd-snapshot-20010430.tar.bz2=20

here are the steps I have taken thus far:

eraseall /dev/mtd0
  Erased 8192 Kibyte @ 0 -- 100% complete.

nftl_format /dev/mtd0 0 4194303
  Phase 1. Checking and erasing Erase Zones from 0x00000000 to =
0x003fffff
          Erasing Zone #510 @ 0x3fc000
  Phase 2.a Writing NFTL Media Header and Bad Unit Table
  Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
  Phase 3. Writing Unit Control Information to each Erase Unit

nftl_format /dev/mtd0 4194304 4194303
  Phase 1. Checking and erasing Erase Zones from 0x00400000 to =
0x007fffff
          Erasing Zone #1022 @ 0x7fc000
  Phase 2.a Writing NFTL Media Header and Bad Unit Table
  Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
  Phase 3. Writing Unit Control Information to each Erase Unit

I reboot now as I am not using modules.
On boot, I get the following:

  M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
  ...
  DiskOnChip Millennium found at address 0xD0000
  Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba =
TC58V64AFT/DC)
  1 flash chips found. Total DiskOnChip size: 8 Mbytes
  mtd: Giving out device 0 to DiskOnChip Millennium
  ...
  M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
  $Id: nftlcore.c,v 1.68 2001/03/26 15:44:47 dwmw2 Exp $
  NFTL_notify_add for DiskOnChip Millennium
  NFTL_setup
   nftla: unknown partition table
  Linux PCMCIA Card Services 3.1.22   =20

I was really wanting to see nftla AND nftlb here.   As an aside,=20
I can fdisk /dev/nftla and get a single 4M partition on /dev/nftla1
however I can't seem to find the other 4M of the chip.  From reading=20
the nftl kernel code, it sounds like it should scan then entire DoC=20
and find the two partitions, however that is not happening.=20

Can someone offer advice as to what I am doing wrong?

Also, any tips for getting jffs onto the nftl partition, I don't
seem to be having much luck there either.=20

Thanks in advance,

Steve Herzog
