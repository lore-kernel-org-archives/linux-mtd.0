Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D385CCA480
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rfPOWvYbLh18f/q1TpeJHRCruc37q5QnmIMny1jDyw=; b=rXYWWNor9zlVy3
	P9OiE5DUgoIIYQKXc7GD+VQ7ZNYezjZk9BpJ44EwOzh/YEm/XzIlnHAf+4nJ83+k2oQkpP/UuGfKL
	H1lauTc8fjXfnqMSHQu5lryfdzdf9b2VlnQaIqk0Oe/2V92AKqGnKeqkakYVY54TSpB5jay3dOAkm
	QfCrBp2luIk8v3kCzTb1EFds1wlqJW/u+4OC1FXo9Q0CwBgTO8mu1XukqEhno+Yd7e5b5mSnAZTGG
	N5vGWeD0BJ78+HT1NyjY6p+wqAcbii0jpUIuZjLMsvf4aa2lEqi4jc+NFZdHIkKm64zt2k7ORRv3J
	QywjuXygHHC/DK+2mjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLS-00E8Oh-UA; Wed, 29 Jun 2022 21:35:35 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLM-00E8KI-KX
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id q6so35077393eji.13
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rMFZHu8PDqwv5GHr5nbOBzzYZPK8b+QduZ22FxBHIqo=;
        b=lOWY4O5UFWVGn6+N4v6WE2yC5CcWG2UujeYLFJKPc3rATK1ToRZVdUXp12kVVZp4EA
         Q+qGDGfTnSzuYY0Vu/oLWDnDmPWbBBEbFufxl9epGWkyo7xb6ueK7dGBtRcTKW8rOq/C
         FMCb6+4GqngC04vN/Ia73bXpg69r9xcNc/Lkigv1lTQinUZruFE2D2SsvV9BcAnC8Y1y
         qZ435hJAWDCnXcbFhghghDois8azi8OBWhdJSbgiQzfVhDTEk61h2K6ez1hBJkEheyDV
         tIkCwmHMa6TFn66lBm6dk3ZA0AgrPeEsy19uyKWYghj/NitvFUKbtgIAXbL9xAbXeJyT
         wsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMFZHu8PDqwv5GHr5nbOBzzYZPK8b+QduZ22FxBHIqo=;
        b=y0vEYQc/QXK5QCcAgcJryLBcqzj8QTXGFQVc96INx1bOxH/ZEWz5NggwO4x+Z1xSsd
         11vy9WCNC7pxp5g701NkKDUmgVEX1JXV9yGpH7NDQGct0kjJmtvYU61MiwDnNVcLcIfg
         XGWiBCStvp4D6XiaXDoeTyj0suTqFmLzyLIqYw+fe0CK+IdUtdqK9xgN+bcTJnTMPc/+
         ZwkwQ5xVMpKuv0dWAM45EDK9IhKZ8Hhm1s6ngXF46byYt0WXs5ObLKgeJWHM9ciOHUE5
         AAG5/vYSuPuHAEOp39vSifc8eGXgSwXMxV5bmR/Pw3vI3vMRe70SbXwj+lM9zENfQ2C5
         aSmw==
X-Gm-Message-State: AJIora9sqSpBsWfKzzVR/7Aa0CydOIrEplqE1Gg4gqKImqpIioB2uks8
	DCb1eyIz+w6FWaiokK0kR3mekZMd3tU=
X-Google-Smtp-Source: AGRyM1ugiuUJV+n2N0SIKZt3j4lTugdBedDqh7stRxX5FTrcmuxq7W2s4KsQay9Vr5flI875x+F8xg==
X-Received: by 2002:a17:907:7f8c:b0:726:2c53:2f82 with SMTP id qk12-20020a1709077f8c00b007262c532f82mr5380349ejc.140.1656538524808;
        Wed, 29 Jun 2022 14:35:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:24 -0700 (PDT)
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
Subject: [PATCH v2 6/8] mtd: rawnand: intel: Remove unused nand_pa member from ebu_nand_cs
Date: Wed, 29 Jun 2022 23:35:06 +0200
Message-Id: <20220629213508.1989600-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_143528_711001_0AE78281 
X-CRM114-Status: GOOD (  12.08  )
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

The nand_pa member from struct ebu_nand_cs is only written but never
read. Remove this unused and unneeded member.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 3df16d5ecae8..de4f85368988 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -106,7 +106,6 @@
 
 struct ebu_nand_cs {
 	void __iomem *chipaddr;
-	dma_addr_t nand_pa;
 	u32 addr_sel;
 };
 
@@ -626,7 +625,6 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->cs[cs].chipaddr = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ebu_host->cs[cs].chipaddr))
 		return PTR_ERR(ebu_host->cs[cs].chipaddr);
-	ebu_host->cs[cs].nand_pa = res->start;
 
 	ebu_host->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ebu_host->clk))
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
