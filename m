Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47460A3809
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zi7N2SsA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvWSwcZs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fx1SPUXEd7hTPFjxopfCTXgrsdhZT7Thm8CEkYwe3Gg=; b=Zi7N2SsAc16P/9ETvbWPLRvp4g
	/pdysWOsbcJz6G1SngphQMTftoUxI2AkjC1Ps+qAOoy+zfrocPIsXLF7FQHXdFWSDJOg2k+pXUqoC
	eU8Wugb7ZYPilY2NSFRvUoz7bALFXw9NL0ze/gqud6yEesVA8gacyfHQgCybS7/n0LplY0lA5oHwu
	zYFVAEhag/r4QYZoJ8nj6jZylg9smOHwMfqvhg4Uh0ZNCTWynvjbgESesxkxu8ALZqVf6BCM4wT5H
	j/ET8D6FRmGfAXduZZ0CE/Ssm82JyGdSFRSZSK0Jrtvg4plBvRL23BJnBBHU1uE2SpYMMzNMOmH0M
	u2319zkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXJ-00000002wmj-3EBq;
	Tue, 10 Nov 2026 07:44:57 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX5-00000002wJg-3apf
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:54 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-563a0462094so863368b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296683; x=1794901483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbLemVA0S81lePI8F7OzuvibNjd2gN3A4gCLsbuFnGc=;
        b=NvWSwcZsuH47eGlM8D3bVz7Ko00br6ZvQjuWrY7poRhK44PNYpJryuxQxoqiKsO3Hd
         PvpsJUdT0GSxc7UnYpmP7GqsxOc6sHylEe+NHUEj7PqWc0W9d8n/wv9kanq81fuev3v8
         KtIwyxJKxuBUB20kY5XChaCuBVfuGIfBxTiib3Tl1pnLeEQllOHaPFLC0Av9TuWSpvdk
         lQE+3wv1Ck8eGD9v5MjowJG5RGJPY6yZ5M6/aEFWcFNP6P1qQ8cXxJJFVOrzweF5JSAt
         2cKJwhd4PvKnh8FWPjQGj3DmuWEQq52L6ew/ZJY98MoNNwWZHPIG4P6olyzfPvSt7rWc
         vu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296683; x=1794901483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbLemVA0S81lePI8F7OzuvibNjd2gN3A4gCLsbuFnGc=;
        b=m7CRmvEjWA3aVIbd98doS75FfnDjfsOxxjKfpTKxN0Sl0I9UvIjHm+3cYntQlHomjP
         KmD1fqDBvlh0ErJrw7wz6GBUxsxTnHi3R1HiUzRlQP1oddkOnQlpJh0t+rkBbY8B9oRb
         IDwbINi7W52FSqdwPxRXp1cYp4ArecugoHTDzF/viYyuujp49mW5XeEMQCZNReZ1yOyf
         ZsnnQueVq9tYRr9lKJUfN8IdxRU1XuwlklAKOEOqjKVUw6f7A/zg03deuekwrLJxmqnO
         45CxCbuUa0P1nIpc9Ob59rqYjlBhUr4GP0E0rA1O6SfU+NTKjgpozin4JtasCs1GkhAm
         /6Ug==
X-Gm-Message-State: APuU4Z/2XEW0wpUQ8ATMFfPE2faJyOkVEAtJ1WQTUSJfR0CuDqm+wDoi
	BZpjzrSSKYfeCVW5yWHoiicmm5HatG/8rOJJYoqpRNxGqdeSnY31qx5Z
X-Gm-Gg: AYBFou1LRxBANeTW1czj5KU1r3ETBeGT56Tt907JX6em2J8AoF5HQO4fbhHGaO0Wv7a
	BrfI9xxz+M9HGpF+f+Bn3w943MeiY6elZc3llkUOxnYQYPrLgMicixKP7ca1unpJ/0J88JvLykC
	iPvW4UzMyd4GOJ9Ap3XLzFNXLq2Lewk8RhjN9Ujdu+93rydHi7lsTcOh5uZnIgmMNcc0TaSXfR7
	UuG2yzy5q7GOqjaPoCJzj3kvtGks1L46Fv9fkF5m1sP+LklLNybHir9jCm1ZSugA2TJndx7yS+o
	gZ7pvmYpoQL+Gy6H6Lp2yXNFdGZC4Ff8wzMOOUn5XLlToOt/lwoMPvGHm0r6ERho8g8KK5RIeYU
	iZK0kYvuR0tjMFhyJDGEIMSxB1FhPgZEbuXY+Rz2v1rTTV2k1fB7VQvgxDc0qKTkXt7QHjuLdap
	fwoBJi5uKOa1xY36u93KxT7Y2n2Vzf5/+CIOFxdaoOOpQRwidOEw5Gxl7iaMc1C8y7szuqZcYWv
	VhW/WdWcBZhzdcPiYcgPg1b/3L2z2Fr2qEssgv3MlJxaRtPN92pEDt0PYzpdbQci60Lp/ygCn9t
	rh76U+N1QKZk07QPvZu6sZkY97HKhuv5EeunR31zbwxE6Y8BLBLcEferwBMbXDyfoY5nDldnGHi
	1z6me9Gktn1KBGhQ9vGclqsrRL8poDQFDH9+V9T9EqiAsVOzynGYycqANuPS2MNiGJamDed6TMB
	NdWQpIfAuFbQLcX7XaRLgTKf9Wad1a0Mzf48ShCv5ouD7MRVtWLJGC+ue0TyknlbAEZoLqlW3ok
	Q==
X-Received: by 2002:a05:6808:1991:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-5683cdec02amr1507985b6e.36.1794296682645;
        Mon, 09 Nov 2026 23:44:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:23 -0700
Subject: [PATCH v2 20/58] mtd: rawnand: socrates: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-20-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234443_959274_BD1BA989 
X-CRM114-Status: GOOD (  16.22  )
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

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..f2e82f2b0fd3 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -131,6 +131,11 @@ static const struct nand_controller_ops socrates_ops = {
 	.attach_chip = socrates_attach_chip,
 };
 
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
