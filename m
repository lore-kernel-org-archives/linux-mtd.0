Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6BCFD629
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DethJr3bXERwQ0eFIf666LzE0rxHpeYblGCNn4eLUiQ=; b=Czrk+yGI2LIu5h
	lIaZeUIb7ZcOA1//DFgNsOWj/OccZk/f5tVlzCsx0VScoa4tKg55//swjvhXfabtEEiHc0VerlTLZ
	POkj3FkS/Goy1yMDipwkUFXo+SuVb+5kvgqRANL8y+A4afESm9WBcQLUNvkAZiMl+h1U3rkD14a/b
	Sk4rgEp4QODGAQ5wDFkWVlesk11VDk7HGAmgV6I2/TX7QIgBMutBUvPeDi40u3tPlifiNzvepa+Kc
	77NX/Ms2H+MG9IjHXjmPV0uVbQzTemdT/5PkPFxQ2s1yAOgYf7jgaQUyRuYqOS5CPWNFe+k+WsAPh
	K5sZ16CRN1kqD627xJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTEA-0000000Ex73-29Ni;
	Wed, 07 Jan 2026 13:05:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE4-0000000Ex1c-364j;
	Wed, 07 Jan 2026 13:05:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8126FC1EC92;
	Wed,  7 Jan 2026 13:04:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F772606F8;
	Wed,  7 Jan 2026 13:05:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA835103C873E;
	Wed,  7 Jan 2026 14:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zbeN6veyBsnJXwhFnHq/E++8EqnB+Vxb96PGx9jh/pQ=;
	b=lWrkF9GSBlwT5WwjIrJ9TOFk3IsntDlxprTL54vzRz54XOAtyuJZi3klPX5atMpEEmvOyk
	El0roSJp5z20SqmXU3oyLxnth8Zqe3alS2KduFKQBQjR26nh+brdhA3TpmhJuv68BS3o+a
	nRCyP8+eVuQqEWrHz4BEV2h/gdtxUIZ4Q0Ro6SAduQSfWSD4Lz2X+NtQTqQDxhCGT53vQ2
	GAnfoGmhkXOXbQDbwRzXwQSw8voIFDuDEUwEiU1Z/1egq0Wp8AB01D3c+kpcCuwrUgj2dR
	PLZSDL/p4qF6xbk/N/4cOlhexrRJYw+ovoCEK297up3OMPsb5ZjwyC8tFgoNMA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 07 Jan 2026 14:04:55 +0100
Subject: [PATCH v3 4/4] mtd: physmap: Add support for RAM reserved memory
 regions
MIME-Version: 1.0
Message-Id: <20260107-mtd-memregion-v3-4-f9fc9107b992@bootlin.com>
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
In-Reply-To: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_050525_067632_2B371A27 
X-CRM114-Status: GOOD (  22.49  )
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

MTD fixed-partitions can now be exposed for reserved RAM regions, not
just ROM reg regions. This is achieved by using the new compatible
property (mtd-mem or mtd-memro) previously introduced in the reserved
memory region node.

Based on the work of Muhammad Musa <muhammad.musa@intel.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/mtd/maps/physmap-core.c | 73 +++++++++++++++++++++++++++++++++--------
 drivers/of/platform.c           |  2 ++
 2 files changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2bd7a1af898c9..cc7d08a413c78 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -39,6 +39,7 @@
 #include <linux/mtd/cfi_endian.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
@@ -263,6 +264,14 @@ static const struct of_device_id of_flash_match[] = {
 		.type = "rom",
 		.compatible = "direct-mapped"
 	},
+	{
+		.compatible = "mtd-mem",
+		.data = "map_ram",
+	},
+	{
+		.compatible = "mtd-memro",
+		.data = "map_rom",
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_flash_match);
@@ -348,10 +357,19 @@ static int physmap_flash_of_init(struct platform_device *dev)
 
 	map_indirect = of_property_read_bool(dp, "no-unaligned-direct-access");
 
-	err = of_property_read_u32(dp, "bank-width", &bankwidth);
-	if (err) {
-		dev_err(&dev->dev, "Can't get bank width from device tree\n");
-		return err;
+	if ((of_device_is_compatible(dp, "mtd-mem")) ||
+	    (of_device_is_compatible(dp, "mtd-memro"))) {
+		/*
+		 * When using reserved memory region from DRAM we use
+		 * the defaullt 32 bits acces
+		 */
+		bankwidth = 4;
+	} else {
+		err = of_property_read_u32(dp, "bank-width", &bankwidth);
+		if (err) {
+			dev_err(&dev->dev, "Can't get bank width from device tree\n");
+			return err;
+		}
 	}
 
 	if (of_property_read_bool(dp, "big-endian"))
@@ -446,8 +464,9 @@ static int physmap_flash_pdata_init(struct platform_device *dev)
 static int physmap_flash_probe(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
-	int err = 0;
-	int i;
+	struct resource *res_array;
+	int err = 0, is_rsvd_mem = 0, nreg = 0;
+	int i, curr_reg;
 
 	if (!dev->dev.of_node && !dev_get_platdata(&dev->dev))
 		return -EINVAL;
@@ -459,9 +478,13 @@ static int physmap_flash_probe(struct platform_device *dev)
 	while (platform_get_resource(dev, IORESOURCE_MEM, info->nmaps))
 		info->nmaps++;
 
-	if (!info->nmaps)
-		return -ENODEV;
-
+	if (!info->nmaps) {
+		info->nmaps = of_reserved_mem_region_total_count(dev->dev.of_node);
+		if (info->nmaps > 0)
+			is_rsvd_mem = 1;
+		else
+			return -ENODEV;
+	}
 	info->maps = devm_kzalloc(&dev->dev,
 				  sizeof(*info->maps) * info->nmaps,
 				  GFP_KERNEL);
@@ -503,7 +526,23 @@ static int physmap_flash_probe(struct platform_device *dev)
 	for (i = 0; i < info->nmaps; i++) {
 		struct resource *res;
 
-		info->maps[i].virt = devm_platform_get_and_ioremap_resource(dev, i, &res);
+		if (is_rsvd_mem) {
+			if (nreg <= i) {
+				int cnt = of_reserved_mem_region_to_resource_array(&dev->dev,
+							   dev->dev.of_node, i, &res_array);
+				if (cnt < 0) {
+					err = cnt;
+					goto err_out;
+				}
+				nreg += cnt;
+				curr_reg = 0;
+			}
+			res = &res_array[curr_reg++];
+			info->maps[i].virt = devm_ioremap_resource(&dev->dev, res);
+		} else {
+			info->maps[i].virt = devm_platform_get_and_ioremap_resource(dev, i, &res);
+		}
+
 		if (IS_ERR(info->maps[i].virt)) {
 			err = PTR_ERR(info->maps[i].virt);
 			goto err_out;
@@ -519,9 +558,17 @@ static int physmap_flash_probe(struct platform_device *dev)
 			info->maps[i].phys = res->start;
 
 		info->win_order = fls64(resource_size(res)) - 1;
-		info->maps[i].size = BIT(info->win_order +
-					 (info->gpios ?
-					  info->gpios->ndescs : 0));
+		/* When using a memory region, the size is not necessarily a
+		 * power of 2, so win_order is not applicable. Since GPIOs are
+		 * unavailable in this context, directly using the region's size
+		 * is safe.
+		 */
+		if (is_rsvd_mem)
+			info->maps[i].size = resource_size(res);
+		else
+			info->maps[i].size = BIT(info->win_order +
+						 (info->gpios ?
+						  info->gpios->ndescs : 0));
 
 		info->maps[i].map_priv_1 = (unsigned long)dev;
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f77cb19973a5d..23ea5a723aa7f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -496,6 +496,8 @@ static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "ramoops" },
 	{ .compatible = "nvmem-rmem" },
 	{ .compatible = "google,open-dice" },
+	{ .compatible = "mtd-memro" },
+	{ .compatible = "mtd-mem" },
 	{}
 };
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
