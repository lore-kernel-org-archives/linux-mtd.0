Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF98C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oN/20TU66I+SLwQqlp0AUQLS6rfI84qIgUNYHKWpvHI=; b=PwjNnV6aqoj3JY
	SbcjBYiWdDAp0QPKw5jRszT9Qne7ZXIY74CHo44c/OD3u0kFIMUzgOpOFVsCNmxMgl+OJ1YcWqbah
	+zWRSuauAd4LaTZ2gmgZ5sOfzsYxeHrnJePDk6rorqfP39upotR/JyrV0NNChiP5M6E9Y3HZfolTY
	EFdZDdAezamJ9oKF1O3dP64/BgXCcQ2H0citUpSNAjY6j3+AJICk1VFDvEEQIS2+ssdm20VwPuHgF
	iMGhacX1XKgI8dG6MdOUePUj+A3hTn3tRRRywzjJFE5+inz8fZe/1sVZiIOqTG9MW8yyGT+m0GsOP
	NUwRHmgBH3zj8BtBOBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXE7-00DYZo-2b;
	Tue, 19 Dec 2023 10:21:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXE3-00DYYa-1u
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 10:21:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3295986a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 19 Dec 2023 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702981281; x=1703586081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdqPO3X8gW00ZrzDgRfSz9UE24P3HhZOyfbosnIsEEE=;
        b=FZW5f5unsjIyi6NE2NnnoOUMhLk0HlFQZL9lOfKuQaVot2/y6UgNMowd7oCH9TffQd
         /zGOGyv5GygbdalSRMTeoG3fa+ibGhN74LsLESONYOJ1NZMY3rkvNE/gw3CrkjfamdN/
         +xcJqbazYnfRmuySQ0ub46crJRROHP8TAGq7gP8hhy6NBSEsj04mypBovzGdA8xvTEUG
         c3EDVwLLmimnr2Yd7RTwJGAHQRHAOj0MalqYs5rdauBOqiAOsnHR4x/P7lRPN3Dqbjep
         TtHoF/+guNFF3wW7mbJXAVKZNBPYIjVvz+hGS5C1vi9sh4CHgixz95qSNsDx+sWF2Zqf
         pqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702981281; x=1703586081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdqPO3X8gW00ZrzDgRfSz9UE24P3HhZOyfbosnIsEEE=;
        b=JGhwz10aZgMyW9gzONfuqeZWVhclYhLAxbPxKowSZzwhM4z949VRruFMJvZ/wbh/fo
         bX3LIuYlKzgDxccZHjmhLGvvucgD4PyAYE3MtWS/cqaUJF5yWLmHvPrNwsiaICt6ToXD
         wbvjNoTJW35uplJCz/j4ZBBz61C5UcMCZsanuHwyvxr3r0+kVU3LH2w3sN7lHglzJXFR
         0pn2I9/MJ9/I5svJKosToWkdX1hDoPJL5Te9nUGzkvvdRmdwq0tycrXs+wGx4Mcrk/FY
         Cd+JN3MKQfjlk6hqOvOAIfNiYPy/nyzK5uBhVXJgbZZbcDghkE0kIlf9jTYCpHW2Ohen
         ONlw==
X-Gm-Message-State: AOJu0YwOBd4OT9JPL9nZMjRo8zgBMkWxudJmW2X1aPzUqsEG3WNzm+2t
	NaZDxlWaZYWcpYboN/Aj7mw=
X-Google-Smtp-Source: AGHT+IFnNmVrdOl+8T2CT+KxajvkpAPA0dtX0NZs+frjVNbP+D3qK9/qcFycuKC+rwOTjZy4q8AWBw==
X-Received: by 2002:a05:6a20:da9a:b0:194:a4b2:6a33 with SMTP id iy26-20020a056a20da9a00b00194a4b26a33mr963896pzb.108.1702981281563;
        Tue, 19 Dec 2023 02:21:21 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id jc12-20020a17090325cc00b001d363e87759sm9925557plb.51.2023.12.19.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 02:21:21 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id E8DFB80609;
	Tue, 19 Dec 2023 18:25:33 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v3] mtd: spi-nor: sfdp: Get the 1-1-8 and 1-8-8 protocol from SFDP
Date: Tue, 19 Dec 2023 18:21:03 +0800
Message-Id: <20231219102103.92738-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_022123_630082_B9B1747E 
X-CRM114-Status: GOOD (  14.20  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

BFPT 17th DWORD contains the information about 1-1-8
and 1-8-8, parse BFPT 17 DWORD instruction to determine
whether flash support 1-1-8 and 1-8-8, and set its dummy
cycles accordingly.

Protocols 1-1-8 and 1-8-8 support are not determined by a
single bit, so that use 8 bits instruction to determine
whether the protocol support or not.

Macronix spi-nor flash didn't support 1-8-8 read feature,
this patch validated 1-1-8 feature only on Xilinx board
zynq-picozed.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
Changes in v3:
 - Modify title of patch
 - Parse 1-8-8 read as well
 - Modify the typo descriptions in commit log
---
 drivers/mtd/spi-nor/sfdp.c | 29 +++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h |  7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..3f1eba83a7d8 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	u32 dword;
 	u16 half;
 	u8 erase_mask;
+	u8 wait_states, mode_clocks, opcode;
 
 	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
 	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
@@ -631,6 +632,32 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 
+	/* Parse 1-1-8 read instruction */
+	opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
+	if (opcode) {
+		mode_clocks = FIELD_GET(BFPT_DWORD17_RD_1_1_8_MODE_CLOCKS,
+					bfpt.dwords[SFDP_DWORD(17)]);
+		wait_states = FIELD_GET(BFPT_DWORD17_RD_1_1_8_WAIT_STATES,
+					bfpt.dwords[SFDP_DWORD(17)]);
+		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
+		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
+					  mode_clocks, wait_states, opcode,
+					  SNOR_PROTO_1_1_8);
+	}
+
+	/* Parse 1-8-8 read instruction */
+	opcode = FIELD_GET(BFPT_DWORD17_RD_1_8_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
+	if (opcode) {
+		mode_clocks = FIELD_GET(BFPT_DWORD17_RD_1_8_8_MODE_CLOCKS,
+					bfpt.dwords[SFDP_DWORD(17)]);
+		wait_states = FIELD_GET(BFPT_DWORD17_RD_1_8_8_WAIT_STATES,
+					bfpt.dwords[SFDP_DWORD(17)]);
+		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
+		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_8_8],
+					  mode_clocks, wait_states, opcode,
+					  SNOR_PROTO_1_8_8);
+	}
+
 	/* 8D-8D-8D command extension. */
 	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
 	case BFPT_DWORD18_CMD_EXT_REP:
@@ -968,6 +995,8 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
 		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
 		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
+		{ SNOR_HWCAPS_READ_1_1_8,	BIT(20) },
+		{ SNOR_HWCAPS_READ_1_8_8,	BIT(21) },
 	};
 	static const struct sfdp_4bait programs[] = {
 		{ SNOR_HWCAPS_PP,		BIT(6) },
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6eb99e1cdd61..da0fe5aa9bb0 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -118,6 +118,13 @@ struct sfdp_bfpt {
 	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
 #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
 
+#define BFPT_DWORD17_RD_1_1_8_CMD		GENMASK(31, 24)
+#define BFPT_DWORD17_RD_1_1_8_MODE_CLOCKS	GENMASK(23, 21)
+#define BFPT_DWORD17_RD_1_1_8_WAIT_STATES	GENMASK(20, 16)
+#define BFPT_DWORD17_RD_1_8_8_CMD		GENMASK(15, 8)
+#define BFPT_DWORD17_RD_1_8_8_MODE_CLOCKS	GENMASK(7, 5)
+#define BFPT_DWORD17_RD_1_8_8_WAIT_STATES	GENMASK(4, 0)
+
 #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
 #define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
