Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB498CA0EFA
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Aug 2025 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnX5ee55+Lz8KHpQk04eQ9OWB2NlhVuHoMzFtDkSRyU=; b=eKHT3+O42QASW6
	xMIuK812ZKrofBBmT+qaLwD4H8U7B6ryT3OH19helX37fmZB4iIX36iilbdah1E15vSsUHueTu458
	Kt0/PQP0l8s7fqq/ya5hRInwR7joT3TaFAISLXYbx0l6TsNZVYmrueUZsl7K56MenMr0NHvt5eNlF
	Cy9xGl5uNwyo5IrWBuh9AJDBzx4vkhGwdep0COlNG0nx4n4A9Vl03soquJYfYPeckOHYk5yjxKi1s
	+5KuRvxSYhiFL3lKmO6hAtnunKkNO8E8EhlzPWBezdr82bpBuBuYYhCJx09+HRybv9l4B0LlGgL7R
	iN01LK+zxlMKtV0TQD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozHL-0000000G1xS-3q2I;
	Thu, 21 Aug 2025 07:00:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxw-0000000FyhQ-16fM
	for linux-mtd@bombadil.infradead.org;
	Thu, 21 Aug 2025 06:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ja+F/Ralu0iWz+CR1mwf/tiUOLJ7vfAP3EsyupxyM6A=; b=ML434aY80S5VY9H0Gv6ijgLkhS
	OVrS02bWQH1KRzzr7bu687DfjiM7XAKq69Z8wMIjrxQVkr9qhWY2lQPX6xxFOoRmH6neC1/UZytYF
	AJ+V0O0EOxdIbB2+pFPsnZ9jD+dSeh2AsLhAebQqN63TGMKUZglFqYp7BfEcEAVk+QZj4KkVhOcKe
	QCy/9LICsc1gOzJYzuhUMuzkZTTVZf06hZBJXfaIUnph3sy0sZLeCFJl0BPdES3vtHZPF8c+wFDL+
	FEzJGPe/cuHf9AYmjEB7olP9n8LboDZ6PYyHjO5WH+dUe916pxwSU5PMY66HwxnHuohUi0vR8vP5W
	0pUZh0Tw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxr-00000000Ug3-49IB
	for linux-mtd@lists.infradead.org;
	Thu, 21 Aug 2025 06:40:03 +0000
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8AxRNAuv6ZoAU4BAA--.2043S3;
	Thu, 21 Aug 2025 14:39:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJDxrcEhv6ZowvRcAA--.65049S5;
	Thu, 21 Aug 2025 14:39:41 +0800 (CST)
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
Subject: [PATCH v3 7/7] mtd: rawnand: loongson: Add Loongson-2K1000 NAND controller support
Date: Thu, 21 Aug 2025 14:39:21 +0800
Message-ID: <f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1755757841.git.zhoubinbin@loongson.cn>
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJDxrcEhv6ZowvRcAA--.65049S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw45WFW3CrW8Cr1UXw48Zrc_yoW5Kr4rpa
	yUAay3KFW5KF4Y9a98tayrCr13Z34fJr9rJFZrW34xK3s3J34DWFy8GF10qF4avFyxWryx
	ZFyvgas7uFsrXrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAF
	wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U0bo7JUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_074001_635664_2A573D9C 
X-CRM114-Status: GOOD (  15.00  )
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
index 7b331d0ca2f0..6610c239f721 100644
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
@@ -762,6 +771,23 @@ static void loongson_nand_controller_cleanup(struct loongson_nand_host *host)
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
@@ -780,6 +806,12 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
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
@@ -939,6 +971,18 @@ static const struct loongson_nand_data ls2k0500_nand_data = {
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
@@ -952,6 +996,10 @@ static const struct of_device_id loongson_nand_match[] = {
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
