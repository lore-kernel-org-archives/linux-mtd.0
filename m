Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866F4C43600
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:50:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E038761C39
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E038761C39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZQ7Nl2SMRa37Z24xiyUZN4XOQo/o7530rW03WWG7NYQ=; b=muNI6voaM0rJjXWNd7Zn066Sh
	2779CpVGvYfdVt+ZdPHrVbHclUFo8M8hpdrmLKftcpbZbT3TVIcS41jm3vwQYzbXzwnNL6zAvmVqm
	77zuXs2wWZGvuoABniFtbjHMjkAs/7YSLHBMDtwucIrBkv60amZ4tuU1t+BphckCecDUih8L0ksl4
	GQi4W3+IbqwepO89jts1aNH01Bl1A3jhT9tkY/UXWJ1Ca1YuPXRXmhl7lT3mZMY3NsyNwpwmyA7BJ
	y/W6CPwSN5jR7uN2r6i4VLRt+Hye/fRO2/RaPpg9+AyknX8Jbm7fTGWvRByNWWLDJ7/ta5r+TlzB7
	5SnuyVIbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Tw-00Dzxe-OF; Mon, 10 May 2021 10:49:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LU-00DyV9-Nv
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=rV8bFmfS/RM4gWNMq8GtQ6G63E+5ZNCV9ntU1FiW82M=; b=EIpT4V0GiApa8YJG3wXEEZ1hP+
 XO8BUEFyXdeNLUrJ9nB7APspKTrMU5TBUpBh1z8sXSKbABrC5RHqowW7D6ds35r14fCyS+TvV1KpT
 K71QCPhPgyvvc1ugEKMx1Kmol4dOgGBz/vdZS8xAY6MYPxVVK+E/J6QxBrpk1kWh7r7BIgQb7Htv5
 KluZRWbTlfrVDZuzrd5Jq/y8VVbRtRQ9JKGfHs5Y9ajkiouEvkPEG8QWjB2nae4W4x6PmwrP4RA7s
 xuu9Af402V0gR8ioFSGDCpy+2sHa8rTXmN/9rR/zQbOMgrvjbXBg+s5J/ZtR4BJh1b5busQlBCty9
 tb1aV0vw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LR-008YaJ-7e
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:41:03 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B9D0D1C0004;
 Mon, 10 May 2021 10:40:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 5/5] mtd: rawnand: arasan: Leverage additional GPIO CS
Date: Mon, 10 May 2021 12:40:51 +0200
Message-Id: <20210510104051.9701-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-1-miquel.raynal@bootlin.com>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034101_580541_F0CA6E18 
X-CRM114-Status: GOOD (  32.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Make use of the cs-gpios DT property as well as the core helper to parse
it so that the Arasan controller driver can now assert many more chips
than natively.

The Arasan controller has an internal limitation: RB0 is tied to CS0 and
RB1 is tied to CS1. Hence, it is possible to use external GPIOs as long
as one or the other native CS is not used (or configured to be driven as
a GPIO) and that all additional CS are physically wired on its
corresponding RB line. Eg. CS0 is used as a native CS, CS1 is not used
as native CS and may be used as a GPIO CS, CS2 is an additional GPIO
CS. Then the target asserted by CS0 should also be wired to RB0, while
the targets asserted by CS1 and CS2 should be wired to RB1.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 148 +++++++++++++++---
 1 file changed, 125 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 390f8d719c25..fb72e83595b4 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -107,6 +108,8 @@
 #define ANFC_XLNX_SDR_DFLT_CORE_CLK	100000000
 #define ANFC_XLNX_SDR_HS_CORE_CLK	80000000
 
+static struct gpio_desc *anfc_default_cs_array[2] = {NULL, NULL};
+
 /**
  * struct anfc_op - Defines how to execute an operation
  * @pkt_reg: Packet register
@@ -137,7 +140,6 @@ struct anfc_op {
  * struct anand - Defines the NAND chip related information
  * @node:		Used to store NAND chips into a list
  * @chip:		NAND chip information structure
- * @cs:			Chip select line
  * @rb:			Ready-busy line
  * @page_sz:		Register value of the page_sz field to use
  * @clk:		Expected clock frequency to use
@@ -151,11 +153,13 @@ struct anfc_op {
  * @errloc:		Array of errors located with soft BCH
  * @hw_ecc:		Buffer to store syndromes computed by hardware
  * @bch:		BCH structure
+ * @cs_idx:		Array of chip-select for this device, values are indexes
+ *			of the controller structure @gpio_cs array
+ * @ncs_idx:		Size of the @cs_idx array
  */
 struct anand {
 	struct list_head node;
 	struct nand_chip chip;
-	unsigned int cs;
 	unsigned int rb;
 	unsigned int page_sz;
 	unsigned long clk;
@@ -169,6 +173,8 @@ struct anand {
 	unsigned int *errloc;
 	u8 *hw_ecc;
 	struct bch_control *bch;
+	int *cs_idx;
+	int ncs_idx;
 };
 
 /**
@@ -179,8 +185,14 @@ struct anand {
  * @bus_clk:		Pointer to the flash clock
  * @controller:		Base controller structure
  * @chips:		List of all NAND chips attached to the controller
- * @assigned_cs:	Bitmask describing already assigned CS lines
  * @cur_clk:		Current clock rate
+ * @cs_array:		CS array. Native CS are left empty, the other cells are
+ *			populated with their corresponding GPIO descriptor.
+ * @ncs:		Size of @cs_array
+ * @cur_cs:		Index in @cs_array of the currently in use CS
+ * @native_cs:		Currently selected native CS
+ * @spare_cs:		Native CS that is not wired (may be selected when a GPIO
+ *			CS is in use)
  */
 struct arasan_nfc {
 	struct device *dev;
@@ -189,8 +201,12 @@ struct arasan_nfc {
 	struct clk *bus_clk;
 	struct nand_controller controller;
 	struct list_head chips;
-	unsigned long assigned_cs;
 	unsigned int cur_clk;
+	struct gpio_desc **cs_array;
+	unsigned int ncs;
+	int cur_cs;
+	unsigned int native_cs;
+	unsigned int spare_cs;
 };
 
 static struct anand *to_anand(struct nand_chip *nand)
@@ -273,12 +289,46 @@ static int anfc_pkt_len_config(unsigned int len, unsigned int *steps,
 	return 0;
 }
 
+static bool anfc_is_gpio_cs(struct arasan_nfc *nfc, int nfc_cs)
+{
+	return nfc_cs >= 0 && nfc->cs_array[nfc_cs];
+}
+
+static int anfc_relative_to_absolute_cs(struct anand *anand, int num)
+{
+	return anand->cs_idx[num];
+}
+
+static void anfc_assert_cs(struct arasan_nfc *nfc, unsigned int nfc_cs_idx)
+{
+	/* CS did not change: do nothing */
+	if (nfc->cur_cs == nfc_cs_idx)
+		return;
+
+	/* Deassert the previous CS if it was a GPIO */
+	if (anfc_is_gpio_cs(nfc, nfc->cur_cs))
+		gpiod_set_value_cansleep(nfc->cs_array[nfc->cur_cs], 1);
+
+	/* Assert the new one */
+	if (anfc_is_gpio_cs(nfc, nfc_cs_idx)) {
+		nfc->native_cs = nfc->spare_cs;
+		gpiod_set_value_cansleep(nfc->cs_array[nfc_cs_idx], 0);
+	} else {
+		nfc->native_cs = nfc_cs_idx;
+	}
+
+	nfc->cur_cs = nfc_cs_idx;
+}
+
 static int anfc_select_target(struct nand_chip *chip, int target)
 {
 	struct anand *anand = to_anand(chip);
 	struct arasan_nfc *nfc = to_anfc(chip->controller);
+	unsigned int nfc_cs_idx = anfc_relative_to_absolute_cs(anand, target);
 	int ret;
 
+	anfc_assert_cs(nfc, nfc_cs_idx);
+
 	/* Update the controller timings and the potential ECC configuration */
 	writel_relaxed(anand->timings, nfc->base + DATA_INTERFACE_REG);
 
@@ -346,7 +396,7 @@ static int anfc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 		.addr2_reg =
 			((page >> 16) & 0xFF) |
 			ADDR2_STRENGTH(anand->strength) |
-			ADDR2_CS(anand->cs),
+			ADDR2_CS(nfc->native_cs),
 		.cmd_reg =
 			CMD_1(NAND_CMD_READ0) |
 			CMD_2(NAND_CMD_READSTART) |
@@ -463,7 +513,7 @@ static int anfc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 		.addr2_reg =
 			((page >> 16) & 0xFF) |
 			ADDR2_STRENGTH(anand->strength) |
-			ADDR2_CS(anand->cs),
+			ADDR2_CS(nfc->native_cs),
 		.cmd_reg =
 			CMD_1(NAND_CMD_SEQIN) |
 			CMD_2(NAND_CMD_PAGEPROG) |
@@ -521,6 +571,7 @@ static int anfc_parse_instructions(struct nand_chip *chip,
 				   const struct nand_subop *subop,
 				   struct anfc_op *nfc_op)
 {
+	struct arasan_nfc *nfc = to_anfc(chip->controller);
 	struct anand *anand = to_anand(chip);
 	const struct nand_op_instr *instr = NULL;
 	bool first_cmd = true;
@@ -528,7 +579,7 @@ static int anfc_parse_instructions(struct nand_chip *chip,
 	int ret, i;
 
 	memset(nfc_op, 0, sizeof(*nfc_op));
-	nfc_op->addr2_reg = ADDR2_CS(anand->cs);
+	nfc_op->addr2_reg = ADDR2_CS(nfc->native_cs);
 	nfc_op->cmd_reg = CMD_PAGE_SIZE(anand->page_sz);
 
 	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
@@ -1118,37 +1169,43 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct anand *anand;
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
-	int cs, rb, ret;
+	int rb, ret, i;
 
 	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
 	if (!anand)
 		return -ENOMEM;
 
-	/* We do not support multiple CS per chip yet */
-	if (of_property_count_elems_of_size(np, "reg", sizeof(u32)) != 1) {
+	/* Chip-select init */
+	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
+	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
 		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(np, "reg", &cs);
-	if (ret)
-		return ret;
+	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
+				     sizeof(*anand->cs_idx), GFP_KERNEL);
+	if (!anand->cs_idx)
+		return -ENOMEM;
 
+	for (i = 0; i < anand->ncs_idx; i++) {
+		ret = of_property_read_u32_index(np, "reg", i,
+						 &anand->cs_idx[i]);
+		if (ret) {
+			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
 		return ret;
 
-	if (cs >= ANFC_MAX_CS || rb >= ANFC_MAX_CS) {
-		dev_err(nfc->dev, "Wrong CS %d or RB %d\n", cs, rb);
+	if (rb >= ANFC_MAX_CS) {
+		dev_err(nfc->dev, "Wrong RB %d\n", rb);
 		return -EINVAL;
 	}
 
-	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
-		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
-	}
-
-	anand->cs = cs;
 	anand->rb = rb;
 
 	chip = &anand->chip;
@@ -1164,7 +1221,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 		return -EINVAL;
 	}
 
-	ret = nand_scan(chip, 1);
+	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
 		return ret;
@@ -1202,7 +1259,7 @@ static int anfc_chips_init(struct arasan_nfc *nfc)
 	int nchips = of_get_child_count(np);
 	int ret;
 
-	if (!nchips || nchips > ANFC_MAX_CS) {
+	if (!nchips) {
 		dev_err(nfc->dev, "Incorrect number of NAND chips (%d)\n",
 			nchips);
 		return -EINVAL;
@@ -1227,6 +1284,47 @@ static void anfc_reset(struct arasan_nfc *nfc)
 
 	/* Enable interrupt status */
 	writel_relaxed(EVENT_MASK, nfc->base + INTR_STS_EN_REG);
+
+	nfc->cur_cs = -1;
+}
+
+static int anfc_parse_cs(struct arasan_nfc *nfc)
+{
+	int ret;
+
+	/* Check the gpio-cs property */
+	ret = rawnand_dt_parse_gpio_cs(nfc->dev, &nfc->cs_array, &nfc->ncs);
+	if (ret)
+		return ret;
+
+	/*
+	 * The controller native CS cannot be both disabled at the same time.
+	 * Hence, only one native CS can be used if GPIO CS are needed, so that
+	 * the other is selected when a non-native CS must be asserted (not
+	 * wired physically or configured as GPIO instead of NAND CS). In this
+	 * case, the "not" chosen CS is assigned to nfc->spare_cs and selected
+	 * whenever a GPIO CS must be asserted.
+	 */
+	if (nfc->cs_array && nfc->ncs > 2) {
+		if (!nfc->cs_array[0] && !nfc->cs_array[1]) {
+			dev_err(nfc->dev,
+				"Assign a single native CS when using GPIOs\n");
+			return -EINVAL;
+		}
+
+		if (nfc->cs_array[0])
+			nfc->spare_cs = 0;
+		else
+			nfc->spare_cs = 1;
+	}
+
+	if (!nfc->cs_array) {
+		nfc->cs_array = anfc_default_cs_array;
+		nfc->ncs = ANFC_MAX_CS;
+		return 0;
+	}
+
+	return 0;
 }
 
 static int anfc_probe(struct platform_device *pdev)
@@ -1265,6 +1363,10 @@ static int anfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_controller_clk;
 
+	ret = anfc_parse_cs(nfc);
+	if (ret)
+		goto disable_bus_clk;
+
 	ret = anfc_chips_init(nfc);
 	if (ret)
 		goto disable_bus_clk;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
