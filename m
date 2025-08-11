Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1C8C87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbiM7a6yN21uR/S12Fy6UZ5mKev6SwTW20MN9PwoM2k=; b=scldDFjyi7Kti4
	rUl4bIXx0JM6DQLj8oloy7C7YQpx+Pss/YiEipZvIF9RRIkECWCsNhpJXSA8kgKxe/Q6Ys1tEgJVE
	uu9RViyr3GolSBhyOjYAuu7SNdh0J+xCQqeX0Gx6r7XppEKaEIA5ILKGuG3iR0+4+8JYwmW2c+Mlu
	eJCaJ4YTl4Zyj5fiJly+ALf8IKPEoajyl3FVwXrfbZrgGO7A9CFQkXZbutG2cJi6HXAFdeLbiJ5ba
	tVNgwzIVPRFEdr/UBQt9wYTArz16Lr5eFrTU/7zZqbv4WjfCA2Snq6dGBe1mKaTK4AuMwxpcX0wu9
	OJ6R5FLPk/FSCTvqCU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLdM-00000006Ybl-3okl;
	Mon, 11 Aug 2025 06:03:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLdL-00000006Yb5-1TnA
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Aug 2025 06:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S9MsXADvQmMLv5LktB1/6W1UAEPSI/7qkSVZUahWpqc=; b=rTbPLr3z/Re8LFosJiwYkNnDyx
	W1vUA7qvbC4Cznfx1etPkFHYeTwkie0t0eGSjkLrlHbD3e5QXn0kI7jWrnugTSoXsyha17qzdHFaS
	9fzzfE7fdIytR2aJ45p7RMN2ic6crqRDPYPMDrHJMGsyCWRKs71dpORX4sR8tzd+ll5wKuvQwUbOn
	cP/dgeBT+cwL6slFzKqS1KikESssLopsqvuDmeGWZeT/YX32PNyQzJ87LAOlEoNWyd0jWppu8ezzh
	DbI7xWaJiFOj7KELXzdid3a8NmuLbAEvpyVoXgvdWAsUvNcmYq3x6KKh+aAlrHQGC48dNdPR7NDrM
	BTfeq+qg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLdF-00000001fp8-2nNw
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 06:03:46 +0000
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8CxTOK3h5lo20I+AQ--.11635S3;
	Mon, 11 Aug 2025 14:03:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxVOSrh5loVlVCAA--.52188S4;
	Mon, 11 Aug 2025 14:03:34 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 6/8] mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
Date: Mon, 11 Aug 2025 14:03:13 +0800
Message-ID: <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1754890670.git.zhoubinbin@loongson.cn>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJAxVOSrh5loVlVCAA--.52188S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jw13JFykCr17XF4xGryUArc_yoWxXF4xpr
	W5Zay3Krs7KF429a1Yqa45Cr13Z34fJryDAa1qv34jgwnrJw1jga4UCF4Syr12yr15Wryx
	uFWku39Y9anxJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
	kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUxX_-UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_070344_319595_24668641 
X-CRM114-Status: GOOD (  14.80  )
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

The Loongson-2K0500 NAND controller is similar to the Loongson-1C.

It supports a maximum capacity of 16GB FLASH per chip with a maximum
page size of 8KB, and it supports up to 4 chip selects and 4 RDY
signals.

Its DMA controller is defaulted to APBDMA0.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mtd/nand/raw/Kconfig                  |  2 +-
 .../mtd/nand/raw/loongson-nand-controller.c   | 55 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index d9e3f13666ac..7b0c5d06aa95 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -464,7 +464,7 @@ config MTD_NAND_NUVOTON_MA35
 
 config MTD_NAND_LOONGSON
 	tristate "Loongson NAND controller"
-	depends on LOONGSON1_APB_DMA || COMPILE_TEST
+	depends on LOONGSON1_APB_DMA || LOONGSON2_APB_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Enables support for NAND controller on Loongson family chips.
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 5a51c7d299cc..7a15df3fcd31 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -3,6 +3,7 @@
  * NAND Controller Driver for Loongson family chips
  *
  * Copyright (C) 2015-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
  */
 
 #include <linux/kernel.h>
@@ -26,6 +27,7 @@
 #define LOONGSON_NAND_IDH_STATUS	0x14
 #define LOONGSON_NAND_PARAM		0x18
 #define LOONGSON_NAND_OP_NUM		0x1c
+#define LOONGSON_NAND_CS_RDY_MAP	0x20
 
 /* Bitfields of nand command register */
 #define LOONGSON_NAND_CMD_OP_DONE	BIT(10)
@@ -40,6 +42,23 @@
 #define LOONGSON_NAND_CMD_READ		BIT(1)
 #define LOONGSON_NAND_CMD_VALID		BIT(0)
 
+/* Bitfields of nand cs/rdy map register */
+#define LOONGSON_NAND_MAP_CS1_SEL	GENMASK(11, 8)
+#define LOONGSON_NAND_MAP_RDY1_SEL	GENMASK(15, 12)
+#define LOONGSON_NAND_MAP_CS2_SEL	GENMASK(19, 16)
+#define LOONGSON_NAND_MAP_RDY2_SEL	GENMASK(23, 20)
+#define LOONGSON_NAND_MAP_CS3_SEL	GENMASK(27, 24)
+#define LOONGSON_NAND_MAP_RDY3_SEL	GENMASK(31, 28)
+
+#define LOONGSON_NAND_CS_SEL0	BIT(0)
+#define LOONGSON_NAND_CS_SEL1	BIT(1)
+#define LOONGSON_NAND_CS_SEL2	BIT(2)
+#define LOONGSON_NAND_CS_SEL3	BIT(3)
+#define LOONGSON_NAND_CS_RDY0	BIT(0)
+#define LOONGSON_NAND_CS_RDY1	BIT(1)
+#define LOONGSON_NAND_CS_RDY2	BIT(2)
+#define LOONGSON_NAND_CS_RDY3	BIT(3)
+
 /* Bitfields of nand timing register */
 #define LOONGSON_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
 #define LOONGSON_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
@@ -53,6 +72,8 @@
 #define LOONGSON_NAND_READ_ID_SLEEP_US		1000
 #define LOONGSON_NAND_READ_ID_TIMEOUT_US	5000
 
+#define LOONGSON_NAND_64BIT_DMA		BIT(0)
+
 #define BITS_PER_WORD			(4 * BITS_PER_BYTE)
 
 struct loongson_nand_host;
@@ -83,6 +104,7 @@ struct loongson_nand_data {
 	unsigned int hold_cycle;
 	unsigned int wait_cycle;
 	unsigned int nand_cs;
+	unsigned int flags;
 	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_op *op);
 };
 
@@ -751,7 +773,7 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	struct device *dev = host->dev;
 	struct dma_chan *chan;
 	struct dma_slave_config cfg = {};
-	int ret;
+	int ret, val;
 
 	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &loongson_nand_regmap_config);
 	if (IS_ERR(host->regmap))
@@ -761,6 +783,9 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_cycle_field,
 				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
 
+	if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
+		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -776,7 +801,14 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 
 	init_completion(&host->dma_complete);
 
-	return 0;
+	val = FIELD_PREP(LOONGSON_NAND_MAP_CS1_SEL, LOONGSON_NAND_CS_SEL1)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY1_SEL, LOONGSON_NAND_CS_RDY1)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_CS2_SEL, LOONGSON_NAND_CS_SEL2)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY2_SEL, LOONGSON_NAND_CS_RDY2)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_CS3_SEL, LOONGSON_NAND_CS_SEL3)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY3_SEL, LOONGSON_NAND_CS_RDY3);
+
+	return regmap_write(host->regmap, LOONGSON_NAND_CS_RDY_MAP, val);
 }
 
 static int loongson_nand_chip_init(struct loongson_nand_host *host)
@@ -890,6 +922,7 @@ static const struct loongson_nand_data ls1b_nand_data = {
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
 	.nand_cs = 0x0,
+	.flags = 0,
 	.set_addr = ls1b_nand_set_addr,
 };
 
@@ -901,6 +934,19 @@ static const struct loongson_nand_data ls1c_nand_data = {
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
 	.nand_cs = 0x0,
+	.flags = 0,
+	.set_addr = ls1c_nand_set_addr,
+};
+
+static const struct loongson_nand_data ls2k0500_nand_data = {
+	.max_id_cycle = 6,
+	.id_cycle_field = GENMASK(14, 12),
+	.status_field = GENMASK(23, 16),
+	.op_scope_field = GENMASK(29, 16),
+	.hold_cycle = 0x4,
+	.wait_cycle = 0x12,
+	.nand_cs = 0x0,
+	.flags = LOONGSON_NAND_64BIT_DMA,
 	.set_addr = ls1c_nand_set_addr,
 };
 
@@ -913,6 +959,10 @@ static const struct of_device_id loongson_nand_match[] = {
 		.compatible = "loongson,ls1c-nand-controller",
 		.data = &ls1c_nand_data,
 	},
+	{
+		.compatible = "loongson,ls2k0500-nand-controller",
+		.data = &ls2k0500_nand_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, loongson_nand_match);
@@ -929,5 +979,6 @@ static struct platform_driver loongson_nand_driver = {
 module_platform_driver(loongson_nand_driver);
 
 MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
 MODULE_DESCRIPTION("Loongson NAND Controller Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
