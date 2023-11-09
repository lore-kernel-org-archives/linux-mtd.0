Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3CAC4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ2P5I8oCMliAyHJYEmb1cnEvmExRntN2S1cy+BoqTU=; b=bnu+GuNzH+IxdC
	mouhnM0yc8fkBSWUU6Fs2+4T8C4bJoE43UpK7mzakKkfT5Tjd/0rZ7fEaPVId+rxzJaFfSJOKBHVp
	a5GDjUXIoaSDIot6wMLltT4uGGBY2zIteq4AB0TKlejoEjmHEXHocAEdUDT3b13SAutvmKaZZI4Y9
	SLz72kehLs6BHqvEusXUUt06o5ZF0cAu9W/c1Hf45hJBJcm1yaWHUCb1aJ3+Whxd8MjdQZd3eFLIU
	aKy12AWliZAMUwb0zksYosKLSjNO1z6uVX4HWCnGP9LWgjt44U7ATmW0VOWP+vDkR4qGOl2/HzBI5
	TgSYiFeJblwQqhgluCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AL-0063Zm-1x;
	Thu, 09 Nov 2023 11:25:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AH-0063Xf-2b
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:25:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so787870b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 03:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699529134; x=1700133934; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=il4/PY5BDyM7db87KIoCyHawc+72HGUS4y4nNXmHSKk=;
        b=giR+aPl5Ipr6zTkOSuBZEN3v3T9mWKBRj5iy0TPF/eQpFowBE/+z/OzA2E0j/zu95w
         FWtntduQNSFHQ1m4sOyLQ+zcsWx/Ax/nKq1kMzaVj7aOTxSk0/Rp6INakNUeZhreJm+l
         81/hdrbOswpoF2ql3fGBj7zBzqkCoDsxlvSP7s9wMhWDhc6ej8E3wT73FPyQp/bhqKW8
         SS6F0+8e2e0bSheHOec4VVv0cKlcYVddW+i3J86Xu/kgmTQ41A67Qvq9TLcBkQl4pFJn
         ovDDpAgnRDw9NlbeVB0lcJKIfYJikcAYyYHfedGFUj6z11PieY6BmzSLGrE50C83U+GK
         e2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529134; x=1700133934;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=il4/PY5BDyM7db87KIoCyHawc+72HGUS4y4nNXmHSKk=;
        b=dFRxR014P6JW68rwAWs3uzuq7zwOTwP/S1qkpoM3PkiMPqRx0tt5eevcLK30I5Za9g
         gfCsX6zKusi5bdaUQ47DLhTjKFWu81hC0wXkJXkVmhbWMxqdQiWziynFMRvr53EO4PSU
         urGGFtg9O9RfRNyBaRIOHDt6RwVFSBYuQGA61WzgrlVkzSKygT+kq83Xcx/69XF8uvAR
         pmZAu8kmybzNaquwcxKTcsQgQ0VBtkBdQNyRZx//kTiSXSR3i2MbgpIZEfrEfftvbiuS
         4Gx4JWflOTqGwcHWwp+3Rm4dInjykbp0kNirh8zUJeSxx3iGB/mNiz+lV2hJ9uy/g8Ar
         Fetw==
X-Gm-Message-State: AOJu0YxJCdLdy8/pXmEysTtYrdhKSO2N7fRjbKZPD07vqj4lVsKlP+74
	XrDFMoXtt928OAvD5JGaY6VwULXwYTM=
X-Google-Smtp-Source: AGHT+IH4KByi/3QO2YnGLvXN8gr/rdNKMxFQ0xrMvOGSIQte2LBEM0lvN7nNttxtNoaEZ6gJg+AJ6g==
X-Received: by 2002:a05:6a00:888:b0:6be:319:446b with SMTP id q8-20020a056a00088800b006be0319446bmr5396051pfj.21.1699529134342;
        Thu, 09 Nov 2023 03:25:34 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id y36-20020a056a00182400b0068790c41ca2sm10455953pfa.27.2023.11.09.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:25:34 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v3 5/5]  mtd: spinand: macronix: Add continuous read support for Macronix Flash
Date: Thu,  9 Nov 2023 19:25:00 +0800
Message-Id: <20231109112500.4966-6-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
References: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032537_843984_D77E0730 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add continuous read flag for those flash with continuous read
feature.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3dfc7e1e5241..69c9c9dfe672 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -127,7 +127,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF4GE4AD",
@@ -137,7 +137,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF1G24AD",
@@ -215,7 +215,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G14AC",
@@ -245,7 +245,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AC",
@@ -255,7 +255,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1G14AC",
@@ -285,7 +285,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1GE4AC",
@@ -295,7 +295,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
