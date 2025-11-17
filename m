Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF0CEBF97
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9P9Bahpgrfr/yO2OOkBtOi64zcheUl8+X8EoFSpS7E=; b=snZzD7/pdQ+a+9
	9n0TPFsAZff+FRZPOK9BkHdGWws6MNPtgCIggkY57Exqr+dJW2CE+PQ/6ldcWtt4XOwp4JY/70y2R
	+DMgF2Kq8awoDfshbrIgVHCA4RXBy+plRbySyspBOC6QZG4mOhKsfHRfHdGcffRTIUHgAKgwLAmaH
	6SNpY/PWU0p6c9X3AAvE5FBIoMLmbuSdMuJgGfCZtkDusQq6zViTcWvCdjUgdBBdNnNkQNCmsXE8z
	ynxYJR//8kC1To46aSoDYjrPj1UEHx7LKTwyott961EbNdfSGmS9yVz33SZLWcWVQsAKFtspAhfnJ
	1+8FbJXlnaoCICla8HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2am-0000000GRkz-0G9G;
	Mon, 17 Nov 2025 17:00:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ai-0000000GRi4-3ycJ
	for linux-mtd@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BTriyQZYYbnJqpQ9NHQXwg7JbzvLw55voRo8bIRkgF0=; b=M54rmhTnXVTCTqBtidaxGmwBcy
	T2X/fyCH4vkh8Wm0MO0iLOpgVgd3UYp2QqPUFEGuKK7AerqkXYbkVGE4a36a+yC0i29nu6pHC6fzN
	5o4aJ3A6Yoa6uWn6+hSXt4op0tqfxnP6taz/C5hDSvv03D0sqv1/w/1+sakqwOEvHSba4Ep6Vkt8W
	DRQX0mDhzdLj81Wns0SuNcQUnRDIQYJy6ANAi1rEBt9xcJPco0XnT/q2rfHeP1Hr66YJCyBhhjJoW
	UPYo3PBqE4RgH6BgkkW4cAa90mm+AKjM3ElfgokhL0pZ7mwxCje2D17xfGnwjyeA21/YXxwvNJO5q
	Wq8zOSYA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1j2-00000007iUB-21Sw
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 16:05:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C9A1C1265E;
	Mon, 17 Nov 2025 17:00:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64D26606B9;
	Mon, 17 Nov 2025 17:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30FBE10371D6C;
	Mon, 17 Nov 2025 18:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763398832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BTriyQZYYbnJqpQ9NHQXwg7JbzvLw55voRo8bIRkgF0=;
	b=wB7TJ5hhEtRLjauj1zMHEQ1cQIK27amC9ga1W11a70zOBJhLoHgrrUOOonOCkZ8/qD90iG
	wnP4xQS+yHVkG3j7Ee7wptzA86yYAVFqYxl3YOE4MMNmwannthlYdG/gXJfEjiM5zTBWi0
	X/Gg9qxS0liPgSejCEod9xs9E92pj2e4eAsShgj91ZskfgGa6A0EyfPdAgxPBdrE3EvErR
	A08/Ywfv9hIUV9xZvfuF22L3bupVTcnvQHmbza0NMhYjcRTREaAuf8Wj+J7Vg3IAtG3bCR
	PW/H25BH+0W+yKD2evuFmGEgEMBqrZlP80qMIc861C5djHzyOVfLiOt57NuXvg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 17 Nov 2025 18:00:16 +0100
Subject: [PATCH 3/3] mtd: physmap: Add support for RAM reserved memory
 regions
MIME-Version: 1.0
Message-Id: <20251117-mtd-memregion-v1-3-7b35611c79a6@bootlin.com>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
In-Reply-To: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20251117_160508_623599_089A2D7F 
X-CRM114-Status: GOOD (  22.61  )
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
just ROM reg regions. This is achieved by using a memory-region
phandle to reference the reserved RAM region instead of the reg
property.

Based on the work of Muhammad Musa <muhammad.musa@intel.com>

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/mtd/maps/physmap-core.c | 56 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2bd7a1af898c9..f084f6f34d611 100644
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
@@ -446,8 +455,9 @@ static int physmap_flash_pdata_init(struct platform_device *dev)
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
@@ -459,9 +469,13 @@ static int physmap_flash_probe(struct platform_device *dev)
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
@@ -503,7 +517,23 @@ static int physmap_flash_probe(struct platform_device *dev)
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
@@ -519,9 +549,17 @@ static int physmap_flash_probe(struct platform_device *dev)
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
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
