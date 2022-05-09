Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5506EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPQXjttfgIOvpELAhYxjKg19cyL0JaO8vY3NGGkcESU=; b=fHPhmLsw7Jas32
	Vf7s30cjn3LbYUVpfmEkyWHIADUAZVqWT95+qmZOwEMaAkbYzkQNLSMnNP2Oe/jX5txkY4YPHS529
	ZV1FpjagimHCaSRhtsZQVH5TnzituaJyzywClI+ceblESiSVWyFV0yXOnjkWZREKhdxvIgDl5rptB
	jwgmjK0JDYZ2xxen8zU1MrxeYww/NwI84zPuTUFxkF3sFw5krNfitceQo/uBl7XwVI4n9oxA5YCLB
	FzesDMtCQerUn3bK1oczNtOgDiCzdxVq4mbQ6PoWIY+W/j88bPWzvgDgRuJBiq2mlSCb1GTn7d+h3
	9SQ3hhuZmO+3jxIDuCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBam-00GVi0-1K; Mon, 09 May 2022 22:11:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaf-00GVYm-2T
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id i1so15129908plg.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bxke49sP2JK7J/4byaLiwcc1JSwMF8MktPW4n0s2Iao=;
 b=p6vY/KQh/cxHHhgRvkg+zbY6W+w6CAR6i67lWmfPynqOfcNTWVSisyPpjNDXoZuam1
 5gxBOD9QFuFNwyfbILr9Ns/BGDOIeoQVmN6lmvO7Wa9zDA2t0rsOO4TdOlUNzMFOE5wX
 9pzShpPandZUZpXOMgunkxQohCHEFs7l/TFXNc0OpMLoPxIF7s98i7bD/lVbV3WQ/4Yz
 9c8G99gOYoKN2pATFi0tN+d6UHALUFJd5WZ6PAgglYn7hnjY+z/np3TTwSKDKLu+ZOtb
 rsFhOfXp0vMfIxkU5dHm3ktkZVuTphue1yAUwsACsRnPph1dO3FdQFaPbQXSfMKy/1Cn
 nOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bxke49sP2JK7J/4byaLiwcc1JSwMF8MktPW4n0s2Iao=;
 b=W22wWjq48Xx7MvyzJ4kvJlMFnztUaIcXbd4i+ngheDHGrbpzvO7tLgzFw0vwoP2bQN
 i94aF8PqxTe7GgFvVZyamSiX2NFUY2tmuJh8UW3mtCgBnkgOtIMU/huYyk67n/Spi7if
 k57HZwINgoXN5v3+WMvYAL3jbJ6ukXALMDHP2f4YNVXg5tqWTXp6g96hbC0btl7bCMmA
 TYM1rBRt/NCiw6fb32cMjvR+K5UeiIsl47ezK0qBxccZCZEm5ydiX20SrVMX6jJ3QcCs
 ROSDheYTB14C1GCGqH0sbV26uz22pLlpXTvU0qkU2dgZ1h8u6PNVnc42VmeIk3qbh4vM
 Rz9A==
X-Gm-Message-State: AOAM530uMm91MkX6P4huwvC5sDzKCFSVJ8658WJdHklHylVZUVNnDI1C
 X6LEQCVWKE5xVewCuJxsL/ZEjcNsRVs=
X-Google-Smtp-Source: ABdhPJzNwoIIykqG4E0IcgbU7uPJw5dEkXCAXHG9KToWPJI/89JDUhhWOIjJdU/F3dPWGgXC3rnuZA==
X-Received: by 2002:a17:90b:2250:b0:1dc:588d:6d94 with SMTP id
 hk16-20020a17090b225000b001dc588d6d94mr27645932pjb.219.1652134252736; 
 Mon, 09 May 2022 15:10:52 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:52 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v15 7/8] mtd: spi-nor: spansion: Add local function to
 discover page size
Date: Tue, 10 May 2022 07:10:08 +0900
Message-Id: <b5eccbb4f77cd981ada1eb42d0a9bb1cabb2399f.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151053_156608_04CDD8AB 
X-CRM114-Status: GOOD (  17.79  )
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

The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
Move that to a newly created local function. Please note that the hardcoded
value 3 for the number of address bytes was replaced by
nor->params->addr_nbytes.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 43cd6cd92537..e130f5398763 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -113,6 +113,37 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_set_page_size() - Set page size which corresponds to the flash
+ *                               configuration.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * The BFPT table advertises a 512B or 256B page size depending on part but the
+ * page size is actually configurable (with the default being 256B). Read from
+ * CFR3V[4] and set the correct size.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_set_page_size(struct spi_nor *nor)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
+					  SPINOR_REG_CYPRESS_CFR3V,
+					  nor->bouncebuf);
+	int ret;
+
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
+		nor->params->page_size = 512;
+	else
+		nor->params->page_size = 256;
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -167,28 +198,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 				     const struct sfdp_parameter_header *bfpt_header,
 				     const struct sfdp_bfpt *bfpt)
 {
-	/*
-	 * The BFPT table advertises a 512B page size but the page size is
-	 * actually configurable (with the default being 256B). Read from
-	 * CFR3V[4] and set the correct size.
-	 */
-	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
-					  nor->bouncebuf);
-	int ret;
-
-	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-	ret = spi_mem_exec_op(nor->spimem, &op);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
-
-	return 0;
+	return cypress_nor_set_page_size(nor);
 }
 
 static const struct spi_nor_fixups s28hs512t_fixups = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
