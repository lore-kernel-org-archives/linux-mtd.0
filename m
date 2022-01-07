Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27123C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYk9WCh4Vlqu8YM6z0qRHNRB1sH+U5mpkH2quqWxIco=; b=cdppdiwpLNxIek
	QHlCbVpwj7c2042aEHWGSrAZjHkcE5PSWvImUqGlXig2OR86so9EYOXDvrZpYfElt7jEiclmBsRYz
	t1LJ/21Y2l/wG6YbDAGagkp1m7NShR6+o7XcbQUK1+xPAVYtMYpdBDoRNuFpyKboWMmTBKiZbWkvc
	TMUEMGT2+ipCeEBcSWUlJ06xqScXsrpw9Yv1koYIeNKc4EcuxZC8x0QRNy7F2KARXbmnUeul/utJK
	HCT8wYaCgzOPdcKouoGmwz5PxAk2YpXc6Xy2AVGoIWvymMOU9rs6Ykb3/3S3w/QhZwKWZgJ3QkRYf
	mKHRxLgbpSbRAQulX+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5cte-001dCj-N0; Fri, 07 Jan 2022 00:14:18 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ctQ-001d5C-GP
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 00:14:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id i30so4023746pgl.0
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 16:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HAeEFO2qvIKP8NId8vfdtckbt5Y7Yjs9xWcmvkhoZSI=;
 b=mdWAqTR9fyhSi8Df7gWYtdt7BHU2fsxRj+WXjvkMximiEO56VSnNXZa7g8cw7sTj8v
 6cArDCX5bwiLMqs9LzNjVITJyqHY+8LYvBdtnKQ5bSzHS9hI0/Gw9Tvga5smTjlJi8Ed
 f7r8lfJgtqBrr90aEeH7F3vhT/iFihgzY2X/0zzfWwexuKJwGCnbtKR1LnLuwP/gfw0g
 ZTyOvLaEXJxZPFgAh2b/iX0v769jenBmV+cpIjmDo1zWX31/E8CNoZMizEbghMXH5cp3
 L8mH7aiPI5Wc1qLDVqiYgaMLHo91C862JzSO3d3dy5IuYGc/YHbPpaEdLaeF96aEdYpG
 8CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HAeEFO2qvIKP8NId8vfdtckbt5Y7Yjs9xWcmvkhoZSI=;
 b=ZUv9JM3Z6eKzyk4DhPxuuZPfsqtKkW0jd1eRc2KgXzTTLedc2qXP+T8T6MrIUL/ed8
 LPKKQ+aF0XHIVioqEjCC++RQGeaBfyZqVzbJwUyjT6ByP116KVvKynMvzHXimpEFDinK
 BpkQgIzHJhzacBv0A1fWG/jisGW1cP5+0twTDWogOFBoRM4c/qjOSLs2iJ/mZonRi5Fh
 ENzz0lp9nrXJsP91l7ipjc4f1vkkp9QmliCmsc431WkniTkKCYV9lLXuh8WqZmycsK81
 rrUs74ozUsvZDRgEKOtZ3NAhZBzUAZvwiDo//frZK8Jy0IOaTmDisHQRLYyTta1N2HKH
 u9xw==
X-Gm-Message-State: AOAM533++BlbxQ6Gvc3g4xRR1h//oHHznPxOVorI3oAix+7F6KkkviSS
 BqTypyxVyqG/ibI8oPowCJ715J20y3M=
X-Google-Smtp-Source: ABdhPJy5ireaJcIcq1W271fVNEhILDI0b0GWowJLlF8ZFeWfAlMMJ10PGn35Xapr3uV6erfEEaIAvA==
X-Received: by 2002:a05:6a00:130a:b0:4bd:118:8071 with SMTP id
 j10-20020a056a00130a00b004bd01188071mr1376710pfu.28.1641514443085; 
 Thu, 06 Jan 2022 16:14:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y3sm3301906pju.37.2022.01.06.16.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:14:02 -0800 (PST)
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
Subject: [PATCH v2 1/9] mtd: rawnand: brcmnand: Assign soc as early as possible
Date: Thu,  6 Jan 2022 16:13:20 -0800
Message-Id: <20220107001328.2233896-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107001328.2233896-1-f.fainelli@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_161404_576927_1721797B 
X-CRM114-Status: GOOD (  11.53  )
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
index f75929783b94..63080ae3aef1 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2998,6 +2998,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
+	ctrl->soc = soc;
 
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
@@ -3138,8 +3139,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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
