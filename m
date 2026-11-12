Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9DF6073FCD
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNH8fni2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A1xSQ71Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hy1oiEDK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f4f6r9VhNYuIRmTLKB7cGmQJy5bA1LYdkqg3Y+8B5ME=; b=BNH8fni29mUfKZuO7sVrgAvWiD
	LgE6XERoi0eukrqePmUI0sVERkec4w8UU3uEmRwz7UHQQS4JM7WUTKZAyAqC8ssdQugc+tqCVtDGP
	bMdI6wUFj1Ulte8PR+4M89rWPabQOQ1a+8y+iZs3LUDsGOiP2x8PhlYyV/Oa2w/szfQggz/boRl16
	BY61NTFU/Sp4z7Qg6iD7SiSlrvKadsJUDT7NC+v+Rgbqc0vSo572g/glMkzcoxH8OtS73WdBGLTWt
	r0NaIMtuxaZliU0hPngrehPkqztG5XH2wQNctLL//0M4k2764xB9W9C68okrepxQZoxrn/eHxhzO+
	2aVX84lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdC-00000008MtJ-0bL2;
	Thu, 12 Nov 2026 01:29:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJck-00000008MB3-3BZj
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=; b=A1xSQ71QEsK4jDFHEjn0cfaMUg
	WsR9LX1wmbQ818Egw7LWW5v64/BSNQq+CjroBFytQg3s8yne8gnXCwu/wGAZIAtDfnLQUPP2WTZZf
	FmUq4oWizyavg0dgKc2m7CGlPVi3IJy0/2nzeRuWGzy1DGalsFw16CpTThJSQwtKRijWaLYUjUVho
	BSMkswQGEaJlpwF9tiIbw0SvIynL1tGr+4t0XOWkSF9nX7+x2EJ0cQS2300WGVPef6FazuXH3efqQ
	1UM7Y6Zlv+5cwg6uWk3fWQKe8j2Ef8+UaXbJl4bD9Ge9eRc2b6vAOyFZ0x6kFKPo84SX4NWQjvIQ+
	WgvQsa1Q==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJca-00000009mn3-1cF1
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:06 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-82109f51565so1636128a34.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446938; x=1795051738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=Hy1oiEDKWo65CV4eV+Ga9Swjm4ddeuFQi57YvIZHgjky8mYvexFnvlsfVaSWmkagCE
         0LA4r8OnvX3YAHuwR4TzoVDR5DL1kBh5nytm9/8egbbzwvohOD+GxWdPHnEhmDfBZqQH
         gvOsgXTL9rLlth6VpVsmyJaGdk1KxyadH9793ndOTR07ZXgLjw2FQIRmPvqmbT6S6xkL
         u8hBq31USQX/Q3sTs8JejiaVz75MFjG3n49xTn4OIxlSWywxlVhNl2Xbkoddj5Sb61HS
         wCQPfvIs4hvh3KQkXPFTxIktQWVuZZpBFzVFwlXQ3kHHY6Y/rYy+i5n3gwio3A2EA4xk
         2nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446938; x=1795051738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=JfjgmNxY4b/NyMtEyVyJETAYSyvhBY8tUam2ude/f8pSsJnDlSgIVSRdosAR4HYrFa
         Rbk+qx0IAckLljk5tG4e9jxfH5TBCRPOmm60alivAMOW4iBwdPO4Py+bvBjhcUb5h8JH
         CNmNdihSuMCbmbM0+iYRWSLHG97cx2dR4W+UMGHe/Q2BrBEcEZKJD4P6mbGE10nvEEBB
         t8KyIOMvCu7T8zjX+XlJCcBIymtoYnotdMGXAz/4IS4m2K/B0bi/SNUEnP0z1jjgUdQh
         0flMAq8LeKUfZ399PpTmljZGOn+p2tgh/RYdvLEwYDR1YK6rm0YmxBGiTw7mqSY0//TA
         1oOg==
X-Gm-Message-State: APuU4Z+I89Y7IklRoQxuTfqU703otQYcckhKJDrV73S/wj+Zn4y27j8V
	uBD81v5lbxwb459wPKFE1QvUgUejE3d9Y0nvD6vd1lDIjRUpv29j+514
X-Gm-Gg: AYBFou2VEuK/I/wE7GlemdzZfuOfB9+/5NMhGcvuR93mq+q+f1aJZl6bAPtIij+ekDh
	52X7c/8oRGeLWZhLm1VFoLKg7/7AlaPts6D9dcY5g+YtXsKbxCeSHisHSc6YgHkLlfj+Kb09/dE
	SZ2fV7ubJoudkxzpp+RLWqv5XB+lyL/tdXDvUHVLAqlj8Xrbf8idjE4Hh1Qmr/WRRtHOWvSv4iM
	D3AV7CzNGaOjKUGbRWSMub91fq+KMsr9beqgldPBl8I65wF5Gg9ueaf3Vjt3vSWUcWC0unwV5Wz
	9NAHY0kv8pNg1IFeG34Ap1n+XMmZgIoAx09mR7d6uPdDBdyFABUvrX7Ph66vlTDmObFbrg2thtp
	qd+4qKf4lpI9etwOeM/HWfCbcD8QUs8J5t+u6WE4HpTdnly6EWzKcEDXvi46rXq2A7hOIB/rAGi
	ton3WE2HUGbTC8yfCdDEPJkaKS7M+Nq3jn03+PBX2jJBIc7Cp/yfmbf4eSx1iE9rSvYqVFA7aLH
	xmBVNs4X7apMSxEI7onlbLixJ3h0PV3eZdpParf8FN6vgc+ZE2nfFejSDKDVzuNter25XuyDumq
	RryM+4JVORQCoPF2xAJm8yOnM2AXwc6F1EWnDSjzBp3+hHHdRBfXIAJG/fRl7bKBw64DE+2hzCJ
	yeWLSJ9e7GOdUNZlBH5hpUnIZOiMPB3on+VOIaTlPlxK+nn9buMZGRKaZcApS9SSJe1eXdaocTU
	Kf2WPXxRdNCNqYLbnwYJ06DqhPSKvB8vZiiOzLUAIZKZnyx2Ve4c7Qte9ghrWzrhxbj6UTF0yt+
	A==
X-Received: by 2002:a05:6808:13c4:b0:55c:6aa:14f7 with SMTP id 5614622812f47-56b962977e9mr3910659b6e.21.1794446936603;
        Wed, 11 Nov 2026 17:28:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:04 -0700
Subject: [PATCH v3 25/58] mtd: rawnand: hisi504: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-25-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012903_373518_641BB253 
X-CRM114-Status: GOOD (  14.01  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the host through its embedded legacy controller.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index ccc21d21c3e0..a9e6ed2d4c4b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -740,9 +740,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, host);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +793,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +817,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
