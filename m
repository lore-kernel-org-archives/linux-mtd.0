Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1260C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mw+/5GDNw4o9sJQ9olfvH6moJ1vaaJYoBLWBI45v4XA=; b=gm2NcuaeBC7T1X
	cgGL44MCiAuzXEOv3b+dRhhhicnicEM01S5AFOCVQk2tFraMqB8wa/KMpfXTxqSxH6PU1EyJB+A77
	PeYDnaw0a1Li5CMTB4fqz9GPE4FqFznFjfbb61x6hEpx2CAxF8Jr1rVrS0rdJRrWz5BbiyoE9gJUy
	kRXCVvPix90IVfP/hGzaBwN+cDRYMYFSc7O/OvTfPyZYJ7a2B1p/7Y/ASj6A0NsO95XLp7oEaHAzE
	043L3tO/GnDqU7sc4onxDXg62LO6an5M/3WPStLXxQq+XvRB9idKvTp2r/9aR5/FrspF3He146xvl
	tDwDEiY2f94tRDEtEVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5cwD-001e3p-Po; Fri, 07 Jan 2022 00:16:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5cta-001dAW-GI
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso10352839pje.0
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNka3+IguUGdp1cydE8WGaLefB09Fww/UbWD2IYWkK4=;
 b=Seu9740tYZq1PJrqVoNChbyIC7rBtoexwJv6/iqahiJKdpsyV8jT8kZZ6VSLnLse9j
 mSxXfnoinDaoV6Bok1X4aL+RUAKE4n1cmtua3jTx0qHOJ34ye+rxXKwJugDt18q9FRsx
 KFNo/DBLZCAG6+Pk8ZQNYCnOAXYFvfDG2bFpN6RpS9DFG9A2MlYd2/YiE5CmF1bwmqKa
 /1OnD+ZaK4v8pPQVqrDavvDVPCd3nAAI7f2sDqomljjYuNEdzWZafoccWXRy8flxsAgK
 GdChk2RU4Eg1jjAKo8AE/WWGqfTW/2OVpp6EOJzzjE79wxLTrlPuAzqo02bszpeBGVpL
 qZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNka3+IguUGdp1cydE8WGaLefB09Fww/UbWD2IYWkK4=;
 b=ouPghfZAmvqaIxBYqCaZfntxaoJim7r0XQT4Fp9gaew7GV02BViq/Eqkvfi9TY4Sq8
 ZGsmxpzM+aTT23lFh3xx/ZQ0VdEKkHSLlSoFsOWVVRuZDFB4X2DNIoetUvGrmRgYGlI0
 RqGGxUd3rM3QkP45qJlpcqDDL1aov/ZeVXbjdf0RyZd439HTCpoN6LVg/hkTYKGdAwnl
 DNRhcXIe7CaGjw/hxADyqYvHmW5bnVTlhVx8lRm79A/R6pOpYSnDjGKfN8QoHpke1qjz
 a48EQiPMlK9LzMkPFBNj7eAL2gqlIOosrLMH+HC8j3cNzroTtdX2Jl/88BsMVfTNdDXv
 Mt0A==
X-Gm-Message-State: AOAM530l2YQkGoPNCbQ1V5BaQqTNviPnBkFqJZ2X4/5lfxkUxd/4xBnn
 MzAWSHTBv0jPvjkl+m4DW9i8zz9LEwQ=
X-Google-Smtp-Source: ABdhPJxDAkhDdXYXT1X4dUFMKNxw4D+kgqAalhQrQCn4Tq5TbxqNmikwCs4vhUp8N3IYbf9BHQcEEA==
X-Received: by 2002:a17:902:8498:b0:149:f459:adfb with SMTP id
 c24-20020a170902849800b00149f459adfbmr4522715plo.85.1641514453069; 
 Thu, 06 Jan 2022 16:14:13 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:12 -0800 (PST)
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
Subject: [PATCH v2 7/9] mtd: rawnand: brcmnand: Allow platform data
 instantation
Date: Thu,  6 Jan 2022 16:13:26 -0800
Message-Id: <20220107001328.2233896-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107001328.2233896-1-f.fainelli@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161414_574095_3C72C9FE 
X-CRM114-Status: GOOD (  20.55  )
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
index 08e2acde5133..eab19df152f3 100644
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
@@ -2768,7 +2769,8 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
 };
 
-static int brcmnand_init_cs(struct brcmnand_host *host)
+static int brcmnand_init_cs(struct brcmnand_host *host,
+			    const char * const *part_probe_types)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct device *dev = ctrl->dev;
@@ -2821,7 +2823,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
@@ -2990,17 +2992,15 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 
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
@@ -3027,7 +3027,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	/* NAND register range */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ctrl->nand_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ctrl->nand_base))
+	if (IS_ERR(ctrl->nand_base) && !brcmnand_soc_has_ops(soc))
 		return PTR_ERR(ctrl->nand_base);
 
 	/* Enable clock before using NAND registers */
@@ -3171,7 +3171,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 	for_each_available_child_of_node(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
-			struct brcmnand_host *host;
 
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 			if (!host) {
@@ -3191,7 +3190,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 			nand_set_flash_node(&host->chip, child);
 
-			ret = brcmnand_init_cs(host);
+			ret = brcmnand_init_cs(host, NULL);
 			if (ret) {
 				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
@@ -3201,6 +3200,32 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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
