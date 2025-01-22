Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A56C02182
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2025 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP9XrC++psqZlV1ptj6Lc1pKHaMMSTBbkxyP+RUi8Kc=; b=fYHhwVRjvwcSmG
	G+lms64pwc4FH6LGRmSLv/3mE4zIrHswc4H3Qc91Iih68+hmUShZZhBDuYrNVq3/UNiyxbJCQPPpX
	QG83rZHD9jmqVsT7EoQ+t85PAKT82rP9sh1QJ5MC10nkxvBlmXQMeqvfT3Gguk2q+rZddnTHey5fs
	4ruMFeka2XSavF9+QePpZVkpzNjlY1Hep57XgWcKqgUEgnn6mmyM40PFGLb9RAUNNqV8Qu2yL9u2L
	FGQixpL6KcYOINBkv92LAI5mT2QvFljbiI1KM44oJSfJA2h2Z8gwVBlqYPxQ/TdiconZ8AVgSsbxA
	3zmOt/aVNIGUdu1gdpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUlt-00000009ZHY-3VPk;
	Wed, 22 Jan 2025 07:03:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUic-00000009YoE-3Gj3
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jan 2025 07:00:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644aca3a0so147026805ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2025 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737529205; x=1738134005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXrSsk/WJ+wpbAFAOo12xL0y3vgGX4Equ+yHr3ypru8=;
        b=B7xtaWi9jVdexAqkjwFhLS4Fn1dfQIWwCXc7jmc30RPGLawsbm4Ts/TKK4dVuaOyne
         FRPXF0ZKpmHQ3QdFsT2F3pTDDAY9uHWvPPGmg8rWFA3uDMvHp6za/u3L2LcyDNjJSDSc
         nOEGr8nxo5gbYgnosgrYXHguVHKZ2dlfhHH5m4RwUV7kSe5WAQZMM5UneQq6COvNs3MO
         NPFwLSFcNDcXvbn2PhzqLThRoFyYKAkOju5PoVhXXLu1IzfK/hpN4e514osKEP7dmq9H
         4/5fgW2XwIc273vUrAneF/x8p+df0h+6DNIfifku7589RGHLMVl/FHHwQqQRqaoYtynS
         Bn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529205; x=1738134005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXrSsk/WJ+wpbAFAOo12xL0y3vgGX4Equ+yHr3ypru8=;
        b=GS8CX40Wq7SSwnLAhp41okM9uKx22SmQUnxJn1/JGrUQFeDcPB6890kHeNrfOuwVse
         SCzQSC+oDcsPMFsZm0IcQQkLW5iroJQs7fEy4lkosso94AD/asYKbpc2nzAYcMqJ8rwk
         sZWn3dc1K+JQq3I7qw+LDOW7+mJ97MxuNOd/rQ0mpR9gGe2oVwPFQFf3LpK6dT5x35ov
         fsp6kiruuXgMGZwvXY30U5V1i3e8rYx1YK6bOXkCYDA2GvknIWbwXTwvs9bDwCwpB31i
         q28O0+LFIPEgQePL5ohwZMYwa0QkTNQrapWNFH8PckZOc42mnRqED1PPtltD4qcgkWCG
         Aywg==
X-Forwarded-Encrypted: i=1; AJvYcCXqTNXUMSgwEjLOnXclXL/w0bglfNOvl3pxTqGfoI+/A5/wyw6W8wo8UgHfsBYYVXQ8OEtkvcg8Gzo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp/RoiANrYvFhpGyagdsEluVnI1xAQdj2/FShgwQoNadWWLHeY
	SCMm8Y1m0FFLpXELQjAd7sEMln4LuXrwOHqkQSL4KBUMFcdPU417ibfDqA==
X-Gm-Gg: ASbGnctpZpcdbtLiZhP6ZpyAfIRO/+m3hhMadygi1Ll1ScUoA2Xw9ZNlqPaLPnXVDeK
	ehm/BMl8wDSgi4PA1Zkd0ERWCB+J9XN5CF2Rn4zbk0KCwh8V9HDkGwiutBPssRVmvGVVIr3toHE
	mYMfyBwrXGBfzEPgXQG7ifOKb3rHxwQ0UfoQEgt63UNs1qvHR2El0Kx8/20p6+2gFiHUMQ5l7H2
	X+m9fZGYtmhehm9ITsYYYtBcQJSDcHOfZ9ZACvFKLpfZZ8q5MV4FSyLjqx7dYxXH++8RL7iMtRa
	TSNL9PFj0K1wfEy9nw==
X-Google-Smtp-Source: AGHT+IEIrHwLB3WTLwayzB2OSmba1zFsJdfhmUlcPOEZ/FmvWHb0t+GKrLa1D2pO+bSxnO2O+XKG1g==
X-Received: by 2002:a05:6a00:4fd3:b0:72a:8461:d172 with SMTP id d2e1a72fcca58-72daf9becfamr32613466b3a.3.1737529204757;
        Tue, 21 Jan 2025 23:00:04 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8e95sm10464977b3a.106.2025.01.21.23.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:00:04 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 57D678094D;
	Wed, 22 Jan 2025 15:11:07 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 2/2] mtd: spi-nand: macronix: Add support for read retry
Date: Wed, 22 Jan 2025 14:56:05 +0800
Message-Id: <20250122065605.285145-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122065605.285145-1-linchengming884@gmail.com>
References: <20250122065605.285145-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_230006_827797_E56936F0 
X-CRM114-Status: GOOD (  11.80  )
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

Add read retry support.

The Special Read for Data Recovery operation is enabled by
Set Feature function.

There are 6 modes for the user to recover the lost data.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index d277c3220fdc..d7087bac8da7 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -14,6 +14,8 @@
 #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
 #define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
 #define MACRONIX_CFG_CONT_READ         BIT(2)
+#define MACRONIX_FEATURE_ADDR_READ_RETRY 0x70
+#define MACRONIX_NUM_READ_RETRY_MODES 6
 
 #define STATUS_ECC_HAS_BITFLIPS_THRESHOLD (3 << 4)
 
@@ -136,6 +138,23 @@ static int macronix_set_cont_read(struct spinand_device *spinand, bool enable)
 	return 0;
 }
 
+/**
+ * macronix_set_read_retry - Set the retry mode
+ * @spinand: SPI NAND device
+ * @retry_mode: Specify which retry mode to set
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int macronix_set_read_retry(struct spinand_device *spinand,
+					     unsigned int retry_mode)
+{
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(MACRONIX_FEATURE_ADDR_READ_RETRY,
+						      spinand->scratchbuf);
+
+	*spinand->scratchbuf = retry_mode;
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -168,7 +187,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)),
+		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x37, 0x03),
 		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
@@ -179,7 +200,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)),
+		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF1G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
@@ -188,7 +211,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -198,7 +223,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -207,7 +234,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -217,7 +246,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -226,7 +257,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -270,7 +303,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -280,7 +315,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -291,7 +328,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)),
+		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF2G14AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa0),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
@@ -314,7 +353,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -324,7 +365,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -335,7 +378,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)),
+		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF2GE4AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa2, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
@@ -366,7 +411,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     macronix_ecc_get_status)),
+				     macronix_ecc_get_status),
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF1GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
@@ -377,7 +424,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
-		     SPINAND_CONT_READ(macronix_set_cont_read)),
+		     SPINAND_CONT_READ(macronix_set_cont_read)
+		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
+					macronix_set_read_retry)),
 	SPINAND_INFO("MX35UF1GE4AC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92, 0x01),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
