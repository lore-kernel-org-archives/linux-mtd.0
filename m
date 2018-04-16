From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 0/4] Improve MTK NAND driver
Date: Mon, 16 Apr 2018 15:41:00 +0800
Message-ID: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
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
  - Add MAINTAINERS entry for Mediatek NAND controller driver.
  - Fix some MTK NAND driver DT binding description errors.
  - Support to maximize FDM ECC protected bytes setting by nfc capability.
  - Replace max_sector_size with sector size array.

Changes relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
	'commit ba4150b1ec2a ("mtd: rawnand: s3c2410: enhance the probe
	 function error path")'

Patch v2:
  - Add new nfc capability instead of defining new DT property.
  - Remove not backward compat patches about nand-ecc-maximize.

Tests:
------
  - ubifs and jffs2 are validated on MT2712 platform with NAND device
    MT29F16G08ADBCA by 'dd' command.
  - all drivers/mtd/tests/* pass.

Xiaolei Li (4):
  dt-bindings: mtd: mtk-nand: Update properties description
  MAINTAINERS: Add entry for Mediatek NAND controller driver
  mtd: rawnand: mtk: Replace max_sector_size with sector size array
  mtd: rawnand: mtk: Add new nfc capability maximize_fdm_ecc

 Documentation/devicetree/bindings/mtd/mtk-nand.txt | 18 +++++++---
 MAINTAINERS                                        |  7 ++++
 drivers/mtd/nand/raw/mtk_nand.c                    | 40 ++++++++++++++++++----
 3 files changed, 53 insertions(+), 12 deletions(-)
 mode change 100644 => 100755 drivers/mtd/nand/raw/mtk_nand.c

-- 
1.9.1
