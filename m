Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2BFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kM53Luvf2bBOY6Nd6bbSDv/6NR3fzsn9G/MOq7yjK0=; b=F27cLIFiQUsMQ6
	bdzzy50r8jFsUUSv4HjEkQAbbOOrxCFqTYrsuLMWxci32fU8zJQ7o8LADniJPk1I1Bvf9KmdGjZt1
	dpDzLyXt27Lr3eKwSOEMUhzFLZQ8QlPd4hfX4IazciUoQ6yxzJdCcr9Bw6VtRwJFSG1+9trBRqCdy
	fIYWXqoKM8Wasah6PjTR7chGl8TOSH7uaf7GoXdPQqOtvbyngHDXAXs8EbzAbyXIA32Z/bSu4KiJ+
	vjDjhjqcGgvIiAliItkKETQn125TgdJ2P/3h0lOO82gIB99fCUvR9o6ctwXBGWvgv2QPu4qG+LbDl
	Yucv4dK7nzo/aXkHJDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mub7z-008qd6-7e; Tue, 07 Dec 2021 14:07:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub3z-008p6I-Fy; Tue, 07 Dec 2021 14:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885803; x=1670421803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/sk5hRAhdTtm4L+b1T/IK+Jm0j9hFg6YwcL8epwpGw=;
 b=G6B/WwH+gZAQgvYQrPQk32jgoM45Hrpr+haCOOWVQqBoVhJ2Tr6HhJqe
 2IV84We32l+Q1ZMP3pblLEBU3xs8bIQLIB6xY4muW3A2QmCreiQL6HtkO
 d1BDAtROxvI4geuTvbW4N0LtkSs7eArPjky5HOZvtIQTsSVCje1zQq7Mv
 LOJiJ0TFJYHIlcfCd8RD057kfZPlsvt1KMBwjXIQI7/+B1qSRVAiSm+NU
 7ea55QoqxxWi7DQrHCr4EyQc9h86DeRg2miyHyYxjXRACvvYMyZD98hZq
 w3pMdMVFIdgM0kNZ169uoJK+vleZeIhESvru2sPWZIR6IFbRoC/s/rzjo Q==;
IronPort-SDR: zH9C/LDiQfnnGrVW/NIAeA9z+qpZn43hQCY7y3f6cAei1tr1gzj1eEIW44stD74jQC6IdjYcN+
 TOkT97vJaiBOEyquYxjR9n81+ZfPkOLvqq4w8c7c+IkAEdzuFYY6TcgO96K8nyxE/mF+qt6hA/
 b5tJTJT+mcBIRwgx+LrDIdTyQ/4lBKU2qndFQJPtAShtr5m1HAGRsNdZDu/Y+eHz60dX40t/Wg
 R9mLbl8uGLsIJQcZtpBUa1A8xB+nzwYJ2Dy+eL9oqhhKmbbUitPF8WorYTfUPC/CBe4hORHRyV
 pW1TVXhEjpO24BifZnkLEbJA
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="78762152"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:21 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:17 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 04/14] mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups()
 only when SFDP is defined
Date: Tue, 7 Dec 2021 16:02:44 +0200
Message-ID: <20211207140254.87681-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060323_674874_13EEADAD 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

spi_nor_post_sfdp_fixups() was called even when there were no SFDP
tables defined. late_init() should be instead used for flashes that
do not define SFDP tables.

Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
hook is as of now used just by s28hs512t, mt35xu512aba, and both
support SFDP, there's no functional change with this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 33 ++++-----------------------------
 drivers/mtd/spi-nor/sfdp.c | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index dbb2c98c0366..115261f0e904 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2642,26 +2642,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
-/**
- * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
- * after SFDP has been parsed (is also called for SPI NORs that do not
- * support RDSFDP).
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Typically used to tweak various parameters that could not be extracted by
- * other means (i.e. when information provided by the SFDP/flash_info tables
- * are incomplete or wrong).
- */
-static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
-{
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp)
-		nor->manufacturer->fixups->post_sfdp(nor);
-
-	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		nor->info->fixups->post_sfdp(nor);
-}
-
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2712,15 +2692,12 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
  *    Flash Parameter Table.
+ *    spi_nor_post_sfdp_fixups() is called after the SFDP tables are parsed.
+ *    It is used to tweak various flash parameters when information provided
+ *    by the SFDP tables are wrong.
  *
  * which can be overwritten by:
- * 4/ Post SFDP flash parameters initialization. Used to tweak various
- *    parameters that could not be extracted by other means (i.e. when
- *    information provided by the SFDP/flash_info tables are incomplete or
- *    wrong).
- *		spi_nor_post_sfdp_fixups()
- *
- * 5/ Late flash parameters initialization, used to initialize flash
+ * 4/ Late flash parameters initialization, used to initialize flash
  * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
  * tables are not defined at all.
  *		spi_nor_late_init_params()
@@ -2740,8 +2717,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
 
-	spi_nor_post_sfdp_fixups(nor);
-
 	spi_nor_late_init_params(nor);
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c500c2118a5d..a5211543d30d 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1228,6 +1228,25 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	return ret;
 }
 
+/**
+ * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
+ * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
+ * tables.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Used to tweak various flash parameters when information provided by the SFDP
+ * tables are wrong.
+ */
+static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+{
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_sfdp)
+		nor->manufacturer->fixups->post_sfdp(nor);
+
+	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+		nor->info->fixups->post_sfdp(nor);
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
@@ -1408,6 +1427,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 		}
 	}
 
+	spi_nor_post_sfdp_fixups(nor);
 exit:
 	kfree(param_headers);
 	return err;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
