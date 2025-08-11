Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEEAC87FDA
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lOv/24fGk1aotoshFVq+jsMyZUJobdWTUR/RMb7IvY=; b=B0ieP1SiRpAx3h
	Yg9DGyw3Q12AEUvaiIF6AQoLr331COAICEi6vztlj0E2P98k1KsFGuVHHuL8QkvtWFe4x/r7h2+pB
	CmccO+CvLF2gpFYCI0/wJ5u0o8oQ7jaRs8IQb/3e2ri4vf/FsFL4Z1PtriDlevwM3doB32pnC0aul
	pzjeJg0jrT5RyN36AzBXSjjMnQrV3quqrA6rtedIGXPKm9YudNnUN/Jq7qWdzKx7AlpE/XJK4IPdA
	t5Udd1OnvoTX9N3U0fJh2CzN6AyRI/B1oKlUpHTcar8Ba5fjrY7bapDKMlyIVopZ/nCtpPulzukRe
	VTij4/Ubsa8+o8BUYkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLde-00000006YkZ-2wkN;
	Mon, 11 Aug 2025 06:04:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLde-00000006YkD-0TqO
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Aug 2025 06:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DJa91XtBMA6Vd89ZErv5lNJu0V6ymZpfDD8ML4ui2E8=; b=IvZjlCen3keepSKVfvaOPyIXnx
	nVNbOBzikdSYWokWpfZwV6tsqjAYRbuQs96/EZFahelbs/zJxpBB5KOCminwy3no2nwExOzE0Ssvo
	6w61QkbtU4dq+jedR1Alv3lqm1pPSOXsLHVG5rRUUFdBuJLJMj8DPx+YCdNczPtG8BpxcdJqWv+MK
	ZFFcA0yavh7Pmkavvjq+bG+DkEFTvvzolAGuJAerypmcGSv73+HNyc0xQaobYV+51GoLOjp4WK3BV
	JNAjhT+/MHVTfEQK+GAIBAvLoNRTS5WJO2O80o+8pBTKacx11SlbEpdk+MZXe5ksiNuj2kKT9Cxzc
	wY8/ebgA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLdZ-00000001fyq-2CFP
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 06:04:04 +0000
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8Ax3eLPh5loJkM+AQ--.14563S3;
	Mon, 11 Aug 2025 14:03:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJBxzsHMh5loslVCAA--.24696S2;
	Mon, 11 Aug 2025 14:03:58 +0800 (CST)
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
Subject: [PATCH v2 8/8] mtd: rawnand: loongson: Add Loongson-2K1000 NAND controller support
Date: Mon, 11 Aug 2025 14:03:48 +0800
Message-ID: <1097082673acb35e41c07937a24c184eb7000437.1754890670.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1754890670.git.zhoubinbin@loongson.cn>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxzsHMh5loslVCAA--.24696S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw45WFW3CrW8Cr1UXw48Zrc_yoW5Kr47pa
	y5Aay3KFy5KF4Y9a98tayrCr13Z34fJr9rJFZrW34xK3s3J3srWFy8GF10qF4avryfXryx
	ZFyvgas7uFsrXrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26Fy26r45twAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUcIzuDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_070402_953744_FFAE302C 
X-CRM114-Status: GOOD (  13.57  )
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

The Loongson-2K1000 NAND controller is also similar to the Loongson-1C.

It supports a maximum capacity of 16GB FLASH per chip with a maximum
page size of 8KB, and it supports up to 4 chip selects and 4 RDY
signals.

The key difference from the Loongson-2K0500 is that it requires explicit
configuration of the DMA control route. Typically, it is configured as
APBDMA0.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../mtd/nand/raw/loongson-nand-controller.c   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 7a15df3fcd31..9c377062a3a1 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -73,9 +73,18 @@
 #define LOONGSON_NAND_READ_ID_TIMEOUT_US	5000
 
 #define LOONGSON_NAND_64BIT_DMA		BIT(0)
+#define LOONGSON_NAND_DMA_CONFIG	BIT(1)
 
 #define BITS_PER_WORD			(4 * BITS_PER_BYTE)
 
+/* Loongson-2K1000 NAND DMA routing register */
+#define LS2K1000_NAND_DMA_MASK         GENMASK(2, 0)
+#define LS2K1000_DMA0_CONF             0x0
+#define LS2K1000_DMA1_CONF             0x1
+#define LS2K1000_DMA2_CONF             0x2
+#define LS2K1000_DMA3_CONF             0x3
+#define LS2K1000_DMA4_CONF             0x4
+
 struct loongson_nand_host;
 
 struct loongson_nand_op {
@@ -768,6 +777,23 @@ static void loongson_nand_controller_cleanup(struct loongson_nand_host *host)
 		dma_release_channel(host->dma_chan);
 }
 
+static int ls2k1000_nand_apbdma_config(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	void __iomem *regs;
+	int val;
+
+	regs = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	val = readl(regs);
+	val |= FIELD_PREP(LS2K1000_NAND_DMA_MASK, LS2K1000_DMA0_CONF);
+	writel(val, regs);
+
+	return 0;
+}
+
 static int loongson_nand_controller_init(struct loongson_nand_host *host)
 {
 	struct device *dev = host->dev;
@@ -786,6 +812,12 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
 		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 
+	if (host->data->flags & LOONGSON_NAND_DMA_CONFIG) {
+		ret = ls2k1000_nand_apbdma_config(dev);
+		if (ret)
+			return ret;
+	}
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -950,6 +982,18 @@ static const struct loongson_nand_data ls2k0500_nand_data = {
 	.set_addr = ls1c_nand_set_addr,
 };
 
+static const struct loongson_nand_data ls2k1000_nand_data = {
+	.max_id_cycle = 6,
+	.id_cycle_field = GENMASK(14, 12),
+	.status_field = GENMASK(23, 16),
+	.op_scope_field = GENMASK(29, 16),
+	.hold_cycle = 0x4,
+	.wait_cycle = 0x12,
+	.nand_cs = 0x2,
+	.flags = LOONGSON_NAND_64BIT_DMA | LOONGSON_NAND_DMA_CONFIG,
+	.set_addr = ls1c_nand_set_addr,
+};
+
 static const struct of_device_id loongson_nand_match[] = {
 	{
 		.compatible = "loongson,ls1b-nand-controller",
@@ -963,6 +1007,10 @@ static const struct of_device_id loongson_nand_match[] = {
 		.compatible = "loongson,ls2k0500-nand-controller",
 		.data = &ls2k0500_nand_data,
 	},
+	{
+		.compatible = "loongson,ls2k1000-nand-controller",
+		.data = &ls2k1000_nand_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, loongson_nand_match);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
