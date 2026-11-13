Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A8606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=juR3mWcu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GtnZB+pc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qd+10QarzHJYPbnj3Nw/WVBfZmhPYmrw50o4wLAmAHA=; b=juR3mWcuADP/t5MSy2z4sjQUVs
	UJgoh/UDdlEnUiD18RcV1G0eLfvtppreCYR/UFDiR41DiBdwOHJgNk2USVENPbe5v/+FguUXK5Pc8
	SuY57i5+fj2JeHAAgIQ3MhWhja8u8tp/G97ZrU076HUbWAIVzFEVNHR+HUP+T43wAqiEdiP0WgpR1
	qUsH61J2Df066cZKN5h5bSQU+AlPeML0LfpwYnj6MuOi575hjvgnCSIHtsGhpR/AhNPtVuVyxw+E3
	8ldyAJdA5FWMtKDH4SGLG5a4/LUdzZUvfP+hTiNnrN2ZLRuA1bP6N28tU92q2uDYWLmnAuJayIL45
	z5lZT/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpX-0000000DtD1-2dgv;
	Fri, 13 Nov 2026 18:16:55 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp0-0000000DsCu-2OrO
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:30 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8446af403b5so1363631a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593781; x=1795198581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=GtnZB+pcIqmQtsWGmVxecx25J+A30KJbtf1Gh/e9yET3RdRJwIy+nBPAcpyfBUqCha
         rijLdtVao8+n67ep2P+TWbl77I75r9o6N858WH/5WtlBsrNBr9iXB7CxkXZB0zPQeXr5
         QNiWuix4//JPfoEuvc8iqQEVZz4lG+5ZPy1qQ4dth4ZVGUg0pVRonn1Xru7MAUv/uHdk
         CpTCwcbgpcIoloNHucB+OqG7j0bvwQdiI+a2JooffGDAtTI2zx/tHIBpKPIU8q2Fe9p+
         Il8HMHIVZ1WK5rbBWXzoLX0c2iO60jIEqQp+nDRIp+YmBFtoRIXLQiXhITmDmfibp7MV
         A0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593781; x=1795198581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=04+Q/cCBXTZ/8aPbi+YxOXUvdko0mAqT/ZE8Sdhf/DFOfVl5uirjFMrq4t7F2PbuMV
         Bq9nh/DQboj4CxkJRcz9xx7WCVJACDkaa8YMVJTNNDAqd0QLrOLuPIVkoTuEFwinErrg
         BIgRjE2M3rGiNCVllKWbn28UegIBss0/7iyGC4vGivA9mrZVjzQEOELFGDzbDgkEwlVY
         Mmw10YpBswjLh2KCvv0NWyvDc4jREvSnhtxgHy4qASowL0ZOqIv2BKj8vFYUV3PDxoz/
         cWUBgv46hDr1BgtmynVxTdp+m594DByMwOT8vDYdBIZVWMIc7a9t3EMoFd5B+D14vIa3
         XMDg==
X-Gm-Message-State: APuU4Z9oKKtVg5GEgsqPF9L9ymlNcz5yd1FG4zsGMIOonP4WutsnlLKq
	yhQ5e5HIzs/uO2wEP0NbFB1gmbUwggm1FAQp+2xVJTyswkMf0OdxDtqQ2pIcA1gc
X-Gm-Gg: AYBFou3d3vJ29rn8+sFpdz02dUaBD+VrCNciInnNaHSrmlx08G+MP9mXTjQM7r38nda
	qeH/Rk0RsYZVS5u6yKst0FM9mY70alVWnYa5k8PDgF8IzkBPhkjvJKc9gMkrsduSJUYzny+xOWm
	A9wnoo+NRrMjWEm+4JyWaBebNlvDJOfYQOIZIq2QtMdUrqMg7PqPKyOtp3bp7WfEgmFVB68HdjW
	/M+EV1xjcUxs0yVyWGukxpAIgI5lV+UNyYw4zWktLhpahCxXM2OA7pfoIRFsX9XEGg4wnKOcezN
	9yOr1V019Ij55XQ2ahk08K3eZ1maRzHCvHmk4V9G9M8415N3GOicFy1yf24pnAqGrYj+LIKf/cG
	gy4xsA3aSaIIx5Qz6X+Sa8KwjgAxU3bDeKaRj/6nIBbjvJHR2A/90SfsBR2M5ueepcz7YJD1e6h
	7UZAZpun1fAtp4vaCrMGB6mfgOBXbDQdtcCH65WOab69qri9WD4im0EhJ2Zne72zpnq38dgccCz
	vikoC73dCkPQuTtnyRr30xSQnXpS8XSuagufGD8PORGArMLGuRQQMOnOtouoxlkbl7HUynff50s
	caMiEOD0ytThMcKWTixicN28JD1pj7jqwekI8Ck1TJBbrFDBUxFcTcT7vnstnOLNATzQXFi9mJj
	OLqnKuIIwuI/SEmlSJNHAxFLPLSKhAc2MXMVyB+PXHvwRRLk6pRF3mg3Orntt59blcbCk4F0pM3
	RSlysULxzKkmjwHAHpYcc9ZNVQnUaqaoYEuY4pDFqRjCZyvVRl9bk=
X-Received: by 2002:a05:6830:7183:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-8628981220cmr2350104a34.8.1794593780921;
        Fri, 13 Nov 2026 10:16:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:59 -0700
Subject: [PATCH v4 43/58] mtd: rawnand: sharpsl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-43-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101622_714941_2E3C303A 
X-CRM114-Status: GOOD (  15.09  )
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 5aea5afd480e..8376ac823c98 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -135,6 +135,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +157,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +190,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +211,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +228,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
