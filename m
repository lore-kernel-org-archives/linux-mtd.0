Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F493CD3420
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 01:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nSa0xEcVSmqERkVV1PJPiTyyoOKeYiFW1cgCrcB+us=; b=McPEk1ztknJIrb
	lr7w73LBeaUbm7VxFuIUwr+okBZEDyTHoVD8VzCTQ2zkO0WSbTCQGltW3dtgSujidpVNSC+qiyp0n
	b4G6eCszd5w3gYVdkgz67+6r/5AzxCSSK0H3bbMMlxc6RRo64g/s8MpdkWc2Ow8p3GMm8DcnRch7+
	+/OcUq/6uC/i5CQUVLEDVVZmLIDpDhi3qwobqElTKCT086g0xwqfvgflBe3mrafxL6uIfzHspS+P4
	evcih2KVCVotka4rTyMBU1yFrF2m7lkIZ7qHdewDUVRZKl5b4mPx3x8NPNpgZp3pOrefNFTEmusWi
	KDnHw35ftEGIGsNOu1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIVN-0000000FxbP-0qMt;
	Tue, 03 Sep 2024 01:38:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIVJ-0000000FxZn-3uzW
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 01:38:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20551e2f1f8so19142935ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2024 18:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725327524; x=1725932324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujFttD3pwqoLnOaK61kxmmuY79VSw05G+mBIn6vQcDE=;
        b=XAaLfREXhdp0Ib77NQOP9zpetYJUMCSn5nzktlbET6J2N0/UOYnfwzor9mZIY+wigZ
         e0orV21BkYqXlCIAx6Pu1vknB04bm5LMk9/t8iZp2qj1pYYAGZbxj6ySLHb6dy8ime/E
         clMfjSY3cFW1kO6MgybU82g4gTuMr2jr/51nxTCmPKDJSz0+oLYA8koQ9BYXzQOtK3hP
         rJNDEeDi1gK1msTrVpluY3Q/jk6WyKQwa95c0IlZNdt5VW4nZfUeiqkCZaf6PuPxGluS
         ONq9DH0ZmG2dupiNS5nbMSli641DoxqFyRN331UoVsftGUcCgziJrFBAMPHm0JbPsjBY
         EXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725327524; x=1725932324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujFttD3pwqoLnOaK61kxmmuY79VSw05G+mBIn6vQcDE=;
        b=fEqIlJVf5tVfmBg2Yfu3w7eq1UucssLtigvdiKSWV/tgxepMqMYgJUEBDh0JbXIvU9
         G8YO+UeX9UChgfHORkLnEPPaLQU7sa887YW+X0T64I7AAfz1iEgaZhPFbuSxYUyhagnH
         gTuZWSpifAQ233BCqKyTTmybNLFqMgoUoPFEnMAV9tUrXvZ2f0C4lyHGajWnQ0ststQL
         /v2oIa5imAg1kiOwoFGPbVWhOZ68O7UTwMyP/VJWNe/7FH+nhohtq05sIkJuvW7w7Yo1
         R4TwBZcN5UdCPndurueG2eZ2g1xWjGQztgczj9RdlNmItkUW6q0A2B1uuDV7L8tkoDiE
         Udhg==
X-Forwarded-Encrypted: i=1; AJvYcCWaNXDpXJ14LPf4sh8CWRQbCA27/g7WrW+S1Fpe2ZPCo5oiHVa5/9EPZGjSuIq9H46UG80xHr57pxs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwcdD5HiRWVC5C3mXTsUQqWFIXnWL85G1ws2bsMrkA78zmOId
	AeO0QZ3cgNMN5Wh6SZq6PHtEd6lTPXuJ4ZZerL+c+6/er+xCmCvfYaYG1w==
X-Google-Smtp-Source: AGHT+IFtuSBup7LMg7m4f9UYikvtoExFDkt9GoIGABbjoibnui0xTXGl2XYwYOv7QjgeaRROpNVjnQ==
X-Received: by 2002:a17:902:dacb:b0:205:5136:b2fb with SMTP id d9443c01a7336-205841a4376mr46479795ad.23.1725327523827;
        Mon, 02 Sep 2024 18:38:43 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20555dd1520sm35107915ad.230.2024.09.02.18.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 18:38:43 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 9B1EC80484;
	Tue,  3 Sep 2024 09:47:11 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v6 2/2] mtd: spinand: macronix: Flag parts needing explicit plane select
Date: Tue,  3 Sep 2024 09:36:25 +0800
Message-Id: <20240903013625.1658825-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903013625.1658825-1-linchengming884@gmail.com>
References: <20240903013625.1658825-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_183846_000748_F8B3006D 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Macronix serial NAND flash with a two-plane structure requires
insertion of the Plane Select bit into the column address during
the write_to_cache operation.

Additionally, for MX35{U,F}2G14AC and MX35LF2GE4AB, insertion of
the Plane Select bit into the column address is required during
the read_from_cache operation.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f9e9c572854..9c93dfcb955d 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -118,7 +118,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x26, 0x03),
@@ -156,7 +158,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
@@ -174,7 +177,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
@@ -213,7 +217,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD",
@@ -223,7 +229,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
@@ -253,7 +260,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD",
@@ -263,7 +272,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
