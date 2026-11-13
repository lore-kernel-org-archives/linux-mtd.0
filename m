Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA861606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eWMOEt8H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qptZrROM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DKyrv9Wig+2d6TDBAWB23jPrPyfIxhWEd6WKs1s2RzU=; b=eWMOEt8HrifBhXg96nm34Ylh1S
	Hz3h2WbskCHDoGH57zUYrznmTOk6fpyAHMxDA6/mzC2bET3Bw3vg1UNaQQzauAJa1eOYMcrOpucc5
	bqG55TgyqeKP5LK2PPsUo9tTz6CGJi2qCgGi5pZwVAimbiSwa7o0ZmCuebAqjHrLybx53sHFYa/SR
	gCtPYAjZ00Sgplimmwhyot89UqzRP3ZCinYR42ZzIeiYJlHpY5DEG7Yh9hgmC1VY7791MWxHhR08b
	B8zfzCurgNa3Z8Ic7Xpc+lRbjh2Nu2vsncQH/FTZXCMFnnaIZ3ws1Z33DFMSr1taLSBa+AlmSybDD
	s4UIH5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpb-0000000DtIt-3Dgg;
	Fri, 13 Nov 2026 18:16:59 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpA-0000000DsOv-1Hrk
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:33 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-8479f46ecd8so449266a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593791; x=1795198591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=qptZrROMW4J66j3hVg5+1gsP1Va47Y6YXIl53xlypFKYcztnmBn5WQQqm34T5MUO/u
         +6xYtUuL56LJOQ7OyzEBlB4nr9pIDCcuxw3x8pddglNl2ywpAGPmlwymyYGUtBIxT8ON
         ETSIn+c6GurkkCHFoZnaVEVEHRhg7WULwnrxXJGWcpaAj/XY4EPz2ME3tHbGv/+7Ioyn
         5hO7/HcHgXTUCwH1Jo0LysTqoPshyTIBRMYPp1nntQ1Ae8Q78YWQbc5sT5jgQUh4IAcr
         66TUkNawL59CPZx6f5tESakqBehOz9nSVXDPVU4yrwt0GYQOG+C2Hu/ASAPHJvHaB0J9
         2drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593791; x=1795198591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=IPF8ccumGnBKfaleI0wzc7LVG8HtgY2HVWmWwsxm8QwWNMP+qTfRJnICGxhH2wioNh
         YmDfagqGMjssIz/ePPifqBBm7cUccunVTg0Sdt51l/l0DoHhreHgHTqRVyjCTjV9NUvx
         nLlIx2Va9sTvLJDdXW9ncqeq3uJSOSsB6U9v0eX6rmpKuL4dSRh5vw1rbJ9lcpvUJgcw
         z3Vi/gYufULRO0l/7VEWXTT5MzERdZO8wdi0HYhmcbDKRLNSCwQF754ZIVJ8cfE1DjZP
         cz06n2s0220HzypkwidvsGL51fshFEStcJXosTL6kELwtlpQL6pKl+Z40Fi7hkKGhAuB
         McNA==
X-Gm-Message-State: APuU4Z9q6p4XUGEiBHd65I0bGVduXmwShJJ5ob71SmMetaPDJ91V+HeI
	6PycCosl+tT904Fn1Io1jua6rR5T3n9yj/3uRSuO7ZxYAO4ieSyx/r7K
X-Gm-Gg: AYBFou2h3s2JN/itZbiPEnAYI2rFp67L6lg9qr0k59shXAh0Jtpkw8CbpLknFGZO8Qh
	j04pLQ1o0NVG6TzbDNox0JD7pGkNbCc1tVkkGqRQmfuU2OZjMCfzXXfLUwB0sVMNr6VGAf7OHah
	UBgh649ipc5FAdxZINHz/UhNYXdiLwwp6mCWrdLFkUxhUzrK8MuDTVAZrN+qy5pUDBu6UmLLY2+
	vRaF/H6+yhGXW1leZo3j5nPD4wvFH7lOojsCS678CyxakBY1iQTDRCIVyCjU6dWK3qjpQDgMx2V
	3r36efTCVG21IxEDCHyzqEOYaLXJ7XEuMkYBRTQbS795jW2nNN5EeNtreOax54vWbTwmORk9S5H
	j56Tu8YaR2fBrJ8RpPD3F7H1IZ+6+OI2OjlT2EhdW9vYGQ2aWMv3yt/sPHFru0iTXpYXVWRwtxI
	sNQopm6is/yqTgbkzj1ZNNWqo90G++tMzHqmWZmoydzTHptPaKNODEVH7H2wanLymDdYDN4+wBq
	wJnYVi4JqTdT1BAxrX1ckVFBTEgSytndzKOyS33QWJ4tGIg+gtN5nkAfUN+oBz6eYNAMdz/cQ1+
	9T64ZpcIpzo5K8LxGfS/tpxg+DKKcmckyxQmXyUZ9sjkDCXMV7O7+xzHzzp4uQ97K4Md0yw9Yv/
	3uBNIN+MOkKyeYcAABOC+fttvKcBftC2jAEQZwBysnyUpi4uwjLIc/uyr9nOOZXBenvfGSMCNWp
	R9CYLLJO9+edO+rNi6x/XQJwWd0zQ/ta/HT33EeZfQc3s3p69s4ao=
X-Received: by 2002:a05:6830:640e:b0:861:5b84:4fab with SMTP id 46e09a7af769-862899619c8mr3027224a34.27.1794593791193;
        Fri, 13 Nov 2026 10:16:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:03 -0700
Subject: [PATCH v4 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-47-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101632_429435_EFBD0A24 
X-CRM114-Status: GOOD (  14.10  )
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

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 408b2aba2fdd..633d09471760 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -687,9 +687,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, host);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +799,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +841,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +852,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
