Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD92606AD6B
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J6fATUa/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ddpF9Jq8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugtSv69W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C7GUbcRC+ndMxRG11ybgAIaPwdWvFWo5cmAajw99Zkc=; b=J6fATUa/JNROL39S/CQ1JWADsX
	c796FL36JoFirK42kiyXl3pXdCHe4mgZUgW4jWQJU6Q7iH6xp5IJxouaTJR4zc7rSOpor5WHlm5Ne
	B6XRDi5WmD+xuqRmJYHiJjHlaqFlXC7/Hb6pSCIyHgsTrWCEXqeI+f/mmCakTaqTCwl/AhhheYAGN
	BdigCHBLF/PU8ReUVaflZX+/pERgi3K+so0MO/pJQwRAwRtABBfJMDPw/7/pu4t4sJhFPCkS+gzZT
	ZoZ6yohEIQ9TdeZxgguVOWYAh4P5Y6G9srCkhJ5iWwdtuyz7VM5GavinbbDr2X5qza38vmqNKLTW6
	MpJT8OKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcv-00000008MX3-0U9i;
	Thu, 12 Nov 2026 01:29:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcg-00000008M4k-0Q1k
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=; b=ddpF9Jq8wHiEy4Q7ipVTp5yQMi
	VfeL2t1p9r6+3vjzjdRvwvIU+7AllD5GRbpecnHdC2XOgRcASJKMPEMI7UONEPix5YscMrvTgsnYx
	FqYLD3MxUZ1WR8IxElE9x7rwWtKF+ecSFQqNh7N71k+yGQ41xb4Gm+y0f+RFeTsyylp/vbo2XrbNx
	rSdlph8fCSO4qIRoFkptlW/tokevMeov0z3LRR9Qu9jMYmXNYSN5WT/9dD4cZ/Zo/17ddgQQuz+vv
	MOllg9WjEFs1t6+MzJ+vxv+PCJEvS2UqG1S2m7YE9VMpKDZfr33PaoRWOkg9IADHD1CfzvlIXiSGW
	hnM+zPmw==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcc-00000000uzW-3UEX
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:04 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-82380b0f55dso1692370a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446940; x=1795051740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=ugtSv69WzrZje3D0mjfDogq1Mag4Qm8KLTRCjbIGEXCBk2j//KliU+Z0Dg4YHQLdqT
         Gxo8wsVyCfKl6xNIiZky9aOIpYzo8ZBjyGe65SNuoqtadfckXFffNA8ag8oeYbx3snrY
         +i2LmrzNIMA5UxY63GrqFmR56bpFH6eiLpDBnvYpFrD7Sf1c4u8t867SkUmDbRoY+Tfx
         CsTBeSZhoqNRcDA1WKZ6sb2MAUh28bQf/qIHvzHDBk2aKw5gWY1uzNpKyw/6j4WJFrDP
         aKDYMxahEpb8cMFL3YgO/LdeUiPvY8N0oC0OXOAYyJvpPc+CUE47uQVDLyl3aNqwj0z5
         q0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446940; x=1795051740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=tOybJRpjRbaq8r9MMFpPRgNK80jANqpkv5tdReukuL9+SDSyHwVkBvRgXh1m0FK2V9
         XeLWunOW8RNfZ/0LaH0YPWjKhixwl30Rl35MtlTZV/7AV9B/oN6ApvVOgRWRMTfj2NKR
         Hjn9WL6kFHOlc7q0DoJxFgRU2Zp/DHIl8IDf+l1uZjhYIFxoxuNaYTo+qlnSaM59aXSf
         hFkgmmRTs2gVMttmIolUvRF9RRdPLvGqH9RVLbS//eCm0CoGmvp3omxwrC9txlCuZPr1
         qtIDqBnOQZ80+kZ3Ibq/D9eGWYN9S1vTST8SaFS0bAa32czSX7jdMu3OZ97rI3aN6cx1
         ljug==
X-Gm-Message-State: APuU4Z8Exmh7g4yLSQpPAr9Na3fwV8TdY1fS3Fo/Yk7JDG7zwmi3aTs/
	cIxiR978wNY1tahgNW7ZZWTDFl2ARjZgBGPqPWlzjc5BwQTA7a3RjtSJ
X-Gm-Gg: AYBFou1unqgIUwyMq27tkxC8sEC4pw52L9dVr2rHzhVWy40ffWAzY1XAWVVpxkt63j4
	5D6Q/Zh2w7seZYzbe8bhT9InmsnfK0wzojt3aVnYr0GainE6GFuLDbtb63OP+TzacG1WaIvgau/
	vXi6EwiaFs2WPzB6eKSRJ7l1sKS7n9sM06VHMmUe8CIfL/Tkft8Cwm/YtdJh4YGZYFT+QIZbDg3
	uf3D8T6lmUHDunWtQAijg01zi4PVQ7g11S0GkSTSPe7v1GBFlFgukBhabPV9Ulb81pWQ3Zfv7/W
	mvLI1N5B+fvQqAUC+++IbrlagPg3MIlWdRu8nsmdCAzf0P4A9e+jGqLuN/8JZeLyp//yfyTwE1Q
	u1Fot+sFTUYghf18/H1GOrFIn1p/nl07OuB6T9YtufIykvR/dRi/VeHfY2bwfckd8uAfnZGb1Jg
	4YZpXMhn0C11iKxGIqLlHcgsfbB+avuyBUx9Wjh7jj3nWfLJx9KJOKyfaRNDrahZ38yvMz+LfV0
	hmGLvWMFHlQRNWaotm0CMBBP9Gu0f54FIst6hl9sSImluwt2IJRJa38NuN8Pw+2n6sWCDuBdNy4
	dvx3ji1o6K2IA7D0vVdRw+40df9P3dWk5298QT7OjwjcH9zfEAeyobxypnO14QK64L+MKUyjK3s
	RKsLHMFRLv6lTH7LTfpBcNI18gmy7PDzgf9giuVUQyGgeJJOrhHuH+OgWas/xYU/4LH0UzYxQEb
	NGXBNL42d8uG8chyEmeTs845NqsehVb4c7rJAPxDVSE7rFrEUGPjpC
X-Received: by 2002:a05:6808:30a4:b0:53a:3533:10d7 with SMTP id 5614622812f47-56b96298e4bmr4442109b6e.14.1794446939678;
        Wed, 11 Nov 2026 17:28:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:07 -0700
Subject: [PATCH v3 28/58] mtd: rawnand: loongson: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-28-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012902_907139_7889AA54 
X-CRM114-Status: GOOD (  13.60  )
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

Disconnect the chip before DMA resource cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 741e19f351d1..7f8ea6819097 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -863,15 +863,20 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
@@ -890,9 +895,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, host);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +919,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +944,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
