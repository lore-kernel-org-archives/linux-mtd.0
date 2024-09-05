Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B20CD4F54
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUGQqvLCsBMKGVTgcL5vhOI/ZBYt94QDKVrj3/af77E=; b=WyvCIsI2EnH9N0
	mu8gDsFaM5uND9FlGW1aukDKVzQKe/4NQFapR0EitJ0bnklGPzVDenwtoDcwgRAR1CFBKaZhFPNGP
	1NyuzmpdeiWVR2CFGrioI/K2K5jN7f4JINTwdgBNoLTqxuvbtGFbylkfUhXFbg4/Z4B8gzBaIjw73
	dnm+4j6U5gaJz46xtxg0/El6tAvBn3Og6gjX9+pTonPrqo9CDLafR1IIJK660AQ9spxxDqTvBzeY9
	snaTfb+EbYrdgWIkjpCSyzcqyYSSR4IwK32ehtjpYqjFXIu6J+B/LiCMUZqihDGUz8JpNJprRiVn3
	NJCmklpOAEUfYZFMmsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5TC-0000000763r-3wTr;
	Thu, 05 Sep 2024 05:55:50 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5T8-0000000761y-3OUp
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 05:55:48 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5df9a9f7fe2so267211eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2024 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725515745; x=1726120545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH6YLbkS9yYOura/T7tK4lXbNY0uW3EvYxuH2OQdie8=;
        b=NvK1Q7dYB0E7NcpZGtn6BDeAQqbR2piOn1M2mNOSPGJHa4WQzjNFXOKlpKq29xfz5i
         QeF41Tidj5VVdMUJ+ZLibiPHGWn9/N6pe5E9uMIaRCoAiCGNNZ6bos+aU8Y/HKCOAtz6
         7oCMRiQWvdJR8793N9AoGQeH0jC2mRohDf0hfHxOGOpSwREQStxIZOCdhRbLxcKlmzt/
         6lHczf1ZsM80ejXwozJ4RkhL05McOCy06o9py/pWtzX74ygJK0qgskYmeVRpc/A6RAm9
         iATQsA9rfQQDdOTmy6tp3+IEO53axC4c45tnV9OQ9gqh2MwPPN7G2hSNXL+L+yOYIE3l
         b+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725515745; x=1726120545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH6YLbkS9yYOura/T7tK4lXbNY0uW3EvYxuH2OQdie8=;
        b=XLFr0UCdn0xOIbrQy+hS8At9cPl3l2+5wVXPFpCVmhKd0bzcpeZCLmaloiMmlY5n49
         GzWwG9l/r8BDB05WCalPp8z+q3VY2U/Q29j/EDiiiJCGkTnlAL0NXgSL4XmFFf+JpQLu
         xF02wDwnob8Vuglyr6YTZKjgCmTy7ia7BrIJGcGZE1HQdr9B7RRVjg3OmgVxrQm4xtPx
         mKsX1+ZXAg7kpzpdb8tWUk9INMgVJ53NKgBW39551R1EEHlgPgntTrO9xLVo9iiXzdUE
         9rlCm+8sHW3LqqHTbAt7SESH1q8rFZc7v5Xmblv4sDoi3xrKzJ8Q7nSMpLGOSx+gvRPT
         OIrA==
X-Forwarded-Encrypted: i=1; AJvYcCUL9ZU1fHdxKhZL9Bwcg7VFNhF7cDoUXZZFisJZKaWpz0+ycXu972l+WdpphytMrjSlAz/S16wqQRY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOhdJKyF23ClenQXBHCSc0iBSo3XgVCLhHki9wFhGtzDIS0h7R
	NQruEpHfWWievKK+xnw7sYtDUorYqlnza8uz2WeKfxTpop3tkz7E
X-Google-Smtp-Source: AGHT+IHPNsq3i9MCEnlzMdi1Q56a2E5K6Aect9b4PFcZ6Bm1W37DmOaRxJkgaJT0SFQkRn2xSq+qow==
X-Received: by 2002:a05:6359:284:b0:1b8:1131:d116 with SMTP id e5c5f4694b2df-1b81131d349mr885094455d.21.1725515745468;
        Wed, 04 Sep 2024 22:55:45 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177858922fsm2487508b3a.104.2024.09.04.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:55:44 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 32016801EE;
	Thu,  5 Sep 2024 14:04:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 1/2] mtd: spi-nand: Add fixups for read retry
Date: Thu,  5 Sep 2024 13:53:32 +0800
Message-Id: <20240905055333.2363358-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905055333.2363358-1-linchengming884@gmail.com>
References: <20240905055333.2363358-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_225546_886080_CE7F0731 
X-CRM114-Status: GOOD (  15.42  )
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

Add fixups for support read retry:
- Initialize the NAND device maximum retry mode.
- Set feature on Special Read for Data Recovery register.

The Special Read for Data Recovery operation is enabled by Set Feature
function.

There are 5 modes for the user to recover the lost data.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     | 17 +++++++
 2 files changed, 81 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f9e9c572854..baca67ff1cd6 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -9,6 +9,8 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+#define MACRONIX_NUM_READ_RETRY_MODES 6
+#define MACRONIX_FEATURE_ADDR_READ_RETRY 0x70
 #define SPINAND_MFR_MACRONIX		0xC2
 #define MACRONIX_ECCSR_MASK		0x0F
 
@@ -100,6 +102,38 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+/**
+ * macronix_spinand_init_read_retry - Initialize read_retries
+ * @spinand: SPI NAND device
+ *
+ * Return: the number of read retry modes
+ */
+static int macronix_spinand_init_read_retry(struct spinand_device *spinand)
+{
+	return MACRONIX_NUM_READ_RETRY_MODES;
+}
+
+/**
+ * macronix_spinand_setup_read_retry - Set the retry mode
+ * @spinand: SPI NAND device
+ * @retry_mode: Specify which retry mode to set
+ *
+ * Return: 0 on success, -error otherwise
+ */
+static int macronix_spinand_setup_read_retry(struct spinand_device *spinand, u8 retry_mode)
+{
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(MACRONIX_FEATURE_ADDR_READ_RETRY,
+						      spinand->scratchbuf);
+
+	*spinand->scratchbuf = retry_mode;
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
+static const struct spi_nand_fixups read_retry_fixups = {
+	.init_read_retry = macronix_spinand_init_read_retry,
+	.setup_read_retry = macronix_spinand_setup_read_retry,
+};
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -129,7 +163,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35LF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x37, 0x03),
 		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
@@ -139,7 +174,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35LF1G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
@@ -148,7 +184,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35LF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -157,7 +194,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -166,7 +204,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -175,7 +214,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -184,7 +224,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -225,7 +266,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -235,7 +277,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -245,7 +288,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF2G14AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa0),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
@@ -265,7 +309,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -275,7 +320,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -285,7 +331,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF2GE4AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa2, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
@@ -315,7 +362,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF1GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
@@ -325,7 +373,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+		     SPINAND_FIXUPS(&read_retry_fixups)),
 	SPINAND_INFO("MX35UF1GE4AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..e567d00a2805 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -354,6 +354,7 @@ struct spinand_info {
 	} op_variants;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
+	const struct spi_nand_fixups *fixups;
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -379,6 +380,9 @@ struct spinand_info {
 #define SPINAND_SELECT_TARGET(__func)					\
 	.select_target = __func,
 
+#define SPINAND_FIXUPS(__func)					\
+	.fixups = __func,
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -398,6 +402,16 @@ struct spinand_dirmap {
 	struct spi_mem_dirmap_desc *rdesc_ecc;
 };
 
+/**
+ * struct spi_nand_fixups - SPI NAND fixup hooks
+ * @init_read_retry: initialize spinand->read_retries
+ * @setup_read_retry: set the retry mode
+ */
+struct spi_nand_fixups {
+	int (*init_read_retry)(struct spinand_device *spinand);
+	int (*setup_read_retry)(struct spinand_device *spinand, u8 retry_mode);
+};
+
 /**
  * struct spinand_device - SPI NAND device instance
  * @base: NAND device instance
@@ -423,6 +437,7 @@ struct spinand_dirmap {
  *		the stack
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
+ * @read_retries: the number of read retry modes supported
  */
 struct spinand_device {
 	struct nand_device base;
@@ -449,8 +464,10 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	const struct spinand_info *info;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
+	int read_retries;
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
