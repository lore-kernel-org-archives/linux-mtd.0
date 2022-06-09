Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23165C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPQXjttfgIOvpELAhYxjKg19cyL0JaO8vY3NGGkcESU=; b=jTLdWttvO3Ncxy
	C1Sea5BiyajOfi4jP/70xPlDf3zIcnKxyzMwkAz2aDqsRxI/gEHDDzweQXPOF4wxrlJE4tzedCXA/
	wqQxZIv1i2W+Lu/2JFXaLX0+qD5bsGB5f3cENxR46Vsp7PkoP0VXAHYjMw1ykbGKV7RMraGnb5gcW
	XZrqObMSHLSGvBz1yY0kePz5XyeiNs6ZXyUU27rEhLVJYKJICf6Mw/BdZ3I2bOAkFOVJ4JkZ+8L2Z
	INwSROSLBiKmLdc3pVZoBi3AQiiz2Dwwhs96rDZMW+V8cKLtE8pyX42hmRRAH0p2HfThm3dfKEo5y
	E9CdZr8FTZu6ntLh7pwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE6U-000WhV-8i; Thu, 09 Jun 2022 09:05:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE1G-000TvK-Pn
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 09:00:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id e9so10280465pju.5
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bxke49sP2JK7J/4byaLiwcc1JSwMF8MktPW4n0s2Iao=;
        b=A9mqfjZWAav+6SEA1WgalFtneGyBpdAkr/GwNPXmYy1y5QXCIN5LxCAW9XLCBNMyMO
         UcFdsgDhY0C9qy5TUXipbUDcUdJNoWk2QDqWuMO4wx3zNfhNzCEEZMme5mEX0a7obtIi
         Feyd/SU1skrtzMVM2+DtIbdJI6aUvJVJE+guzkF3VFgAK4o7Y3qhF6fqIwEqsbb+N51I
         rldmFNFtYDG2tFNP043MECxwWHxVeMmyzyhjYbm/lGsI0bMGUIIl6qLuNYZYhoGXxzxp
         4X/hBgIqWFhll7K7GwGmxlkgs4iDAwQLWwArzQF5pMdVKrw+jIv5O8Y9J9eehVEyCXv1
         Wm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bxke49sP2JK7J/4byaLiwcc1JSwMF8MktPW4n0s2Iao=;
        b=li0+pjEd94FoCiZYV+4225xKw3V3gu3kSSy/sTqv0lXKC3Tldn/NFE1hbFWzc1yh53
         taFq88qR/jGT3CuxIFKdnIPJITLOTUg94tv+x34OMQg1rLYH/gMtP7Qnm+y2Vz0S71hG
         Zw7ylFUyl29+fegI2KGxW4G8gA6IroUwo/d4V7KVslNjoEhY/VxG3o+K6mezXWq63tr3
         VX2aq38qaiVNyNigRcqk6p16gs6b6GCDzNclPy1WEyAGHugynW86UMzwh2OrS0mMOljA
         5Bds6AKv1d+5lmia5E+Atp5yLsGWB/8La551LAe+8f8VOnGNftpHTU7xhvP4tRyf4uBs
         XNHw==
X-Gm-Message-State: AOAM533WehfpyKCGkbn8Tb/4XYUj+KdPh4YONAZ38s14HtHhhN8iSbZz
	/AiTCPLZdrdBBfJRLWKCJT5yfmnS8B8=
X-Google-Smtp-Source: ABdhPJxIFstzQkV2GB2455Vn6XOWVkyIkQ5SmlnEIlclI1i8QymflHVfsyJZBsh7l8FCbqudnn+8zA==
X-Received: by 2002:a17:90b:3e8a:b0:1e9:d56e:347b with SMTP id rj10-20020a17090b3e8a00b001e9d56e347bmr2427384pjb.42.1654765197261;
        Thu, 09 Jun 2022 01:59:57 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:57 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 7/8] mtd: spi-nor: spansion: Add local function to discover page size
Date: Thu,  9 Jun 2022 17:57:44 +0900
Message-Id: <547eb542d62be50ff8afca0677ce6f988c25eb4a.1654741889.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015958_888068_77533596 
X-CRM114-Status: GOOD (  17.05  )
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
