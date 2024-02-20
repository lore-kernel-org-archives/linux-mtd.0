Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB67C48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5L1e55MagE+z4nZl/V/r316o6uLKuEFjCuvSx9N3Q0Y=; b=PfhE5IocwYPaWe
	0Ye+XDiazQcQOlWG0WbkxKnjpeygaYZFoamDMWOEAenqrVqzqmVveLWS8FRn5w7Y4uSK/JOeylyTZ
	GUgCRnplPGp2pSEryXm68NYSWw0Ec8FV8l7pCfk2bKqS+MKOsm7p+F54782zvWYOBHsKJjfoNoFlE
	1hRZB+VV8TMaEBSFE/f0jal3tMPS19H8FoLBDkIG5PbZFF5Y7AnMWh8393w/ANKCpi9qwa/nO+fuL
	CzxUhLYXsYWxHqjcjes1OmSiaEF625kDPOyUcxRKumpZyjHH9G+S0WxrnjPU7+6O9MnnexeO5zJc4
	2h2pQboVAsqLKkaUDOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLaE-0000000Dk1p-2hq5;
	Tue, 20 Feb 2024 08:34:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLaC-0000000Dk10-2Y7T
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 08:34:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d911c2103aso27817285ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 00:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708418071; x=1709022871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRgDTjBG9sBDt74PvkN4sJnay55IbRbHDzPWdIk6+Ww=;
        b=csPdPHYwBV9+j25o+9dQxR0yU9LX+nLAq1dMiNaL3MIMgxKK4MtO8Ku/QgEg2Ed9WO
         VrD0j4OgIQva8NzGIhJbcLLvmMtFhcMR7XytRTUkNMNiGbtbTVmi9E58DwVSiaFTx7E9
         JkPaHLUiHTs+GjJOPJJxSaiCAbg4MljUYgXqot4fLzccLxNx1VMxEr89EG1iYDWZEQWi
         LTVEkaYzAOjWOXflUQlvnNC6lPBhyds6q6HVLT2/ilLIAKsJ/aDVusU0oPj4ewQB+Uqo
         kfLAyMj1oPL1GhusdVKQPozkFm7uebeaDzHm9KaoXXxMCKVSbwTiKNBnRqrtFqeDcCkE
         KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418071; x=1709022871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRgDTjBG9sBDt74PvkN4sJnay55IbRbHDzPWdIk6+Ww=;
        b=N6PH3eN63pzGaZQpGcBAnscbSlYwHnzvQKaioOtlObeYX4TLZhUwzDiK1z39B69kqN
         MqOFmMNNJPjZSgzSsxAfqAFNUzESB80Ebd/ogR2Y6F7Fz2ft2Mu8CevuQNgDNkto3hze
         /izqHrUQwAyHkZlpPK6Zs1EGQuFT0UfWJzfcb0LtvpIbwEi4fO5MeKwILNA3gq/klMfk
         Xl109cDhnjaz34cRFrlKnLNXsTYp/xu//9xP94xjBJrqH2r+0cLx6SwDCPZ5FHihq16Z
         z6LhR0lsxqqmCguIi2oDyMq9nzXjg/dAHK2PO4gqAecG+1rBgvdXyZ/7645pzBq53K/b
         jYuw==
X-Gm-Message-State: AOJu0YzFWCBT1+QC/DJKLLGhkenobPFhAIO2gkxoE6GkCGgE+efc/5w/
	BrT6GNHSTI7+tdftC5p9LcCtKkYSSj+krM5H90XOWYcUBuctRbNaDWry+FdU
X-Google-Smtp-Source: AGHT+IF3UUu3h4ZmHgRUMU+1Buh2cBS8GvuAZtHPWQMPMk9Xc6Scs+uvAwEj2dyg+f4RCkTpAZTkrQ==
X-Received: by 2002:a17:902:cec2:b0:1d8:ab27:d76c with SMTP id d2-20020a170902cec200b001d8ab27d76cmr17314603plg.51.1708418070611;
        Tue, 20 Feb 2024 00:34:30 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id lo5-20020a170903434500b001db715d3bf2sm5655655plb.137.2024.02.20.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 00:34:30 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 3/4] mtd: spi-nor: core: get rid of SNOR_OVERLAID_REGION flag
Date: Tue, 20 Feb 2024 17:34:08 +0900
Message-Id: <076416d5dc8328dec72d31db12b9bec96bf0ac66.1708404584.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_003432_678545_50429AF4 
X-CRM114-Status: GOOD (  16.65  )
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

Only SNOR_OVERLAID_REGION is defined for flags in the spi_nor_erase_region
structure. It can be replaced by a boolean parameter.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c    | 7 +++----
 drivers/mtd/spi-nor/core.h    | 6 ++----
 drivers/mtd/spi-nor/debugfs.c | 5 ++---
 drivers/mtd/spi-nor/sfdp.c    | 7 +------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d9a0c0e31950..21775d5eccd5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1549,8 +1549,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
 			continue;
 
 		/* Alignment is not mandatory for overlaid regions */
-		if (region->flags & SNOR_OVERLAID_REGION &&
-		    region->size <= len)
+		if (region->overlaid && region->size <= len)
 			return erase;
 
 		/* Don't erase more than what the user has asked for. */
@@ -1592,7 +1591,7 @@ spi_nor_init_erase_cmd(const struct spi_nor_erase_region *region,
 	cmd->opcode = erase->opcode;
 	cmd->count = 1;
 
-	if (region->flags & SNOR_OVERLAID_REGION)
+	if (region->overlaid)
 		cmd->size = region->size;
 	else
 		cmd->size = erase->size;
@@ -1650,7 +1649,7 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
 				goto destroy_erase_cmd_list;
 
 			if (prev_erase != erase || erase->size != cmd->size ||
-			    region->flags & SNOR_OVERLAID_REGION) {
+			    region->overlaid) {
 				cmd = spi_nor_init_erase_cmd(region, erase);
 				if (IS_ERR(cmd)) {
 					ret = PTR_ERR(cmd);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1668d79f55bc..77ae2edf513f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -238,19 +238,17 @@ struct spi_nor_erase_command {
  *			inside this region. The erase types are sorted in
  *			ascending order with the smallest Erase Type size being
  *			at BIT(0).
- * @flags:		flags to determine if this region is overlaid.
+ * @overlaid:		determine if this region is overlaid.
  */
 struct spi_nor_erase_region {
 	u64		offset;
 	u64		size;
 	u8		erase_mask;
-	u8		flags;
+	bool		overlaid;
 };
 
 #define SNOR_ERASE_TYPE_MAX	4
 
-#define SNOR_OVERLAID_REGION	BIT(0)
-
 /**
  * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
  * @regions:		array of erase regions. The regions are consecutive in
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 0832b5893d6b..c9a344e0f96f 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -142,13 +142,12 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	}
 
 	seq_puts(s, "\nsector map\n");
-	seq_puts(s, " region (in hex)   | erase mask | flags\n");
+	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
 	seq_puts(s, " ------------------+------------+----------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;
 		u8 erase_mask = region[i].erase_mask;
-		u8 flags = region[i].flags;
 
 		seq_printf(s, " %08llx-%08llx |     [%c%c%c%c] | %s\n",
 			   start, end,
@@ -156,7 +155,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 			   erase_mask & BIT(1) ? '1' : ' ',
 			   erase_mask & BIT(2) ? '2' : ' ',
 			   erase_mask & BIT(3) ? '3' : ' ',
-			   flags & SNOR_OVERLAID_REGION ? "overlaid" : "");
+			   region[i].overlaid ? "yes" : "no");
 	}
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c4721d7dc97a..248e1e071fed 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -773,11 +773,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	return ret;
 }
 
-static void spi_nor_region_mark_overlay(struct spi_nor_erase_region *region)
-{
-	region->flags |= SNOR_OVERLAID_REGION;
-}
-
 /**
  * spi_nor_region_check_overlay() - set overlay bit when the region is overlaid
  * @region:	pointer to a structure that describes a SPI NOR erase region
@@ -795,7 +790,7 @@ spi_nor_region_check_overlay(struct spi_nor_erase_region *region,
 		if (!(erase[i].size && erase_type & BIT(erase[i].idx)))
 			continue;
 		if (region->size & erase[i].size_mask) {
-			spi_nor_region_mark_overlay(region);
+			region->overlaid = true;
 			return;
 		}
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
