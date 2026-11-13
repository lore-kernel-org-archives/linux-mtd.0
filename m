Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8E160A5BD7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=INU/YAZ4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtq3/vJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqrwM4ZT/L/Z+SZkR9o+O0ltjO5nNMSN5TPA5MoKyew=; b=INU/YAZ4HwWOBHY/xmHSs5oYqN
	Sgpznz70+XFOY17fOtExTsb+BhY3nscI6gQyEvNaqcdsleFXDzJdq5FQ9byrJ/M96h0s83Zo3YJ1y
	KIlqPBbfP5U4fkerm7PQlNgQAroCyvHpNbqcliOys6wXrHsTMbO7Lf8yiO92h0kqmdO7m97XIuyn5
	J7Zqxr5eFU5FoEALJaPYeEG7fZOaZPVtvMX1KTziQPq2uW34uNY8SWct4xnx4h9n7OG4rCD/bFeP1
	uXXiDTte6V82721B60GWKRJYtPPrKJFNT0T/M9hdeXOJHtYGl0wlojxRJlXDMVbcr3N0MwLSzwZP4
	LPlQH/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp8-0000000DsJt-2mMs;
	Fri, 13 Nov 2026 18:16:30 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvok-0000000Dre8-2Tgt
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:09 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8446af403b5so1363378a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593765; x=1795198565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=dtq3/vJI2sbaPXSOGW5lEysvhhPdqBk/l1uvL11NZwdcT+b5mcsNh/EQLOhQzrqnwR
         BHanHgANZcaAa3VMpHQEtb46SuDTZLDUYzgeMaiPWxc9o7C5kda2gDxJFqkOfrS8t3By
         /ht9sYnKWHq+/BACZEQ93dUkHJr+PMsJ95J4x91RiC1oTwceSO+3EeBzxL9xMZWhVicq
         z+Z6zMmt65C6AY3D+gj8sVBhKOwMwIUMySHw9YnfnNmegnyRizqSdI0TioFDHXcfXsj4
         TweXx5L+zLl36b3nXw3zCve3xS/oA9rI7fJ1D/q4sQO/DyNNLzBgQHbQ0jf/9x04ZTV8
         l96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593765; x=1795198565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=cs48IAAvynG7r2xUj6ciE/uMGY+1s9Ul5QXhffbRdcdieKIQnCSM7a0kiSmA7YXKMf
         +RIIMtwrGZLFJeDBNN82C9g6dVOgivwXXjvQPNx6MYjGvrcSzE3Z9qnpPeqnUdufBYlc
         mx1SYQBH6YhoEJbPIm4MnmMQ3s+bLaxo4ZIYcyIwwLbHzHnj1DXAR+0vsTMQUfMn528b
         gt/NrV9g9jguSKDo2FIEkNDFY16mwlRekEKWVrDtbBEcoY9flrw4tjSrv5JVvGd7vLTy
         0ADDX1m8jh5tElZZy9eIh6FchM4TVUBH05E6RQIuwD0zAdNP41tQVYYmpJpbeKMQnBv0
         K+cg==
X-Gm-Message-State: APuU4Z94fPRduPWShX/0Lkn1SRLHsNG0ugfblqGMqr4J3EVg5Kjuti3m
	7rgFJ+vg3BDnAUb7WZNT2eodXRRJWa0VQsV+sSOYQw1I3/DfC2I7CFEg
X-Gm-Gg: AYBFou0fehuWvyYI343vfJ0l4dOANaxv6nrSgLTExV2OBwzh/JfFL8/yYpMYwD335/q
	vK+0s5qHPChOPqI7afZyjPg/6hdTnyKG6vwR3m0Yec7tLPI64R0MqaKa1M5t/WTAPedqb/1uR+2
	wbGIrWmY816hGIrubyN2JvKLW8Lhb1ziUGuaSR9MyfgZeBeJy4WmlHDRSbcR2TtNqJIEjzZzsq3
	ZGSL4EydYstAFPYSRszmkJ/0JqIE+QtK22j/PGXNkKqbeSGVxTrD9sWUxwLgnWH6dpzkeanfVPX
	rSMzTexQoinLdCgQw4w3vxrD4Oj8Fd0O2V9Oxo/qyjY2QOZB5vDeCVYflWC/8XRdzoI6DH8Wa41
	BQcmvnK7Ry0Uyd/Pee0WTgh+FVHxMX1hStj0Gi1249I6dFaA5J5YYGcxi+Q3WjCdLhSb746OJol
	BRoIUqiKO+xNopW0HA8HyMlYc3KrzbApu2NAIkyJ00giM9ek/OE010DMCzVml0jkw7W+6bJB7kD
	MFYDihhaa0Dgermj3uspqbKebZM8Pt+BmHP+ipc12UEC5tWX7zUHs6BQWTWpSgkbGid8D+whvx6
	IssjhTNNAwP/xI9jolP7tTq1Cdnsk+x8ci/oZlhWeJERyuliKkvyrd/peqpa3tz8e2Mc7UYXvAm
	F57KayWhhXZxKeDoIwOWEfu6jHz151iig5INgR/Jg73xMJ4AgzKD6pvqDQFGFONansDM1oAfWeK
	M1mmgsSHXHRle+qU4ELfGtcnDBuOfmkfxzEQ3h/+8i52Z1wSxAq35PKbKMjbc0Fot/uXkz6LilT
	Q==
X-Received: by 2002:a05:6830:230c:b0:822:a034:551f with SMTP id 46e09a7af769-86289738d61mr4118424a34.2.1794593765498;
        Fri, 13 Nov 2026 10:16:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:47 -0700
Subject: [PATCH v4 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-31-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101607_465605_3235A366 
X-CRM114-Status: GOOD (  16.30  )
X-Spam-Score: -1.9 (-)
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
