Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZN-0001Rg-Ea
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:09:26 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RESEND PATCH v2 08/53] mtd: nand: denali: introduce capability flag
Date: Thu, 23 Mar 2017 05:07:07 +0900
Message-Id: <1490213273-8571-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND controller IP has various customizable features.
SoC vendors can choose desired functions when a delivery RTL is
created.  It means there are several variants for this IP.  For
example, the Intel version is equipped with 32bit DMA, whereas the
IP for UniPhier SoC family with 64bit DMA.

This driver was originally written for some Intel platforms with
Intel specific things hard-coded.  What is worse, the revision
register of this IP does not work to distinguish such features.
We need to do something to make the driver available for other SoCs.

Let's introduce a caps member to the denali_nand_info structure to
switch on/off various features.  Also, add struct denali_dt_data to
store the capability associated with compatible string.

Boris suggested this approach in discussion [1] instead of a new DT
property for every feature.

[1] https://lkml.org/lkml/2016/3/29/142

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.h    |  1 +
 drivers/mtd/nand/denali_dt.c | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 8df2285..eed001d 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -338,6 +338,7 @@ struct denali_nand_info {
 	uint32_t devnum;	/* represent how many nands connected */
 	uint32_t bbtskipbytes;
 	uint32_t max_banks;
+	unsigned int caps;
 };
 
 extern int denali_init(struct denali_nand_info *denali);
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 5607fcd..293ddb8 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -29,6 +29,10 @@ struct denali_dt {
 	struct clk		*clk;
 };
 
+struct denali_dt_data {
+	unsigned int caps;
+};
+
 static const struct of_device_id denali_nand_dt_ids[] = {
 		{ .compatible = "denali,denali-nand-dt" },
 		{ /* sentinel */ }
@@ -42,23 +46,19 @@ static int denali_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *denali_reg, *nand_data;
 	struct denali_dt *dt;
+	const struct denali_dt_data *data;
 	struct denali_nand_info *denali;
 	int ret;
-	const struct of_device_id *of_id;
-
-	of_id = of_match_device(denali_nand_dt_ids, &ofdev->dev);
-	if (of_id) {
-		ofdev->id_entry = of_id->data;
-	} else {
-		pr_err("Failed to find the right device id.\n");
-		return -ENOMEM;
-	}
 
 	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->denali;
 
+	data = of_device_get_match_data(&ofdev->dev);
+	if (data)
+		denali->caps = data->caps;
+
 	denali->platform = DT;
 	denali->dev = &ofdev->dev;
 	denali->irq = platform_get_irq(ofdev, 0);
-- 
2.7.4
