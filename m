Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FA60A3830
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HBSvElA9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWgBs+Z4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d92gW0P2GAUagZHE5Z34XzQHNN9u+XBc1zADG0HHByI=; b=HBSvElA9sd4YgYaPNMFaA8rguH
	OIL2NiLzxgNIsRx2SJ3YYHunNgbz9VppTtZ9vEd8Uy7t0US/UEkJrWq5DsTLihH0xbeYk7mLgnDBx
	yUo8PAnWlClIBPzoJ4VuIxCc2AOGy42r324xBZY+vGEsrSNOOSxuCN+LpmkoscVJAEYj66KJ5RwMK
	xJkoocBNevA3EC/6hgh/idNdgKBtrj3XWRZu34JOKieMhT3vth/DWa2l3/4ACw0BvmahkXJRzoiLs
	E8JtIbAQaB9el2iNDLaPJwY/vV61wnEXvBLwEMmJu81XJHnXYpr8fwkGmhkUn+PBrmmIV9ZU+p8IL
	TddhBGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyb-0000000DvkB-04ck;
	Fri, 13 Nov 2026 18:26:17 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyX-0000000Dvi3-2qUN
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:15 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-451a49abd8aso1901446fac.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594372; x=1795199172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=YWgBs+Z4tM+XsgCA/gToRyky9MIhL471B5tY6qjlCYqjvvdxv/zR6BMcDRGY8fyCkc
         bsIMpHynFa7jOTaQ/3ZPcl7DgiNp0qFvnqF7usqh8tZ1wuwPTwLVHzU0Y5yCcpzNhZx0
         H+shm6zg6jdasYGbI6dlEVu1iS+weTvJ+fTa9pNlmIx6id7wZzkQ04UBqPktwPkB51bw
         xI4vbuoH9JuxbPJ+6ard6QfoC/XoxGFYpJbtPbGzbQAjqRMBxnTjMS8l96hFTropXOGk
         XQnrQkc/9buRR/DBTEMmciba8TA2LamQSfPxO5MvshO6loCCDdVBlQjI0jotiTdM5cP4
         uRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594372; x=1795199172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=EBLX3ZqsJalChmmBZyEnUOeMXp6ypZpqf7QxFByqAfjwja62nBY0nPj/C0KKipiinM
         g3up2G4fR2wEcXzRs9p9/MX9EvAV54k48fzOwipIdtzQfyyrDz6vpVeBjnb40iixkPSi
         Si5Xukt4Aj38rVz+2swtfUZuv6BmLdWOCHRyHUQLOoJR3eYwWtSmaE03Dgad0I1dXGIr
         CrDi7Scr1kdgHHWtMIEUHlrj2UtYyfUwp2Mz8PiPPFpMsaCwzvSK4e3Ut261pg4ekRJd
         gdbAUY+PRiwL0iz/niPzymN8VMCTkFObBgDBpGF0B7nyU1zN81YyDFRJIZmgNFj8h/ay
         KIFg==
X-Gm-Message-State: APuU4Z++ttzwW8TdroKUhNX5O0HBgXZEPiqigF+It4TNq+xwhT+CJiLo
	WCc44/x2Oc/GXvUNI1xWtWDI7sAOnx+3SIgkQ+47YaRwV5R21ElCraIz
X-Gm-Gg: AYBFou1KKAfn5ysx+snhqHQbxSYaQzxcSGIZASdUP+yJGsN1/pswDYgph1EeJlwBp+6
	F+sst9VH4MvwTjBH9xRztVlLtSSKJwjEjf5shb2yR8AAH2NKUX2Lagz6wJOUcN83GUa/DsTkNNV
	xRLr1iFW0Kc5oyRvEvE2R8/VQtk3OPjdIEY5vnhAzUdngjO78Zhuwt2oWcC+s2umiNOpndxqsrf
	gS/kF9Cj4mx0lSa+A6IRNDJXRf6VntfHeuBDFsy1Hi8iR/0OftUaVDsK67ENrwVnEgDGJoiJjdp
	/cEtaS+ljWwq0Tx7lzJ9UQaRC69XoAjkWevGnfZZF4fXMnYKFHuJDcSqmW9b3n+zQcU4U4IQ73B
	7oHaBcJbgblN5kl2VD8q+cBRlxKrSvwF7d7Pf+Ffw4jhmfsACUfxN5oCkr8I4Wgjf0v0qTH5M1h
	EEJtzh6/v2sIV1CfYtw6r56NBFFTxsW22hfgHQN0CfivC0qmcPNjP7rs1rHoA025VVFv9Gwsquf
	HC8/mwGv9igGeoey8sRiTN0IPmlmfhDptAhvi1v443UHa+SgHbCGp9f+ugNcbY27wO9tCe8Az/K
	J5Ahh6QNdYNJnBbcO3e9sxN0i7Fj72zZcBn8K6+ozCRpaMN+F3RSCjA02mWF/N0l6FBJFy7sfsQ
	362ZQaRXEL3Jlc7Iqz32FTfvVUfbVkBeOt6sYuonvqU/+C7pRdf1z0YXg5IXpcQmWC7+ds1HYVE
	xIBqOKx6tMxl669IP9h9U8CImEkc5e3E7dZv/xeQY+r4tYGURRIpU=
X-Received: by 2002:a05:6871:a1e5:b0:4a9:58d3:b60c with SMTP id 586e51a60fabf-4afdf6f359bmr3316826fac.32.1794594372472;
        Fri, 13 Nov 2026 10:26:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:04 -0700
Subject: [PATCH v4 48/58] mtd: rawnand: ndfc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-48-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102613_950882_B7B0150D 
X-CRM114-Status: GOOD (  15.01  )
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index ce10fc6a41aa..27ab5c034e70 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,7 +171,16 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
@@ -187,11 +194,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +209,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +254,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
