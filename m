Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B51C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHQL6E4KWFQNzddEkuwA0WvjmOEWm4qdMlfhmYaLUeg=; b=pjeHD0ACfKhg4O
	B4JUUTM2iWBDcuFJ0UWaIRqQKY1BJpIR9/Lr2Jma8ko5Ty3VQPEsSWiyKcBrgd3YSqNk1wa7/YQej
	bTOZGtmlfoNfEvHw4iShLjaHE6cuKlSJYQCBFJYeB/AXDDJ+eYfJyTt85884JE/qrG2DTh5DGTFRg
	BLY/+WxcOo44taUBvw3cGDCcQ+kxR1x3uAQhU2NCvRWgs894iX5cuBXUFa96wDxO0ksOthpOg+4pw
	Xz9t3qe/B8J4Y5+aTtr9s7J2uyCZcFAhVfBo7MzNn2G7yi/Z+hyeD6L39QrSdvk6CIm0hkhVo2rtW
	xs3nzAmILg+7utEGXp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwj-006SYH-33;
	Thu, 06 Apr 2023 06:18:09 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwh-006SWU-13
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:18:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso39685940pjb.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b35Olt+2PoC7el1azLVeaVvHulfg1FG1zStXaw6X/Qk=;
        b=V52CaGTHC1Xu1sjLJWaJagZMlC3iGIIHuOoLhUZ6j1jUFQtxb/kCbzZyzEzfOPPOeY
         I+zWj0q/1iD0khgR9XY2jOJdVzbzsqK1XLul4fTUgGDG5bsWbr26yWEnQWiDe6sCHX0+
         O0yMwRVPyc//09Mb8OATlvlCCMmHxIb0ehe9wvheZPVtyBC/muUKivaw6Y6KRX+eM2K9
         PxGH3TBxD+muoAO5LWjPnNhyXGn9qXUd7yhhNAZlC97YgDXOwGy96VB94sU17rxKqQgF
         YzWGIhKMxcuGut0UxugXcX92OVN6VELMhtVSuIfMjD9bNaRerHWRe8cjBqg4aiok+RyI
         lvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b35Olt+2PoC7el1azLVeaVvHulfg1FG1zStXaw6X/Qk=;
        b=6iTNQ9HAj6S8DlSfFKeDjBqYosufYZwYwrIUebXkeIP/v5wJYP/5R75OWb3z9DUOnr
         /rtgc8IkoAUfCpKQx4m88l5bYBmeC6MM15VumDBOz606OA/3iDpp6HFVvyGoIQP6mPY8
         Rhb3+c9XqCD5+O9cvVAE+7f3mJuNmTsleXPTQ/TULs3300aZ8V6i6WIi9xDSj47Vl0+J
         BNDsxA/PsY0LY1VJyCDMTIa/9rQonUKynYxmk/9qGMT+iuUqk7FpljWRp9iPmBPB/SHE
         9Lzf/wLaPT6ufdZ1iBD46yOpvazLKwSjloCUFo/F5GUUZT3o7XMielZ4uYtGqxcPKA5j
         S5JQ==
X-Gm-Message-State: AAQBX9dhqdWX1Sqb+LEN1InVbO7RGQbPMJJSgVBlRDRdNqqKVmWuyzFZ
	tg65ubDZzO5HwJG+rG5a+LtIbw2dnochtg==
X-Google-Smtp-Source: AKy350Yans3gBJucYJ20YAtV9EsW1lYpo3zGz6gjX5T1vZ8kr1f3FNKGS03spBkrBBkZ7y0SLyUjNA==
X-Received: by 2002:a17:90b:3b8a:b0:237:161d:f5ac with SMTP id pc10-20020a17090b3b8a00b00237161df5acmr9457506pjb.36.1680761884243;
        Wed, 05 Apr 2023 23:18:04 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm567622pll.86.2023.04.05.23.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:18:03 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s28hx SEMPER flash
Date: Thu,  6 Apr 2023 15:17:44 +0900
Message-Id: <d586723f6f12aaff44fbcd7b51e674b47ed554ed.1680760742.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231807_365683_C9B2CFBA 
X-CRM114-Status: GOOD (  16.34  )
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

Infineon(Cypress) SEMPER NOR flash family has on-die ECC and its program
granularity is 16-byte ECC data unit size. JFFS2 supports write buffer
mode for ECC'd NOR flash. Provide a way to clear the MTD_BIT_WRITEABLE
flag in order to enable JFFS2 write buffer mode support.

A new SNOR_F_ECC flag is introduced to determine if the part has on-die
ECC and if it has, MTD_BIT_WRITEABLE is unset.

In vendor specific driver, a common cypress_nor_ecc_init() helper is
added. This helper takes care for ECC related initialization for SEMPER
flash family by setting up params->writesize and SNOR_F_ECC.

Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/core.c     |  3 +++
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/debugfs.c  |  1 +
 drivers/mtd/spi-nor/spansion.c | 13 ++++++++++++-
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1e30737b607b..143ca3c9b477 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3407,6 +3407,9 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 		mtd->name = dev_name(dev);
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_CAP_NORFLASH;
+	/* Unset BIT_WRITEABLE to enable JFFS2 write buffer for ECC'd NOR */
+	if (nor->flags & SNOR_F_ECC)
+		mtd->flags &= ~MTD_BIT_WRITEABLE;
 	if (nor->info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 	else
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ea9033cb0a01..8cfa82ed06c7 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -131,6 +131,7 @@ enum spi_nor_option_flags {
 	SNOR_F_SOFT_RESET	= BIT(12),
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 	SNOR_F_RWW		= BIT(14),
+	SNOR_F_ECC		= BIT(15),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index e200f5b9234c..082c0c5a8626 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -26,6 +26,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(SOFT_RESET),
 	SNOR_F_NAME(SWP_IS_VOLATILE),
 	SNOR_F_NAME(RWW),
+	SNOR_F_NAME(ECC),
 };
 #undef SNOR_F_NAME
 
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 352c40dd3864..19b1436f36ea 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -332,6 +332,17 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
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
+	nor->flags |= SNOR_F_ECC;
+}
+
 static int
 s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
@@ -506,7 +517,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
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
