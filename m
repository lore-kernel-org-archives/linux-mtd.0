Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5031CC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2rm4KVk9y4sg2zNpEXWyhHdA+dO+6Ok1rd/anPzbAc=; b=F9EZYHe3Y7aA7C
	GkkkYjRD+T4aNxYNwnEpPbJm+JMr44LKGkf6hJPUH+9Ggg4IEetGK4pq25I5FwF7MuBs98mVTj4+/
	T3TUPwBYhp9b9JzuNQACEvv31K/A1DamSxdl6eNh9LSbLcF4uiDJS8anaWede+h3UAywUM6020nY5
	Iu4S7IKvGdlsCAQdThhLDzKFfmSgBhcdo2j/aueLOD6ghVWY4hvNC3dc/L4vZIfZtJu/XWAB+jcsI
	VrbDFGCUsKRnFZm+Z75QBg4NEOf0tdKq5TBAowXR60zXrkVE1PBVcL3wgwfNwTqe3OFI95x8jz+Vi
	9QM/ooVM0ku+GdSHS9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLXG-00E8ow-01;
	Wed, 13 Dec 2023 09:28:10 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLXC-00E8o6-25
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 09:28:08 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5913b73b53eso980795eaf.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702459685; x=1703064485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ud5Lm7eBSwaNvfehhx/JZXXqmmz8NLKbRLfi0ylo4g=;
        b=Xpzw8nSocr4GgglKvV5X8AkTcWdnelcfH30eXQw02BdSSyYX3DpJybEjiabJ6zy/kK
         CJK/LIKwPbjboUNjJCjUiMJ2xW7lacgdQu7NkzujagiemB1tX6X2zFp8eoEVfMdewjhI
         lb3dMbA8U+m+Z8gnzOjm4i6Z9XZvyYpxdcNcATpf5eNSJ+ljGDQkCgYYKHcgQ/Ouwjd2
         25nonvK7IV72SaFYRcmLfdJAKB/sLAVII0BXrTcXTwta/LdeCB3PUnkoJkpLbTSl+DoT
         AdejZP98dHaLeNsDKnnqgtMYynDHFgZLWfIwBQAT4tvugySULLEFQ86szgphZE+nxdKH
         H9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702459685; x=1703064485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ud5Lm7eBSwaNvfehhx/JZXXqmmz8NLKbRLfi0ylo4g=;
        b=GUhaVWq6VlcmywYCUUz2ZEUhx72JduloqaIxnrpshUnJ+cCsfMZ+kjhDgp9rYGa/UO
         8XjZPJIEvU4hccxnZ1ZmTMiiI6+3Zjsv4VDZjRgP5zhpZ8f5JrIpbCI2iI7wySNKhE1X
         6AMUEoBAEX7fFb/flxwER7SrVe4n24iJ0VU9LXWCepBR4gxm3O0k+LsePb/A3d1qjRGk
         RdeslxyZhIkhMqq+dX4TVaXmi95ITPeTRAnOa9ERuVqq89cP3m+oVqp0AJ4qcrAfU7j6
         ySQuQgYKvqkUkhj6wpgBXBcSrfhjSDCXCGeLrozfamF7NI1Cq9BlXO5szr4GI32XDPSe
         7HiQ==
X-Gm-Message-State: AOJu0YxiDGAkDrvkL1I7cf6IFWmRufGGJUpFtON7XObM1vScDfuWxL0U
	0R7thgEaxy0W6pyeW4g1er4=
X-Google-Smtp-Source: AGHT+IFRjKbSpVwbOLc7f7KoVOzFV65UV0G1xi+uyajE5pBvcwYI7AjSeIbPdLhH36blPjYgA+pDIQ==
X-Received: by 2002:a05:6358:4194:b0:170:ee27:bfa1 with SMTP id w20-20020a056358419400b00170ee27bfa1mr2997535rwc.5.1702459684941;
        Wed, 13 Dec 2023 01:28:04 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902b58a00b001d331bd4d4csm3265794pls.95.2023.12.13.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 01:28:04 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 4C95F80152;
	Wed, 13 Dec 2023 17:32:26 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
Date: Wed, 13 Dec 2023 17:27:53 +0800
Message-Id: <20231213092753.58933-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_012806_689543_21477947 
X-CRM114-Status: GOOD (  13.94  )
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
