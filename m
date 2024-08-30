Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776BCA0EFB
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nSa0xEcVSmqERkVV1PJPiTyyoOKeYiFW1cgCrcB+us=; b=cBDYszrOsp3TUg
	rI5MwN30XWX0Dzs1gruocEGQqohw4gsuw50Ax16Ed30SjoZou7VVY2hEJrkYN+iLQ/MQOwoJugBpJ
	FmPBw9Mh2u9QFvDQICUnyU5k5DyoJSXfO+m3YeAzbemitwzt+/Q//PjqYOZZWgig0+U0Tvpyt1U3T
	VdKUrldCQCu37dys5cU2lECv2zvkEWdzTcy7W3VTKrQlPp9wkifly2rIUsyAjQzBAjJZRhkgEoQNn
	22Ytlquf8C5U/T9fM6maBIx5eqLQL4OIbW/pL9dSTRRTohn7SI2zIniyikXtFOno7NPXUpL+4gaPl
	7Usy5zYN6OkZLWCNftkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyW3-00000005iHo-2esZ;
	Fri, 30 Aug 2024 10:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyVd-00000005i89-0Brz
	for linux-mtd@bombadil.infradead.org;
	Fri, 30 Aug 2024 10:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ujFttD3pwqoLnOaK61kxmmuY79VSw05G+mBIn6vQcDE=; b=OOoBv3PibVWbmucOzGpmkwqdyi
	Fri5ZUzLB3BbI4Qz+z0ZhyqQjjmVnHDJujgbvYAFWDYQlHMhW7Pmhxt8OYLYMy+Bc6gO8AuyADYhm
	/teGlAxrSZwwnaWNPt5Wi1YNN2SBC6tGgROXyRNUdm6MwWn95njy/Shtys93SDSs22KLEbRcNImB3
	rk616vfmI9HytPdAPfGEyHag4aebtvUCW4JLIissHXhxyPZhGiZAhHySrDqoSOwXhH8DoyGY8Dgst
	S9DhOjBFMMUwfA8eq+tuqay76qEFQAXiQXu3xSnzE1aHRATQkt5TwNJXXkn0uAOpcAR23pLOkifji
	u/4oymew==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyVZ-0000000Be8R-3jE2
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 10:05:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2023dd9b86aso13311405ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2024 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725012330; x=1725617130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujFttD3pwqoLnOaK61kxmmuY79VSw05G+mBIn6vQcDE=;
        b=M3BicN5xlriMHgnkF4xj5NmW4Ni8yKNvsOo7ObVf3lrNG1Kvfa7eHWkvcg6LXZCsDM
         3BqL2KKNPK4VXaFLUIWMuxhN8Sat8u7L9/aXTmqO4hH0Xkk1r3KgYoNcov7JIzK/mkVm
         B2c3Qkl0sm56wmqZXk+UJJalZsw5IJgcGfAM+F4Tm4hFM0LWF2BKJNA5fQ+o32FNBJBr
         uIlESsFme26UkNSIh1ulz0IPdR0jh8iTj+5JmN+HuWoS3OzEGX5lj8MNCFNEK1LGT7VJ
         L3Ow9Ny4KRkdeF2/bG7O32CCvuwqa+RLwEZ8GcKAkAY+wvJGuv3eFzpIyxG3zJy3UAzf
         Dh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725012330; x=1725617130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujFttD3pwqoLnOaK61kxmmuY79VSw05G+mBIn6vQcDE=;
        b=jhhlnzVqKaVK/O3+CG51aSecy/EDukkNFgmyQTIYZTo8rQTba/EyW5yP7ELjzR28Kd
         M7AWzrbVSJEt0QyF+805ZwPLxPnOjA3BhiJ9LS0CFWi0eEXh175Zr3QI1j2KoOcMYDnr
         g1TCvQzN/PPs90YZVVElC9+gzwT0QBmLrd54e3fiICQuEGuXOwy5g3cVraxpv0zn7C0l
         3C4WXKuFEWmp4I1o+YFNm42l+CMIH2prNeAob9DzEs0MwWL/VsKuZh5brDLe28zUzzgQ
         UFl9xiNzW7tyOcCJKSYKWX7kYAhixgg0/PAng1UcazFqHtOg2Se3fukKEBh9kcmUPsUY
         zKig==
X-Forwarded-Encrypted: i=1; AJvYcCUZiOpNkjgX4kiQYDrE5MOTYnnoevV7szpV8PxC2T0EGDFXPPKkDdMhG+cyrVAGX+p5RxMJ/zNx6bQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUUT42atwO8LmOtQGABkn1AXSSAgvzlHr08Gw44OckIA+Z9oZb
	l95GEBhwYMdlJfY5hneg3Of+E6GXE42r+yr4mI11X/SQjrbcflss
X-Google-Smtp-Source: AGHT+IHLBKlMUybqKBiC16M66/nmTmwdFS/I6Vt4aqj2C6ubd3+YM203iTJ4l88THZY/kpa8NjVnlg==
X-Received: by 2002:a17:902:f550:b0:201:f568:b8fd with SMTP id d9443c01a7336-2050c40de86mr65686325ad.42.1725012330414;
        Fri, 30 Aug 2024 03:05:30 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542376sm23934725ad.204.2024.08.30.03.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:05:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5BB2E802C7;
	Fri, 30 Aug 2024 18:14:04 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 2/2] mtd: spinand: macronix: Flag parts needing explicit plane select
Date: Fri, 30 Aug 2024 18:03:10 +0800
Message-Id: <20240830100310.1553675-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830100310.1553675-1-linchengming884@gmail.com>
References: <20240830100310.1553675-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_110534_162957_9A3DB782 
X-CRM114-Status: UNSURE (   7.83  )
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
