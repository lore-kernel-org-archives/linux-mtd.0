From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v1 0/2] Improve MTK ECC Engine driver
Date: Mon, 23 Oct 2017 16:21:35 +0800
Message-ID: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
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

This patch-set is mainly to improve MTK ECC Engine driver, include
- remove dummy ECC IRQ disable setting
- fix infinite ECC decode IRQ issue

Changes relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
        'commit 1f3df4dc088d927683b292118cd8b4eaaf1af573
        Author: Sascha Hauer <s.hauer@pengutronix.de>
        Date:   Mon Oct 16 11:51:55 2017 +0200'

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
  by 'dd' command.
* all drivers/mtd/tests/* pass.

Xiaolei Li (2):
  mtd: nand: mtk: do not disable ECC IRQ in the function mtk_ecc_disable
  mtd: nand: mtk: fix infinite ECC decode IRQ issue

 drivers/mtd/nand/mtk_ecc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--
1.9.1
