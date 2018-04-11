From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 0/8] Improve MTK NAND driver and ->calc_ecc_bytes() hook
Date: Wed, 11 Apr 2018 11:41:50 +0800
Message-ID: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches are mainly to:
  - Fix some MTK NAND driver DT binding description errors.
  - Support FDM ECC protected bytes setting by DT properity.
  - Support nand-ecc-maximize DT properity. And improve
    ->calc_ecc_bytes() hook.
  - Add maintainer entry for Mediatek NAND controller driver.

Changes relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
	'commit ba4150b1ec2a ("mtd: rawnand: s3c2410: enhance the probe
	 function error path")'

Tests:
------
  - ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
    by 'dd' command.
  - all drivers/mtd/tests/* pass.

Xiaolei Li (8):
  dt-bindings: mtd: mtk-nand: Update properties description
  MAINTAINERS: Add entry for Mediatek NAND controller driver
  mtd: rawnand: mtk: Add DT property mtk,fdm-ecc-size
  mtd: rawnand: mtk: Remove max_sector_size from struct mtk_nfc_caps
  mtd: rawnand: Modify ->calc_ecc_bytes() hook in nand_ecc_caps
  mtd: rawnand: mtk: Introduce mtk_ecc_calc_parity_bytes() function
  mtd: rawnand: mtk: Introduce mtk_ecc_get_strength_num(),
    mtk_ecc_get_strength()
  mtd: rawnand: mtk: Use generic helpers to calculate ecc size and
    strength

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  24 ++-
 MAINTAINERS                                        |   7 +
 drivers/mtd/nand/raw/denali.c                      |   3 +-
 drivers/mtd/nand/raw/denali.h                      |   2 +-
 drivers/mtd/nand/raw/mtk_ecc.c                     |  43 ++---
 drivers/mtd/nand/raw/mtk_ecc.h                     |   5 +-
 drivers/mtd/nand/raw/mtk_nand.c                    | 187 ++++++++++++++-------
 drivers/mtd/nand/raw/nand_base.c                   |  11 +-
 include/linux/mtd/rawnand.h                        |  77 ++++-----
 9 files changed, 223 insertions(+), 136 deletions(-)

-- 
1.9.1
