Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAB16074E5D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Boub17CF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ/VoKYb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yKUUne9jTHsLyRc1Guy01mloIFOQXeO7MASDDae+I2Y=; b=Boub17CFc/ZVnA6FMC56eqoaUw
	T8wLdBP+51+jEC6L0uUS6mN5GOnN/BukD4INkCA5sUX+fyGmDKorDHI3DJigWYHGp2ye04YfSEcDK
	226ltUph/O5o1b2ls4VDF4Tp4foiVdOtCLf4el07s94qwMy2Szpzxqx653SeE77mpr5+y8/yYwtR8
	ixBwux5YhSyNP7XwDD2ancTUjR+hBrfiyCoxk6MesqdHQTNU1ez7pENrZyLpX4rD3BCNSfaUvtFdF
	eYQUFDEBoDdQOgYZeV8hTeEDL61wMlIOEB+9dEbx1jDJ4E5snr7Fe+SGJ1SrjnQQ1xuJU8YY5pGJH
	HCAw/aTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJde-00000008Nrs-3BhV;
	Thu, 12 Nov 2026 01:30:06 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000008MKJ-1pgQ
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:27 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so2384692fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446955; x=1795051755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=EJ/VoKYbhW3z15CiQZOF6Gs06kBKH/gjHd51a5ija91IIbEAzJzcmBOomq+QXTRTzJ
         zA1m1uwCPtY7LLBOQuB16OK8abLkxpYgZDLMiFMD62a7UrXbhw2Rk0+FOedeQdCyqZB2
         wFuDC5Q+j45JRyXE8GiIQGCiLcIECgn7gvG3GSoUxxORseARR10+u6wtJOURlLFU4IIX
         zuVMLTc4y/jO9edYaGuHrvFxhLCZOWvszUGuBcaZLij/jfg1TK5C/gc/0w5jNgz8YKlP
         kXx4JuovfceQl/hUdNS1rIOLQz0fTmsdCwU4CyvYwUHP3AwnOOd0Hja/bsqmAySpl4HB
         HWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446955; x=1795051755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fug6G+cvom6+MRkGjwieiMjGPMrolNlkGyGeYh3G8yM=;
        b=zY4uMwZUOAxBjg04stkFH+q5AmyFIdETNmeBq23vtNI2B/c45gXHeB4M2OYGvqUmwE
         Knv7UC3vGBngrENy0OHxw1y5/sH3oIx3Dz/2TwWLjkGApwu6gPUsL0vtLskdZ0YFS4By
         PeQXqYUUt/4EqMMGrfaxmtPTf2G57qO55QuF9IN5dDycRO0Km6p7mYyzEKXEawpb0Do1
         CfjpviXgyaY/qtPmPgHYeK8y5txFe8RiKgDAkUbSIYiX7rMbL9q40RH41oCN0r8xLPSK
         a8MaTvTYjq6fAXl1cuQVZ3YosgwGYR8eieF4Ju2QTVBCA0qzhyqr7K6vi8ErKsFXN7fw
         HuAA==
X-Gm-Message-State: APuU4Z83ezqx+KOL78baRZ1yPUCRTy27+2B/HxDdcNgDikTf00HRG1YE
	gydzb28/a5SIhzLjkjyEfvDz/ilT/VxbmgGvFgsSXSPUmW/nQvV6WcxI+o4XpwWv
X-Gm-Gg: AYBFou3v2aRngdlqrGOBIsZ8lrpWpPEFJJ4iKsoltUTScDvET2ojWP4WTWe6absa8Tx
	bPkHx23xqac4Hybmk+XQPjmitWKrVO1I83x0oPoyqoX7jwiXW+wcdn2hMjj3YQeYSmSBlNlE89r
	rXsjAUM29pSIqVbLi5iwWoV4EQX26m3PYDHcyvQk7HE57D9NZpFhs6fD0bpuxSPTulNpFE0lfCI
	b6sjm4Cng97Rro6K+yFd9zUIeRoKvK/jvlf7HJRR0VJGhU8ikca5O0IaE1SguNR4g4cgpJBpnyk
	XtXjHNOJD5yr+aX3MF1tCYqMTeTV8taMeLXBso0D7X3deG8IjRxV2V+yuPWhhmqWgTKf99vdxsi
	nXntGMLds082h0V2xmbcq2ACBObhI3xPKzadogV3o6WwxSl1ZxiphvrDZgpQFJAuxAnNuzblrAP
	6bYc3/KwBuWb/TBHZVy6oBK8buhdR92vD1KZCAcrKEy65MiPDVyYFS/ndwyjZWosJY4ig2VMfmI
	KAXR2olJeZow/eLpTqxsgsC+FgIj2rmN/IZOz3V/w5nvhgpZPW93IsQ1n/twZawySsrIMzUdQue
	A3D7SPflyvXtFylWYxHZ4jfHHBuRAHA8AOoRt1M4hjudzr2ToqnU6qVTG4X/2UDfmlD67Rj6ytg
	mLkNnNk/51ZBJbhAlSrXBqkvDc13mvJUHAmmJwMoNfNEM7RRS4fKEKHX2bvWuGp75Arth5CPnLN
	rc4qZKrtne7GHd8lddkEt/L6r3njYz3FPvjooCMOt3uUiZAmIJRmAI
X-Received: by 2002:a05:6808:e90:b0:55b:f8ca:3f21 with SMTP id 5614622812f47-56b92a3843amr3976212b6e.5.1794446954743;
        Wed, 11 Nov 2026 17:29:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:21 -0700
Subject: [PATCH v3 42/58] mtd: rawnand: au1550nd: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-42-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172916_516742_560ACE07 
X-CRM114-Status: GOOD (  14.34  )
X-Spam-Score: -1.8 (-)
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 01c2c8b191eb..83db1963c449 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -269,6 +269,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, ctx);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +305,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +324,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_lifetime(this, NULL);
+	if (ret) {
+		nand_cleanup(this);
+		goto out3;
+	}
+	ret = mtd_device_register(mtd, pd->parts, pd->num_parts);
+	if (ret) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto out3;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -333,7 +345,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +357,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
-	kfree(ctx);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver au1550nd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
