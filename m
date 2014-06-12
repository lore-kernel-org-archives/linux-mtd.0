From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>,
 Russell King <linux@arm.linux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, Jingoo Han <jg1.han@samsung.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Subject: [PATCHv4 5/5] mtd: gpmi: prevent creating a new BBT when blockmark
 swapping is disabled
Date: Thu, 12 Jun 2014 15:20:45 +0200
Message-Id: <1402579245-13377-6-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without blockmark swapping, there is no use in creating a BBT from
scratch, so use a BBT descriptor with NAND_BBT_CREATE unset in this
case.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 37537b4..fc710d7 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -43,6 +43,29 @@ static struct nand_bbt_descr gpmi_bbt_descr = {
 	.pattern	= scan_ff_pattern
 };
 
+static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
+static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
+
+static struct nand_bbt_descr bbt_main_no_oob_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_WRITE |
+	NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP |
+	NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = bbt_pattern,
+};
+
+static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_WRITE |
+	NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP |
+	NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = mirror_pattern,
+};
+
 /*
  * We may change the layout if we can get the ECC info from the datasheet,
  * else we will use all the (page + OOB).
@@ -1728,8 +1751,11 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 			chip->bbt_options |= NAND_BBT_NO_OOB_BBM;
 
 		if (of_property_read_bool(this->dev->of_node,
-						"fsl,no-blockmark-swap"))
+						"fsl,no-blockmark-swap")) {
 			this->swap_block_mark = false;
+			chip->bbt_td = &bbt_main_no_oob_descr;
+			chip->bbt_md = &bbt_mirror_no_oob_descr;
+		}
 	}
 	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
 		this->swap_block_mark ? "en" : "dis");
-- 
1.7.10.4
