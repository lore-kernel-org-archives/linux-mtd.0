Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD0DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2rtqikBNoydttzJ2RwHIEybifnGWaxn4s+Vyp5w0vQ=; b=NtQjk/CkBcPUWg
	PBUHhC5BXzuM/Ln4m6YzzvgSXby+atwqXTmyAcamXzemBZpSMmnDXYAewTdrAGj3l7qlE6wXZIRQX
	jnV116yuGR0NMr+oVDUz9ErI3Z6pYFC8WcBQ7+yvaTFqCzDGxKqzDAg5SlrwfkiyOr7TuAW1Y/aYY
	aFfFuCIQo6ORZLdsR6UO3dbEd4vtPF1e24gV+9LTKsImM24DY/BJ4MN6eJfBijyLN/ZSf7EQzKX2k
	ubNF3EgVY2w9r3LfwXA1tjX/E6+cfBNStoYChXkbc/YglliXDGdipCJQizNHqIE/43afmC8ewR3XI
	eqm3h/AsUshsW3ET8Hgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0BvP-00BYkY-HO; Thu, 23 Dec 2021 00:25:39 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Bsa-00BXhe-QP
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:46 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so7287565pja.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ooOQpqGI8yqwBdhnAO1DTOd+XDWRopDBw4/NhIv0RTg=;
 b=Caau2MVJF8vOqLzcwoVJXvMhtrKVgzUKS7PfAM0T86L5n6vh3B5MtIy4/0vpJflYMk
 8o8O97LLzApN2bfBSOuJpaMQQxa1GFs31k74LvcYSDIkjAbezmh99XHexENvLCNprvrG
 qoo/VAhQuqVPEUfszUKj4xDs+Nk/cJ82RVgF20dS8FT5kSs/ayOMxIe2FDgK4ShFRzJ5
 QQ5YVpQmoMoZoQhiFYsRUpTvsVshweqH6AfWc64S4kEYgoriaWvJHsKqPoad/us8KpwT
 gGTpy8Musa+aPKHIeRnKTOeLEaVgYR0UYiN+Rsj1CTbWmsZqk+wE64BBS5Au920rBMyL
 a74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooOQpqGI8yqwBdhnAO1DTOd+XDWRopDBw4/NhIv0RTg=;
 b=59Ib5Gw+Muap1l+dzl/WXnYB+P1FCGPCS7xhxKAjXCBjmN70Vbj62YlSNPLzVxG6Ym
 gCplcFmU/zTVM8hyjHrLyNxuiClENHZzJjSy9/RARonQgs66ZMlTHTMd2TQRtt6wfSF2
 QbYrqmOE60CLJRLj7XYCczf2NYrexVgK1juvxFm24Qh45481sA0nwKQgyAMZZrhjA3J3
 3hTc1DB/1BiGa6eGOp+TZlkMo06EXvhP5F7qfKEgRMJMXRjGJth8e8GTTj3aFmXcd9vY
 +fXt8GI2pV5A+zoN2p4AY8rKcwyHJJmcrQJiZtCjxXPXnTN+IhDEVCkrMZKs3UIanOT9
 9kwg==
X-Gm-Message-State: AOAM533+Uf/5FViKdVhf9aigwV8mFQwdRNfVH7psMgiFatizbcpNmWuT
 PIFby7dODmg5W/aG75u1Oavn4VlE3BE=
X-Google-Smtp-Source: ABdhPJxa7BlJTDNL5Bl9zH3S6qNvt+nePjZ4VIg972BHLrDi/rIXlBQtfu1Tm6HFn1XrrNRYwtePuw==
X-Received: by 2002:a17:90a:6b44:: with SMTP id x4mr49967pjl.27.1640218963819; 
 Wed, 22 Dec 2021 16:22:43 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:43 -0800 (PST)
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
Subject: [PATCH 7/9] mtd: rawnand: brcmnand: Allow platform data instantation
Date: Wed, 22 Dec 2021 16:22:23 -0800
Message-Id: <20211223002225.3738385-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162244_883798_AD23137D 
X-CRM114-Status: GOOD (  20.67  )
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

Make use of the recently refactored code in brcmnand_init_cs() and
derive the chip-select from the platform data that is supplied. Update
the various code paths to avoid relying on possibly non-existent
resources, too.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 45 ++++++++++++++++++------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e7947cff4dd1..2f2aaa554282 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/brcmnand.h>
 #include <linux/err.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
@@ -2760,7 +2761,8 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
 };
 
-static int brcmnand_init_cs(struct brcmnand_host *host)
+static int brcmnand_init_cs(struct brcmnand_host *host,
+			    const char * const *part_probe_types)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct device *dev = ctrl->dev;
@@ -2813,7 +2815,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
@@ -2982,17 +2984,15 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
+	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node, *child;
 	struct brcmnand_controller *ctrl;
+	struct brcmnand_host *host;
 	struct resource *res;
 	int ret;
 
-	/* We only support device-tree instantiation */
-	if (!dn)
-		return -ENODEV;
-
-	if (!of_match_node(brcmnand_of_match, dn))
+	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
@@ -3013,7 +3013,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	/* NAND register range */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ctrl->nand_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ctrl->nand_base))
+	if (IS_ERR(ctrl->nand_base) && !brcmnand_soc_has_ops(soc))
 		return PTR_ERR(ctrl->nand_base);
 
 	/* Enable clock before using NAND registers */
@@ -3157,7 +3157,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 	for_each_available_child_of_node(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
-			struct brcmnand_host *host;
 
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 			if (!host) {
@@ -3177,7 +3176,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 			nand_set_flash_node(&host->chip, dn);
 
-			ret = brcmnand_init_cs(host);
+			ret = brcmnand_init_cs(host, NULL);
 			if (ret) {
 				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
@@ -3187,6 +3186,32 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		}
 	}
 
+	if (!list_empty(&ctrl->host_list))
+		return 0;
+
+	if (!pd) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	/* If we got there we must have been probing via platform data */
+	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	if (!host) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	host->pdev = pdev;
+	host->ctrl = ctrl;
+	host->cs = pd->chip_select;
+	host->chip.ecc.size = pd->ecc_stepsize;
+	host->chip.ecc.strength = pd->ecc_strength;
+
+	ret = brcmnand_init_cs(host, pd->part_probe_types);
+	if (ret)
+		goto err;
+
+	list_add_tail(&host->node, &ctrl->host_list);
+
 	/* No chip-selects could initialize properly */
 	if (list_empty(&ctrl->host_list)) {
 		ret = -ENODEV;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
