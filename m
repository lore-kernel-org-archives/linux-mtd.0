Return-Path: <SRS0=bCBt=FV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C651DC4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Dec 2020 22:13:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868DD23407
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Dec 2020 22:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868DD23407
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYkPBg68GqS5orc5igxGjAhfa2yg7SNeOQ2Q2oyBwjI=; b=1DlLLIlsa+5i74wTImyKUhgh2y
	2tqpxKvsUXzQdfA0E8IpeDAdO+4y3VmmWTwmfrWc7C0beAgUFioZYitZK8gw+UwlH4MuaNiUJ2vlO
	+vUyCjBp2iWeOlfhUkSoOhVmQdr5aM9L1+4k7uhnyMSqtsM85ouBsu5NIRG4929UTVqFv2pjL4i7D
	pqGWmkUbPPEqQJezAiNuixI4mNyGej9jgRklzCcHPr34ZqrtJEkQNNCQi0OkfwN7a2NWNaShD8ppu
	IwUaaOBuKjVVWKcKwHEy5cpyCQv9CiWx1qAbQeEcps7sb7xgk1DEKZqjRhUc04lzdTGbf19O/jp37
	r5FEWu1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq1VC-0008LW-0S; Thu, 17 Dec 2020 22:12:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq1V9-0008Kq-VM
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2020 22:12:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b2so325321edm.3
 for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2020 14:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ctiK0mA4JK6QvRekJWEWOG1zeHLhg/gasLcxbxoVjc=;
 b=A8GA8OkuDewd4OZzGXgLg2SB0z//t9YORRY5DZf9LWIYIFt5Om0aDUsaVXYu5IsuP3
 ffkDcYVvWIAEo36FDAAo38dBcrXKKN2X2oQuVzJlRmujVIYEMhnusSK/sTNmM7GlPY20
 Uw8mCuwCXC/n9I95XjQx3E8wSpdrCmPD1PE1sWsCGxCXwhhwanoCqrX4poiocnlvtBzQ
 TPE/3wRqJhefWP6C9VAnAHZbTQtD/3cKE0RQUNzlMAVm//HNDnPvS/WO7k+dIDHmgaDo
 lA2IplvyRFUdSWoV2zIj+wysQd0TrUGEBH0VnFgEEinw5fZUD7L1FuqR8n09xw8Wlqce
 6JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ctiK0mA4JK6QvRekJWEWOG1zeHLhg/gasLcxbxoVjc=;
 b=auFV+7wsz/KMwhsesn/bvM6WC/yd48bmnbaKhJfi0ETpZu7qgNkFFCbZic1F7Si1fz
 OjjIqpPo5iR9Zi0dgxd0UvovRbbWi8r2rju5H5Ezu1xiFt1MSioToJe7TwwmwJce7Neb
 X5MlkXTLK7plqKCjutscVeuiWMgh8m7kWjtsCsBJw0aG9uVVl0sqI8OOiF0hKKLY8A6+
 NHRmCf8gyj9oBLPHGDJ42U19ugGbS+OM2U9uGZom8/Cfr646zKI+yVs2mOm1vXDPxckK
 dRfvs6BTHrG3TTEbfiaXNYbMlGzC1Di+MNfGi+4/83D+y4UjhTdKwvJSSLGy5dLrbFb0
 E85w==
X-Gm-Message-State: AOAM531YxZebY2l4rM6/CP+ghXvnwUS6kojdPIa52TJ4FsdgTbDZuxSm
 Ky6g+z1MVoLOhvfAZJ542vI=
X-Google-Smtp-Source: ABdhPJwpxmgrhbd2dIZ1rE4ZcxAA/fLKKWS1bdrxMjIhPPMeXQmB/FtqRW/sCRJJx4PpPIzXFq9F7A==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr1535936edv.100.1608243117145; 
 Thu, 17 Dec 2020 14:11:57 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137008a00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3700:8a00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m7sm4627091ejr.119.2020.12.17.14.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 14:11:56 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: vadivel.muruganx.ramuthevar@linux.intel.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: intel: remove broken code
Date: Thu, 17 Dec 2020 23:11:48 +0100
Message-Id: <20201217221148.2877318-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_171200_058673_B55D9BD4 
X-CRM114-Status: GOOD (  14.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Drop the check for mtd->name as it's executed while the mtd variable is
always NULL. If some MTD name is needed then it should be validated by
the MTD core.

While here, also drop the NULL assignment to the mtd variable as it's
overwritten later on anyways and the NULL value is never read.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I found this by looking at the new driver. This patch is compile-tested
only.


 drivers/mtd/nand/raw/intel-nand-controller.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index fdb112e8a90d..398de6ec68d7 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -579,7 +579,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ebu_nand_controller *ebu_host;
 	struct nand_chip *nand;
-	struct mtd_info *mtd = NULL;
+	struct mtd_info *mtd;
 	struct resource *res;
 	char *resname;
 	int ret;
@@ -647,10 +647,6 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	       ebu_host->ebu + EBU_ADDR_SEL(cs));
 
 	nand_set_flash_node(&ebu_host->chip, dev->of_node);
-	if (!mtd->name) {
-		dev_err(ebu_host->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
-	}
 
 	mtd = nand_to_mtd(&ebu_host->chip);
 	mtd->dev.parent = dev;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
