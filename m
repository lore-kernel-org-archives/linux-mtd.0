Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44E606A33D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4kPWkPPy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=luEGH0vz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ce8UK3bi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Kln24rvMIpqH7w6im4bfERaDU18zpLvyl3W2YogMC0=; b=4kPWkPPyMUhBqL2J9JhEuMDBOJ
	3Uxlb//BZrdYVS/pRu8lv+Urnll/NzsYoneBk8dCp8p3KEbhbzyRcuQoW8i3haeB336J5yLtJdK5L
	gkyJlNJ0XpHUXeLNmRjWZnDSh/UaG2B9GQvBs6cpCO8myAMQ677hg8nrAR5j8/juaLnvI+DIfGsJi
	LR8GjeLm6XUFuPCzw/e+Ot7d3PKxV9LyMnvPTSMX5fOZCobHQf4+NsY5tfmLz6aH75AV3HkL4DE+g
	M6KiYJsgJC0ZM/MkVDLpK4PztkihMksK0K2bdLnsPO3i7XitaDzWY7UmrH6DJuBNuE0KXGqgCxKfJ
	RjQsAplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYv-00000002zG2-1OEa;
	Tue, 10 Nov 2026 07:46:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXq-00000002xp0-0BOp
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+OJPSVWkhBoScGRX8u1MCa4c9TmlNDLnW4QbLk/yAO0=; b=luEGH0vzOXnYe/A8bMlIS0oChd
	1Qcme8nbcbTKaVSjMmOKjp7//YY/MRMpoBxMEpGs2IKQIP7NmUs2UXI6NvkKf3LqrX+vOEZqv0/ug
	Qyqk2NaHaNd0mGv0bxyCOnuTofRqJ7l8lzAPiQi+7qSAAFJyOgmtM3MA7HxlM93bqgbEhSI0UvN3y
	0RwIkgTsGfoUXIImEWiPXXppRXsL+g4l0OGCxXwPJPUVtRefLNpdhdE0PHVO+vjQEpu4nzBoFnaQM
	GikqYpVxWx93ZE1/l3itV+shV6tf2K/tQxK7tRzagtIdWDAfNEUc62Z7z+jAwj+SuDh2iyS2bWVku
	JGpGvMWg==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXc-00000007e9J-0tKE
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:27 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6b1afdf5196so627359eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296713; x=1794901513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OJPSVWkhBoScGRX8u1MCa4c9TmlNDLnW4QbLk/yAO0=;
        b=ce8UK3bifopGs0cZgyhctjUQt5w6ko9oXPcGNjP/uaxzad9YW4lY+rb7MeI/XSdGKb
         s4HbYLPcxO5a6Cog218Pqwdg3gkWDcov0hVNU+KmxQF71cnOVUscM4XZ9TOBPQp3ouh/
         KzXwUiVkIFMUPNt47PY4oWNpqN3KbbTSQ6jtkUrc6uA//0XEbjNZ83NVlcHZD0fBUvg5
         obQ+xdVwRqCbKwo/cM7DJhUhjPmtuUk5tPXJbaSHy42UoXVPuwzEuut+Aslos/LXDVQR
         dqbggTkUfrEhsCCiGc79ESfcDR6FghO2L4mA0jk/AsC43DjPfqbwRdfI4qyq7rus5OtH
         dftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296713; x=1794901513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OJPSVWkhBoScGRX8u1MCa4c9TmlNDLnW4QbLk/yAO0=;
        b=qIfpf3x7sDE2ygm43Kmf3qE6ejBU2XE++Vx0mx78uwtupDZ1L0chIrgXg4+VwDf6rp
         Q4QpsyvWM9f/nDTwqJQFMDL0dX24OSmwkc2O4jWLv71IbL6QTC+lylzLASbRcl6ys+uC
         mLk/xDEEOWKfYFJxw8a9gHVRC8wq8sOFrlRAvv0vZYIbjW6YCxuNMct3zjzcqJb1L5Gi
         Egi/F1EWSMS8etcYSR6ph1xTIBB+7otDfYOx74g6xpyDJJGaxFJYX8Dgv163XDPEAzWS
         c2eWB4IxqCvxt7uw85MXEgZGL/fEBZF+1w/P85mCvmZF1CVXChB452f7VDkgKXpOmO7k
         eyjg==
X-Gm-Message-State: APuU4Z/RLRmJtp2JQ+ADFiO5yGf75A26uZF8/VLBKdf+U7vAjFoM7QcE
	o5MKOTiiMOfxjFk/PMGYn/44sG+mIYJ09Yp5ToaZRFTqb2n8pzPSpT49
X-Gm-Gg: AYBFou16yaztjTffTVUET3sPVtnqaNCwd5zBO38yX1wVCgGY32Os3/4auueRZeDVWZ2
	nBaA0HqYe4UTnyD4oilPze3zCj5YdZiwBk/lau0tJmMTBJVPQ7GLRYZze29jJIupHC4K3fhukiK
	aG/j5bBTbMAPuCh6/eE87A/SsSyxha3/LYB0W9faxVrmaKTX07tOQcWbk5AC4xsIjUquYvfQvD6
	xoTwXEvVNsrOCtKh88pGtAMRQavWRY8ndZQXYcRzMnQw/O4deeEXzKfItk05RMa+wZ0PdQLlwkO
	XXTyxNVq4a8hVpGh7NP+bTzV4W54dd74F0DIxN5LacwHden3V/9AuJbZBAwYwI/QQHEActlKPeK
	hOm01p+DRvIRzAWA3C0Tq1m+zNW/2N5aPRsret2Zwce7OljMCW7AFMgUqkTuwclj3chP4+CREE+
	YmQk8+bJ9NFXKW+jFGfWCJ7/SHCqJn2Ar9muK3z1loBijzzqUlQ7Eqn12xw5eGptn2D/USLTrPv
	FbYa+7XUFtQeUg4sxHg3weDCXVKNYpaICATk04hH9zw6U8NjFwpAJ42HKvTQsmg4rwzQfb/EiMh
	DNq+iwv+XJb/Z54ZDwwxISzcs02II71d9sKs2THQs9DEUVtdiXySuTBN9a1qOZdAcGcKGZqcEIc
	uzRVJG/6gLEIfQ/pUYe1EHOHd0DqgTkwhdepATXhN0h6fPeL45zxlh5w+tIcnf44D/HMuaESFtM
	BEHOJ2NPSjvynfLVB9wSE0QLyCLUUOgXmyF3ulDnVaZj5oGDJCtio=
X-Received: by 2002:a05:6808:13d6:b0:4e4:627a:e094 with SMTP id 5614622812f47-5683cc1114amr1237629b6e.11.1794296713566;
        Mon, 09 Nov 2026 23:45:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:50 -0700
Subject: [PATCH v2 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-47-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074522_071756_BECF754D 
X-CRM114-Status: GOOD (  16.55  )
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

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..93ee8cfc0345 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -675,6 +675,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -687,9 +693,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +805,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(nand_chip, NULL);
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
 
@@ -830,7 +847,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +858,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
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
