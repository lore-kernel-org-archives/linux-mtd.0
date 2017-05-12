From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <matthias.bgg@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 0/3] Mediatek MT2712 NAND FLASH Controller driver
Date: Fri, 12 May 2017 12:33:20 +0800
Message-ID: <1494563603-37716-1-git-send-email-xiaolei.li@mediatek.com>
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

The following patch-set adds support for Mediatek MT2712 NAND FLASH
Controller.

Changes on v2 relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
        'commit 2b12c057cc2837312001f4fc3a4d89498fb6f463
        Author: Kamal Dasu <kdasu.kdev@gmail.com>
        Date:   Fri Mar 3 16:16:53 2017 -0500'

Patch v2:
---------
- sperate patches into 3.
- refine DT bindings documentation about NFC and ECC compatible.
- use ecc->devdata->encode_parity_reg0 and ecc->devdata->err_mask
  directly, but hide them in define.

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
  by 'dd' command.
* all drivers/mtd/tests/* pass.
* speed test:
  eraseblock write speed is 8318 KiB/s
  eraseblock read speed is 11374 KiB/s
  page write speed is 8155 KiB/s
  page read speed is 11290 KiB/s
  2 page write speed is 8217 KiB/s
  2 page read speed is 11354 KiB/s
  erase speed is 116472 KiB/s
  2x multi-block erase speed is 352978 KiB/s
  4x multi-block erase speed is 359750 KiB/s
  8x multi-block erase speed is 361484 KiB/s
  16x multi-block erase speed is 364116 KiB/s
  32x multi-block erase speed is 364116 KiB/s
  64x multi-block erase speed is 364116 KiB/s
Xiaolei Li (3):
  mtd: nand: mediatek: update DT bindings
  mtd: nand: mediatek: add support for different MTK NAND FLASH
    Controller IP
Xiaolei Li (3):
  mtd: nand: mediatek: update DT bindings
  mtd: nand: mediatek: add support for different MTK NAND FLASH
    Controller IP
  mtd: nand: mediatek: add support for MT2712 NAND FLASH Controller

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |   5 +-
 drivers/mtd/nand/mtk_ecc.c                         | 110 +++++++++---
 drivers/mtd/nand/mtk_ecc.h                         |   2 +-
 drivers/mtd/nand/mtk_nand.c                        | 198 ++++++++++++++++-----
 4 files changed, 243 insertions(+), 72 deletions(-)

--
1.9.1
