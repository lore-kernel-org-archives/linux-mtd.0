Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE69C7618D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 07:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KQOWNQtwN7oJYMKpcowTmrw2izzUhpHUmMLGGQL9RSE=; b=VvOoiwfc1zZY9X
	GLUa3z4R2RGOPQbOxXdcxK7nfOB0UtazlYeBKMX7hfaSKG428fz7twzxLxlIxrZIUkG3VHFkLvr6b
	yMtBDeBXgGU/yd1LGacvMQokn4AfJBNwVLh3QWRVh4S8CJjSdrXv1kE3KBOsrRQRkl2UtPS0j6kW2
	CWSzaRiuYlHxaecHDG8uhmD4hp1kRczG1KxjaE6jaxJeZsUSgboaXW34SEy3ic0cIVOWOWQaZ+QM5
	HZcsGthcISEyFCBYwj7dDLfwo1W/lMguePyT/1SsJ2Mv7WrUGqALqU5XgchDsmQ3o/hK8JcF2qggK
	mbvtY7tLK9bwIjigo6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjavB-000HkG-0d;
	Tue, 04 Apr 2023 07:17:37 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjav8-000HjQ-0M
	for linux-mtd@lists.infradead.org;
	Tue, 04 Apr 2023 07:17:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id bm13so6656502pfb.5
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680592652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aoNmBxTLg4bYP1LzWqAv4g+6PvsLW4SUU9joYqsr0+E=;
        b=k6hBgeKIdLswuphk8o+msL6BlDoimoCvxzs5fev3hxxlU4tJwQarX6vd+ub13AU6Dk
         SwNq4E80Mi9J9d7Lih/t65WIm6+z7BkRg4Y4JS3OoRfuWNDiJu/YnUYwTexoxjCb/3m8
         zmLXSJ0gaOulTAVvE62rKhTEpEbWu+QFAUC0TTvbD+rS5l14WwdQE783UrRU+S/DHpi0
         Y3rWsYn4KSTOfFDs7NPEYGCs0HAYoKfKo2tQvhiutAb3CfBYaD8HTUfQ25TpbaQmi3Tk
         2WIzynPmCg1Xs7+c4uXeYdrVcrlQ0E7ZVj6WNYAaxSw4BCOVzX25LeLj86qbB0BOnX8p
         aGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoNmBxTLg4bYP1LzWqAv4g+6PvsLW4SUU9joYqsr0+E=;
        b=oTk5DSlCh3DbPsNGUfhnwpgA2TkfOZGW2/hmIvPwblRHmLcCQKPOGGbF+KHJcuMkF+
         8iwN6XHLY5ZYh7PXdSt8RKX1UY86GSWAzBZRC8ic3WXY6fq7TnRpjTe88D6NTfkTgTCm
         bu9RB0NPcq1UzGcjpLspMqU6hXQnUdLbCpmavowJyW+Elc5wkiOwiq/O6ngCJn1wzu/c
         zsJJqlibDe6ctlgs+HkbjgQ6JUqjf4Dby8FK9m+cdlZQgt1bD+fZa9IhPIiTHkP/4LuO
         JTINglmHqcZdNWK+AkbjgcXx+tRWqLOo5zOkADhvGPKENjQWYBPhLdNrKqYSAw+n7GzN
         ZLxg==
X-Gm-Message-State: AAQBX9eKq2UBtoCPTGklZB113J8a76h4rqMAQQiqdJmaXrejQus1NDYS
	hkJGoQTIhfj7UwZqJI9QzyqaBlu1REo=
X-Google-Smtp-Source: AKy350bRh2Vl1mnEpBIpqLnJyt2P2UVwO5IlmA6g6W9a2DUHzZpM3dYtku/ox0FjeegmaSaUTs0QnQ==
X-Received: by 2002:a62:19c2:0:b0:62d:944e:b0b8 with SMTP id 185-20020a6219c2000000b0062d944eb0b8mr1250675pfz.32.1680592651766;
        Tue, 04 Apr 2023 00:17:31 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b00627f2f23624sm8004213pfm.159.2023.04.04.00.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 00:17:31 -0700 (PDT)
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
Subject: [PATCH v2] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon SEMPER flash
Date: Tue,  4 Apr 2023 16:17:15 +0900
Message-Id: <20230404071715.27147-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_001734_148233_C0AA2422 
X-CRM114-Status: GOOD (  17.36  )
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
mode for ECC'd NOR flash. To activate it, MTD_BIT_WRITEABLE needs to be
unset in mtd->flags.

A new SNOR_F_ECC flag is introduced to determine if the part has on-die
ECC and if it has, MTD_BIT_WRITEABLE is unset.

In vendor specific driver, a common cypress_nor_ecc_init() helper is
added. This helper takes care for ECC related initialization for SEMPER
flash family by setting up params->writesize and SNOR_F_ECC.

Fixes: 6afcc84080c4 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
Fixes: b6b23833fc42 ("mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups")
Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/core.c     |  3 +++
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/debugfs.c  |  1 +
 drivers/mtd/spi-nor/spansion.c | 28 +++++++++++++++-------------
 4 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c67369815fde..46592e04d5ef 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3406,6 +3406,9 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
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
index 352c40dd3864..ffeede78700d 100644
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
@@ -373,13 +384,7 @@ static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 
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
@@ -431,13 +436,10 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 
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
@@ -506,7 +508,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
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
