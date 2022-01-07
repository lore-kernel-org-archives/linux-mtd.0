Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3560C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKJMjD8QlMPqr+tYmxlZxFBmOpVH2LUau0338q8jv9s=; b=fnuM4ow+o37V5h
	dSHj2ifoumbzh2jFRQ578F9WUYrHYpKD+dEQrB7kBXd8bR97JUBS8gP8Nj8kz5l7UaHg3bTek6BvC
	0QVMs1EhKShz0zzO4wKNttvkBV8gHliv6+dsR4S9FIGH3isCzXV+/NDCGXyxTDhIoq47UEw4G6X5T
	QK9/QHUIEyf1CL8SaJYXzf7TeGPmIDvk4AljCCNDf99jCcdqy5hzWRPkOU03Uck0XDLNwi396ABOD
	tJpKiCJi2dUksy0SLCtQl6BxoOavfwg7iWGgIu2IqVvfe4eInowj/ms3opk2IS7o4eLlAs8m4zGII
	2wOU5r6GJHoSwUgqLkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5cuO-001dP5-3T; Fri, 07 Jan 2022 00:15:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ctV-001d8R-HF
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n16so3640328plc.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IoY5n8/hOXcYzzCekmvhUPi61HYip2TvWuhybrzU3W0=;
 b=fHEPV0IbYaeoGAvRgyHjHhrb3ALA2rKz2ZwOsHdUqg0dVO3o66WNLPzuTuH/F59/y0
 wkjiLOYFk5d87glZGSB43JO5Eo8Z+NxFwbTiLo6RFuBtgR7O+4Ie84nPbCwTpTDkwHYj
 QFWiXCE3upESxoU+ILxtb3fexh/RGt5TWxEBEJCPeMGqnGfuuIxUH3qYF/e2VITDQvjK
 Yxzonyb+JkZKNcV+DTpRaLAY+Nx3bLgJZCfWXlqU2K5rtGs5/dMBvO+Ea/ogcF+rLpvU
 iceOM12AgRt3cx+JzyzOeWqh0t7Mfpnvx4K2K1BQi1s6jSD9OY6WuCShKQisaldi/nop
 dEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IoY5n8/hOXcYzzCekmvhUPi61HYip2TvWuhybrzU3W0=;
 b=w15pK6Coe4p3oAaGumlsvC/F0pbOm4axhvkHcEB1DXiACq9B8tNKi0cHFLQGn/gsSB
 7ZjqRa0BJZrI6YX4JTekwEDw39MwOY6voRLLDsR+da3vEAK/KIGRAYLrqp0BJFwcZjQH
 7KIR3AJJwO5LEAjbE5DIzSkBEZsLZtZ52mODsB/WMVVU2snOTVQaMxN3ZKjQwpNrM7hB
 xflytgJSiMgeQpUQBi/mecXsdW8GTW9VosgE2jpw0hOP/OQhNz2lDOlI0vuC0kNDpTAq
 m2wIZuGix6KORAORes22PbhA5TWRwI/8AeryyiFBRswc9ZhKLy9M0qu9OFtAb+HqfUdW
 0KiQ==
X-Gm-Message-State: AOAM530wcldfei+se0to3B+K3esLVqHxZ84fICFlIABnB10mMKlYHn0y
 zt56jRw2UAUwsdF/aIWLWDliBDH0L7I=
X-Google-Smtp-Source: ABdhPJytawMvWhdWce/qO7j0+OrT8e2Wdw3x91mbzd1pgM9mPVTH3uptZffWDJnhOIwhA52g1o4gQw==
X-Received: by 2002:a17:902:ce85:b0:148:d590:573e with SMTP id
 f5-20020a170902ce8500b00148d590573emr61616173plg.85.1641514448138; 
 Thu, 06 Jan 2022 16:14:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:07 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v2 4/9] mtd: rawnand: brcmnand: Move OF operations out of
 brcmnand_init_cs()
Date: Thu,  6 Jan 2022 16:13:23 -0800
Message-Id: <20220107001328.2233896-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107001328.2233896-1-f.fainelli@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161409_594682_0CA3F0B8 
X-CRM114-Status: GOOD (  14.72  )
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

In order to initialize a given chip select object for use by the
brcmnand driver, move all of the Device Tree specific routines outside
of brcmnand_init_cs() in order to make it usable in a platform data
configuration which will be necessary for supporting BCMA chips.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index fc14765f7d23..eb3f96489f83 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2768,7 +2768,7 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
 };
 
-static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
+static int brcmnand_init_cs(struct brcmnand_host *host)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct device *dev = ctrl->dev;
@@ -2777,16 +2777,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	int ret;
 	u16 cfg_offs;
 
-	ret = of_property_read_u32(dn, "reg", &host->cs);
-	if (ret) {
-		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
-	}
-
 	mtd = nand_to_mtd(&host->chip);
 	chip = &host->chip;
 
-	nand_set_flash_node(chip, dn);
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
@@ -3195,7 +3188,16 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			host->pdev = pdev;
 			host->ctrl = ctrl;
 
-			ret = brcmnand_init_cs(host, child);
+			ret = of_property_read_u32(child, "reg", &host->cs);
+			if (ret) {
+				dev_err(dev, "can't get chip-select\n");
+				devm_kfree(dev, host);
+				continue;
+			}
+
+			nand_set_flash_node(&host->chip, child);
+
+			ret = brcmnand_init_cs(host);
 			if (ret) {
 				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
