Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1349ECAC592
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ziwuOB87mQbuPaC5kfv3kswdf+dow+jNn/R+c0TDB00=; b=Z00yUQONVMKbDb
	PbwkavODy8o6mRDsQPHVo8CPEvOHpZvcptz/8ZV+uPa/QVV011fsOLgzNdD1yiZl3fslRax5ZGHZM
	6wXVHzUSHZztgBRgjRnVauktL2vI8BgSdHDvxPjM1TXfYyFdxYfikC3w/BA3wnZVzh6I4DDvttoXz
	gsQFKY8GeRodcd+saMdbu7CzDmhblDkxFsKkqk5YLoJcVSrGfBxP3fuRo1HUIc0XQVtw52ltxQvUp
	DV3vYWDccFvi4wQBWyGOj3ME45r8HyFXC/ycGymxYzLvHWFmAOk3/EEV6zV+mF255ZmYp7p2fRoky
	Z7AIlttXui+xsCSnRC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iee-0000000AqzA-3TaY;
	Mon, 22 Sep 2025 15:40:40 +0000
Received: from smtp28.bhosted.nl ([2a02:9e0:8000::40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ieb-0000000Aqxu-49gs
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=4m4XxfeOnQfD8SjFcUdl5itKBGk9YX/dPDna0jtQUXw=;
	b=RgxdkXikJ4C1IUraDotl7A2lAWMKaHYSAdsmuRZvm8BojeT9lKz3aDSFV1hDbNaweRDCh65I7biJD
	 QEURI2TTb330OHUuQRBgLjMiQYEsiY89rmaIZc+Zg7vZkcH3LOBVNDNHABrjRM4BsfWVCBqHGImtje
	 KIuRjKZLZQOHMX/CGGZEXlXcOBO6n5SZOdErPH88gOy0+aJ1meSxnI2ZdQJroQyPfJccylXC5/mFX5
	 E0odx9cc8O4C/CrXGk+VMvpqDBnOsLLJwCy4dWjPUB7fO6l/tCtfVGxCW1cOPzsn/26JdD5BMOIbYg
	 Njis3hRXa303t/tc+Vdoq4kKIaUpNaw==
X-MSG-ID: 78c8b809-97ca-11f0-867b-0050568164d1
From: Maarten Zanders <maarten@zanders.be>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maarten Zanders <maarten@zanders.be>,
	stable@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N
Date: Mon, 22 Sep 2025 17:39:38 +0200
Message-ID: <20250922153938.743640-2-maarten@zanders.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_084038_440351_EFFCC19A 
X-CRM114-Status: GOOD (  10.57  )
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

Commit f04ced6d545e ("mtd: nand: raw: gpmi: improve power management
handling") moved all clock handling into PM callbacks. With CONFIG_PM
disabled, those callbacks are missing, leaving the driver unusable.

Add clock init/teardown for !CONFIG_PM builds to restore basic operation.
Keeping the driver working without requiring CONFIG_PM is preferred over
adding a Kconfig dependency.

Fixes: f04ced6d545e ("mtd: nand: raw: gpmi: improve power management handling")
Signed-off-by: Maarten Zanders <maarten@zanders.be>
Cc: stable@vger.kernel.org
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f4e68008ea03..a750f5839e34 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -145,6 +145,9 @@ static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
 	return ret;
 }
 
+#define gpmi_enable_clk(x)	__gpmi_enable_clk(x, true)
+#define gpmi_disable_clk(x)	__gpmi_enable_clk(x, false)
+
 static int gpmi_init(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
@@ -2765,6 +2768,11 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
+#ifndef CONFIG_PM
+	ret = gpmi_enable_clk(this);
+	if (ret)
+		goto exit_acquire_resources;
+#endif
 
 	ret = gpmi_init(this);
 	if (ret)
@@ -2800,6 +2808,9 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+#ifndef CONFIG_PM
+	gpmi_disable_clk(this);
+#endif
 }
 
 static int gpmi_pm_suspend(struct device *dev)
@@ -2846,9 +2857,6 @@ static int gpmi_pm_resume(struct device *dev)
 	return 0;
 }
 
-#define gpmi_enable_clk(x)	__gpmi_enable_clk(x, true)
-#define gpmi_disable_clk(x)	__gpmi_enable_clk(x, false)
-
 static int gpmi_runtime_suspend(struct device *dev)
 {
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
