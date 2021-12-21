Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D400C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbXpMJNlk68dwj7y/rm9esatSbdOKQ2KVL11HeYLJdQ=; b=iPzgiiNrpnwIZs
	lGK12R6r6LZoHYitlzi0IfdUxtp3Adar87G2uknVI+BouWGS9Uo92I1vxEk+hEeYgYbLdzwYNDzEG
	K/hB+5oQH9+sj4Aqnwo9lRSnBJOtEAeRhgKYpV6MbwTbJzwwjEQIrhWxHC/fyvWkkM65F+E67yoHc
	ZKeTfKrwl5S0DQFGzRdI3lydTKByq5XZ+u4cX2YPm1b8OzqsF+HiLxEWd8lXNPPrsiYeoVy4EeuJa
	rt0nC3hdBxAG9RUotR3fycocvjCjTTQI073C7DAsOr8zFLS/zqWh1EqQCl9A5lLXGCe2YOkaIC7nQ
	r9oPm24xzm/YLrBqEiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzf2M-006v8o-5j; Tue, 21 Dec 2021 13:18:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzf1z-006v4D-Cr
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 13:18:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28967B816AD;
 Tue, 21 Dec 2021 13:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6040BC36AE2;
 Tue, 21 Dec 2021 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640092692;
 bh=MeirT4xGsKt7osRpBz1wQ0uIbtgu/8LH4Sy26maoJnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zit+Yb7cyDorZ9iSV0bEmdgRNfYpo1kgVyNVeWRoq85n99EIDL8cXIoqMS4XSEtYS
 nyDFrZQkLxbTMKvd/ZxzariP9NNduubecXv8OSHbqp8MbxambWpfIOP42Y+gD/W+2Y
 mjij64Ils7tm8CA9O2SXLNurgnEoM/UwYxD2cUlDU7t/PslPHCHkpr1nBvtIvA0pmO
 eVE5ZjG+GlJB7S0okPMdqGxmOreAKO4yVHs1Ra/3frMyu5WQv/DpXIpQbj8Ajp44Pv
 pkWj9buEalxcPlxcGYaGreT6cYmxaO/b7Wzfc+emfwhudKDdE+OhU/IdYGxMLQGKvC
 MVPOsj9UTf61A==
From: Roger Quadros <rogerq@kernel.org>
To: krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 2/4] memory: omap-gpmc: Add support for GPMC on AM64 SoC
Date: Tue, 21 Dec 2021 15:17:55 +0200
Message-Id: <20211221131757.2030-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_051815_731357_233B6236 
X-CRM114-Status: GOOD (  16.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The TI's AM64 SoC has the GPMC module. Add compatible for it.

Traditionally GPMC external addresses have always been mapped to first
1GB physical address. However newer platforms, can have it mapped
at different locations. Support this address provision via device tree.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c | 40 ++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index be0858bff4d3..624153048182 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -237,6 +237,7 @@ struct gpmc_device {
 	struct omap3_gpmc_regs context;
 	int nirqs;
 	unsigned int is_suspended:1;
+	struct resource *data;
 };
 
 static struct irq_domain *gpmc_irq_domain;
@@ -1456,12 +1457,18 @@ static void gpmc_mem_exit(void)
 	}
 }
 
-static void gpmc_mem_init(void)
+static void gpmc_mem_init(struct gpmc_device *gpmc)
 {
 	int cs;
 
-	gpmc_mem_root.start = GPMC_MEM_START;
-	gpmc_mem_root.end = GPMC_MEM_END;
+	if (!gpmc->data) {
+		/* All legacy devices have same data IO window */
+		gpmc_mem_root.start = GPMC_MEM_START;
+		gpmc_mem_root.end = GPMC_MEM_END;
+	} else {
+		gpmc_mem_root.start = gpmc->data->start;
+		gpmc_mem_root.end = gpmc->data->end;
+	}
 
 	/* Reserve all regions that has been set up by bootloader */
 	for (cs = 0; cs < gpmc_cs_num; cs++) {
@@ -1888,6 +1895,7 @@ static const struct of_device_id gpmc_dt_ids[] = {
 	{ .compatible = "ti,omap3430-gpmc" },	/* omap3430 & omap3630 */
 	{ .compatible = "ti,omap4430-gpmc" },	/* omap4430 & omap4460 & omap543x */
 	{ .compatible = "ti,am3352-gpmc" },	/* am335x devices */
+	{ .compatible = "ti,am64-gpmc" },
 	{ }
 };
 
@@ -2502,13 +2510,25 @@ static int gpmc_probe(struct platform_device *pdev)
 	gpmc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, gpmc);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOENT;
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	if (!res) {
+		/* legacy DT */
+		gpmc_base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(gpmc_base))
+			return PTR_ERR(gpmc_base);
+	} else {
+		gpmc_base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(gpmc_base))
+			return PTR_ERR(gpmc_base);
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "data");
+		if (!res) {
+			dev_err(&pdev->dev, "couldn't get data reg resource\n");
+			return -ENOENT;
+		}
 
-	gpmc_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(gpmc_base))
-		return PTR_ERR(gpmc_base);
+		gpmc->data = res;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
@@ -2562,7 +2582,7 @@ static int gpmc_probe(struct platform_device *pdev)
 	dev_info(gpmc->dev, "GPMC revision %d.%d\n", GPMC_REVISION_MAJOR(l),
 		 GPMC_REVISION_MINOR(l));
 
-	gpmc_mem_init();
+	gpmc_mem_init(gpmc);
 	rc = gpmc_gpio_init(gpmc);
 	if (rc)
 		goto gpio_init_failed;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
