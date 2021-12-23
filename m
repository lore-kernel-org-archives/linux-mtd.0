Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1581AC4321E
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aktTzL8lwHZLe0xUrRQTqiqpHwAzgYwAKHzZJMLbmGY=; b=5F9JPAhaKOVXRq
	6pN6glPhnf3j8Z5Yn1ZMIUgqR51lLVXfctJqdRN/Nc4a7tdR04czyZUKe9iXul2EAp7DbSmZiz0XR
	41xjloF6Bl/uEIoO6xKNJZRPWgUxN7lUvE7L2Nhtupj4EK59jLmH3Hc135FMytmKEXy1G24xVGpsY
	04YQa1RrkvZndPKxFAAs92fG0QWqsihWjoAM2HDviNvrKzZjDPVLnz1ramp6f/9QbAKkWQKK9rY4c
	Pyhl8DumYrkngWrmqhyIC+GhPdCYwdBnlmUwYRMX0P3LAtyEkCXaWJWaEUiSMjxeUIFWMEqR4AcR2
	xiT4uN5DiA1m4qFxM7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Bsr-00BXn3-Mh; Thu, 23 Dec 2021 00:23:01 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0BsS-00BXfJ-6U
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id x15so3054919plg.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DknGyPcGjNy3srT0IigmczMVpbDaJUX0db4clA7nVyE=;
 b=QxfW+YUo9bh17Swjkq0zfV9nRzqa+6MeWsmnb00FFEZs5uI2lLJ3EkzIrANj6bcSUl
 c5+jLzpvHhIxlOWm0akQNmgBAmTIio5TXxTf3XGidCVA6qAA3IjUilqlbdrrxzUuWkUv
 PmZsW9jvdLZJ2PZrg7CbyXIWCAQskyUTO6rHDvTUbi9v7fi7nBeDNtxgKcsePdo6Dc7J
 T0lnyiO9padNcOdNawQqcKEOLZO2EZ8xG7D9CI0M4FFpWeHC9BwetVt5Us2H4MXxe7z7
 6deM+2JSNcPSW/IN4Gy1+b9nIPz4JcGzqvKOt7RjqIPawe6xyeUATroXMcFD8Ra42/d0
 UkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DknGyPcGjNy3srT0IigmczMVpbDaJUX0db4clA7nVyE=;
 b=vxmC8cXXuViEp9T/54vs1T4Z4LNiszOwWOuBeZlSJW/Bbd1bT6bHxK/i664McsO4Ma
 yrQxtXJEmRBswdhc0qyugJfYNNWJJ/gr1LD6gD5SCUwpARtzbAh95mSvSm0zYzbH/UKp
 EVaLx9ueq8TH388ywwWOjz6A0pjoTgkrrRNOsArwV23jLasb64gN14OrfSRdb27+vODU
 nzPOyx5HAwQxQUhszDPm9dqxEjI0Fu5vHEosSi8EmnyWk8qhcN2bcH+vwLx/b3Sebh/y
 KH7HHny8cuFyBfleOfZ5MkUvr9neplKH4L5wZMMlRcF2jZD0ePxXFnjyZuIHRheDLRFm
 /JhA==
X-Gm-Message-State: AOAM53346SFvcEZLVmEkaQ7aHweguNMJY3vzi7P/tl/UyDR1N9rzMUNB
 I7PJzm/5M4/WTcp64DKHMcZ1odiC9Go=
X-Google-Smtp-Source: ABdhPJyWP5a3vUVMkg6PgbOpBWjwpnAx/lSUHLsZXUV83dbGPFKmgEnhKi29+REeORMYHIDI8QR2og==
X-Received: by 2002:a17:902:d682:b0:148:c928:1fa1 with SMTP id
 v2-20020a170902d68200b00148c9281fa1mr4949461ply.155.1640218955024; 
 Wed, 22 Dec 2021 16:22:35 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:34 -0800 (PST)
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
Subject: [PATCH 2/9] mtd: rawnand: brcmnand: Assign soc as early as possible
Date: Wed, 22 Dec 2021 16:22:18 -0800
Message-Id: <20211223002225.3738385-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162236_262664_68EFEBA7 
X-CRM114-Status: GOOD (  11.78  )
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

In order to key off the brcmnand_probe() code in subsequent changes
depending upon ctlr->soc, assign that variable as early as possible,
instead of much later when we have checked that it is non-NULL.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 7a1673b1b1af..fcea5a7443e8 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3008,6 +3008,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
+	ctrl->soc = soc;
 
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
@@ -3148,8 +3149,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	 * interesting ways
 	 */
 	if (soc) {
-		ctrl->soc = soc;
-
 		ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
 				       DRV_NAME, ctrl);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
