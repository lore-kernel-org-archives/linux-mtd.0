Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697B606D835
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6gvFFCt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GInLI1kG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X3/glzetu+7DLj293PI1TKpOWWyCKRNYcbuzgXg5CTg=; b=K6gvFFCtwK8kpS8SSfdm01wP5m
	YRQzZUyQv9nr04N0Zu/hi2IgIK40yjdZW44bvdctx/yrqyZC9e0XnC4mhlooaRSagJWxhNE+NWiKV
	ulIKo2UIXf2kHqMEvkjorxVCK61s5rugfG9rKnIvxR4eeXsH6UzVDdcNt3pjRn8ggh+vDfu1+UpEL
	yQqgp924JWkf8VpLGZGp5w0nAmiWXIJ6CltYDVANIGX8bVxqJi9KbhoMZX9aBRqs2T4x9oCkrAioH
	EyLzhvg6eYnC9VYPEDH5ixOiWt3iXQABNEg8DWkQhlK1kQYHuu2KsMZXeIHdUZIb0CXGoBQUdnDLp
	J9gSaD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBal-0000000GqyQ-2t7S;
	Sun, 08 Nov 2026 22:42:27 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBai-0000000Gqwi-3ZUH
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:42:26 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4d198f1a591so139644b6e.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177743; x=1794782543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=GInLI1kGXAe5rZI5YTU2fBEKh/0u3iZAfNAMQySp2wAFXIZsVy7/coU/eIlfXMdhOR
         PnweTaAU656OSoXuVb4egNiVf5lVkq2YZF343hxATaKKWHUXib0XAcuFEYONg5y/nmmJ
         b9O/6g4eW6KId1alxQXfAjWHNLYoSIn6JVGxgDK4jPA8qt7opJ8rgXMB+S8gi31QZIX/
         z2H2uexBPwUck0BMoT1bB+wHqW/P1SN0DWbEbAbYae64ui4HzNtqUVrdoZSVDOlksLpu
         wNVVE2Tt8BIu0vRywQeH2e3t1mAvGyTqjsmTMlB9B3w407xQhiaCH1ta3eFWVNRWxCrz
         EAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177743; x=1794782543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=FsMXqOv+bG6B3OeLLGyX/nGyx/cr/afqruebVyOChqd+8BBsG8IRn1WCQkTPZ9QsxI
         g2U8tYjAsmCvIchYGN0QqD3KG8ynIDZOfWIkp/Q24+vW2NEtixjzwrf7Whj9cJtOfkT7
         YgxQlW1RSrtRL89070hBEJ1dLf3pY8HQeGsCaTjImiVZ40XeaDLsrxcYTUaPuArYziB7
         oaXBp8wwIuWPtezHrgIocTL0R+zXIrnu6vrN3DQ07e5oEBhbqDPuE8SAKdiUTUJaVhgR
         oFkQ5kYd2oTJoUtgLF7DxPmi2IBYVgrEFrD8h5nvaJdAQltVbkMy+xBRZa23bRajh5SP
         SUZg==
X-Gm-Message-State: APuU4Z812BidPPNQN5kztAbwCfUnSa45t47p8Q04+fSi138qLTtHqi1s
	cGn/ACldO/TkhtCGrcd30I9llQBfqZm26tnJShgvc4D+mPKk20IUqv7u
X-Gm-Gg: AYBFou1LBgA5KB3O8T/BQOgKayaKUo3MqaH1bwZ/Yf+KSR26qVsZcGUSnKRIwYFRNg8
	XptlPxgsJpNqmWzDK2hCbvujvpv28sYKv1d9eHyWz02Ap3zD5+SNd59xBG5yzPBFJd0qSwm0Voy
	2Gj1HCW2mFshUu9UiNOrEVFahELfiKKxpI1FdeBsV7UtLAYzupwD2WY1KamPtQhhclQi/egBSwC
	RS+6nXjCMvHcaxkC6UiexFo/2inxGtprRW0/gdgNV1SviQOmn8pJtQaGixRkqPNy5hxQpiP30r0
	mIhr5ryidTROT8sZoIeTMlxYqxIu5OmGGCsmDwcB8ZteTHQ33vPBuUVIUNZIIJ1sqHGUwB3RzPO
	XO2jB9B1v14yicXcc+b7iUFfwAiTBE3UnnJnmxnZgkTQO0nuzoXekI+OSGlYti5WR67R3T8P8A4
	ZFxq+4CL7Nlz2Rm1ir4xx40gA3YH7r/IHEjh57unPPWb60WqvOYxV6AyavcJl9K9pyooJIvGl1n
	TcTPtCeB0cUJ7kJkY01GyyWWxGzFrk9ANJCp7pqSt8lQY8qqy2QuDWl94UUHj7mOlZvnY8fahLk
	KadcVK0CMxNPOf0I7C8gQAhed8dDEkVwz/i+1+RmrFHZ0A5HJQAanzGP+41HNzq4A1x0RqR8Pi8
	yviElTiHXqPMbWtpxbwEd8SnTuulZmCxX6tPYxuBE8jCAWnuFuCrZtFFnwC5qN4XZ+W/vHkzsVi
	XCStrbsWMi7eFEEo0n1p3NPPUjswF2dDNp02NQ0w7/fiPDmp7QMEiO
X-Received: by 2002:a05:6808:2383:b0:4d6:90d3:e18f with SMTP id 5614622812f47-56814624be0mr1364853b6e.46.1794177743647;
        Sun, 08 Nov 2026 14:42:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:09 -0700
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: retain the BAM transaction if
 replacement fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-2-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144224_899433_5E27DF08 
X-CRM114-Status: GOOD (  12.32  )
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

Attaching a chip frees the controller's BAM transaction before allocating
one sized for its page geometry. Allocation failure leaves bam_txn NULL,
although later chip scans and previously registered chips still use that
shared transaction.

Allocate the replacement before freeing the old transaction. Restore the
old capacity on failure so the controller retains a usable transaction
for already initialized chips, including I/O during probe cleanup.

Fixes: ba7542eb2dd5 ("mtd: rawnand: qcom: fix memory corruption that causes panic")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f240d1effa04..062fba9eaecc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1329,21 +1329,22 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
-	/* Free the initially allocated BAM transaction for reading the ONFI params */
-	if (nandc->props->supports_bam)
-		qcom_free_bam_transaction(nandc);
-
-	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
-				     cwperpage);
-
 	/* Now allocate the BAM transaction based on updated max_cwperpage */
 	if (nandc->props->supports_bam) {
-		nandc->bam_txn = qcom_alloc_bam_transaction(nandc);
-		if (!nandc->bam_txn) {
+		unsigned int old_max_cwperpage = nandc->max_cwperpage;
+		struct bam_transaction *bam_txn;
+
+		nandc->max_cwperpage = max_t(unsigned int, old_max_cwperpage,
+					     cwperpage);
+		bam_txn = qcom_alloc_bam_transaction(nandc);
+		if (!bam_txn) {
+			nandc->max_cwperpage = old_max_cwperpage;
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
 			return -ENOMEM;
 		}
+		qcom_free_bam_transaction(nandc);
+		nandc->bam_txn = bam_txn;
 	}
 
 	/*

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
