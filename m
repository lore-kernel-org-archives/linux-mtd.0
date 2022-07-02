Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7EDC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOcknKiPsUQ3gIVQyd+YDp8XKJ+Ceth1FFv7nv8Y7sQ=; b=yMDJesKQritN+S
	fKg4kTFhK/2QcOZgRzRfz5K4iDgmnEUfp1UCpP30wh08HpMsmfdbuP62s0LXCMMETR57mbu/PhSEl
	3cbDFjW8zOkaP2jzK+typAtVu1Kp0B/0ieY+mZocck0/rMMFBrZfhymw1euZqjQfv4kCyMMz2oXZU
	ID5oqeIPr6/PttpJphHuzx9ELwkSsHWcKTHYZxh/xtdwIMSHZEwU8I0BXpfvvF0J3497mypvgi5eT
	PcFRcq2ROukuP+h8tXC96IX+IFhiCRhRat8DeClpb4HyVFrLDdry5UpSj5BI028M/PBgKS+qFeRYq
	SFHn01r4bv7+gUoEIiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIP-00C9BS-UG; Sat, 02 Jul 2022 23:13:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mID-00C92r-Ey
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id z41so7188856ede.1
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tfhcm8JZSEoxWkGuUHKnCtWh4qkCjWwjLcTzBInqbQ=;
        b=qbIIucf1dHuEEnkQJeZxhoxVXunTNBrwf9pPgBg71UJEDtXVOAHHMiaM/j3sUnPzF4
         46asSmFmH7jSYtv7wiE5CucIH7eN4l4/0NyOyVVrG8RpEP8QOgTGtC8buXFJUIm2EOwB
         PY+FXLWsmIz4WjcO/Cb9ZmEGV5zauPiwV+JW4P5LlnwK2vM5LfCTU8FTcXyuq7+m3Qci
         YcsNRVVO90cY4nHHJVbCD/loPHso+pV90AIizkTEqn42JyeLulqzGyRzVlbvQnqMLRB0
         t6cRg9MP/2bmRy3mxFm9EUOSrJ1otUePF1pzZvIGlTFak+pXO+sKwLHoer7KuqWWrnMd
         ic3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tfhcm8JZSEoxWkGuUHKnCtWh4qkCjWwjLcTzBInqbQ=;
        b=WfBGupP8Do/bTB5Rsa+zCpb61rkbPM/QMGVXFKib2hBDT+xyRdHeU+Pfuqi4T3CGEP
         GnnNvAl528+MjQJ8f/2dL8PzMtHJeOkOTr4yIjmkYe/qxberc8x11ARzjwRJXzvVMl1v
         j7DLsEgHPY+wODKsQypYVXAiuUiEd8IfucfOrXzpZFa6CAPsjcy6nlxITBM+1jAGc2FM
         VsxqNMWhgVGJwXdF/q+XutV7KgTBxUDJY/njYZFavtC5vUIDFnwaTYjiwy6blNdd4qy6
         vgZzNVSis9O1ZGIiRcocSMmYGhSlRfxc86k0+zUXc2+C6fyu33TlkVOpPy4P7xRvr32f
         BwPg==
X-Gm-Message-State: AJIora+U7SSt0vMl/kdJi4Y8YlpKhTd8qNz3aWT7OpYatqbIotjQ4Auk
	5/j5dzfRwdeaDwVL9LLm8Pi/9SRopaQ=
X-Google-Smtp-Source: AGRyM1sEQUtTu4io9H64uN46LrAbSLznCXdL3wuhSctJgfAka/2jCTDrvjy+AwrKFyWjb+CH6dGK4g==
X-Received: by 2002:a05:6402:950:b0:439:646e:c68e with SMTP id h16-20020a056402095000b00439646ec68emr18073691edz.42.1656803567209;
        Sat, 02 Jul 2022 16:12:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:46 -0700 (PDT)
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
Subject: [PATCH v3 8/8] mtd: rawnand: intel: Use devm_platform_ioremap_resource_byname()
Date: Sun,  3 Jul 2022 01:12:27 +0200
Message-Id: <20220702231227.1579176-9-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161249_569485_83FCAB8E 
X-CRM114-Status: GOOD (  12.96  )
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
