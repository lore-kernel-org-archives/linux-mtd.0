From: RogerCC Lin <rogercc.lin@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaolei.li@mediatek.com>,
 <srv_heupstream@mediatek.com>, <bayi.cheng@mediatek.com>,
 <rogercc.lin@mediatek.com>
Subject: [PATCH v2 0/3] Support MT7622 NAND flash controller
Date: Thu, 30 Nov 2017 22:10:42 +0800
Message-ID: <1512051045-24026-1-git-send-email-rogercc.lin@mediatek.com>
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

From: RogerCC Lin <rogercc.lin@mediatek.com>

MT7622 uses an earlier NAND flash controller IP which is similar to
MT2701's, it has less sector size, less max sector number and less
parity bits. This patch can support MT7622 NAND flash controller.

The patch has been verified in UBIFS test, with F59D1G81MB on MT7622
reference board, it works correctly.

Change since v1:
Keep MTK ECC's struct private and add a helper to get parity bits.

RogerCC Lin (3):
  mtd: nand: mtk: update DT bindings
  mtd: nand: mtk: Support different MTK NAND flash controller IP
  mtd: nand: mtk: Support MT7622 NAND flash controller.

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  11 +-
 drivers/mtd/nand/mtk_ecc.c                         | 126 ++++++++++++++++-----
 drivers/mtd/nand/mtk_ecc.h                         |   3 +-
 drivers/mtd/nand/mtk_nand.c                        |  43 +++++--
 4 files changed, 139 insertions(+), 44 deletions(-)

-- 
1.9.1
