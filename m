Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9686074E4F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tx5Vy3CH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9Sr7EnQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nnpnViYmeE9LbvwbrFZzHXkPJ6b5EaNphdbtuBXRqLs=; b=Tx5Vy3CHmqDsT2IQPMiDFIlFjL
	JWIKKL820mySk8nwsrNZrJZYFLYYJAqu27XebTvgPiOBdnzX0eln4dnCfUc+V4tDYJjucCxLuStZL
	F9KpCEtfmIZmudM8/K9vqAE3DOHkjLLejJMtMXEanF24mW4QrjN/NcjE/I+MZ09sHlYE/PCFCWKiw
	Ws5ZKxJ1f2cnNzVI4pnzT1H5CrW6kA7JMyD843emRoisVQSUqceOJpqG14YyVrqo1TJDLyWx0vnd6
	/7ZvpACuuqmLyOwTdb4Sj1EUam69HB9GH1SPtsZWYnPpdHpVvET8Rnpcazei4GWA2IAYPvlHpmLVN
	EdyhbSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdD-00000008Mvz-1X6S;
	Thu, 12 Nov 2026 01:29:39 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcd-00000008Lz0-1BXy
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8253bc5a613so2070475a34.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446942; x=1795051742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=X9Sr7EnQ6fyMY+nNCYGNlSt10rk71WLLHDcP/Uou44LACAuStqU1IaGtUf67Lq6ywd
         BrE1ANhOOWUY6bwZJyS5ifOc/h6C3D6wczfDd71yEbeSMYSuyV9jnHILFT4fcUP0NtYi
         nkUv0/N2f5KMVky9OZg6sRzwuhL8XgKXkhrWFuYkLwiTitrC63GzKD5uA0vW3WJB12G1
         lVbFQ95RJ0ntVlS7HRqnqsa603BOp5UqiGEzgdvr6SIT4jiDf++yu+Q5Ahc9De3Jkc94
         GO+nEgfEMzXbw7ZVdzJFqAQJHHj+mouOq/eo0T7RmjpSXOU/v2IACBRLspaJTO+t8nXh
         3meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446942; x=1795051742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=KuxqPtgmyNk9sQt19vk3mJRSHhno1YrrP/vgsxKL4l87sLZZbxZ3R9SbRalixH2SL2
         yrUV82zzD71mxf36HmZSEDgEC1bSAp9V96wRPRyMPM+bHXmsCPmhtcl/ehMLPtBGSZgm
         lI/+gwzWlGrGo+G70DG6EE1gc3pdnHysIuRqlkG7JqMsYbTgHzEn8205W6uvyaAzumm1
         nu9//3AZTU8eKg3FJHHjeiqaQBbDO7WpPpZ+VBd31S2Pwz5ZtjtqsSIoL/OKqe6L35C0
         ndRHqgMf08JnjEsPPjrLA6bmpQ9rw7JulL47p2JrXaAMPNmva26L/EoBAVMQ+c5eeJag
         g7UQ==
X-Gm-Message-State: APuU4Z8wgBk7VVyjx+xnFt/Fp7GASHE/gcKZUqBjBMcASEVTHvB2eNUx
	ZuS+l6eJ6L9Hmz6O51iN3+n2TcxoT2mdizDoRzHuW+kmLO/1YO6/soQwrUwoQVBE
X-Gm-Gg: AYBFou3DySXSMv86DfmjuehNNVjFZHmzT+EZQ4MiV3sTXp9F7nZuLkBSok/3oBR2BAd
	iMy0bdtlGWLc8Rrr3Cb0yNI+UT7Bo2Hp//eRs72sLzmXDnHvkh+be26+dNRa4CiKdV1aHz8Ics7
	y+GvpqbAKCGoVNdht774pXmapp1MoVbDaHHqSMhVUk8ovsZpnKNwDejmeKChdmsmVN6TEDu233q
	zYv9Hcb8A6rKuAnPHYsHVIdaqJn2YKeBWM7AkY/rJPpVGxuOKKvs4YVrRH3t61+6iZVYtKNY02E
	6xvjJzLE9iflWiq9JUGzQNV8fvr+ZlciGMCDQwHQmk5GuoL9Nth+Xbu/FBIfKlOInNMlZKJMI7n
	rPmdcTpp9OiSY/3N7GR0gfpMEWCzR7DfU7rN8504xushldQEdrDCNbXjFGJqBON0H4jRwDx9v4i
	ihOVg2mhZwYAPkyH8vj0ArtMhMx/KXe2GffXdz3ukxAvORnLtkrp4ZdBZSfEnpbgUPbvX6m3OgB
	OQ/WhtmfNA2UCXIEpEcJN11EO9JDIVPuV2eAY9WyHhxNBVVrkplK2/sBuiluM44ziRsSQ0k6Bsr
	AG6AE0V5b/qdOgYHf8eUrwY3xOVced1TWx12mr7xsICp5VPhnbtK0FCAYKhrKIVz1jGFn9zyOrk
	A6g27byG7QicNBcLosJH082KnLi1QmI0HJaGcen2Y3+eSSuwPq4Lgmb77mISZ1INXfaqdKYFtNs
	qySZKK8A4uPZ2TXlLYMx9l18OAYPXPkJX7hxjryjyTHlbNCmDImCqYLUUP9CB8lqQcZkh4cIuy8
	w==
X-Received: by 2002:a05:6808:6614:b0:4d6:90d3:e189 with SMTP id 5614622812f47-56b97e1f3f3mr3600497b6e.50.1794446942113;
        Wed, 11 Nov 2026 17:29:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:09 -0700
Subject: [PATCH v3 30/58] mtd: rawnand: pl35x: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-30-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172903_376207_320D51EA 
X-CRM114-Status: GOOD (  14.36  )
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
