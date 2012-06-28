From: Josh Wu <josh.wu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
Subject: [PATCH v12 0/2] MTD: at91: Add PMECC support for at91 nand flash
 driver
Date: Thu, 28 Jun 2012 16:21:35 +0800
Message-Id: <1340871698-477-1-git-send-email-josh.wu@atmel.com>
Cc: hongxu.cn@gmail.com, richard.genoud@gmail.com, nicolas.ferre@atmel.com,
 Josh Wu <josh.wu@atmel.com>, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Those patches is based on the l2-mtd.git three.

Since there are two patches of v11 already pushed, so this version v12 only includes the left two patches.
which includes the modification according to Richard Genoud's review suggestion.

Changes since v11,
	add documentation for atmel nand reg parameter and one example for PMECC support.
	fix the bug: no error reported when fail to get resoures of PMECC ERRLOC or ROM.
	fix the bug: no correction when ecc data has bit flipped.
	add clearer debug information for data correction.

Josh Wu (2):
  MTD: at91: add dt parameters for Atmel PMECC
  MTD: at91: atmel_nand: Update driver to support Programmable Multibit
    ECC controller

 .../devicetree/bindings/mtd/atmel-nand.txt         |   40 +-
 drivers/mtd/nand/atmel_nand.c                      |  801 +++++++++++++++++++-
 drivers/mtd/nand/atmel_nand_ecc.h                  |  114 ++-
 3 files changed, 951 insertions(+), 4 deletions(-)

-- 
1.7.9.5
