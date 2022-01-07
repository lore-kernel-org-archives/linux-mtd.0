Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC29C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQZskbsT2vGu+XEejWEe7EWAdSSD0Q+9atQgtXBpHGI=; b=C+UO2T/84KW6LH
	9+JajWLaxjyAjplO6grB4f0aWwN7A8CdUYgoWx1KqAexR2Urxme1SogfeV0G2DClPjhARmN5QjMKd
	5DI6XLGcYZU+tLk0c5qHdS6hlljxP/ckxAybY0huN1GA9cQ+uLEfG7CI2Cfff9L/CyZQ650WG8/pG
	1CKYarxc/i5jGZFqa9m33yw8d8RwNsm5P7G7AdEqUXUeSXBUAxKJCV3x16JrQwlPWYBbD5zUnOUAU
	1JUGu+O9aZuxnRuzHpGEgVE4e2iupBOHrabCI22yRmklKIqc8BSJt1p+VAW/dv4xnB6omsR0DXnWw
	QvWGniYYxC9n6ta/TBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5cu6-001dJD-FP; Fri, 07 Jan 2022 00:14:46 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ctT-001d7Y-Sf
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id f5so3968599pgk.12
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qnrm4M73pcXgG2prIGPXbohVD9PEy3lmOekq9Ie7yIc=;
 b=ObYPBPNQI76IvDAFqWLlVXbar5bUsxlHdNYmKMlhDj1JMnwjejflYfRT4SpcXGU5aI
 cj+ArGk2ej/+GfYyl2Y/LiBBLDXCoSE8iHQGjwEUcAlW5d3CYtT2BRPerazDhhQc6Ggm
 ++ZCAlyw0GHtPz2mQnPEWZv4Lw7gj8TeSUxs9yYKFz2Zy+ApBv9AonaWoVUCqNXtTgnQ
 aDaln5QjljfU3GXEkFtRzkUVVJYvFuKjR2DIXW3yUy/+bKW0yBNfF0hdObSOKzMHjLjs
 /29YrbAHUb+scwzv2SqNYrM9sgdFIKf3N1yOy8aUN2VIO72s9+N5iIIK+dFjJpw2hRIt
 nDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qnrm4M73pcXgG2prIGPXbohVD9PEy3lmOekq9Ie7yIc=;
 b=rhCwfwWMN4JZQDsvbtKWMFkJ9Tf3+vLHJcg1b0ZZtuGdKILYuJfc2AFFfwoahnJPys
 wvCzBAtNzYaqSfD0YTfiwtw3FKaVT6JTOwzDuje2BsIvtGJ2Am/piop4REgAXkNMJps/
 lYSfTGJfW+d07akcc7VVefvBev1tBlWCmMEaJXed5smmVZaQ34jEYpsf9DSk9/ejGH9x
 OozkmJPtjwKzTUgViN5TJb2feZCfXIVb6w+Kr7Rpi/24zGZY+tj6GrlMQKe9gROB5ITU
 Vt+GmcezACXjTu7pk7AVx3T+knOFXpgJgxH4bRQVTzHeEnNoUtKBzoFzyxfADaBeZfbp
 1dTA==
X-Gm-Message-State: AOAM531tGQJB7DBBoZMgCbBgchznw7dFeIl2oRZwBD/3L4zvV1rmKoi5
 dlACagJnc7ekIkDHQLmp+ESok1zjZOQ=
X-Google-Smtp-Source: ABdhPJy/ay5oezAqQtSDT5SKYRsd02isnhXaeOH806ZvUoIyPwUpjWfGtPyaoihnmnkCwwsjnzD5aQ==
X-Received: by 2002:a62:80d8:0:b0:4bb:a8c5:868 with SMTP id
 j207-20020a6280d8000000b004bba8c50868mr57972741pfd.25.1641514446464; 
 Thu, 06 Jan 2022 16:14:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:06 -0800 (PST)
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
Subject: [PATCH v2 3/9] mtd: rawnand: brcmnand: Avoid pdev in
 brcmnand_init_cs()
Date: Thu,  6 Jan 2022 16:13:22 -0800
Message-Id: <20220107001328.2233896-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107001328.2233896-1-f.fainelli@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161407_954231_8C92D226 
X-CRM114-Status: GOOD (  14.97  )
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
index 9c3909c34dc2..fc14765f7d23 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2771,7 +2771,7 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
-	struct platform_device *pdev = host->pdev;
+	struct device *dev = ctrl->dev;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	int ret;
@@ -2779,7 +2779,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
-		dev_err(&pdev->dev, "can't get chip-select\n");
+		dev_err(dev, "can't get chip-select\n");
 		return -ENXIO;
 	}
 
@@ -2788,13 +2788,13 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 
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
