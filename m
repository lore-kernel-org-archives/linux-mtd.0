Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50136C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 04:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxQIPPExSoiKJjxkmyi9yFhLxVHGm7bI7r9SW+frU9M=; b=iP/EaFhIUnbrfw
	rf4/FZMqOgx8SJce2WYP9UsnM+811Gn63Vyux13zx/CY8JOV1uypYfr18y3R728isoZCFQEJLDJ3P
	5FVtgCjktmKFrl61WvkSXCkPoaaXVv+Va43iKoqlyK8qsEiInQEJcbuoVdPBcDpp0SeDFho+P3GQ/
	ThjNm2oWItuNxX76WF8B1qUsnYbNktBCltHW0KZJlCfEkY99q3mKQN4jJE2B6gSNT8jII7rryXjI4
	MknSqqUF56yAtkDdnnBpwdS87PcuqOc96vQcmaTyuJ3o/qwaaVj4x7j9cr66/7iCYhHBBjN0Ie+/U
	AsDeR1pwfmjaajk7Hfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ehK-001W7z-Fb; Mon, 26 Dec 2022 04:02:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ehG-001W4i-0M
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 04:02:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id 4so9833183plj.3
        for <linux-mtd@lists.infradead.org>; Sun, 25 Dec 2022 20:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYghT8z6pQgfuU8EhHHCIZHlSw9Ue7DgM2NGwhO6S1k=;
        b=JEZRs6YEe5xQIYQV3qR4gEdYzxAlF3zlVmGvoawOnm2YBq3sbwaC0jpOOuQ3be14iq
         vZVVhQKP9/MmsKqIshv9l/lFSWPxzTJVIxvnCtlTTbM2n9f5dc8zSY7GbW1My0tPlxqv
         xUnK19GKM9u08luX+rC5OklKhyjlYmCOEUNVpdyWwsOSEau7Ft+41jUA9bUYi+sAjq5d
         WlKdBZ1PpSAkuFe+8k/3x16aAgucmGeytFChGj9aWi+/3ZGbQ76eIYJRstBGNqRPTHCY
         bQRY+rrBg34KtvNO+xrmomZtN4TAryOMdiIGisEXhOzzg5QiZG5MlNfaeeWbXfK19wc3
         zmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYghT8z6pQgfuU8EhHHCIZHlSw9Ue7DgM2NGwhO6S1k=;
        b=hIgl0Com6GQUp/GT/VLZX1JnKezWHCnzQDn9O+jKFwO+yKOBzoSUo5wy5lWXBY1yLn
         AcCGKh472HbxQ0I6DscBS1YGgGUhD9P1O2vhoWQF4xgw5JgXpTqXUx6kkcHRLte3RkGA
         pFr10XWFbbHbWHhXfte4GyQ5+0tvX7MItdW8qPW6AgOqs/7/t7LSHrKthcQz05YAWOWM
         r8mSf0KKOGz3990FwoJZSXKfj7mf9CE2RCr/6PvesK7sX9bRJQTN7UplZtXgMcIOUU22
         7MKjiwojycDig0wACcTpbfNEi5uWhR9O9wvGDiNNz32Oe//Bg3x0IGlNELdYpbfPwYYp
         sUAg==
X-Gm-Message-State: AFqh2kqs7/6tnGJly1lMGQGf0sX3Vfa5rzBENc77zkH/fjVqHgHVCljp
	bMqnPw5cqZ+Z87V6fAzTEiBYSNpusHk=
X-Google-Smtp-Source: AMrXdXshi102iOXV2ABgxCS0zkPmt9NPO1aQUN6yWdwzUNpVb2ZJKvUiX+TaHDDr2PTQntdfqjqobA==
X-Received: by 2002:a17:902:6b4b:b0:189:8790:73b1 with SMTP id g11-20020a1709026b4b00b00189879073b1mr27336565plt.65.1672027360997;
        Sun, 25 Dec 2022 20:02:40 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001708c4ebbaesm2641401plk.309.2022.12.25.20.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:02:40 -0800 (PST)
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
Subject: [PATCH v2 3/3] mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter tables
Date: Mon, 26 Dec 2022 13:02:00 +0900
Message-Id: <48cb008b40fdef4bf7f87e37029efaa2bfefa9ef.1672026365.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_200242_239265_D68A63D6 
X-CRM114-Status: GOOD (  12.71  )
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

Change 0-based indexing values of parameter tables to 1-based ones by
SFDP_DWORD() macro.

Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5c2ab868707b..3acc01c3a900 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1004,7 +1004,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 
 		discard_hwcaps |= read->hwcaps;
 		if ((params->hwcaps.mask & read->hwcaps) &&
-		    (dwords[0] & read->supported_bit))
+		    (dwords[SFDP_DWORD(1)] & read->supported_bit))
 			read_hwcaps |= read->hwcaps;
 	}
 
@@ -1023,7 +1023,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		 * authority for specifying Page Program support.
 		 */
 		discard_hwcaps |= program->hwcaps;
-		if (dwords[0] & program->supported_bit)
+		if (dwords[SFDP_DWORD(1)] & program->supported_bit)
 			pp_hwcaps |= program->hwcaps;
 	}
 
@@ -1035,7 +1035,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		const struct sfdp_4bait *erase = &erases[i];
 
-		if (dwords[0] & erase->supported_bit)
+		if (dwords[SFDP_DWORD(1)] & erase->supported_bit)
 			erase_mask |= BIT(i);
 	}
 
@@ -1086,7 +1086,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		if (erase_mask & BIT(i))
-			erase_type[i].opcode = (dwords[1] >>
+			erase_type[i].opcode = (dwords[SFDP_DWORD(2)] >>
 						erase_type[i].idx * 8) & 0xFF;
 		else
 			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
@@ -1145,15 +1145,15 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, profile1_header->length);
 
 	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
-	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
+	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[SFDP_DWORD(1)]);
 
 	 /* Set the Read Status Register dummy cycles and dummy address bytes. */
-	if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
+	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_DUMMY)
 		nor->params->rdsr_dummy = 8;
 	else
 		nor->params->rdsr_dummy = 4;
 
-	if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
+	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
 		nor->params->rdsr_addr_nbytes = 4;
 	else
 		nor->params->rdsr_addr_nbytes = 0;
@@ -1167,13 +1167,16 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	 * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
 	 * flashes set the correct value if needed in their fixup hooks.
 	 */
-	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
+	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[SFDP_DWORD(4)]);
 	if (!dummy)
-		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ,
+				  dwords[SFDP_DWORD(5)]);
 	if (!dummy)
-		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ,
+				  dwords[SFDP_DWORD(5)]);
 	if (!dummy)
-		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ,
+				  dwords[SFDP_DWORD(5)]);
 	if (!dummy)
 		dev_dbg(nor->dev,
 			"Can't find dummy cycles from Profile 1.0 table\n");
@@ -1228,7 +1231,8 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
-	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
+		      dwords[SFDP_DWORD(22)]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
