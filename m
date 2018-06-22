Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWAsk-0005jX-RW
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 01:29:01 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Date: Fri, 22 Jun 2018 13:28:29 +1200
Message-Id: <20180622012835.17874-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm looking at adding support for the Micron MT29F1G08ABAFAWP-ITE:F chip
to one of our boards which uses the Marvell NFCv2 controller.

This particular chip is a bit odd in that the datasheet states support
for ONFI 1.0 but the revision number field is 00 00. It also is marked
ABAFA but reports internally as ABAGA. Finally it has internal 8-bit ECC
which cannot be disabled.

The existing test in micron_supports_on_die_ecc() determines that on-die
ECC is supported but not mandatory but I know for this chip it is
mandatory despite what set_features returns.

In order for this to work I need to set nand-ecc-mode = "on-die" in my
dts. Ideally I'd like it to be automatic based on what the hardware can
support but that may be asking too much at the moment.

Here's a dump of the parameter page from the chip I have

00000000: 4f 4e 46 49 00 00 18 00 3f 00 00 00 00 00 00 00 ONFI....?.......
00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
00000020: 4d 49 43 52 4f 4e 20 20 20 20 20 20 4d 54 32 39  MICRON MT29
00000030: 46 31 47 30 38 41 42 41 47 41 57 50 20 20 20 20  F1G08ABAGAWP    
00000040: 2c 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ,...............
00000050: 00 08 00 00 80 00 00 02 00 00 20 00 40 00 00 00  ..........  .@...
00000060: 00 04 00 00 01 22 01 14 00 01 05 08 00 00 04 00 ....."..........
00000070: 08 01 0e 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
00000080: 08 3f 00 3f 00 58 02 10 27 46 00 64 00 00 00 00 .?.?.X..'F.d....
00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
000000a0: 00 00 00 00 01 00 00 00 00 02 04 80 01 81 04 03 ................
000000b0: 02 01 1e 90 00 00 00 00 00 00 00 00 00 00 00 00 ................
000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 a6 ................

Series changes in v3:
- No longer RFC
- dropped "mtd: rawnand: micron: add ONFI_FEATURE_ON_DIE_ECC to supported
  features" which Boris has already picked up
- dropped "mtd: rawnand: marvell: Support page size of 2048 with 8-bit ECC"
  since I can't test it.

Series changes in v4:
- based on top of http://patchwork.ozlabs.org/patch/932006/

Series changes in v5:
- address review comments from Boris on patches 5 and 6

Chris Packham (6):
  mtd: rawnand: marvell: Handle on-die ECC
  mtd: rawnand: add manufacturer fixup for ONFI parameter page
  mtd: rawnand: add defines for ONFI version bits
  mtd: rawnand: micron: add fixup for ONFI revision
  mtd: rawnand: micron: support 8/512 on-die ECC
  mtd: rawnand: micron: detect forced on-die ECC

 drivers/mtd/nand/raw/marvell_nand.c |   1 +
 drivers/mtd/nand/raw/nand_base.c    |  14 +--
 drivers/mtd/nand/raw/nand_micron.c  | 129 +++++++++++++++++++++++-----
 include/linux/mtd/rawnand.h         |  14 +++
 4 files changed, 131 insertions(+), 27 deletions(-)

-- 
2.17.1
