Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E9EC31D97
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2024 02:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M++O/fOPxSY5JTAKQewfajz/dTwkUh/w5NKEjjZytPg=; b=D3i98x7GOwC+rL
	7hL2jabuCBd6IeffLEw6ySLJLSYPd54uAtu98cs9QknC5xHyBO0l24ysqs+NDTatjPJvVWhsvQph7
	Wq9k7tdxuI228ZjktYKen8kan6SIkxEUS+0K9aqTkKfels4HBy3D9Qyh3T5nkFmrLObIbeShP276Z
	o1xB1AIYTvxZZRQDLzGAXcQrT3Ja4BNL1ipfmmu5WbYnxulafRpP8rVOsPuy5cpKL/VWr/XP/XPWK
	3N0T5S5nMsQ+nxtKC7uYXXAQ2kZRowdzXoJV7DTF9cCnAe0OQiwg8OYhO0ac7aTAsFqPwE558uIrL
	Vd1Zvy/kdNApPDFh55DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCXG-0000000Bxhl-1Wx5;
	Thu, 04 Jul 2024 02:49:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCXD-0000000Bxgv-1WWB
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jul 2024 02:49:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fa244db0b2so844125ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 19:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720061362; x=1720666162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjSFML9rs+IxRWgBs2FkyZWebdMICFl2jZWZ0Nxu9Fg=;
        b=CRYctNty50ozT/Q1I/VphwlO+RDCjV5HzlLi28ZXOFn9ac5e2fpWMzTEAT+S2bHMgT
         6u8wYlkBYXGu5pQKv+0d3Ks6KAMWBw7TFhJPukt3BNvlFLOrsagFFx69QcN3YzfxQDZz
         Y6xJxxbS6DzSP5ToB+XegiOyjXfVHRZJPjlowmUZagqPo5gI7tJu4H0sfQy/olrsyUeM
         BVtO7RFMZVFYSFA/SSMFpwuCrfEmho5cxUYhqnDYR1bAjiFrP2PM0TgLBI/eCztDI6cT
         5Sq4RgUBEg8omdUCDzgUjRzFpxwu5mt93o4+ElKiD6n1hoEmmq4nuTUlo+8eEdOG3zT4
         PEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720061362; x=1720666162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjSFML9rs+IxRWgBs2FkyZWebdMICFl2jZWZ0Nxu9Fg=;
        b=XEAJxsbE7BpcWNJvLlnhCwrxVBtNBMJWu7h1s49vnYTxKi7SquColin43xep4pkvCp
         CpkVBAr8iCInQqix5A78MebLAqaeCYv0GQE3jgGsELfH2PgzNaWR771YjK++ntkxYaD/
         OPbQuvuNp3i57USVNeBk3O4Kd30stM0lIgIxlNxWQPzy5nYzm/i2BVFTOx7Dmnjko+Fi
         Q+PrqvYXj30OMXBapM6kG18XQH1H2nqvYNySZW+0JHhPj3smRceqHsCs2COoENZ9MiQP
         9PrfjMGF+Fv93Wql3dbaPByhTL7/JsrPxQp0rXT5LwUEaEdZ0lmIuUSPcLZp3YaO/xdb
         OKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjE+7RHm+oZwcX5RHXghufjEreedcKsurcfyCbTcwesfHmMW+Yrd08IM8egkCE7hgDnM+mHusd8pOasQE9ZxdFpVRp9xf2HHRQxvb2sg==
X-Gm-Message-State: AOJu0YwHjs9gxMt/SY5M5eC4xWIj7wUeJKFHFdZiIiVICCmfI4STCySd
	SNQ0Edpvh9Fcvg0c8OkHebpXyugGIorBZgmYoBOceZWdPbnyJAZ1
X-Google-Smtp-Source: AGHT+IFv4Y9TKBA26fPr2fOHqnUmaHNR6bdAIRogPsrOpKi0UUMA5iVD6eLa5O3cxAJyrIf9J29Etw==
X-Received: by 2002:a17:903:234d:b0:1f8:67e4:3977 with SMTP id d9443c01a7336-1fb33e8e704mr2942705ad.34.1720061362396;
        Wed, 03 Jul 2024 19:49:22 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb31c6e258sm3829155ad.295.2024.07.03.19.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 19:49:22 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 8B0B180639;
	Thu,  4 Jul 2024 10:51:27 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/2] mtd: spinand: macronix: Add support for reading Device ID 2
Date: Thu,  4 Jul 2024 10:48:38 +0800
Message-Id: <20240704024839.241101-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704024839.241101-1-linchengming884@gmail.com>
References: <20240704024839.241101-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_194923_430588_0553B35F 
X-CRM114-Status: GOOD (  10.16  )
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

Adding the Device ID 2 on Macronix serial NAND flash.

When the number of flashes increases, we need to utilize
Device ID 2 to distinguish between different flashes.

These flashes have been validated on Xilinx zynq-picozed
board which included Macronix SPI Host.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3dfc7e1e5241..aaf610f5d4a1 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -121,7 +121,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2GE4AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x26),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x26, 0x03),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -131,7 +131,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF4GE4AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x37),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x37, 0x03),
 		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -141,7 +141,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF1G24AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -150,7 +150,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2G24AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -159,7 +159,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF4G24AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -199,7 +199,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb5),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -209,7 +209,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4GE4AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -229,7 +229,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa4),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -239,7 +239,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -249,7 +249,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AC",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa2),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa2, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(4, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -269,7 +269,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1G24AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x94),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x94, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -279,7 +279,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1GE4AD",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
@@ -289,7 +289,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1GE4AC",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92),
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(4, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
