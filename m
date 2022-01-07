Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038F4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VogUqdnHRY3RPbPYisGMdzk1Wq0gwsmMZCMwsXMMqv8=; b=LgNBBTzGp1x458
	il6PSKi48xXMGS+7i1LpHYxx96irbysD6q16HgwTCttc0tURXJ1C3CybX062XfTmxIdsvVKoLvQ0w
	OjcstZzwioAdtBnBvv7eAc7ZE4qicRAIx3LCg23X1WvBONpSXKQv9JFWujUPXUoS9K7sBBisBj1ST
	93jd70p5Nm9bY2ANU3OVoLtm+sJ5J8lfroSg9UT1FCPS5Y2FuKkUXBTGhv5S2IBmlzoqSGdasGOpa
	mGndmiNEabZl6QQldu2hiE1oP7LbNEP4xVrEFVFswZhELRSNxgMe8biohvzvOBKs+QzGv7+2tO3G6
	ntZulN54/+/Mv+1+Kwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uGE-004w82-6Y; Fri, 07 Jan 2022 18:46:46 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uFx-004vy2-5z
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso12898558pje.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ck82Zp1Tae8+QI2Zx2HgGoHvZl69KSCAcrb3o+V4rZ8=;
 b=hrtt98CloqhBmvDI3lhMHSzgXd565r7hVxigscmEZDKCrWo5Hpd6gukvw/+fYq7N8F
 k2ruKHDPz6HJw7Y0zsDxj+/77yAQOmGEwDGLh1/6b3GDFEiETfWNkujMZ7lkJe2VQgwt
 0e9Mc0GoATMYJFkVFt68Yb8IRdq+93G3i5cb1A3eKC725uRzfxVi701CP80p9uLx3u5a
 uFY6LF0I71VIkI8sOkZFHnStxconajl+lmTzO8HGSUJqlRLEfOTanxxr1jw7608m4GrR
 +9xOjOlbhQPI13KVRxvqFukDwOWR5D42B3Afh0GWD65r82J3TczEG6fSQNVo284rfskr
 4c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ck82Zp1Tae8+QI2Zx2HgGoHvZl69KSCAcrb3o+V4rZ8=;
 b=hHDq8a2FUXSvoLLRIenTqcdrh1NsPdtVtRhoAX1RKXu1X2DDIUEwen66valvZY3Kl5
 i5bc2Suzrd//OAocdZbI6dx5RmRoJ8vxspnfvDCQOlNgHGgcJIwB0fU+x0e419JdhsnX
 IxdfJpvRJMHuA49JX3NL/tx6gXWNGFbsdLi8Ahf/ABfAgTmtUacrQbIgu5I8pFWhpY3P
 E0ruAxP2HSrzi0iMTDoOFIDBQ7u2YxOkos+DXxIT4+ap1XyvXQ+NC3zT/16ANVjPV2ui
 EOAroX+8jXlWiiym4EMmP85pDe9Hr9I2zh4smig7PNr7r9U+4pSh3YAsNZvxLmbeyMWH
 9Gyg==
X-Gm-Message-State: AOAM533EIUIjT8KpD4icNv7WQ6RdEV/ec518G/WxL1CK/FWfFvKBurhx
 oCO1ULUZ+4FuUGGBo6OWG0i+9XTR0jQ=
X-Google-Smtp-Source: ABdhPJwP79G3S4N6iYbgoCr/2lc/KlhPdEp+uz96DS6vUDW2/zR3MV5P1IahI3JTHGYA0Vr0WHQNog==
X-Received: by 2002:a17:902:6908:b0:149:b26a:b9b5 with SMTP id
 j8-20020a170902690800b00149b26ab9b5mr29947655plk.169.1641581187752; 
 Fri, 07 Jan 2022 10:46:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:27 -0800 (PST)
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
Subject: [PATCH v3 1/9] mtd: rawnand: brcmnand: Assign soc as early as possible
Date: Fri,  7 Jan 2022 10:46:06 -0800
Message-Id: <20220107184614.2670254-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104629_243204_22E63130 
X-CRM114-Status: GOOD (  11.45  )
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
depending upon ctrl->soc, assign that variable as early as possible,
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
