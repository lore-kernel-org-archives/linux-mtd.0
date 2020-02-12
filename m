Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F76EC3F68F
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:41:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729C72086A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HN1bHHYM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJMbw2yP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729C72086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciSdvE54nMV7N/S721i7y27y4q78vWDlorwgRTLLhgA=; b=HN1bHHYMDQJk1F
	mNwhUV33IjCSxKd2A40Ap7YNPGR0aqII3H0b31AON+cfnFF8ABid+Y2+n6R0QFuPDyFV6C7eI86Mp
	hE6raq+N0JI1vxPv5ckJPOXRuT0oTOuU7hl4Hl/1QRgWHUEHQEbC7kGRgnxbCnRMzO1wtZV7E34xb
	4t/Hv41MQW12glPLS5hBtVC1tbgVyBNMPksvrtGtrG28kYbDw78ocvWxGnwiAydpi68no+nK0wAaE
	0E1sjGurRAuxjoLOXFcOoVjzXaOYf1W5Nl7j2v8nAddKeHI0nzU+bSVAj0RqpudFltYWLp5GKTMYi
	lXyMksYXtyRinxU9V2Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g5S-0000Rf-HL; Wed, 12 Feb 2020 00:41:06 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4d-0008BX-65; Wed, 12 Feb 2020 00:40:16 +0000
Received: by mail-lj1-x243.google.com with SMTP id a13so246497ljm.10;
 Tue, 11 Feb 2020 16:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gTk0y+Tu/ho+sT5UGEydRAB4Ni1w6qYJfckfOq/GHOY=;
 b=PJMbw2yP5vepLZAHEHLf5YyuNbxRFBJ+Egu8gubKnwV1+VNtB+MuREb7ARBAFx6Frp
 HUAMMDoidNWpA4m0S2u23Kt/9EuZewUVDme2/WregRLAMoinIx8uwRgoGN7+KdZ6F8vI
 CNdsbtwlOFIUUdD40lCreH2f1rZ21xLnB4KhWs86tlIvlZqlz0+QKIgbZ82B4iz0E6kU
 lb9xM/rHOv5ISDn+w6tZeHZyTe6FvrMkvl2+VneTH/7F93LTMqt/hfYwJLGvZ73lhhdQ
 Eh/SqZxp2Bfwi143TMuXlnuzLR+o1OlDR+tuSLdA3yi+9t8IOuTer4sTxSl8keMsw1L8
 RSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTk0y+Tu/ho+sT5UGEydRAB4Ni1w6qYJfckfOq/GHOY=;
 b=gpscpCFiJI0WyoB+WDXT5Z3sQJ+iy2oocGkhXXum2RqNbZ01EuXo3XnSwohYmsfGju
 gcVZ6zZpAucDyQwHjnzONjEl5rc3zDIHZ2XrsYpxFtOulvsc3RZOWmFfQc09xpEJ+OJ9
 B7oSR5Y29ZJFLdui8Dt/Fo0By8gf2olDAILuiaaKDSgNdrfGUubEWoBUbM+Jz+6RHdHd
 gJI2Sz08jAQFr4A52kTwZ1K2UCZwIHjU0ZrmfRxAdzmoohoG5sqpeGMaG/w8IJ9zp2xw
 AZSf62jz2UEj0Gb5wKrBSAVNvDY1u7vOYZHwkVqK+HX0JRxJa8OXLREdAJGu4WaF6ByP
 7wgQ==
X-Gm-Message-State: APjAAAWeowKvvc2CbdmvZm0fnC1xsKV3P/ue6QN2YNTKNh5BSnGQe7HK
 O748RiLs18fkHXEMDNdDtNU=
X-Google-Smtp-Source: APXvYqxOlD/PlMVdsxwg/tO3eQ2ldw5JbL3TvOKRqRg5kuCKvfoFE1wmf6aj9BVWpeyX9mnmVZ1tfQ==
X-Received: by 2002:a2e:880a:: with SMTP id x10mr6200191ljh.211.1581468013645; 
 Tue, 11 Feb 2020 16:40:13 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:13 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 01/14 v2] mtd: rawnand: ams-delta: Write protect device
 during probe
Date: Wed, 12 Feb 2020 01:39:16 +0100
Message-Id: <20200212003929.6682-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164015_260974_7F1D54BA 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Initialise NWP GPIO pin as asserted to protect the device from hazard
during setup of other GPIO pins.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
v2: release write protection before calling nand_scan()

 drivers/mtd/nand/raw/ams-delta.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 8312182088c1..2501cfe00f43 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -251,8 +251,8 @@ static int ams_delta_init(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	/* Set chip enabled, but  */
-	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_HIGH);
+	/* Set chip enabled but write protected */
+	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nwp)) {
 		err = PTR_ERR(priv->gpiod_nwp);
 		dev_err(&pdev->dev, "NWP GPIO request failed (%d)\n", err);
@@ -309,6 +309,17 @@ static int ams_delta_init(struct platform_device *pdev)
 	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
+	/*
+	 * FIXME: We should release write protection only after nand_scan() to
+	 * be on the safe side but we can't do that until we have a generic way
+	 * to assert/deassert WP from the core.  Even if the core shouldn't
+	 * write things in the nand_scan() path, it should have control on this
+	 * pin just in case we ever need to disable write protection during
+	 * chip detection/initialization.
+	 */
+	/* Release write protection */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
 	if (err)
@@ -336,6 +347,9 @@ static int ams_delta_cleanup(struct platform_device *pdev)
 	struct ams_delta_nand *priv = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 
+	/* Apply write protection */
+	gpiod_set_value(priv->gpiod_nwp, 0);
+
 	/* Unregister device */
 	nand_release(mtd_to_nand(mtd));
 
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
