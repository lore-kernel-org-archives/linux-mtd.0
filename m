Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA72C4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vtXgJf9kdwM5pTE2SX1TCy8OvXlvCvcVk21j2wr9d+s=; b=cIZjkKUIbGb35b
	rKIZ4PuNppBU74vaJ4Qo/j4l7P7yPGhvL2aQB1lY7TXw/Hfo83o+SNjKnwXDam3Hgfp04io1HkhM/
	T5x74kLXK52fuC/kdMEIPzO7DXRI3igWuLFiX5SXFQIIdQV/lGsBIvcnWhvf2Dbik60BLImxqHh47
	DZ5dsYkm9f2cvjcJ62UStKPuhS7EtINsNUbrr0HPh60IY6Bq+3Ho7GFHTYfS2oPFOkK0O4WHdIAe/
	vf9584Xr1Kk4m34VoUOk0Nbyv0wJt4TLhdhBRY0DuHYUZuwza1JeHs2P8hQKVsAdFz/C8K2pmSKdR
	bShi06rJx7d91NpNYQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9AZ-00C7Q9-0z;
	Thu, 07 Dec 2023 07:51:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9AW-00C7Pm-2p
	for linux-mtd@lists.infradead.org;
	Thu, 07 Dec 2023 07:51:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28670a7ba84so544647a91.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2023 23:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701935492; x=1702540292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OVjDwxWFBrkvlq4NNAjnFXJSfmmhYuOKAausOl8zC4=;
        b=Dsz3TqmEV1VTHcN4N+KPbwiSXAxLNfSHXi2Kb1SJPyuoLxAVyzLUYIs91hHjeD8wMx
         9ognFEoXTZlGwnCzVE6vGO33cWFDjURgL9f1zu7DFw0UBhu30hkUscJMm37FELZQnBOv
         RPwm12gsKREWq9p4TqnvdNf/I5xLTjrrlDHE7hGeHCrbaPg4xuw+yx7jP4OD8MV7wCMl
         zTVT9VnV+dM75yMtSTLD0J2V8t+jsiZXys37/ipwkkB2agheCiUxe0ceZf0NM9Di7/e0
         D25P5q8w/79++Zt06RV9aATPmQaPLeUJIG9YurQI9Jr1/mR5u6T6G8Gwu/jjojys5TSW
         ecdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935492; x=1702540292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OVjDwxWFBrkvlq4NNAjnFXJSfmmhYuOKAausOl8zC4=;
        b=PKX6WjOWuuHN9f9vmIbrCXjKLFtpAOBBiRidO49RnOLWRUVsoJ2CO0ysY7PRd94YBf
         JBHhm7faJpqZVlScy2VdWv8rLCIRHjzS2oAegVeOOVdOMn3QeyLlpl4RjNblFZsLCeH+
         tAXp+dpHuIQD+tETwfB+eiD7kHWVO4vNAI42wyVJ7hGCD6kdn75rLCHtjPi8wI+XvHIC
         mRU4jtUV0Cv2OHzdQT7WCwePRzoEY2PqTEhoFq5jYYDfgcM75fsCWRomwkJ7QtqfqS1E
         OExd2Dyojv7+OQLgRFAd9S10kTVim0RruMQBOVkZDDB2lsu0tZj7NVRmCvjnKNNVW9Dz
         ZkUA==
X-Gm-Message-State: AOJu0Yw51tO1VWtjWSmAi7RBc4wAqTEk91zUl+IVeQxChesT3zUWzVkt
	ZbQ9EeP4vlxEXlwfcIb9A/43lA2DxZk=
X-Google-Smtp-Source: AGHT+IGW/hPP5sFacspJNaxoy5Uo5Z94B636Et1qbFweNuDO6seRxaOQ/c6iLgeXNU20LFiH2YIGlg==
X-Received: by 2002:a17:90a:2c0e:b0:286:bc9c:327a with SMTP id m14-20020a17090a2c0e00b00286bc9c327amr1571596pjd.28.1701935492398;
        Wed, 06 Dec 2023 23:51:32 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id f4-20020a17090aec8400b0028596286f5fsm660320pjy.6.2023.12.06.23.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:51:32 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 91FEC80423;
	Thu,  7 Dec 2023 15:56:01 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
Date: Thu,  7 Dec 2023 15:51:21 +0800
Message-Id: <20231207075121.21788-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_235136_940278_4630122F 
X-CRM114-Status: GOOD (  15.67  )
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
The difference from Dual and Quad mode is not determined
by a single bit indicating support but rather by using
1-byte instruction, which content is the opcode.
A value of 0x00 represents not support.
Therefore, parse BFPT 17 DWORD instruction to determine
whether flash support 1-1-8, and set its dummy cycle
accordingly.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 15 ++++++++++++++-
 drivers/mtd/spi-nor/sfdp.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..d04dbddb70d6 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	u32 dword;
 	u16 half;
 	u8 erase_mask;
+	u8 dummy, opcode;
 
 	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
 	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
@@ -516,6 +517,18 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
 	}
 
+	/* Make sure BFPT provide dwords more than 16 and parsing 1-1-8 information */
+	if (bfpt_header->length > BFPT_DWORD_MAX_JESD216B) {
+		opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
+		dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, bfpt.dwords[SFDP_DWORD(17)]);
+		if (opcode) {
+			nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
+			spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
+					  0, dummy, opcode,
+					  SNOR_PROTO_1_1_8);
+		}
+	}
+
 	/*
 	 * Sector Erase settings. Reinitialize the uniform erase map using the
 	 * Erase Types defined in the bfpt table.
@@ -525,7 +538,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
 		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
 		u32 erasesize;
-		u8 opcode;
 
 		half = bfpt.dwords[er->dword] >> er->shift;
 		erasesize = half & 0xff;
@@ -968,6 +980,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
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
