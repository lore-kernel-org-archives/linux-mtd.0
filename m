Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20311606B226
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iql399tB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ooygT/IS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B0hfqOop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kb9sjQrM4echU0jxgsjM2ylGN2aj+HCkznLx+kAfqcM=; b=Iql399tBSRj+ZLUsU+9s1uzI6t
	p/qvhpWthPwmsVDWgYFdn+qJUAFNAbC2h8BYfIvtrglcLyxoIrNcHKtJS37hs7lzFWJH4KrMQ7M01
	ae1b/xAI1VM6XrF3aBVYhHPQ9gH8L+2dq2j/88Q0SX6EopxPAPFJT/tzpGHy3MfwO8Y2fGeY+cNW7
	+HFhta2KrXnaOcu2djJBDc0AiBK6LnPMbJHtuCibMwCPUOe/vcSdUesk/NEmqn3PI7Dkia9GVQryF
	Ee8TOYOIWx1UTnRJxY72tKQp8XxB2YsviTNMlxgyVYqrD3IJ7xKTFeliTJB4z4tG3fhTeC4mnPpE+
	vYOEavRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvor-0000000Drs9-1pzg;
	Fri, 13 Nov 2026 18:16:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoS-0000000DrAu-1uAK
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=; b=ooygT/IS1sgyi0CTXD9KNd3zs0
	35pXscLm8oSf3SPPM29vw5vSR1o69qyRuPLSjNhbLLQWSd3ohq3gnH/JN7TvE7iSWjrElBOAPfh/o
	BP9ok0ngAVYeBIls9UYkLjgPLxjV4UPPShC8H6oejY5ZFa57vZV9iU2cumyuxJY1Sdj+CLC55v4hY
	Dm37h+rWSF84gZXlu02edpTAAy0mQlsm7i4UymnfUibMjdsiZqIKkci0+X85auzsJowrbzIE3Hcv2
	RDYhFm2UV5v4VQavWDg9p9Ii2YnSUo+9+ZLS6xfL5RlWrDqLQrC05leECHU6IDA4Kw/iRsYfr9fsq
	0clCnTxg==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoO-0000000BdiI-1kE5
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-86103aaac12so1925174a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593742; x=1795198542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=B0hfqOoputRCJelpFx8Ca+Dmfo1kqg/0QueceevfaNesGp8gROFD72ofz6/1clw0Sq
         HdIvl9XAXqAcbrpLR+Gz8CmGoRDKF8sby82VRmagFouXv3jol+EM/rRusj5nILbxeYRF
         V7c6cxZK8tipeGyAUe9e3nwbnLHaaR0r4B+Ng4SahVHDjkEjVrf7aGOFlMVQAOojuBdJ
         6uESsHTD27x0t3XTKBODWkKWGYnJyjsOiW0+0OXjCkxAwhs0TDxmWwnenfFNqbTyXPaG
         mzm+7zCYV5Aik0Ih50jFGhgjOSm65YlLY5USsAS+kjM/AlpLONU4gquvrpJUcyFSXw9r
         pZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593742; x=1795198542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=nqc9g6hmW6reyE4fjqcV7p9srNDJkMbEV5gWufLJPuCOzPT88tx1MyGP9rd0/0QtwE
         9fziY7icEkrCqBqgJx6yvgbe9uI4rd6Bpr0njRoIA0TYvE1d5i3nP24x9VDZETy0gbTE
         lWKo9tJo+EUbDCyzkmGkFIBvorE5hj94XaIWoQsllaK5xVeR3lu8Z4Y949MexzXehi2w
         ilKJ6HZN2unyojsVzESkt5C9hNL3g4+WTVl+VYFS5gnrjX0KPHlqpCJRXLus06q1zDSo
         hOJ3JERBhxj0QNHBO0KygkFMCfJ7op+3i0BnBlShEBKqmdothO/jwWLEXKWwuS1H1Qta
         trYQ==
X-Gm-Message-State: APuU4Z9dH2XZVbsbQ+tpZ0OkN9EjYPqK7SthHnmj7FqH2yyTZ7nlPFQc
	q/S0B0v4UD4lNkcINtAIgJDY7S/DgXNCH5N6E8qS91l/iCZBEEMMNgkf
X-Gm-Gg: AYBFou0bo14bRPy6idgHIyeuZm5KC0IElek2bFdhJhRRs72z2zHuB/sqsOzSllhHQVN
	+8sOTci3ilekYkmV0nmUlzWJRJ+vcLrlRyjPZm2CG+EVbqf4um0G/pgFjzAlkhwop8bIzKQgafa
	eHKmHcruNF9Q/5tNbcLEOEVMr54cfrqP9JWpdBBOjzX3z7piJGUoetTarH5afKr55hBKkAcZMFs
	4+04LJnBSeFdJIIDknP/FhuRYWIXIiAssM4R/mKFL7e6Rk5cRFAIPLYkLizpON3vwYbfasB1+7R
	KP1pW+VbU009d/Tna1pQqTkDmdbL3K5mQ+kPOIuUrpTgFwqTHGBOC1vZupx+BKuYVbonCGB1MEf
	VdJe7tRPdIxQfUKTrKT2PawbCdnsLDkjh4A5BdD4rBVsvt76h80N0Ozs0Ra9su5vd6ZeZli7T5a
	P8g61aPPn5/DABNFLN6XJW34lhTrX8GqrIPLkkQZW7SwnrkQ49RylbTd0zepw2HKBi7eUwAgOPY
	9SquAz0gs1pFCm5nGEOafDCV9rbM+f60/67/Lnjf9dCttt39TGWOZMX0zM/68oF+zlHEIMSYnPf
	v+lO8COU+4LHy5nRPpl8ofTyHp+EQht+hF2JcAYZ1X0Y+2p9+0ZnWpbj4Oqa6xRJ3tB1omJaiMB
	XqfPj7X7bEmGuCm7YRNoKUPswV3aElHCl0sloiqqSFws7L8sF1NYSfp5rniG2BDPMVEVlfmIYv+
	L9QA0WFyZPrB5Nf94kRwc+sToDAo6eVzUh91iI0XoD+eb1pKrBBy8=
X-Received: by 2002:a05:6830:2695:b0:862:8871:5bd3 with SMTP id 46e09a7af769-862887160cbmr2427683a34.37.1794593742493;
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:39 -0700
Subject: [PATCH v4 23/58] mtd: rawnand: ams-delta: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-23-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181544_339148_EC5C89CA 
X-CRM114-Status: GOOD (  15.30  )
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

Apply write protection after unregister notifiers finish their writes.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 1afeb38145cd..af3641550b2c 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -250,10 +250,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, priv);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +357,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +383,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +410,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
