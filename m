Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB58C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AD2wjPmfbv6Bsl1jDADq5IK6KikxFOV/U718wXfhAxk=; b=JpFg+XMplFhnml
	WIsK8sxHRs77Clt16JtvjvvmWAO3Nhi5IxXzy9flfVv5T8ZpNYzIfX46yzyTbX01oNwHawnOxFKD+
	BxFWTMEw35cHCPqwcq6PH/qlbvsL0mbMtRE40EXMZO1egMQHC5p/oQ6Uc2POy4uRPuu1AZrkWyHeY
	04Xdxt3xSCEo3wBKAwLGbzHA+8iVlSX/ph4W9j/EIHAqpBUUq1RMwDZqYMLyRkIc3mgKnrxahvdET
	JOrP63VjsVXH9lWj9Bj484IUOyRl7jjSSsWwiap/+DFO8ov7oRvkyCq3AeImSNQT9om1iyVQmdFEH
	bK/IW9frYRfA6m8nA+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNz-004jda-1n; Fri, 23 Dec 2022 07:22:31 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNi-004jVo-Nb
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:22:17 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 7so2833664pga.1
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GxgAoT7fl3W67WfBWzyQSHZ3BUavBtxbLnNX6lhFqA=;
        b=kG25j3X97qVdNHK85BZTaZJtPhtcaAKLM5loiPaV8imPbEA1Jj9V00XSf87B8CCgB1
         PcaixtYhqumPim65hqiTahQdfDdrks4KTfxxDdITlhVBppJllTgp7c+GusAS6iOZsK+b
         MIL6bKkJ6wqQKtQ7fItvUaLc0Kf3DlEOFhCYxEJfR6ugkXo1pLTq6N1rQ+xJGg4kKpHM
         RmOTeURUGLLS8lKSddKe5gf2pGoTg4VUlI1lRrf+c2a98TgzT0IoehuOboF2dgNi4o2I
         owzXGugF0oxf24wGV+2ix4bbhg1Qx3XWN5YE6U2WHrwpVMGlXQVT+AFWJNjOyl7KX7Fm
         cXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GxgAoT7fl3W67WfBWzyQSHZ3BUavBtxbLnNX6lhFqA=;
        b=q1cYSvPILPVPuB1kdIo76rXTmJIsp+GNDhvcZdu5BhSz463DLcHl1RV3PVWOTmukCR
         eij9ff7ZAAp/T1oeaKoIEQdFjia+c1fj0B8bUFfR9WcSFxht7MOA1uBiaLCcrNp+VPbk
         4TGbR2simfgv4nGkLcmUzgTYVLPt6DnWzq3FBa94OYtOsJd061NiWluOOYPDVFH/Wr2d
         TO38cWrYqfR/5ekCgWIGcShy7WE25cYf5q70E7pgiNRbE13GYys26DBkvirVzX8j543K
         ookTrIn1uZRGPSo44z+bisEpjsx2caUBkF19UpjRakNwcJ6odDDqPS9HMZLt9vwt46Ej
         HWww==
X-Gm-Message-State: AFqh2kpsFDOB2QB0JOrK+Fa5H3YrK4lC62ENmfWaR2hRZyVfBdJG0LcF
	p1xZ7cCI7dYTHDICMarg9sctELLHgkU=
X-Google-Smtp-Source: AMrXdXvHyUmsUydVRghKEohYgw9gqarbKvMGcx4V3zCGD1/ZFJ+kYbWXpF6bj9b2Ck6CcDpYlgRwJw==
X-Received: by 2002:aa7:8556:0:b0:578:e56:f57b with SMTP id y22-20020aa78556000000b005780e56f57bmr8385160pfn.28.1671780134029;
        Thu, 22 Dec 2022 23:22:14 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a24-20020aa795b8000000b00576ce9ed31csm1848146pfk.56.2022.12.22.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 23:22:13 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 2/3] mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
Date: Fri, 23 Dec 2022 16:21:40 +0900
Message-Id: <dedcb32567c6cc7a6d05e3f0f7d0155f20afd422.1671684805.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_232214_917903_6DDE2114 
X-CRM114-Status: GOOD (  16.64  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

To use this macro for other parameter tables than BFPT.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/issi.c     |  2 +-
 drivers/mtd/spi-nor/macronix.c |  2 +-
 drivers/mtd/spi-nor/sfdp.c     | 44 +++++++++++++++++-----------------
 drivers/mtd/spi-nor/sfdp.h     |  9 ++++---
 4 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index a0ddad2afffc..400e2b42f45a 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -18,7 +18,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
 	 * Overwrite the number of address bytes advertised by the BFPT.
 	 */
-	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+	if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
 		nor->params->addr_nbytes = 4;
 
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..6853ec9ae65d 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -22,7 +22,7 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	 * seems that the F version advertises support for Fast Read 4-4-4 in
 	 * its BFPT table.
 	 */
-	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
+	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5df2fcba5483..5c2ab868707b 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -242,64 +242,64 @@ static const struct sfdp_bfpt_read sfdp_bfpt_reads[] = {
 	/* Fast Read 1-1-2 */
 	{
 		SNOR_HWCAPS_READ_1_1_2,
-		BFPT_DWORD(1), BIT(16),	/* Supported bit */
-		BFPT_DWORD(4), 0,	/* Settings */
+		SFDP_DWORD(1), BIT(16),	/* Supported bit */
+		SFDP_DWORD(4), 0,	/* Settings */
 		SNOR_PROTO_1_1_2,
 	},
 
 	/* Fast Read 1-2-2 */
 	{
 		SNOR_HWCAPS_READ_1_2_2,
-		BFPT_DWORD(1), BIT(20),	/* Supported bit */
-		BFPT_DWORD(4), 16,	/* Settings */
+		SFDP_DWORD(1), BIT(20),	/* Supported bit */
+		SFDP_DWORD(4), 16,	/* Settings */
 		SNOR_PROTO_1_2_2,
 	},
 
 	/* Fast Read 2-2-2 */
 	{
 		SNOR_HWCAPS_READ_2_2_2,
-		BFPT_DWORD(5),  BIT(0),	/* Supported bit */
-		BFPT_DWORD(6), 16,	/* Settings */
+		SFDP_DWORD(5),  BIT(0),	/* Supported bit */
+		SFDP_DWORD(6), 16,	/* Settings */
 		SNOR_PROTO_2_2_2,
 	},
 
 	/* Fast Read 1-1-4 */
 	{
 		SNOR_HWCAPS_READ_1_1_4,
-		BFPT_DWORD(1), BIT(22),	/* Supported bit */
-		BFPT_DWORD(3), 16,	/* Settings */
+		SFDP_DWORD(1), BIT(22),	/* Supported bit */
+		SFDP_DWORD(3), 16,	/* Settings */
 		SNOR_PROTO_1_1_4,
 	},
 
 	/* Fast Read 1-4-4 */
 	{
 		SNOR_HWCAPS_READ_1_4_4,
-		BFPT_DWORD(1), BIT(21),	/* Supported bit */
-		BFPT_DWORD(3), 0,	/* Settings */
+		SFDP_DWORD(1), BIT(21),	/* Supported bit */
+		SFDP_DWORD(3), 0,	/* Settings */
 		SNOR_PROTO_1_4_4,
 	},
 
 	/* Fast Read 4-4-4 */
 	{
 		SNOR_HWCAPS_READ_4_4_4,
-		BFPT_DWORD(5), BIT(4),	/* Supported bit */
-		BFPT_DWORD(7), 16,	/* Settings */
+		SFDP_DWORD(5), BIT(4),	/* Supported bit */
+		SFDP_DWORD(7), 16,	/* Settings */
 		SNOR_PROTO_4_4_4,
 	},
 };
 
 static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
 	/* Erase Type 1 in DWORD8 bits[15:0] */
-	{BFPT_DWORD(8), 0},
+	{SFDP_DWORD(8), 0},
 
 	/* Erase Type 2 in DWORD8 bits[31:16] */
-	{BFPT_DWORD(8), 16},
+	{SFDP_DWORD(8), 16},
 
 	/* Erase Type 3 in DWORD9 bits[15:0] */
-	{BFPT_DWORD(9), 0},
+	{SFDP_DWORD(9), 0},
 
 	/* Erase Type 4 in DWORD9 bits[31:16] */
-	{BFPT_DWORD(9), 16},
+	{SFDP_DWORD(9), 16},
 };
 
 /**
@@ -458,7 +458,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	le32_to_cpu_array(bfpt.dwords, BFPT_DWORD_MAX);
 
 	/* Number of address bytes. */
-	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
+	switch (bfpt.dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
 	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
 		params->addr_nbytes = 3;
@@ -475,7 +475,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	}
 
 	/* Flash Memory Density (in bits). */
-	val = bfpt.dwords[BFPT_DWORD(2)];
+	val = bfpt.dwords[SFDP_DWORD(2)];
 	if (val & BIT(31)) {
 		val &= ~BIT(31);
 
@@ -555,13 +555,13 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 
 	/* Page size: this field specifies 'N' so the page size = 2^N bytes. */
-	val = bfpt.dwords[BFPT_DWORD(11)];
+	val = bfpt.dwords[SFDP_DWORD(11)];
 	val &= BFPT_DWORD11_PAGE_SIZE_MASK;
 	val >>= BFPT_DWORD11_PAGE_SIZE_SHIFT;
 	params->page_size = 1U << val;
 
 	/* Quad Enable Requirements. */
-	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
+	switch (bfpt.dwords[SFDP_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
 	case BFPT_DWORD15_QER_NONE:
 		params->quad_enable = NULL;
 		break;
@@ -608,7 +608,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	}
 
 	/* Soft Reset support. */
-	if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
+	if (bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
 		nor->flags |= SNOR_F_SOFT_RESET;
 
 	/* Stop here if not JESD216 rev C or later. */
@@ -616,7 +616,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 
 	/* 8D-8D-8D command extension. */
-	switch (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
+	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
 	case BFPT_DWORD18_CMD_EXT_REP:
 		nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
 		break;
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index c1969f0a2f46..500659b35655 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -13,13 +13,12 @@
 #define SFDP_JESD216A_MINOR	5
 #define SFDP_JESD216B_MINOR	6
 
+/* SFDP DWORDS are indexed from 1 but C arrays are indexed from 0. */
+#define SFDP_DWORD(i)		((i) - 1)
+
 /* Basic Flash Parameter Table */
 
-/*
- * JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs.
- * They are indexed from 1 but C arrays are indexed from 0.
- */
-#define BFPT_DWORD(i)		((i) - 1)
+/* JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs. */
 #define BFPT_DWORD_MAX		20
 
 struct sfdp_bfpt {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
