Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8589FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D8660F5B
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50D8660F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQt36fbxQafiENIDidAU2/7usnVthIp7OiaPlhlwnMM=; b=e8P0cx72ZjvdL5
	s9wXmS3yG4HCk8ynCQ4vjlFv2yPumZKCrctuJs8KC6AzgUevsak9I8sHDcZcSSnXAEccX+K67F6Bg
	ztOdkp1PeRvzYDocl1hOo1EBMwD2Hz36CDk4pFLGR0bOhV1DTHA4rJbscreeSx29C0AtBSuzSoye4
	1PNXNLA57ziZr2vhsQ5jreKwsDUmbK0FMp5YefOTdvwB+uuZ/REiseeulN+xmKxCpiUzt7Wc5wHY2
	vPMuIdAXS5zybSv4NifBfvILBGcDSwOaFqWWJce2gS8iPGIjxNGV2fCJ8vqiImhZbrPTG/F6+uaM2
	UP4L1XaEfYsV7yBU8WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7aV-005fxA-6G; Tue, 14 Sep 2021 12:30:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7XD-005eog-6t
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 12:27:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B81560F9F;
 Tue, 14 Sep 2021 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631622454;
 bh=sQuZUWgdARuE9kUIz+EivFia19C84kYYBU5ITZKbWv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VYe2fyB5OyIsRAZIah5+lV6RJBdPKMoC31xPLkQWsG7wF+6nNn/SvmyGr2oyl1YP4
 Hwj0jV9OxOH56nwHSi2p7q/AvvBoA94UUw1YxSmRqlO5R49DZRAsxIFsrCz02Xt8zX
 91O7Gvt99J+4Ind+LSgHOv8G8aiKO5tEkzvTbA5HEKwni8fC/x4Huf60ivmFEhTmWV
 247MczDNHDTAXGqk91S+MZWMuLI2ugg+zXRiJIBaQvybZex9+uRJ1XAP6rjBKIieRc
 AOxbfiruTVo+jDl8Ou4VwsvTrXhmjR2XlE3xj5f4ir6bu81rO2aiN365+HHm60rcMl
 tsLx/WM+TyMdg==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 8/8] memory: gpmc-omap: "gpmc,
 device-width" DT property is optional
Date: Tue, 14 Sep 2021 15:27:05 +0300
Message-Id: <20210914122705.15421-9-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914122705.15421-1-rogerq@kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_052735_319942_C7426D63 
X-CRM114-Status: GOOD (  12.76  )
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

Check for valid gpmc,device-width, nand-bus-width and bank-width
at one place. Default to 8-bit width if none present.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index f80c2ea39ca4..32d7c665f33c 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2171,10 +2171,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		}
 	}
 
-	if (of_device_is_compatible(child, "ti,omap2-nand")) {
-		/* NAND specific setup */
-		val = 8;
-		of_property_read_u32(child, "nand-bus-width", &val);
+	/* DT node can have "nand-bus-width" or "bank-width" or "gpmc,device-width" */
+	if (!of_property_read_u32(child, "nand-bus-width", &val)) {
 		switch (val) {
 		case 8:
 			gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
@@ -2183,24 +2181,37 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 			gpmc_s.device_width = GPMC_DEVWIDTH_16BIT;
 			break;
 		default:
-			dev_err(&pdev->dev, "%pOFn: invalid 'nand-bus-width'\n",
-				child);
+			dev_err(&pdev->dev,
+				"%pOFn: invalid 'nand-bus-width':%d\n", child, val);
+			ret = -EINVAL;
+			goto err;
+		}
+	} else if (!of_property_read_u32(child, "bank-width", &val)) {
+		if (val != 1 && val != 2) {
+			dev_err(&pdev->dev,
+				"%pOFn: invalid 'bank-width':%d\n", child, val);
 			ret = -EINVAL;
 			goto err;
 		}
+		gpmc_s.device_width = val;
+	} else if (!of_property_read_u32(child, "gpmc,device-width", &val)) {
+		if (val != 1 && val != 2) {
+			dev_err(&pdev->dev,
+				"%pOFn: invalid 'gpmc,device-width':%d\n", child, val);
+			ret = -EINVAL;
+			goto err;
+		}
+		gpmc_s.device_width = val;
+	} else {
+		/* default to 8-bit */
+		gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
+	}
 
+	if (of_device_is_compatible(child, "ti,omap2-nand")) {
+		/* NAND specific setup */
 		/* disable write protect */
 		gpmc_configure(GPMC_CONFIG_WP, 0);
 		gpmc_s.device_nand = true;
-	} else {
-		ret = of_property_read_u32(child, "bank-width",
-					   &gpmc_s.device_width);
-		if (ret < 0 && !gpmc_s.device_width) {
-			dev_err(&pdev->dev,
-				"%pOF has no 'gpmc,device-width' property\n",
-				child);
-			goto err;
-		}
 	}
 
 	/* Reserve wait pin if it is required and valid */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
