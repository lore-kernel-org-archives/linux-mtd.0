Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB2EC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hj6zlK96H6wyJgNKJL7Il7vwlQ/7Ta3jjydqaJwme7g=; b=4M0Lyo4RPx9SdS
	d740hmNMrtMzqkkFyUREhzQORtqiThsKgD/Dqgo0qjOMegHhK/vKtAjQdKwgyUYayJL5a/xvz9wLW
	jFQ1bs4WTH2wmUvHonSlOBRvNE00OuZGKT/UiRrL0N227vD8Ke9SaiUKOnoybUOWST2b9+It3PIjA
	GRxTGdvDineE9M/UAaSTiYYmUVdKuFtHHy/a6DpH4LvPv0eX12Rs/ymAR5GDrn3PleUxi4ATh73v7
	IhDYAWnqOjGK2an41+p7BmShyM0tvPAmCb6K/GEs1Z7vDF+pnImbiV1dpX6DKTMIDR7OlDapkgbt4
	NdnADdTF01oFsuB2Evrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Bt5-00BXoE-0K; Thu, 23 Dec 2021 00:23:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0BsT-00BXfi-Rz
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id t19so3709648pfg.9
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igV+0PYJ8LgFBo0u2TcB0EcsmeY4woP3bELald8J87k=;
 b=IkOkTM0nQMWsqsA8TsFwC1jyekX63htbHYb7OcaRLvWw9x3E9Am5hhV6hugOwjwgqu
 99lIUBcPvnecQcDFnGK9HlsGfOqy05UbgnM+I16eOeK7vo56xTFHoLnseFzU94sb3xtE
 Gi7vhRtNVHoRR9ROjMKdiIy9cc4y2lpmyo7csvM6VSJKpD3oj1lvw2VjNy6VUgK0R7QW
 sxGymUfy3b+CnGudIjMqE8tXBgUYfi79gohXtV9MJgrkIkeVodQPrjySpvu+WxJqdI90
 2bPFUVUsd22zpkg1RXfJ2vgZDNWbH6y9azv65UD2Vb89SeCrILkSL8wt26vNVTUqofaB
 7BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igV+0PYJ8LgFBo0u2TcB0EcsmeY4woP3bELald8J87k=;
 b=H+oE6SUM2Er3b2o1MCr4VB3wPUJr1c4RgOqMxpSVWy0r7s2tB8mscNPIuKbc/85T5B
 BkXLJM8VUDwNcEt0ThHXn7XyxTmeu8TJShlsyHfPcHyZCeTfsq5XZEMgNKzaPHaBapVG
 i6RMnT9DqNxT8basai0/SlJutkg2vSEE9UydQtVxOcWM/NYHLA4OJv7Erd97QGCelWdJ
 Kmagyc1Py8IW1GAn/VVfLFp8jdxDjG6/vH5xciuo64YDWCMwCm7lASMs9AXsw7z8qF61
 fBEJuLf3RTLI63YUD3PY5FOnDAfmf4jC1Tq1z9kfQoInwxcr9prs2/gNOmWP3JCl3qR4
 w6tg==
X-Gm-Message-State: AOAM530oVtYwvXFh4vmecmCGeli+8S6bccIdH2UUGIB9ZXfRlPaAnFdW
 k+RjHJx3HvLEkFnNpJptanPxMkERHM4=
X-Google-Smtp-Source: ABdhPJxSckAZe9DaFM1bKLCv01xSnOpLQbV9TIEX6AathClFk7dRqG6dOadtWskP52LFfxtnCFC1dA==
X-Received: by 2002:a05:6a00:1582:b0:4ba:e636:391 with SMTP id
 u2-20020a056a00158200b004bae6360391mr100399pfk.55.1640218956782; 
 Wed, 22 Dec 2021 16:22:36 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:36 -0800 (PST)
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
Subject: [PATCH 3/9] mtd: rawnand: brcmnand: Avoid pdev in brcmnand_init_cs()
Date: Wed, 22 Dec 2021 16:22:19 -0800
Message-Id: <20211223002225.3738385-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162237_925730_CED04AEC 
X-CRM114-Status: GOOD (  15.00  )
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

In preparation for encapsulation more of what the loop calling
brcmnand_init_cs() does, avoid using platform_device when it is the
device behind platform_device that we are using for printing errors.

No functional change.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index fcea5a7443e8..35f8d8e02d4a 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2763,7 +2763,7 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
-	struct platform_device *pdev = host->pdev;
+	struct device *dev = ctrl->dev;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	int ret;
@@ -2771,7 +2771,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
-		dev_err(&pdev->dev, "can't get chip-select\n");
+		dev_err(dev, "can't get chip-select\n");
 		return -ENXIO;
 	}
 
@@ -2780,13 +2780,13 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 
 	nand_set_flash_node(chip, dn);
 	nand_set_controller_data(chip, host);
-	mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "brcmnand.%d",
+	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
 	if (!mtd->name)
 		return -ENOMEM;
 
 	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &pdev->dev;
+	mtd->dev.parent = dev;
 
 	chip->legacy.cmd_ctrl = brcmnand_cmd_ctrl;
 	chip->legacy.cmdfunc = brcmnand_cmdfunc;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
