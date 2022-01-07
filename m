Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58E2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bxw4OxcsiflESS4RMuH1nBeWxcSbgjDzC4WCu/glig=; b=4Em6CKY8CyJ+B/
	4H6g0VLb/smDchKGTMQSaVwaIl+uV3GWgboPAfmaZjWC5o6HVFh/LwR+iGg5XJ/uTI/OcVaxLRHht
	r+ipo5Ykfv4OUWCCd2jgFgHyFJhsUaooVnB7CdWcuKezHi4RXDtYXQASTGVdJ1qkbYBkGcilhwBqr
	VZN1gHqLXRpMmHeC3QweA+eLpaLTddskwNDJfTdhOqlmAaPP2ksQRPQKZVMUkfHwWsi1MlASXChy6
	JzGaMWnXqoRIIpV+iiz8zDZDX4gvF2zY1B+b4ulVk5PITO9HaRhyGBqew/KbJECxFeXVCeDvV6ZoF
	ZNDfk5dcUUnLK6zihtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uGj-004wQ4-1O; Fri, 07 Jan 2022 18:47:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uG0-004vzT-Hz
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so7247815pjp.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWMwTN09ik8fW8a8CY0ElUYPbbYaX58lNI28bcRHTR0=;
 b=FON8An2+hHEanHVgMPl2S3doJMeYEWzOlk7LB+S9YxVqFbXdHaH/ESv0Ay8R/EDhwF
 b6ishHB07KRQ+tudnpxperUePV/eUiXof83DNyrKNsUXmn3yBKKV97PYoViRvwS2oNfe
 LRAanmmef4dq0g5y4KauPc1vUEcBd8jzfRqC33ujGX9Ij9cDRcoJq7OvxOB5yjWrxyt6
 HViQjzUve70V+ToPd/aHH8H8tjeizrDaRBSvBBu/C/9eUXxPnkbvZGCSO5Pl5n4Ju/yi
 ICIxCLrxQjsXDcHyAO+oTJwcD+LfPT31qd9DS/OHkwT8YlGaf6cbjVHki21150hdtYZr
 LNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWMwTN09ik8fW8a8CY0ElUYPbbYaX58lNI28bcRHTR0=;
 b=gzlbDNRJRGD8ihhVFd6wUgYkns2hETcu2222zYqmytnd5bEUdVa4UWmVaEPhLX1Caz
 yhN++LV8PmlJt5LwKJVz1YMNLI49l8q9035MvJiYjQ/qTBI780WOpJT4o4RggAR9rbxT
 ArF/AOi2KLz7BQAB5xuvwXhmeOYXBwY3bmXhfbRit3ErKGOl52iZr4VCh1Y4GFMgSkjq
 vCxyCwmQNfIvkNiF6UTeoiMTyFqDBd6q+TdcLUiIN5FuHGfRWPpwST3NRhO2TMAouTks
 /bGrH+NvZuVQhqJTuMj34owzZ7PVe5c5cNNfa+TTCwg/6Ki6LODgHGFPgRp/n1Z4lH3X
 IiwA==
X-Gm-Message-State: AOAM530p0V2EU6WxAVDc4KmVqcFLtyDO15Bosm9yNyiyKA0nvH+TKnRN
 0qy/p24fPRij9PROEZdvQZTQUt0oDNM=
X-Google-Smtp-Source: ABdhPJy97gYS+reSg3OC50pgLt4B/9MmZtVqehrLZ28AoIqa0x2vrm0SLfDY1NhBvKeAG7QW8wP3YQ==
X-Received: by 2002:a17:90a:14f:: with SMTP id
 z15mr7989126pje.162.1641581191073; 
 Fri, 07 Jan 2022 10:46:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:30 -0800 (PST)
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
Subject: [PATCH v3 3/9] mtd: rawnand: brcmnand: Avoid pdev in
 brcmnand_init_cs()
Date: Fri,  7 Jan 2022 10:46:08 -0800
Message-Id: <20220107184614.2670254-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104632_628494_2A2B5407 
X-CRM114-Status: GOOD (  14.60  )
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

In preparation for encapsulating more of what the loop calling
brcmnand_init_cs() does, avoid using platform_device when it is the
device behind platform_device that we are using for printing errors.

No functional changes introduced.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 48d57b19c293..b7b15ddf326f 100644
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
