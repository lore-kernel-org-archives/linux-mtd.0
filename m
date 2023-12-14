Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7863C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2rm4KVk9y4sg2zNpEXWyhHdA+dO+6Ok1rd/anPzbAc=; b=lbjbHr+4Mw1PmF
	9AwVYSmA7xtBjiOknGbccyF2d44CaTwa42yUGenOvw5jpJ9TPg459byAKRu2me5vhZNEIO6lEA6gm
	LEiydYrmMP4EC3kgWEVLX2p3UpPsNMvgG/6XvBDr8wUkw8l/8f7DA+/M/quXKZtuN6n557YK5KfJF
	d5AaFmosxSf7a2yc3NDOPGuD41fyzT+S6A1xtp/8F2NoZVYspo2E423bXSb9PiPBQTwTmPdFFOcD6
	fpdSbKvVn60pTC7MINf88xpPTVwaMSZ1BB+TF70W5uzPan2rJpEZnczN9NqZU78EdmfAD6kqx6UWr
	lZfUgpwRPpjiMWcG4PUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgER-00H8G2-0l;
	Thu, 14 Dec 2023 07:34:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgEO-00H8Ep-0R
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 07:34:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d351cb8b82so7597495ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 23:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702539239; x=1703144039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ud5Lm7eBSwaNvfehhx/JZXXqmmz8NLKbRLfi0ylo4g=;
        b=XrKTnHdWVttOGAXK0BoNuR8oOaKhZSy52TLHRhkuNWv9bpMdZXWwipPOf/PhaXKv1c
         +m7AAfd1SoQB1SHynZPy33GFsYxc1HOrgJRAdeqNHm/hD38vZIt9RlJCdIrc8JdD5riK
         7BwfuBBtk/Qt64WLyvnNihT22vfnow69APGT96KOT25r9a5W07ulH4EhThLu3VhDu6Wh
         qjQhwwDFOgoB1UQ20/r3MLycNLL+85UEuEJfNjaAGNQngDIf4FK5YtK4BZ1sRk6tNxC4
         F2eish+hEB+26U7vQadGd0bnx9Hs4KkRYXRTX+u9OXwEsOCN+fibML0ezv7iAIFpvWb7
         /hDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702539239; x=1703144039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ud5Lm7eBSwaNvfehhx/JZXXqmmz8NLKbRLfi0ylo4g=;
        b=kVUnO61wtcSigwvxSPzThaYmr/qj0apCIfUuxnk4weeC4BekywObOBLqz9eQ0CByWy
         lUUwb6Cg+5Ix8vF46uLp79xXt6Gb6pcXkUqPcOZpTwNZVKWOnj/jwxrjGu1nRaa1bGHI
         GvSnBO1KV6gA6GPJyU8a1P/aRgMb63NRvWjyO4XH2NFnGOyJNoEynWviOwVVtbU9bY8J
         GP2u16CHiY3xDM/yFsU/4Frs3Jv3opm05nadYhQJKpuniBIKWQ/2BUZINT7s1CcLjsN6
         LXl6TYSuhkzrfbhypdvY5l3f6rWNZ0Jt981bRJSjRHjpbzW35KXpVRkFMFahWcj3UANz
         NIbQ==
X-Gm-Message-State: AOJu0YyAihjK4GeditR39uFMMbazmvZuJxA1ULd1qoxD3sXP6kkeEG+k
	S/eWkWUvgZoSOe6TBzwTou8=
X-Google-Smtp-Source: AGHT+IFs5hgGEKOHMcFd8UUqPcKvr9CGXv6/Ip7ZfdKhqrffjMeAkJOzhAOp9LeSiqAkIfSULQMRvw==
X-Received: by 2002:a17:902:d2cd:b0:1d0:80a7:2b45 with SMTP id n13-20020a170902d2cd00b001d080a72b45mr4903736plc.72.1702539239151;
        Wed, 13 Dec 2023 23:33:59 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id l16-20020a170902f69000b001cfba46e407sm11726105plg.129.2023.12.13.23.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 23:33:58 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 19DAE8053C;
	Thu, 14 Dec 2023 15:38:19 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
Date: Thu, 14 Dec 2023 15:33:44 +0800
Message-Id: <20231214073344.66644-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_233404_170005_62906632 
X-CRM114-Status: GOOD (  14.56  )
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

BFPT 17th DWORD contains the informations about 1-1-8,
Parse BFPT 17 DWORD instruction to determine
whether flash support 1-1-8, and set its dummy cycle
accordingly.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
 drivers/mtd/spi-nor/sfdp.h |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..c55f39978762 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	u32 dword;
 	u16 half;
 	u8 erase_mask;
+	u8 dummy, opcode;
 
 	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
 	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
@@ -525,7 +526,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
 		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
 		u32 erasesize;
-		u8 opcode;
 
 		half = bfpt.dwords[er->dword] >> er->shift;
 		erasesize = half & 0xff;
@@ -631,6 +631,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 
+	/* Parse 1-1-8 read instruction */
+	opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
+	if (opcode) {
+		dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, bfpt.dwords[SFDP_DWORD(17)]);
+		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
+		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
+					  0, dummy, opcode,
+					  SNOR_PROTO_1_1_8);
+	}
+
 	/* 8D-8D-8D command extension. */
 	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
 	case BFPT_DWORD18_CMD_EXT_REP:
@@ -968,6 +978,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
 		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
 		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
+		{ SNOR_HWCAPS_READ_1_1_8,	BIT(20) },
 	};
 	static const struct sfdp_4bait programs[] = {
 		{ SNOR_HWCAPS_PP,		BIT(6) },
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6eb99e1cdd61..584a05f9931d 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -118,6 +118,9 @@ struct sfdp_bfpt {
 	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
 #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
 
+#define BFPT_DWORD17_RD_1_1_8_CMD		GENMASK(31, 24)
+#define BFPT_DWORD17_RD_1_1_8_DUMMY		GENMASK(20, 16)
+
 #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
 #define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
