Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F8C7618D
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Mar 2023 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIERh3qy9Up+N+eJzBP2bzC4M0Xipvve1ToQD6NxtLw=; b=HcC/BGJ0p3RbWf
	BBEXn3DkBZKb8LQGEvEENWbyB9paRYDYbkAWQg/cAU4Bpl6HnsGCbOrgk8Bmus1CxtVjMKBKdMYOh
	9eonol0y08JRyurcl09tMvrEW8AqhstKJIn9BYrkFy34L6rV+hLtk7iQ9cRpFZUvj8mNPXB2CfLAd
	rld8AZV+WYlwhb+ptQ0oa2jcQ/umYTTb4WN53XMzzqutKbCw7VUj/WeF2GqYytau7L9TDzfTeSVnH
	2Z74q+z0H+uvc7Lg6HibT94tSIaptglzjsB+dd/QcYfUtIkdPai1wXyVpqICU6cc6FAahUDbDjMAk
	ricgcseLOjqUC3qsQoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKjF-00CXkx-1a;
	Wed, 15 Mar 2023 06:35:17 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKjB-00CXjk-3B
	for linux-mtd@lists.infradead.org;
	Wed, 15 Mar 2023 06:35:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id d13so7702569pjh.0
        for <linux-mtd@lists.infradead.org>; Tue, 14 Mar 2023 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678862112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMSwSbJsTS4y6fz9hKjPpbpHEWXtJ/JwdzVt0jfJQ20=;
        b=T08cVCxfPRIOpVY/yOxAFJWHY4j2fVPy+4oH1u/fjCfzzpJAEicLiX3lO/0ma7qev5
         omDNHIQA6oxAN+shMa59wEdJ3ycukIEFy5krQ9c3jlDNXoTaVWvytjYZeH8Q6CQESCZJ
         W1f6ObN+FO2aDRImpDPCFua8Bzk8g3qmrFJ2e7a+xoEyz5eX4NTS6ZscDrPIsVH3vfFB
         pvPvjZL1t1j7RUJfI/RvFK0qfghR++9Wk5g0ieboakdElfydrYPdjBUejhnohUnBDeXm
         /Tmi974zuCeSFLtvIRdcn4hYLRv5IiifwJ47oR6WfeqaoNTxNKroSdySLvWJhBLLz+Fp
         aCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMSwSbJsTS4y6fz9hKjPpbpHEWXtJ/JwdzVt0jfJQ20=;
        b=GALBhnwl0mHanP6AhdIArgAamYqTZhQGKBHAJqdzcHgfHBJAmSIqHae8JrfH4m6SlN
         J+ara3zIuyTGvOWLRGjMJ10F6yPEkYcdg69U29pAF42p/bLCGE9kX9H3JYjXLpHTQdht
         zGqOLoespFtkUls7ih4w2GgEGh5wjUdlET2zpvkvYxYHuQOoBTjNR8BR3vk7BRnq1GId
         /T9NrCIxP7I4GhDOnTv30j5voMSwn2numLWo6KcBUfVsKkWPB+B+CAVCkvREeMHidAc+
         MLH2+lrCOlKdqgZ7hbDVJfEhbrBihFdGhEvGtOtdOwz1ua/UJ9yo98e8iK1VJGvTIA0r
         0KcQ==
X-Gm-Message-State: AO0yUKWO6+yg/J9NQuISt1SHk+hA/OBuUDElCVm20wRhYFP2TBLp6lAL
	Q1aGyFXrY40WSkSWaHblLIbxTvp1Emf4dw==
X-Google-Smtp-Source: AK7set/Na6v3ee9GV0STLnUi9JvQFv1QztTp57yL+r2HWUUebgUlc/oF1Z/f+QvkDcgIRoEVv/ex1g==
X-Received: by 2002:a17:902:e890:b0:19f:e9e7:4cb with SMTP id w16-20020a170902e89000b0019fe9e704cbmr1768343plg.45.1678862112348;
        Tue, 14 Mar 2023 23:35:12 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b00199536fbc6fsm61114plb.280.2023.03.14.23.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:35:12 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Add a helper for ECC related initialization
Date: Wed, 15 Mar 2023 15:34:57 +0900
Message-Id: <9e1c639a5bcd2b3f347385ff243dbb521bbe5857.1678858206.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
References: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_233514_100063_984EEE44 
X-CRM114-Status: GOOD (  14.29  )
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

JFFS2 supports write buffer mode for ECC'd NOR flash such like SEMPER
flash family (s26hl/s25hs/s28hl/s28hs). To activate it,
MTD_BIT_WRITEABLE needs to be unset in mtd->flags.

In existing late_init() functions for SEMPER flash family,
params->writesize is set to 16 to avoid multiple programs in 16-byte ECC
data unit.

This patch adds a common cypress_nor_ecc_init() helper that takes care
for those ECC related initialization.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1678b7b2e9f7..9539968c4a6d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -219,6 +219,22 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+static void cypress_nor_ecc_init(struct spi_nor *nor)
+{
+	/*
+	 * Programming is supported only in 16-byte ECC data unit granularity.
+	 * Byte-programming, bit-walking, or multiple program operations to the
+	 * same ECC data unit without an erase are not allowed.
+	 */
+	nor->params->writesize = 16;
+
+	/*
+	 * Unset MTD_BIT_WRITEABLE to activate JFFS2 write buffer for ECC'd NOR
+	 * flash.
+	 */
+	nor->mtd.flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
+}
+
 static int
 s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
@@ -260,13 +276,7 @@ static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 
 static void s25fs256t_late_init(struct spi_nor *nor)
 {
-	/*
-	 * Programming is supported only in 16-byte ECC data unit granularity.
-	 * Byte-programming, bit-walking, or multiple program operations to the
-	 * same ECC data unit without an erase are not allowed. See chapter
-	 * 5.3.1 and 5.6 in the datasheet.
-	 */
-	nor->params->writesize = 16;
+	cypress_nor_ecc_init(nor);
 }
 
 static struct spi_nor_fixups s25fs256t_fixups = {
@@ -312,13 +322,10 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 
 static void s25hx_t_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
-
 	/* Fast Read 4B requires mode cycles */
-	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
 
-	/* The writesize should be ECC data unit size */
-	params->writesize = 16;
+	cypress_nor_ecc_init(nor);
 }
 
 static struct spi_nor_fixups s25hx_t_fixups = {
@@ -381,7 +388,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 static void s28hx_t_late_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
-	nor->params->writesize = 16;
+	cypress_nor_ecc_init(nor);
 }
 
 static const struct spi_nor_fixups s28hx_t_fixups = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
