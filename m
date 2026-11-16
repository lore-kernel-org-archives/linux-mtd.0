Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE9606C21E
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmK5yMWr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asdRIm7X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nnpnViYmeE9LbvwbrFZzHXkPJ6b5EaNphdbtuBXRqLs=; b=EmK5yMWr4cFu+icNBJmMAWaQfs
	3btCmuTuzgaDz9xavFhUNtjxCsuNq0ShaMi3HOvucNZvg1QzhoP+NHuLn2MekwftZtsTFltvKTaTy
	zlxVexbkPcjdR6JJ5USzClufznh1/6OWiKJvx1SKlw8kF3ELblqVuFrTh738ps9C005CaPRJK+a+E
	/qaZqlC9sxnJb2wHrQyIxF+Npj6Xyw529V4AUkSFYgSqaudKF9xR6X6eY7jlNDv8qUQAejbwUyLNw
	XLQGHxYNMjllfj/PizKp9+bomuAN+jF5dZ87iXZ/0+hV0CnnBk0AwYux4IRcM7N7ID2KQszdPfE4H
	4ikOtRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEi-00000001G3m-15Im;
	Mon, 16 Nov 2026 06:30:40 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqER-00000001Fcy-3OO9
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:27 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-70b875f6f13so3408758eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810623; x=1795415423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=asdRIm7XAIJKx+s6gVIGb+V1tu2+odyShh7ZxWrUqoXWA9nW4UVjb69H+2d9+XVW3A
         /1jK6+e6ktoVRh+AhkpKW/oLFuEbpG7DAZ/14drB2g5V4QcaHM3ap/mn9K5BsLnx82zH
         4i0AWAl8tbzxufAcgHC7cSWkJX1u5425H2V/Uz/J8Hze4WYUEVccVxCg/WPPii8Ch3rv
         JI8ZCtF0qw9mZx7czAtpCxFvMoK7HcfptOF6us+LLVssJ7nLSFlDbi9nBMWyBGwE/4LC
         uPCKJYNLR0cf3DveLbSblAVJlYXACbHbAPL3onO6CDLo5Qu7Ojn8hzMFzc6I7siK7ns2
         qZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810623; x=1795415423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=eRdJZhbLiHJZ7ti2F+lBZz+nZO/Z6UjJ0NdMCXg7275+tpYMqrD+idUCMiqfpbHpxJ
         MohwkSrSfTdO0QW+svQ9M24+tcZTjJE4reaqgOUG+rrVPJnfl+HqdY9/FQ+NnRbCj1Yi
         mKsabcxMx6tU3Hq1J+IXL0tqe4PGqlrmtBOfcjbF5qWDVm1y/kaeTENeoMJ+Q/O0k3lz
         pa6dA7/4316QIrixY7e3KplrM1IFxKtwPa9wUgHguP+9ruISBkLGFax6GMmcrDOviGRw
         FyQyAK0X3aEDnBiHQutJPsE/H8h0u6cf2MwGGEcJfMC/gUFk/M77KB8hlfw/lUHXG6un
         pSCA==
X-Gm-Message-State: APuU4Z9vlAFoDtn00wXpfr+HkgA3oBPzfXvxwg/BzgGLwfVmCoIJW6eE
	85AOhyuiuNaOwMMR074aEtT0yTlCgTUXFod3FLOYnI81IDOhz+pGz3/Og10vOJsN
X-Gm-Gg: AYBFou2iz2GTrwJ8so1Du3SxdX9UBp68nFAwcEmJtf2Pje5HfgPj5FFs6peEb+uY7SV
	QNny8yZWreGA9/WuVLN366SeKRr2VPLRPWe/CjZNZ5ZlHj+jaEB1cle3FY6rEWAQZzSOBYcpHy3
	LnKECa3K2lia/+ZGJAGjgcqpcTlfPw8GOZAllxM65YBVktu62+9ZlJM8vGV+UDGhDsAkabIrQFY
	QjzF4nIs+zET0OU2vau9nZa38QWrqxVfwKr6h7SsH57rqhEO+szSGzMp9TiHyzyQquAJB4zdbyB
	FF9HD2ovAx2bLp++evTHvjWlZfGVq9PclvwcHAHIAZHrKzZOQA4p4m70qOGXsjocytBnIA8aQtT
	2iZnvBd+6rMCtlb3cvWKzQ3hpFwgD5z+Nux7ZFcqHaBXtTccIHuKr88R93EQ2yB4HiYKRgCrmqd
	F16A8ru10MWtjGk4KJn2pSdZwJEV1IkGjTx/73Z3j3R3znjcrnh15O0aCw7DsmA7iS0dhTGjQ/Z
	1wphquEz3wno2bvl5/dKELwXHWxBB91ayPVyGP7+WTUxlidhfn9FepVoUJLlsoWmAMTesMfIIkF
	Jwc7wlmMFb5TXNu/bHsvtdmnvgKEQ04Rw99/Bg+X+Itvncb9yjUMiuelYEL+wkNPhXh3ahsPjeQ
	ejMTIMGJuIANMTDgLo3xlep3/UqASpHLv4amHNPr6G5x7+MK94+5RmprhRIEVxn3aSTz4kk9rSM
	l6hvkyWfx1xihEABXhU6QQdBih0MS+hzwZiwQEL/o1aLx5Kbjc9J8=
X-Received: by 2002:a05:6820:55c7:10b0:716:cbdc:4fa8 with SMTP id 006d021491bc7-71ab5072f16mr4223730eaf.41.1794810622672;
        Sun, 15 Nov 2026 22:30:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:45 -0700
Subject: [PATCH v5 30/58] mtd: rawnand: pl35x: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-30-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223024_580487_0558053B 
X-CRM114-Status: GOOD (  13.89  )
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

Unwind chip ownership on registration failures as well as removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 36 ++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 537387014e2a..e5d86d72faf3 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1057,22 +1057,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1091,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, plnand);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1131,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1153,12 +1167,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
