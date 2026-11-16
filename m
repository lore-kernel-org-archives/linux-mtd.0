Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B7606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WSohdNxA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vz5yYJ0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DKyrv9Wig+2d6TDBAWB23jPrPyfIxhWEd6WKs1s2RzU=; b=WSohdNxAiF71SOEFw02OF1bwyC
	+dS59yZOecIeCZ5s0TwBsahYz2blL+YqLwL/13yAE0Rvj6kLj9VFbBX6wVw2h9TZ2XHdpwYIZ9upw
	/uIe7Or6j0a9B2NOxQRRySa7NuOL9RKz66LDcTnHjvXGhiOhnGlQ3qJEHOR09suoyMjCcPFgAaO+/
	OPxbbLMkeXIQRPe3+btha+c7+rY+hSNe1S22pnxU5Ryo4KpMs3rce/6uO3Nn4/STLvOcsfQ38h4f7
	IgUkI6BdcnSEKtCCZ7V9aqWE2qC8Ea3sG9ysw1LuipVmMlUfL57++Tv9zZejK/h3g5EtshqyE5Ual
	NAMFswIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFS-00000001HY0-3hCH;
	Mon, 16 Nov 2026 06:31:26 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEm-00000001GBC-0571
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:51 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ae5389c00so642869eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810642; x=1795415442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=vz5yYJ0LtwcUjdW2j61qhjSGC3ZrCEWot3ayq9n0krVhSpVmTuOMQ+mm2JtpSBlkxO
         Fl3VBJ0UeEowAF0RzlhIh3mqoOx34nD/Ub27V9MZqDe4r+gtKgRjrIYfNF4L49EM4AiA
         jrU4kT1IrqvT/AJowIs0TOleLd/kxH5F/dsgxgTCZ7Rp/2iSPnvehPYDbMg0xJI795hZ
         zXSzvTxr+VVTPuuk7y3eMZpnl3zeEDL7/JWi4BavKG/NuRFMGiFwtSTwLNg2MnvwFZGO
         BN2x++GQzf93dd1ZdBf8Bbir8W38ZCN10zwmKl6/Kmw2gtjcR9fH/H73I7TSSRrhP6pS
         23vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810643; x=1795415443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=Ox9i+OW4EwKGymdlzWNvg0e3rUFtHlNRJC6yFcxNZJg+9UklLD4BVqooDSHeECiX2v
         yHOyCuKfOjCOfxOJgBEGeyKqPiuYR7hJ8euGY5XsVtEJxqdCbKPEvMx0gvcIx+wBl1F/
         5vBS8oEHFDTTEt+6R45sHvIheeM+az6hNjvUsIeKfNx7pcmv4oK5XhG5fQuKNFBBzRq2
         XF7ZgI5m9mUHhtA5Vx5PGYPhNFt4h8ihGqWK7zqJRUO2QbSrIP8NHkNQ2ulsDwIr3nJV
         KSCTQJpAeEl4JUQ0+rC518ng07ZSpikWJgme1uBeNy5RytC+cMtBdAjLazjXFkYMMGnI
         YpxQ==
X-Gm-Message-State: APuU4Z9VJGp8LZvtr+gPeH8OgET4eaN4jRTBFzd2rCWQqUuDf6IQC+mh
	Vt4KW/b9QiQwIF2heoA61BVb3Yz2JuigpXkrCC1g5vBtCF9QiIFCv6vB
X-Gm-Gg: AYBFou0LVjqY+elotmUcsGJ6SVTtXzAF7+NBbQMVg6lPkU9fl8DtsFLTHQyzYxrK+8T
	vQ4HTO/cx/MyVEmWvaHOXKLlYV3HqqX8pX+iGi3d/25B9F8hxR6a41MDbnFrO5jPaBVnlWBavKN
	RVIaqykscGSbb8JPiE4KBs44Y+GG5jT6oHBN+C4rFfGapDaO0jPm8CFxyx4lVq6cH2ESqAJTeph
	Wea+0esx1/0ASAJtvFL49STKj0g0xLZNyTvOXWu2zVu2q3iJEKfQr71wRrkP3dpmewBF5BKeCNe
	4MvJX3v7KO5QwuPVm8lyqu9XdHVi0lDKRipR3js07y8gEEjhHCHTfBso6oCJ459N2MCISoZRaha
	gprtfpBVt4ckTQMWo7Z7fxgTljMoBsNALHLf+sjnbVdUKCuaTlU2zJaNCw8xtIWogI1eS1MagM5
	UziiLqgy8xUmi+P/3baxGy0DidljtPvuILs5IMWcnO7S7Qm/od6ksE+DwLh1tqaZ74ICdAUOfin
	GnGQpV0BMLh2mEx8Zf0v7gmuqPSBPXk4LDIJT8yg5pzeTRv3aM4OnkntxmH55lxbBTp3ZYWa+VL
	+ALB+3xWNRBvfskMGUYcLcrUxKKcC1Z/bRRRYugPB5zZtDkcEcw0QVQZgYRcE91nlU2cMBCM5Cy
	raHZ4m3buBHSply+HCOyhbwCLLaN2XHyOPGaKVWFMkujKFgN+hA9adRYISIH/d8K+hl1Es62XSt
	fa/mu5zwsWgw5miup7vy7o7IGe1iEErONWu7dCQa9DctgQBKeLkRc=
X-Received: by 2002:a05:6820:505c:b0:71a:e4a8:bed3 with SMTP id 006d021491bc7-71ae4a8d159mr2908459eaf.77.1794810642654;
        Sun, 15 Nov 2026 22:30:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:02 -0700
Subject: [PATCH v5 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-47-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223044_351018_725191E5 
X-CRM114-Status: GOOD (  14.15  )
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
