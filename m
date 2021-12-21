Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C162EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZasXDtmtNTCeznrFGQte53rWYYaOG8PlMXCRDc6D+QY=; b=pciKEv7wq1rgdf
	lDdzjCMBDyWmaOu7L9HYfh2619Gw46j0p++IDHjJ32TyHXkHgxLSYsz9ZQocwXjHjVYLPBhSQHmaR
	JFKXU9maB7Jj35iP4VtD+3kf21WKZPaAL4VIMGD1bByhOQv293MAU0WdAES1cA+KK4uqyoJoJhAvi
	T36tcnF0gHncxjk5Lysrn3hfqn284Q5+Ip46+oCMbyYRRNB8Pp2YAlqR5aKbWBqx94L+KY7A7+Hzp
	dvwHkBqp0RE+lSaM2zz0QP4KSeNPtJIpfdTR+0rUy+DYZc+C3mYsp2cVi+e+Aw+YpcuLZwdqVqEx5
	jsgomoYQjHGmVlo9ZNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzf2a-006vCw-Oa; Tue, 21 Dec 2021 13:18:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzf20-006v4c-Kn
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 13:18:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39EFA6159B;
 Tue, 21 Dec 2021 13:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE06C36AE9;
 Tue, 21 Dec 2021 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640092695;
 bh=Nqe6mT09B1kTX33/VRmKBI2xx5UPngqh2E87CJblXg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q11EtiJnQ+VoC6JNDoZINAHnuKhWEUMv7E0sC7FV5AmFsGffUrgodM7PDzKsrdmKA
 jJvF7Q7YMIJXB+P5R5xgJY5IwE0JXwbUmtz713iWbBTuwhbqbuyvzpHcFmCRYA6MJa
 53i6EJVnT7WcpyNzjVYT0C6kdl9Y2DzoQ9791vDzk/B2cur/IaKIuD9HR53TOGRhV/
 uOXD4SbNuCtKfZtkfd5UtixKiYO7flM6Q+k1Kbj9Ssx9F3Pg76NO0s6yyt0+lPoJqo
 S5MKX27Pswdy3yRLBaffxZKUHSkQBJdQdox/9ihrdowrLOoYdHQ15dMDmPN8e5Zmfe
 GHi/trBBx+ZVw==
From: Roger Quadros <rogerq@kernel.org>
To: krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 3/4] memory: omap-gpmc: Use a compatible match table when
 checking for NAND controller
Date: Tue, 21 Dec 2021 15:17:56 +0200
Message-Id: <20211221131757.2030-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_051816_780327_EC72F776 
X-CRM114-Status: GOOD (  17.06  )
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

As more compatibles can be added to the GPMC NAND controller driver
use a compatible match table.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c                   | 6 +++++-
 drivers/mtd/nand/raw/omap2.c                 | 5 +----
 include/linux/platform_data/mtd-nand-omap2.h | 9 ++++++++-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 624153048182..d19ffc895e5b 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2091,6 +2091,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	u32 val;
 	struct gpio_desc *waitpin_desc = NULL;
 	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
+	bool is_nand = false;
 
 	if (of_property_read_u32(child, "reg", &cs) < 0) {
 		dev_err(&pdev->dev, "%pOF has no 'reg' property\n",
@@ -2183,7 +2184,10 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		}
 	}
 
-	if (of_device_is_compatible(child, "ti,omap2-nand")) {
+	if (of_match_node(omap_nand_ids, child))
+		is_nand = true;
+
+	if (is_nand) {
 		/* NAND specific setup */
 		val = 8;
 		of_property_read_u32(child, "nand-bus-width", &val);
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index b26d4947af02..e6dd8b4cf0d2 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2352,10 +2352,7 @@ static int omap_nand_remove(struct platform_device *pdev)
 	return ret;
 }
 
-static const struct of_device_id omap_nand_ids[] = {
-	{ .compatible = "ti,omap2-nand", },
-	{},
-};
+/* omap_nand_ids defined in linux/platform_data/mtd-nand-omap2.h */
 MODULE_DEVICE_TABLE(of, omap_nand_ids);
 
 static struct platform_driver omap_nand_driver = {
diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
index de6ada739121..92f011805ad4 100644
--- a/include/linux/platform_data/mtd-nand-omap2.h
+++ b/include/linux/platform_data/mtd-nand-omap2.h
@@ -7,6 +7,7 @@
 #define	_MTD_NAND_OMAP2_H
 
 #include <linux/mtd/partitions.h>
+#include <linux/mod_devicetable.h>
 
 #define	GPMC_BCH_NUM_REMAINDER	8
 
@@ -61,4 +62,10 @@ struct gpmc_nand_regs {
 	void __iomem	*gpmc_bch_result5[GPMC_BCH_NUM_REMAINDER];
 	void __iomem	*gpmc_bch_result6[GPMC_BCH_NUM_REMAINDER];
 };
-#endif
+
+static const struct of_device_id omap_nand_ids[] = {
+	{ .compatible = "ti,omap2-nand", },
+	{},
+};
+
+#endif /* _MTD_NAND_OMAP2_H */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
