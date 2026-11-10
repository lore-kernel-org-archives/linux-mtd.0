Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABA606DF49
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lVyels8K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CjHstP7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SOZLVMoHe51WuGpziY5WrlT94OzK3jVWLE3jBXO+3qQ=; b=lVyels8KkSCot9oLOExAiOFrqP
	kzvhFVQdrh+tE2g0zaZkW1odQkkxcAnzDouO5FAqo3se9O5sXLux+RqhJB4lH48AvWW5f3zpTFcH9
	B4HHi/gL/SbYhquyvVVTD3/Olat3W4o6rIrkRS5LvuS6UbHMY4QQv85biq30YkRdLd0IB5uUT8Le7
	zg353exc8qga16COkEy0CO7xqQ8kDp14HOexpeGIdmbTTlMFwhXyfWta3T12WQ+PPkyTgQKPMXKVx
	2B6/Xabk4AiCrx02cjDHy2T4r/UCYwxIcMg3oPPjFs6M4yCx3MWPP3J8Eoo0QdDcgS0AATieDBGLr
	wIn2Ew2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYQ-00000002yXL-0RRa;
	Tue, 10 Nov 2026 07:46:06 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXU-00000002x9r-3pQp
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:14 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-8470d7d430fso924981a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296708; x=1794901508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFMAx8E4/aXDwcVO8ktjOtO2+SQSHcxbfap1CQJFtVE=;
        b=CjHstP7cVCu+DQ/a5doGizN09jkWTodA/afP2TvttIlhN2H+ghl2y04aeaKfIL5cnV
         lMFNkXZ7oeAXhEgip+3of7rClCWi3Aeh39rilyykLcaWwdbag5E07y5MK8xKqvnD22Kg
         KpB2Sjvbxqr06p3x5WzE+m3eBMyn7CBPpwvjMNFhW0f9jo/wKyguIgsaXInPUKQ+5yJE
         FaScfP5VDsLEqXoST0YFkoDjbpN9/+USAMuCitoKmUXFy5xWS0cP6sfBRTBC10AfJxHU
         QCtWSk42KZv3gU352FRtNjP5GloN6Fh/wq7E+4/L/JLKhUFvjwq5e0SdCkxzlzi9lWRJ
         KW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296708; x=1794901508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFMAx8E4/aXDwcVO8ktjOtO2+SQSHcxbfap1CQJFtVE=;
        b=daHLdH3sHDHg3fBWXe/djHP8fEzI2ydjyPXlYNuG93jn51f5xmsRTk1BXpIriURwki
         nj+DVGoWWU6KDWpxRRn+oCNGcHM5TYJgHKnrE/og1u0G1zFXeWHYnahGmQYD6DrWhlhx
         8nfvwob0EdYnRX+iovQRTgIgBi7XyNcdPZKAF7tQj7AYCwbLaC8j4NTvRiXEKrQBhpQ1
         4DlzZ5PDaUWmeUjU1zYLQLs9Ebj64l+57NZewgBopfPIfFknummOqfbY0FOjDaqINgQm
         ebpo7W7Yhl3INT5ULR7eZt5gipqIpPmaSil/oV9j802ZYilYQJi4XsnVAVNPGlj4uFe7
         iJ4Q==
X-Gm-Message-State: APuU4Z8v/3S4Y6G9SX5a6NUbV3m84p9HXx2+1rllbWAoPkkNmiXAllLm
	UffEL3bgIvhMrNpb5/SA7mIz7okewqf/p6EVjGwf19MKGNOKsM/I6UfGsgV1utMF
X-Gm-Gg: AYBFou1Y3ULT06dh+Qi9ztfjLJtRRwutGDasFvA0IbAkSKZso3qtvn5hBjCgMwsLmc+
	RDJnBkkjXlsPQLcPZ4PgerzF7vz7JBDO2YitOh5QEeE7lBl1uRWzhIxEcLI28CsHWwNAjlu8ZGO
	R4Nv1r0LXPOhBslIoMg9yTD3O26ifHKXwLJ2X+SFJcVH2PVeqkMzgwAoCExZ6Tktwv83FgLDoEb
	croTPFfjG5c7I//kWMUCSjgFbhd8+0Kn8mEdLm+mTEf7OI8bDUOXJNtFD4plPPo3S5B6tJ07yCG
	REDpXFLSqKbtoilnmsmipyddMC861vb5YgXqBlL0gG6FiGISaqoNq0EHf+7tt5gSSpIJhpjvKcz
	RxjQWc+L+I6yx0FESdFZBKAfiBhXhTsBtgNZpH67AeEB3Bb5Dfyaagzlh+r4RaHpV1U2gAAvvJx
	JRs7LeZ5NEge5wrZeoZYX2aWEzn7G/5tzW6garI8PxllNMA8fKXrShMxsMOmusQzXcbgWtq5/wE
	7O4SzUnLpQ3NwEShxhJaiihsLIeK3bna/bK27a0pw4snRq/El6jrFAGV/w0yZP/llPSunih19b8
	nNddguhaT9dy868sEe3AQRu8pCDXf4dtoIHFLqAnxxTavPvbZdBkAaEEqUg0eqlDIbX7TH3S2Dj
	KW/QMTql3pSDXPdQlh36KEcSX/w7AiFCfYJyl83WXVOdkkvLgFItbC9psUd8jskh+ON3jl1QTio
	zr3r5ZrwXoGFNHIp0B7OWsga7ZrKzEzA96viBZqntdh2KGbLUr2B0=
X-Received: by 2002:a05:6808:c177:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-5683ca9f489mr1419482b6e.43.1794296707747;
        Mon, 09 Nov 2026 23:45:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:45 -0700
Subject: [PATCH v2 42/58] mtd: rawnand: au1550nd: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-42-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234509_125546_F46A7528 
X-CRM114-Status: GOOD (  14.84  )
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

Drain NAND access before unmapping the chip-select window, and retain
the chip and controller until the final MTD reference is released. Check
MTD registration errors so unsuccessful publication releases the same
ownership.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 6796afe9cd29..ba9019ac698e 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -251,6 +251,11 @@ static const struct nand_controller_ops au1550nd_ops = {
 	.attach_chip = au1550nd_attach_chip,
 };
 
+static void au1550nd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct au1550nd_ctx, controller));
+}
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -269,6 +274,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &ctx->controller, au1550nd_release);
+	if (ret)
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -302,7 +310,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 	ctx->cs = cs;
 
-	nand_controller_init(&ctx->controller);
 	ctx->controller.ops = &au1550nd_ops;
 	this->controller = &ctx->controller;
 
@@ -322,7 +329,17 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	ret = nand_set_release(this, NULL);
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
 
@@ -333,7 +350,6 @@ static int au1550nd_probe(struct platform_device *pdev)
 out2:
 	release_mem_region(r->start, resource_size(r));
 out1:
-	kfree(ctx);
 	return ret;
 }
 
@@ -346,10 +362,10 @@ static void au1550nd_remove(struct platform_device *pdev)
 
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
