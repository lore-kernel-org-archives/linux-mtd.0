Received: from smtp3.libero.it ([193.70.192.127])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AywiO-0006aJ-VF
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2004 17:32:57 +0000
Received: from libero.it (172.16.1.85) by smtp3.libero.it (7.0.020-DD01)
	id 3F6F068F014881E6 for linux-mtd@lists.infradead.org;
	Thu, 4 Mar 2004 18:32:35 +0100
Date: Thu,  4 Mar 2004 18:32:35 +0100
Message-Id: <HU2BEB$839CA61AFA93D23CBF7FA3E2A6E3971F@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "federico_ts\@libero\.it" <federico_ts@libero.it>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: Unknown flash chip found
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I try to use a DiskOnChip 2000 (24MB) in a PC-104 board, =0D
=
working with kernel version 2.4.25, but I have some problems.

I format=
ted the DOC with doc514.exb at address e800,
so I compiled my kernel wit=
h MTD and NFTL support built-in.
After booting I have added the followin=
g links:

  mknod /dev/nftla b 93 0
  mknod /dev/nftla1 b 93 1  
  mk=
nod /dev/nftla2 b 93 2

Here's the dmesg:

Using configured DiskOnChi=
p probe address 0xe8000
DiskOnChip 2000 found at address 0xE8000
Flash =
chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba:NAND 8MB 3,3V)
Fla=
sh chip at floor 1, chip 0 is different:
Unknown flash chip found: F9 F9=

Please report to dwmw2@infradead.org
Flash chip at floor 2, chip 0 is =
different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infra=
dead.org
Flash chip at floor 3, chip 0 is different:
Unknown flash chip=
 found: F9 F9
Please report to dwmw2@infradead.org
3 flash chips found.=
 Total DiskOnChip size: 24 MiB
mtd: Giving out device 0 to DiskOnChip 20=
00
$Id: ftl.c,v 1.45 2003/01/24 23:31:27 dwmw2 Exp $
ftl_cs: FTL header=
 not found.
NFTL driver: nftlcore.c $Revision: 1.87 $, nftlmount.c $Revi=
sion: 1.31 $
NFTL: UnitSizeFactor 0x00 detected. This violates the spec =
but we think we know
what it means...
Cannot calculate an NFTL geometry=
 to match size of 0xbb70.
Using C:999 H:16 S:3 (=3D=3D 0xbb50 sects)
nf=
tla: unknown partition table

cat /proc/mtd:
  dev:    size   erasesiz=
e  name
  mtd0: 01800000 00002000 "DiskOnChip 2000"

So I'm not able t=
o mount the DoC or create partitions.
Any ideas?


Thank you in advan=
ce

Federico
