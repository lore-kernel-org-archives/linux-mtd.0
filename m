Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30C9CCA47F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VViL0v//zti4KFpoMaZMHJ/+ck8XsU/2hpnZUlyJiOA=; b=NgCANoYKNbj1OK
	rWZHK0KeHVV/aPwmUE+Wp+1t3U5t+hrzMmpEQUk/npzo41PMd13ftO9PmUXCEpWrTzxs/5elLzZT+
	nieUAPyJJrSAyAdZXsHsOn1i/qRAqzd+U3JpA4QBB4FLT7hmxGtMNXUylIRH6dtaxAxojyCoOMcbR
	ZeOW+ZugPxUvCgcT6hYurzBzZcKTK89905kVKOsov8P8oCCb1FJdlJ+H5PWtUEvsq/PM/pSnDcwh8
	/C+Re8FJ/QqtUhpE/jOW9b+4DtlUIFYOqLQSyAC9NoeovOafzWSdGwdlbZppt/P9kzCfr7XLzBKCY
	SWqKPEedCwGgLy9hcYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69Oa-005vO3-4x; Tue, 28 Jun 2022 11:28:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OH-005v7a-Ij
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:22 +0000
Received: by mail-ed1-x534.google.com with SMTP id z7so17060502edm.13
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wSWuOS2cAYv5FuJkZUEc6ND5j48qnvL32xgmlNFYci4=;
        b=FvZMPG4RvTvduiJLbxdgkpBmHO0eivfuDB3c9SxChryaMNJW+RHsG0LmEDG9Dw19sU
         +7kHR0ctkFPFGOzNyssScuN0/V6YJe1/jvh9gInfgAzF6JsMIKuFIEyXLrCsof1hI6uN
         ZkQgi842QELzR98SBpzr4fT6W/EvvNFPTkJlL2EMmHMiuCjvTXVkGI+ZQgEeXhmKYkdd
         zFWcZrdkpewXgyHVxaAEbaXRvd+LMr44fGqNdY4wToMrbyw8vJdaEaDMhAE92k31vfoq
         igJWVXzBZ29TByMze6b7uWTfch6DYTBA4eItcWvNKFVAqGqKk/g6Vzz4ucX1bg8aMnps
         vSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wSWuOS2cAYv5FuJkZUEc6ND5j48qnvL32xgmlNFYci4=;
        b=StTCdyigLrmgp1j+5CN/kJ5cWYQda+FDn+NjfN0PBs1Z+dWg6LpLtC1hpVApYT8zDk
         vcoA4VW+PQMCWfkT+tcJwVY/TOM273Nr+W2k7+64fCQ9AYRMABSOZpFjkKJyRZZnChK/
         mgdcVVF0D70WuktAWkiU23Y8KW1Z48K5rgGO11PQbP2HvOFKPNjmSlnfwLbCIQvlOLkd
         6/v4VhHLAWDnK2sSL9r6/4cJwunerM6pLQvK6A7ZHrNA1+97CiLkWheeJRV26rv49R5J
         ZcmjaaqYXUUGzy3IJEcZ6v6B87R90NkZpFKuAGd5yfR/NkmhRmmMOyFMSVP/7ABaVPP5
         WzAA==
X-Gm-Message-State: AJIora8ywSnGDPjrC/JAYnVmNLNc/oC7GUx+BzFwQeRBLBUbGuPgT8t9
	jEg+wvqTdKYFNjJ3IMg7XM+xZfJy0WU=
X-Google-Smtp-Source: AGRyM1tN9+xICqng9ViA9oB4fb9cf2sQb53hvOku9jNJTaaO+oR/dcUdswOIf+hv1Nr6y/+uWwoFfw==
X-Received: by 2002:aa7:c7c4:0:b0:431:75d6:6b3 with SMTP id o4-20020aa7c7c4000000b0043175d606b3mr22099442eds.280.1656415698324;
        Tue, 28 Jun 2022 04:28:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:17 -0700 (PDT)
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
Subject: [PATCH RFC v1 8/8] mtd: rawnand: intel: Use devm_platform_ioremap_resource_byname()
Date: Tue, 28 Jun 2022 13:27:31 +0200
Message-Id: <20220628112731.2041976-9-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042821_675050_7071D32C 
X-CRM114-Status: GOOD (  13.02  )
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
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
