Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E117C5474D
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2024 03:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uOQYwWd6Pm38/tvLPFldQnd2hgD/jQ0dlrYNXTiwrs=; b=ydqlsSqOAqDrzl
	d0n+oybY9WeG9Zt+whFiwoBWNuGHp8WwN/lILxvP6f/bqIpXkHvL8MzXt9ApKtvNyc53ExBLirmBk
	KYGpiMw78lggoEmOeuCCeW0tZ47MhWAlHPamCCYMEZ4nklJSwxeBFmE5X7iK+ycOIrsZDAexYiTV4
	sJ0SK7Q1ScUD+Dgy9dK0CycAOhtdNkRgWYUjy642uI2hSI3SkOZ0TRmYYPocerMJRtMZuIriCPfKM
	OyoMV+eht42Q+7cDfoX9dqYZ6cXVHLG+3CdpW0FlbcZlSlz3F0PkTN4RqXR5h76KVPHnYWD0Ue4w6
	sltAeHQvc7sQM1Q4Fz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVpT-00000000M5i-00om;
	Thu, 29 Aug 2024 03:28:11 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVov-00000000LlH-3ADZ
	for linux-mtd@lists.infradead.org;
	Thu, 29 Aug 2024 03:27:39 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5da6865312eso113461eaf.3
        for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2024 20:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724902057; x=1725506857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhmAom+LVcmv0Mivl3IQDZRfWyPiO2Vvp66v1pNhYJY=;
        b=fwfmuRUr6ajSUa6V0794lRLpc6GAz1OL1h4hHnoX5FxtcwuM4WhLM9IVfhcSDPmPLZ
         i2+++b21Xz5MHO3slQ38TCwhbCtnDKIDq2ZcK4DjHbVPUcec+0lPAXEZyHTQkj43t0yT
         jz+EPkQJKD2OddP6u5qRd0o6ZSPPI9iXPC78FKKaeZoHd07GjI3esljegW3DBPGdaQVf
         eyu+qq62kgr3QMCxniVbsc5wUPbXhasGeTubkexEWBaPf11SdeZv/2iYnpc6pmhr8EW4
         N2R54rmROVNBnTB96XozQDMiINTOg4g6knH3tmgPLNimEq7VMJlewQ6mfjrKDBHdwKj4
         rRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902057; x=1725506857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhmAom+LVcmv0Mivl3IQDZRfWyPiO2Vvp66v1pNhYJY=;
        b=cs/QfekTUL2epAVCReFUnSwJclcqQ1duFnrvruNfAs7Z1bT87FMkDrJyKnDoAUsoAU
         6mZb+OWQ/3oWtJggu0vahc6wbB2jzibY7puaNOvPVCCuu0aiTpjs0M1Y2dXVPkl6hZcd
         lFHu3XvAKHbQ8TbS0PHXYyFd8nOaKMcQVgblxqI3e5aaL6Wm0RNguYH7r3M2hlmOwzap
         mTWjA4CxNOVvDmZlFxkfl9M0srKRvNZqzWysdNTfrzh8zIx0TekvIL/IjpB45PJKRqhG
         ftFvXdnbM0f/yCAIVii8VYzT/M5oF/AhV1/3ua3cOT9bxEp0z6mcEjozIzJdslX5eH9Y
         VqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4h4CLD8xd1+Hv2vkAB2pnwBvRc/W7bBGm77sLEFLHNi8rEintXse4FzHzOWwWwbAUNniW9OMh3W8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpFdA79aIaCyExHYyu+qZmjZ5rOIcWdqQBqN51rzt2ElXo3luM
	GYll4yad5aP904EuR5uZuaNQuVdslLJ1hwxDpVjEH+gt3rdkWnut
X-Google-Smtp-Source: AGHT+IHIaBPww4NUweWCTqWg13olD2CoFRyn8srMULQxL28/S7iOsYX8yyzacHcoPFbRY9F8s4phJw==
X-Received: by 2002:a05:6870:f153:b0:229:f022:ef83 with SMTP id 586e51a60fabf-2779035fabdmr1840332fac.43.1724902056599;
        Wed, 28 Aug 2024 20:27:36 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569e34asm198107b3a.111.2024.08.28.20.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:27:36 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 4B9E78070F;
	Thu, 29 Aug 2024 11:36:12 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 2/2] mtd: spinand: macronix: Use the flag in Macronix driver
Date: Thu, 29 Aug 2024 11:25:17 +0800
Message-Id: <20240829032517.1517198-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829032517.1517198-1-linchengming884@gmail.com>
References: <20240829032517.1517198-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_202737_828240_52E46E53 
X-CRM114-Status: UNSURE (   9.45  )
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
 drivers/mtd/nand/spi/macronix.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f9e9c572854..f17cd4a6f4d0 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -118,7 +118,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_PP_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
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
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
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
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
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
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
