Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158C7C4708D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 04:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnE4Y3qYKEZHnoLI5sjjvVFuEo9kn5eqGeQY3Frbmds=; b=uG9Wl0C5NmzlWD
	T5za0o1L+x+7O2uLRTWZUuuC1lj8Adoc+yus+VxFO7aZJorD+WfnEnOg/sRBdammkAAJvk3Ie1x55
	dORAF8bmVj9Nzay5M+P2AKOMf4z7zMkl2qRY1Qfqg/sNgcABef0UbihI+quJeVtavMfa+khH2FsWW
	BNdKqKU4307ejmAD8wkBBwjlHDQij9S1VXs+acCWvVXSv/Jn5efN40ZJd9qS6mxf5IPnnu8LbgtMv
	24EeaXsLCnAiQY6JX2gk8XiHE13nRwnjgRALIBEC8OJOKUqBMtA3AWZ2J9znSsbnK2bFrakFrCask
	57o0RTtccaY/BR6RG5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ehF-001W50-Vf; Mon, 26 Dec 2022 04:02:42 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ehC-001W3A-Ac
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 04:02:40 +0000
Received: by mail-pj1-x102c.google.com with SMTP id gt4so9759887pjb.1
        for <linux-mtd@lists.infradead.org>; Sun, 25 Dec 2022 20:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6Mn0dgrGJAx4c9UiWIYboREYbY/5JAEz+kfn3my168=;
        b=n+AmiCsDbieP0hmJ700JJ/ETWDcUtfIqUwR2oHlBHgIWYydEAzlY0DIrI+XZubfiOT
         teZvSDWn1g+ftmN8/yDACNxG3rpCC0SgW7kit55RaTnkGt/vgEQNiHgXwFuxE8HEDyAr
         NxvQsOQ9r8Ldev+3K09ldls9cNTG1Rhnw7qjC860bpqYhTs2dEJOsCwM8LZvB25huuq6
         tnXt31V8u0F9ZVlmiiFR4fUc9gSnZAQxLEM2u17IolS7JKOMONvwJsRwykqk1vP54/vk
         8nELJJtWHJJjI4PZ09uWn49wnFQ3olD3lfV3LZOzvCSoNtxC4BlKVwVMK2pIZ1FEB4PV
         XpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6Mn0dgrGJAx4c9UiWIYboREYbY/5JAEz+kfn3my168=;
        b=FihR9HKn4F128vusf2Fw9GfB9iY3OGF0/AjVa7CEAVWTT8Oft4XFMot1aZiEZf2fYE
         U9u+n4yy00MusKqrX1KCm+3rBOCyvJMmvOpG0DxuNxCdg5cNIouJtYWh4hmXlMCAOdpP
         6I/DOWUGMhqgY2wv+U6LiAakALQ2TIWPjFGR39UVE5pTMWytTEV0Zg8tGSN/at9eF70Q
         eDzozNXtZtUalqN91JzkFT7EhCjJ2qISaGP3gCUfNAERWCpnVOWlk2ZuFidqytBXg07E
         3yXrS3lrmWYG+SrzLPrrq4b/avlYukUwB7vILG/YjnJBLy0p1pgkuD6tCU4Ncnq03DnZ
         Mzmg==
X-Gm-Message-State: AFqh2kre5Py+LTZcEceCratr0nEFCyHyMrNuAJbOF8Rx6L7nLw7tfDeb
	b9KSox8T47wSwxAPkw6ffWDmpdxBRco=
X-Google-Smtp-Source: AMrXdXuJSwpdFtoLyvtvns60Rb00g8dmlOGnxYcW7ZB2DwDA4iVL5SttKaQVafKtaGNz4sZTSOcCZQ==
X-Received: by 2002:a17:902:f285:b0:189:d068:270 with SMTP id k5-20020a170902f28500b00189d0680270mr16703543plc.30.1672027357314;
        Sun, 25 Dec 2022 20:02:37 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001708c4ebbaesm2641401plk.309.2022.12.25.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:02:36 -0800 (PST)
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
Subject: [PATCH v2 2/3] mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
Date: Mon, 26 Dec 2022 13:01:59 +0900
Message-Id: <e42feac840fe3a31187419e91b2d514d9f259d15.1672026365.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_200238_480141_0ACFD132 
X-CRM114-Status: GOOD (  18.10  )
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

BFPT_DWORD() converts 1-based indexing to 0-based indexing for C arrays,
and is used in BFPT parse. Per JESD216F.02, the conversion is applicable
to other parameter tables than BFPT. This patch renames the macro to
SFDP_DWORD() so that we can use it for other parameter tables than BFPT.

Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
