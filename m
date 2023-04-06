Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50300C77B6C
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kejn1XeZEcYxTtOUQCCgibTZ3X4fL5hz3WuGHhiWzR8=; b=l3gS3t8741Mk56
	Z1ADmhls0E9vCB4Om86b0UlrQJwYTsgPbLHbQOhfVN+lkRJzd1tgPJwvfOczRxiouxZfvEJtosTuH
	7FQTVnFVaOMfzutyE1ILmM87FfjpK+FWFy2lCq1/qJT4bdfX/L5ws0xx9EGsRy72aSOAM1aPTmW4z
	CYu95EndN2wLfNuiJ0yqJV52cjIdmzEbefIfjt1157q084ZfPN+g0yQMSH3Cxz8Elp3xpEaMfvoOq
	PiZfE/u7li5XUQJdJkSLyh9A9hZVlSaJ5pxubIhuyvLlFWwlc0C74QYLaQhXqCaY8dRDoFu7jdAyj
	zO095NHbOlSXSB0kSdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwp-006SaG-2M;
	Thu, 06 Apr 2023 06:18:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwn-006SYS-06
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:18:14 +0000
Received: by mail-pj1-x102a.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so41922340pjt.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCEA1jaG6kIaIVjEfEFyy0ijLEpt43ZoFGLdbbk9ziM=;
        b=jkzquUiUYpzf1iUmoyDTbcxE37xDnI0gu5WXkP5hKCAGxi6OEyVXtFP4ruVsAp9e63
         al8bAnP0sT/SFIiTmODzsj9CeEBBEIrkOKRg8bPcof7XdwKRQaevu3Dy7Kd9cy4biLxE
         oyMrIzPmI6MZcLYJNmFwCiD2tVzlPu9prgeKd25EqqBNxxicDBbkGGKWjEZYHMJ8bczH
         HPI7ch6Rn/5rxG7FNRv5F3w0tRF+fh4Sk3SOFYjxSpA8p3Hnl2OkMFv7T8PJxrDQRElV
         Zzi1j2NQ6WpreAo0NqBywSadjeD15xW1ucjLQu7AzgwLnVXz+vkjKjVxH/FNE7/wKGBm
         Tjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCEA1jaG6kIaIVjEfEFyy0ijLEpt43ZoFGLdbbk9ziM=;
        b=mHIvz7zQfHAULgUePrkd3BDy+Xbk41bpgcseFd5Mr/Jmn+S+y+/lUGKIOHeDoDQqB0
         KcfM4e6iYIHX0NPqv+7yKoEUY+DvFEPy8cm/+UvOxDiZIwwxTqpNZ0/vZZzbs0Jmdm/n
         4MVbd5eoagfGHSYq7YWP9zFBlNTPJQbjhjP/KToHiSUj7OGrENui955euP3CEJmGQf2X
         srlBzwnir1OuDgA9aFr3njiECe9YEpf+lDkSx8hUDls0IuDlHZAGv+0QAqFoqCTbQiyG
         A/psBizuaVrCByOfBqa+g6B90lDoDybgVRZq6oq9XbSYkesFTZPIvOupZRASq3/4s6OD
         Wg/Q==
X-Gm-Message-State: AAQBX9dQREkGTcne7CqTC/mdWob//kEX1SD5ceZOebIC9Bvwdf6GgqYI
	7GRKIiGOLc/dKI1ttgD1oONhgKVG16H7Pw==
X-Google-Smtp-Source: AKy350bmXKziSxPzbErymEv4CZ5tvv9TAV0tAlcHDIqTHmYRoV34GnZYqfQSK1Jp0Azb3vBtkXAp3A==
X-Received: by 2002:a17:902:ea07:b0:19c:3d78:6a54 with SMTP id s7-20020a170902ea0700b0019c3d786a54mr5539527plg.14.1680761889951;
        Wed, 05 Apr 2023 23:18:09 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm567622pll.86.2023.04.05.23.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:18:09 -0700 (PDT)
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
Subject: [PATCH v3 2/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s25hx SEMPER flash
Date: Thu,  6 Apr 2023 15:17:45 +0900
Message-Id: <a1cc128e094db4ec141f85bd380127598dfef17e.1680760742.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231813_069822_DC8A2873 
X-CRM114-Status: GOOD (  11.27  )
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

Fixes: b6b23833fc42 ("mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups")
Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/spansion.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 19b1436f36ea..4d0cc10e3d85 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -442,13 +442,10 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 
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
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
