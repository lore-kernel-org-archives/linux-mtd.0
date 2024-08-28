Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0103C5474A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 06:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBifaRKe+TLgl1iRGWkRIRBjLXItjmd2btOXVvAg4Ow=; b=tj95y0Rsfly6jS
	hmN8TfPUfbGzvKXdVskk9QDiw80Ck3h4h+tSMr6zbO1jMUqaD5v/ivI7GmhpLkTQBednh3zaKSKIB
	HLKV6PfVcqajP/rCPl+/DIW9fFwcm3CA9xLh7yEgu2DgGJZ5qzsW7h/v3c8bldlqz7O44VtV1WkOD
	+qiI1yLfEYJTup/4b28uEv2hVrlBo67fBij1+XOwsURbqszW3FbVlhk3nlB44TEPdZfmhObKWz8fb
	IEOtI6MsPbUXcYyNtTDDqxtsOFpQfHFhmzRkj2xXnwTte4NBtqm3DKQwnTKKiNAacJHsAM/A36G96
	qazDLNci9Md+hduD5fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjC5s-0000000E4oN-4ATD;
	Wed, 28 Aug 2024 06:23:48 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjC5p-0000000E4mm-3EMw
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 06:23:47 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-709485aca4bso4366762a34.1
        for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2024 23:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724826224; x=1725431024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUtCV19hfeNkRysHDxKfU4/8WiiEHGFbZ5MZIYZz3bQ=;
        b=ECngPf75QqbwVPpH+KN3EHTZMI3vbzYKtp7O2UOmxDqv2yn2UV/z9vu7U/IU/XqjA4
         sSQvLlfOrdwX9Oy04Huqn4q85YxJnojrOzBfo+SmR6uoM/rr2e/EmGI/RkR+Q13/07vl
         HPOrqOGrk19PnxVD2xoEZKc7dz1QtLcm8pvrtcTFBzHBO8Tsf2SIgKCInOebDnMBSuQ/
         3wHBJZkq9WLdGDZ2LjIJ2wO8ckaUnbpxP/3GdWpWPJmyWqGveGpG5L91UiCyQIrfbTxb
         dlVf9e8SiS+Nmw9FQjEtSln5LKATv7ALNmIdZ0oCay71oTpc5YBOa2YUj8i8JTeJ7qao
         XgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724826224; x=1725431024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUtCV19hfeNkRysHDxKfU4/8WiiEHGFbZ5MZIYZz3bQ=;
        b=ONd1CA56SnLUB67RZJBaG8O4iGOGoBPJSU2GV3wXDj7X0YFqWMqhAB3onbsd4S/yD2
         0UZ8HcYKLWAfGV3Uovg9lX/m8j6NzK7slHMqADQFWw87BM3E+zXTHOG8tKPSvFpHFFWY
         XmfdfLrt4sxwvKuxSMacp7oSzrNSV62enHH1V613liNHXyVLLjKQwhIy9i5Bm/LD1Qvm
         pHaUVMkOq3v9rENl/rVv2a+HTnBnpSG+Jr57RcsJWgq0id2lTjeLrpoCdzQL3Li3qRA0
         y7v8XPl94HPcOHAOBFvQSt4NycQM7yOHWtIjVUcDbC4orlBVh3VF3ktGRXng3b/T2Qgc
         AIbg==
X-Forwarded-Encrypted: i=1; AJvYcCWn0elCHN5eycAT/Rnx7SXBH5UNw0oULM9Z0WuYC39BCWk/4ciLWwhGgJBEuWSEbU5/M992LPfa854=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvZAScjJMlakRVCpTLgN5BbatfT4kXEplMlP6SiEybrU6foOMA
	48yidKpzcTs+q4xR+h536OCEnhCWzv07gJ7gcqaYdistB1OOe2uY
X-Google-Smtp-Source: AGHT+IHaJft7RjZWHta48qlmsJbiu0vmKQKrJgP0Wjf+7u373+g5aOn4c6YcgpDOHCC7lukSgsp9HQ==
X-Received: by 2002:a05:6870:1684:b0:268:880c:9de3 with SMTP id 586e51a60fabf-2777d19da70mr1011681fac.14.1724826224410;
        Tue, 27 Aug 2024 23:23:44 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acabac9sm8873089a12.28.2024.08.27.23.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:23:44 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id DBC1980414;
	Wed, 28 Aug 2024 14:32:21 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 1/1] mtd: spinand: Add flags for the Plane Select bit
Date: Wed, 28 Aug 2024 14:21:31 +0800
Message-Id: <20240828062131.1491580-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240828062131.1491580-1-linchengming884@gmail.com>
References: <20240828062131.1491580-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_232345_842999_A9D91CDA 
X-CRM114-Status: GOOD (  12.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add support for Macronix serial NAND flash with a two-plane structure.

Add the SPINAND_HAS_PP_PLANE_SELECT_BIT flag for serial NAND flash
that require inserting the Plane Select bit into the column address
during the write_to_cache operation.

Add the SPINAND_HAS_READ_PLANE_SELECT_BIT flag for serial NAND flash
that require inserting the Plane Select bit into the column address
during the read_from_cache operation.

Macronix serial NAND flash with a two-plane structure requires insertion
of the Plane Select bit into the column address during the write_to_cache
operation.

Additionally, for MX35{U,F}2G14AC and MX35LF2GE4AB, insertion of the
Plane Select bit into the column address is required during the
read_from_cache operation.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c     |  6 ++++++
 drivers/mtd/nand/spi/macronix.c | 17 ++++++++++-------
 include/linux/mtd/spinand.h     |  2 ++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..49f2d66c3a9c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -386,6 +386,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	else
 		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -460,6 +463,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	else
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_PP_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
 		if (ret < 0)
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f9e9c572854..a531cc8121ff 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -118,7 +118,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT |
+			 SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x26, 0x03),
@@ -156,7 +157,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
@@ -174,7 +175,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
@@ -213,7 +214,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT |
+			 SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD",
@@ -223,7 +225,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
@@ -253,7 +255,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT |
+			 SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD",
@@ -263,7 +266,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..cec451e7c71c 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -312,6 +312,8 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_PP_PLANE_SELECT_BIT		BIT(2)
+#define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
