Received: from aboulogne-111-1-1-87.abo.wanadoo.fr ([80.11.223.87] helo=ns.nexgen-private)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LktN-0006DU-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 13:57:46 +0000
Received: from david (david.nexgen-private [10.1.17.1])
	by ns.nexgen-private (8.10.2/8.10.2) with SMTP id gBAFVCu04466
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 16:31:12 +0100
Message-ID: <001201c2a059$27471aa0$0111010a@nexgenprivate>
From: "David Girault" <david@nexgen-software.fr>
To: "Liste Linux Mtd" <linux-mtd@lists.infradead.org>
Subject: [DOC2000] invalid size detected
Date: Tue, 10 Dec 2002 15:33:48 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi all,

I am trying to access a 8MB DOC2000 using kernel 2.4.20 and MTD lasted CVS
version (using patchin.sh).

The current CVS version detect a bad size for my DOC device when I load
modules using :
  /sbin/modprobe -a doc2000 nftl mtdchar
  /sbin/modprobe -a docprobe

The previous version I build (2.4.18) detect the correct size but lack for
UnitSizeFactor!=1 support.

I think the problem is in the NAND_IDS.C chip identification but I am not
sure.
As I can see, there is a name conflict beetween nand_ids.h and nand_ids.c.

What de you think of this problems/bug?

Thank.
David.


-------------------------

LOG for 2.4.20+MTD CVS:

  NFTL driver: nftlcore.c $Revision: 1.87 $, nftlmount.c $Revision: 1.31 $
  Using configured DiskOnChip probe address 0xdc000
  DiskOnChip 2000 found at address 0xDC000
  Flash chip found: Manufacturer ID: EC, Chip ID: E6 (NAND 2MB 5V)
  1 flash chips found. Total DiskOnChip size: 2 MiB
  NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we
know
  what it means...
  NFTL Media Header sanity check failed:
  numvunits (1984) > nb_blocks (512) - nb_boot_blocks(8) - 2
  Could not find valid boot record
  Could not mount NFTL device

cat /proc/mtd:

  dev:    size   erasesize  name
  mtd0: 00200000 00001000 "DiskOnChip 2000"

-------------------------

LOG for 2.4.18:

  NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
  Using configured DiskOnChip probe address 0xdc000
  DiskOnChip 2000 found at address 0xDC000
  Flash chip found: Manufacturer ID: EC, Chip ID: E6 (Samsung KM29U64000)
  1 flash chips found. Total DiskOnChip size: 8 MiB
  Sorry, we don't support UnitSizeFactor of != 1 yet.
  Could not find valid boot record
  Could not mount NFTL device

cat /proc/mtd:
  dev:    size   erasesize  name
  mtd0: 00800000 00002000 "DiskOnChip 2000"
