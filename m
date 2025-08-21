Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9C2CA0FE2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Aug 2025 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vF26FzfJGQgxrS6IH6TsNiB4Yqnaqd8qZ/4RRLBb8+g=; b=LrR7rkSgzxs4EY
	76mQxU7LMxZNzX3hSkJUFnGZFN6NpGInVjC+63rHVzCPG9qN97VjYZKwJCk2PgJBB9c05c2k//vbu
	CngrgfH+d6BDOUt5Iyai7RSLvK+fz3/mlqrpyeR6gpyWeZVL1SHGIs85b1LjfY0ynWP6inIkRidR3
	yqOWXzbKTu3i/qXuci+nAzyTnJ+eVS483rH8Cf5nTkukpun944wGt/iaUk5LkhacyRjVlMfjNmX/W
	T0dqmEZg90mJEBQYs444KUPJILWAa0YkCHgOCObRPhGxgqyMZWA2kHPuvEPuCNjYZJsyEUvhwmBB9
	JgMo0BpIbsBwCTbVH5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozHK-0000000G1wu-3uYC;
	Thu, 21 Aug 2025 07:00:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxn-0000000FyfL-0nKw
	for linux-mtd@bombadil.infradead.org;
	Thu, 21 Aug 2025 06:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fTYmmep8OC2zdQJKefD7UOmWgymoyEquwDswdUjGE/c=; b=OVvhw0BuLFfdHzt7NgQIMqM5ND
	WGcX4YqBYkS8dUL9kvRZlvfDWv4vhx9c94/9u7r5pZhbIXX4NVD4gvsE5clTX+ix1JrfPgpvTK4ue
	XzoUMFCI0ObkrFncFYJvhmvr+tnQx0S9xdsmxyENZEhMR55an2gLY2SqadOAr048IZjCgfznfepVU
	nopI73vrprL+RU8E4KomL6yfQXQL9JCd9fQ2a0PGX4+TrkI7xzhUGTsCRSxrxKnrfK038NeL3U2lI
	g1ptz1USE4q2WAl1qevxcjws9sVY/6weqD7k2lTdwahfXaAig5L6CQPoekpmKVRqtKG8EcEKJLbZ2
	FGrmP3aw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxj-00000000UfX-2vhZ
	for linux-mtd@lists.infradead.org;
	Thu, 21 Aug 2025 06:39:53 +0000
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8Cxrr8ov6Zo7E0BAA--.1419S3;
	Thu, 21 Aug 2025 14:39:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJDxrcEhv6ZowvRcAA--.65049S3;
	Thu, 21 Aug 2025 14:39:36 +0800 (CST)
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
Subject: [PATCH v3 5/7] mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
Date: Thu, 21 Aug 2025 14:39:19 +0800
Message-ID: <589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1755757841.git.zhoubinbin@loongson.cn>
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJDxrcEhv6ZowvRcAA--.65049S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jw13JFykCr17XF4xGryUArc_yoWxGrWUpr
	45Zay3Krs7KF42ka1Yqa45Cr1fZ34fJryDAa1qv3yjgwnxJw1jga4UCF4Syr12yr1rWryx
	uFWku39Y9anxJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_073952_541924_CD90EC62 
X-CRM114-Status: GOOD (  17.60  )
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
 .../mtd/nand/raw/loongson-nand-controller.c   | 52 ++++++++++++++++++-
 2 files changed, 51 insertions(+), 3 deletions(-)

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
index b26d1e133594..7b331d0ca2f0 100644
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
 
@@ -745,7 +767,7 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	struct device *dev = host->dev;
 	struct dma_chan *chan;
 	struct dma_slave_config cfg = {};
-	int ret;
+	int ret, val;
 
 	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &loongson_nand_regmap_config);
 	if (IS_ERR(host->regmap))
@@ -755,6 +777,9 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_cycle_field,
 				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
 
+	if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
+		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -770,7 +795,14 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 
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
@@ -896,6 +928,17 @@ static const struct loongson_nand_data ls1c_nand_data = {
 	.set_addr = ls1c_nand_set_addr,
 };
 
+static const struct loongson_nand_data ls2k0500_nand_data = {
+	.max_id_cycle = 6,
+	.id_cycle_field = GENMASK(14, 12),
+	.status_field = GENMASK(23, 16),
+	.op_scope_field = GENMASK(29, 16),
+	.hold_cycle = 0x4,
+	.wait_cycle = 0x12,
+	.flags = LOONGSON_NAND_64BIT_DMA,
+	.set_addr = ls1c_nand_set_addr,
+};
+
 static const struct of_device_id loongson_nand_match[] = {
 	{
 		.compatible = "loongson,ls1b-nand-controller",
@@ -905,6 +948,10 @@ static const struct of_device_id loongson_nand_match[] = {
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
@@ -921,5 +968,6 @@ static struct platform_driver loongson_nand_driver = {
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
