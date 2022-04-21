Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E23C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu/HHxhxN6JCrQFSo9ekz72tY9ipkdClbx/WqaNQF5w=; b=vxNT/5KG/9OiK+
	2sGQ3ITl2F/DkwYDBA2xBMeNFWvynZVWPYkN6TBjJmZypgOL+e6Q+mfVqcVE/im3GmC2yiVkA2Miw
	YghrMHDDqdXeXlVkoBjoJuNsTtUPMbEtUm4AGSM2BdwUa2uo3ArY65p5f81khAQ3d3m8jJ2RACrM4
	Jy5oHtlejO31lyCUERFeYD3MvKEysriiYwXRzb408xLtas4Ogm7Z009jJvWE4YSIG4G8BaoMl/wF4
	saxj7NqiS4jdcQWbj2X8rhOSaAO2uAa9cGfewRQcLKzmZoEKza0aimwXOVExCJlvUuQZZPBOSxcE9
	nxoZdtg7BhDK/y0NW77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTJ2-00Coln-UT; Thu, 21 Apr 2022 09:40:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTIt-00Cogz-CR
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 09:40:49 +0000
Received: by mail-pf1-x42e.google.com with SMTP id i24so4505613pfa.7
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2G25TwScr/xpDsKhPXEIdbL0FkjJ2w+p6O0ShOwA3ZE=;
 b=RSzhJKKxGc9XA5AltD4EHxH1orctbdKmw8R15RhUQjtOK1Q5HN7aPwIhTA1WaW9f7L
 S16tT0PEJk3+kHQ4b6BYdugb8XxjXiKhunnqlopbmwjQ0ZyV+Sx+CVnk0EJSCL9lazS7
 VCFwFvNHWm6h715zhybxpkeRW/6Ad0uhTlwawrcvRyZNc/ffisFo3dlxAJ2WTInF+EW0
 eYOedU4U/9TUvIWS4f0Bhc0MxDuGNoCYnjJcKtTkcmMEyMJM2S74xKTgDHXcedA7iBic
 EQ1glAmHQrVw++wmVVj7FPyNLaXLgvLgipT5WeMkih9YzCS39cQB6jOWPHwA75vQf/7B
 5D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2G25TwScr/xpDsKhPXEIdbL0FkjJ2w+p6O0ShOwA3ZE=;
 b=Xo9rRZ85GTybCJDglnlzNPhs7YGYbPr2U3Bn4iLnixSln1IUlh5fJ8syQq8fd/5Zfc
 9tbS8Q8DsOJnavMiYV7EYLGQ99RhPjWWJ5iFLhWHU37A8FY/P7SIhxN3HQBPrxcv2yaN
 RPYpw9mxR+nnZuONwRmUFuyCmlRpUFJZZ1LIuVBVXptT5x8IgGiSqerTg0FNkFX0WHVx
 EaeRwY9RSoNL3ADoM27G1ivEpKL2Lfalva60L208uzgYsPICLE8IdkhuQJMUQxHRn0Ud
 47qHwZaoa5d9uVUI0p43e/Rkvgv7lXdZwsFXypYprV1evn5O0r1j2jq1/wzQGnpslZ/w
 qIwA==
X-Gm-Message-State: AOAM532905Na0xIvmbaviqIfvcRffaEnnqewRk/1OxRoagy10oNQq6bt
 /VmUeu+Jdwh5oMDfflttDDjw7CiQA9w=
X-Google-Smtp-Source: ABdhPJzmEC6lGh9s4qkAKOfVjc8RVX/It/FKNigtgYTOCX2AR5bF5+EfG6GN/29NjoefP4tFpEuytA==
X-Received: by 2002:a63:151e:0:b0:39d:7613:9183 with SMTP id
 v30-20020a63151e000000b0039d76139183mr23062627pgl.52.1650534045753; 
 Thu, 21 Apr 2022 02:40:45 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 k198-20020a633dcf000000b003aa9116ba17sm1503970pga.35.2022.04.21.02.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:40:45 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v13 3/4] mtd: spi-nor: spansion: Add local function to
 discover page size
Date: Thu, 21 Apr 2022 18:40:23 +0900
Message-Id: <228838a08ce42b886869cc8d59a4029193afe0d8.1650532121.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024047_488658_97877BCC 
X-CRM114-Status: GOOD (  17.20  )
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
Move that to a newly created local function.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Changes in v13:
  - (no change)

Changes in v12:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
  - Remove addr_width param. Use nor->addr_width instead.

Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  - Add addr_width param

 drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 65ae3ade0b95..952d4383f9da 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -172,6 +172,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
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
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
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
@@ -226,28 +257,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
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
