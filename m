Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31286CD6115
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qDFmFr7oLGOq1JHs7hc0DtYk+Dbdnp60kh3enRAwaJc=; b=mT+y0plS9Oh/dj
	3lVWf9xEezexSLou4FgXPET8cmg/ASwSw3dh/aIgb+Q5aqYvMxE667PurXNQF5KKGfTz3x4ZgYRu3
	+jsKk8FJLvzQfmTdVKaTNBZNL0v+M7pG5tZHtxeuP/Kf+AukA/xf0ZX0ZrgSEM7WE+K67WU7kCgtj
	Krpta2OaKOaR5JhXkyMAts3Ykn0unt8BeckldNEs7//MgR7rgzdreimKRw/Yx32g0SF/f1vklPKlq
	rvQjvW/jXI4RKaHKbhBQoVwGhoaM7Js6Hl9rGgpft8RqRMz7eMypVyLnS+ALVlJk1xIh054fm9Pri
	XEvNjouZegOZHFGtxTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpu5H-00BIBJ-3C;
	Mon, 09 Oct 2023 17:30:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpu5E-00BI9e-2B
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 17:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 22835B8163C;
	Mon,  9 Oct 2023 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D75C433C8;
	Mon,  9 Oct 2023 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696872618;
	bh=sx1WoOjHaMFdTQ94kKpqfTIrZkWzcWgNOPYR3IAiEnA=;
	h=From:To:Cc:Subject:Date:From;
	b=Erz4h7PnwGdYsKPPDmpKjzmwgGq/yPUJJag64Hhs/bUOEcgTxiXmDSbq+fA/JmaNA
	 gvkkYTsvOE6uoY+QT1L37QqfzSeXuQZqGoqO61cPxYgiu71sdA9GpFkNw5Vb8Hs2Az
	 YDB5bLjFu4C5OwC4UuJYg/lpw7IW5lPdZbnUTJIGkFaFJ9hHN/CdiSxz8R4+Rfy0J9
	 TDrBeKfgo4mXCw44hz/4yIyO8BNYZrQ79CGH2WI6n8FSWBL1oSIT7QiMCPKElYWsck
	 EJaaOqVSzBNIW+dPfMkep+MB4n05HuNCF2dJKVbYH9xixhkmPNCHPKiN+XWIEDON5D
	 pglJS28VkhafA==
Received: (nullmailer pid 2480196 invoked by uid 1000);
	Mon, 09 Oct 2023 17:30:16 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Use device_get_match_data()
Date: Mon,  9 Oct 2023 12:28:56 -0500
Message-ID: <20231009172923.2457844-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_103021_007986_716674F2 
X-CRM114-Status: GOOD (  13.76  )
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

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mtd/maps/physmap-core.c                | 10 +++-------
 drivers/mtd/nand/raw/cadence-nand-controller.c | 12 +++++-------
 drivers/mtd/nand/raw/vf610_nfc.c               | 10 ++++------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index fc8721339282..c99db9c6d25a 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
@@ -37,7 +38,7 @@
 #include <linux/mtd/concat.h>
 #include <linux/mtd/cfi_endian.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
@@ -296,14 +297,9 @@ static const char * const *of_get_part_probes(struct platform_device *dev)
 static const char *of_select_probe_type(struct platform_device *dev)
 {
 	struct device_node *dp = dev->dev.of_node;
-	const struct of_device_id *match;
 	const char *probe_type;
 
-	match = of_match_device(of_flash_match, &dev->dev);
-	if (!match)
-		return NULL;
-
-	probe_type = match->data;
+	probe_type = device_get_match_data(&dev->dev);
 	if (probe_type)
 		return probe_type;
 
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 034ec564c2ed..f19bf06e9e05 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -15,8 +15,10 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/of_device.h>
 #include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 /*
@@ -2995,15 +2997,11 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 	struct cadence_nand_dt *dt;
 	struct cdns_nand_ctrl *cdns_ctrl;
 	int ret;
-	const struct of_device_id *of_id;
 	const struct cadence_nand_dt_devdata *devdata;
 	u32 val;
 
-	of_id = of_match_device(cadence_nand_dt_ids, &ofdev->dev);
-	if (of_id) {
-		ofdev->id_entry = of_id->data;
-		devdata = of_id->data;
-	} else {
+	devdata = device_get_match_data(&ofdev->dev);
+	if (!devdata) {
 		pr_err("Failed to find the right device id.\n");
 		return -ENOMEM;
 	}
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 3f783b8f76c9..f31d23219f91 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -29,8 +29,9 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/swab.h>
 
@@ -810,7 +811,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	struct device_node *child;
-	const struct of_device_id *of_id;
 	int err;
 	int irq;
 
@@ -840,12 +840,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->clk);
 	}
 
-	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
-	if (!of_id)
+	nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
+	if (!nfc->variant)
 		return -ENODEV;
 
-	nfc->variant = (uintptr_t)of_id->data;
-
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
-- 
2.42.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
