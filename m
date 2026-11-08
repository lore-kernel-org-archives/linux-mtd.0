Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65258606D82D
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNt7AC5e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnfyqPfy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X3/glzetu+7DLj293PI1TKpOWWyCKRNYcbuzgXg5CTg=; b=cNt7AC5eXVAufBVgAjUeOueSYw
	XL1F6G2Jc/uoG7pSmMRbXRiDEoLKO9jEdTdGFkaGpzf9Nr3NtlFkp/4ZzWqFBmyRbnx8Kh0v1XxzY
	yl9h7KPlMyRklGTLNtXiCrCJnS74cpbxHEwqlRBjcSRm1oIyC0pPI4vSmFIhuyVNRyZ6qjssYk9Cp
	U10GmubG6L3oNklqB/DEOoTcPJzgWeL3XNHFpaOQHfzvKfPIn0Qle1fHmtl8EkXPLDxDqWQ/hQS0s
	esCxWtmNLBPgQ9cXlbCmB5untZpbf8PpuAsQF4A1BPSH52fBuhWqcXVeW4YaX9qqkFDK6PMvA+Cui
	olfUrplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFr-0000000GhXZ-0NJv;
	Sun, 08 Nov 2026 21:16:47 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFo-0000000GhWQ-3EGN
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:16:45 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6aa9606ddadso154625eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172604; x=1794777404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=QnfyqPfyEhCjiECX7vUnUPC/L5Dq24SfzYrcSd2S7a08F4f/dpbDagaeVK7Q5EbE2e
         sHxbAGWimMtc7YHDzBecJA5YBN5X8pcZNSvXo2eT8io0m6M2oGTDzyY9N0uy3YGHehAI
         WMFwUFKuvlFbDha+Dxcxel84Ed/xq+wJ9jYrSbWWqMQNU/+0XaDWj6UFC8sw+sdkFblF
         XdzXejnSloWvUUsOjujR15NYYEd25B5McxHuk0cXCiq4HGg0K6glwa0WJzWgRjgVFV5z
         +syw9e/KBhXMKVVoHue+mMrG2KU6eLdUzEBURMJBH0Flm7zO9t41Q4V/gyHgAQy0KjQ0
         52xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172604; x=1794777404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=ZteF42ttjj6gfjwyxU1EDCE+gsmvZYZtN0zmi57bX9JA91hvit8UmV+iM8oJBZZZmv
         qL7jHfjcovRKrby0M3+RGJ/iPAdW48ErZM2u8tK2ka5TC2Rp9q9OS9mMMCryXBqwmPzy
         GDb6TkUHJr3MtwjkYG7cI2pfgp24eLxfowbw4rU9pOapI6nk/xIKNmO1+fD2oNjzNud1
         Og02OBk13PMuCu/Ly5fa6QsTEXt5uvqBvjUx7mhlVe0qBNGnA4WxpFID2bz4m1UcXHPT
         JBWnZ1Ob+G18y0ykns4UM3/Kj/qSTUIsOLerlQ3ZweVZGgm0CejM2NF6fKAQzSYHyq4J
         WN0Q==
X-Gm-Message-State: APuU4Z/3zVjbYcGVL4PJQ6c6/Bmm2hxBta3ZsdTw3A1bAIQzgSWvulBe
	yQNaPiATO33m9FT9NElj0O0Wl5SjtidoTl857v4qElqcY7eysavMbTRaVAZQnw==
X-Gm-Gg: AYBFou0tE2trZ6tcVv9/Uqx6JupPj22Cgl/p8xUwflBlfzpuhk44fNkMrFbZJm6I2Jn
	0AaFGRqeH5FJLGWmLNPunydn39atGAN+bCWPn3StrPM8d4FmfG0HYvckKYIutKfyTrjOl4Vw2B3
	HCvTgHwHnSwZf2fgyLtEc5GOefkNnjQxbCV6PsnlFuemXhqIEnI30r7Mb61JR9tBwCs4FnapGLi
	MvEgQk91r6y39ika+R6lzHqsLcHR422w60trG/z3XH+GfTTI9LekiKbs1Ck+5XDNYoQ4AxdBMlm
	O7c4UUjkSwYjxDFmo3KFjtd96vaikzURKKrESKtfoJnNUsSgkjM4J2fQGkZFM5vezQd3zbIDRL2
	YXh8L+9nLJLMHWzA7NfKMUMyZU4QLYedgFErxP8hJAWkdjSnDpEIjiiojKeK95SSp21qcaU2srP
	f2tkKkRPw8gCXLsyS3OVzg/grOyJAL+Q9eGh4/DSD/iTOymN1ebQ28mxvhV+8AUNKfu6q0weIPy
	HSuCSqUQrIPNM4+t06jfwyN2P9xVMkiHS7DILXdZxBCYv74KTy5qMkiZQowSVoTXCq5CH9AEswa
	QyrXdKcnYeDL2hNTD3yZDNZhQYAqKUMYQH/3xADq52yJFTMazHjiNfuXihZl9ruv5w3aQ8Cxe2z
	qRD8S6b0T/8rPKUb369B4gziEWle1q3QYfLxBVge31Iujl5v16LJOmvOyhLJ5t5gVhfSzdTeeyI
	JkcfEmcXnYE7C7DIpGpYnzGLx7EvryDNStdVp+43mqUzkmNMRtjuU=
X-Received: by 2002:a05:6820:1690:b0:709:529a:478f with SMTP id 006d021491bc7-7170f2dad52mr1144251eaf.60.1794172603603;
        Sun, 08 Nov 2026 13:16:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:36 -0700
Subject: [PATCH 2/3] mtd: rawnand: qcom: retain the BAM transaction if
 replacement fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-2-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
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
X-CRM114-CacheID: sfid-20261108_131644_821979_26B24BB6 
X-CRM114-Status: GOOD (  12.34  )
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
