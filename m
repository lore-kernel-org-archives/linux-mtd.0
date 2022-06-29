Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC14C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOcknKiPsUQ3gIVQyd+YDp8XKJ+Ceth1FFv7nv8Y7sQ=; b=aPKjm1CLrXbhLS
	QvZChbaeAH7N+efZCVwqLD3TiLHkMFJNB6NcM5xxD5wx7I6RGiA+xoLg0trIVjkcVmBKB/GUGGWmA
	2xEJ0rAdiJFa2A2mPbcUYkBdTRYNt5BvyfKTSLCHtCnao+2SmufMgPfcZA/148DGBUJk4hR+GmQ1Q
	wYektOjc4WpzFKhn0mLVgDxmVLb4cXT/JlSg+515d/rgy7tKcl7oFFS0ELQ3yoO8fXB7UQrpFAykR
	ULIjX0nFpgAX+HiEvfosLPHh1Ho/rtWsLTsIwc2dqxHnsSZBySheEQyrWCKcsmRaRrwTGdII7LwYd
	jdkh5J9mqEyJQeSVAizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLV-00E8Qj-Iz; Wed, 29 Jun 2022 21:35:37 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLO-00E8Kb-9w
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id h23so35088519ejj.12
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tfhcm8JZSEoxWkGuUHKnCtWh4qkCjWwjLcTzBInqbQ=;
        b=oaq594aJORkc4igVhEmAnz0tkKUz3k05Guf1B279q0eOY+2zLcShs6V1Q631zqvpSl
         X3BdluSPlIbMXeGsi/mi0rNaYlWDifQwFtCq8ABKYmqvQHXi8oKBiszAUijLT3rj7LM+
         vXXwgF9tkQ3otFWn3c+yChCAqJkJu6EaV+xitTplrc0DykRi0OAN9TUWleLNjjjvzPYJ
         yoxvip4VMqiM6c8hmxpzalaUZNY6/77OWedK00AyseDNyFkogdq6hn56v65Q1E4Qnvi/
         HALW+UFk4u+jEmruo7FCyoAP8xG9GzMnKjW/e5GzVKI2T9E2gRCUFgbPoVP96N8shhas
         DJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tfhcm8JZSEoxWkGuUHKnCtWh4qkCjWwjLcTzBInqbQ=;
        b=me6TsKmnFQJGLsq000a3+O2ucch+fgilqIVgUJWid82/Z1RimMmmktzhhXC3h/N5On
         nUdoUnL/kL3NWcthx6an2ACwtOPub3rzoLOh6jcCnC+tIFMrmqnDiBI8CRzpwMXC2moi
         geEFD11RRKsynMXqWQZz6uTUE9u33rLGzXALnfuBiGP435ovGGjUrgIMdaIFHYWaPwWA
         9KB37X47N5DgtwNlA+I5xHQrLi8yWK3eHkHWIkGts3UA9scnwI4fEPXP1JKsGrEflRBL
         iq1dZHXSJ/L6y8h4NgpfEPma6zfhRuXJpQJHWayUNGrT+sVRmYNeQrdLLnYXPhcXjAQL
         m8rA==
X-Gm-Message-State: AJIora/fM6S9Gsk6fdgWP2KcfTbhyxR6wTiMpqeYa1/Yfy93Kcc3Og7R
	DoBoEgzAz9++peupDZaSyRNXTbvkk90=
X-Google-Smtp-Source: AGRyM1vW89vMC6hdRwv48UbekRqLhvtYfRRKtoMLQHN16sjs2/WwOiGw+E3YgTnOj6scRy/JfOL2KQ==
X-Received: by 2002:a17:906:3ed5:b0:6f5:108c:a45 with SMTP id d21-20020a1709063ed500b006f5108c0a45mr5284383ejj.623.1656538526513;
        Wed, 29 Jun 2022 14:35:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 8/8] mtd: rawnand: intel: Use devm_platform_ioremap_resource_byname()
Date: Wed, 29 Jun 2022 23:35:08 +0200
Message-Id: <20220629213508.1989600-9-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_143530_385726_A9169CE7 
X-CRM114-Status: GOOD (  13.12  )
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

Switch from open-coded platform_get_resource_byname() and
devm_ioremap_resource() to devm_platform_ioremap_resource_byname() where
possible to simplify the code.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index e486db11ecc3..d4a0987e93ac 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -592,13 +592,11 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->dev = dev;
 	nand_controller_init(&ebu_host->controller);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
-	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);
+	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
 		return PTR_ERR(ebu_host->ebu);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
-	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);
+	ebu_host->hsnand = devm_platform_ioremap_resource_byname(pdev, "hsnand");
 	if (IS_ERR(ebu_host->hsnand))
 		return PTR_ERR(ebu_host->hsnand);
 
@@ -620,8 +618,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->cs_num = cs;
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resname);
-	ebu_host->cs[cs].chipaddr = devm_ioremap_resource(dev, res);
+	ebu_host->cs[cs].chipaddr = devm_platform_ioremap_resource_byname(pdev,
+									  resname);
 	if (IS_ERR(ebu_host->cs[cs].chipaddr))
 		return PTR_ERR(ebu_host->cs[cs].chipaddr);
 
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
