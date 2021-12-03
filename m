Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C37C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kM53Luvf2bBOY6Nd6bbSDv/6NR3fzsn9G/MOq7yjK0=; b=lM88l6M254Ays6
	MDLKjYiFkkkaoUdRsL+3aOW+JyvbcJStYaquxG4ZlkL974XUANF69iuPodFdd2W4f9zWO2S8b/lfs
	R26kNZjiv9Q3jc3+hmLtbgZZFpk3BU/TzzlxvOqbPZMX3j8SY/cnYT8JmOfcpb781NshtP5VZ3TaP
	SJ7kYvgWj9AieQSJc8eaw73fHsvfsnXoqoIfBOEYXgPyum873zMZTBOU7r18ut1xeJenGS9iWfE8e
	kU8v5/lW7RqJuahwaD1/MCFQUG9oMSXqV+yLxWC6LrXjGXvoLRC7A3Um9Gy4vEOmKH+kZ0hbr4gvg
	iMJ089dLGl7BiNcK/qmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9Vi-00G8yl-T5; Fri, 03 Dec 2021 14:26:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9T8-00G7xb-4I; Fri, 03 Dec 2021 14:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541402; x=1670077402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/sk5hRAhdTtm4L+b1T/IK+Jm0j9hFg6YwcL8epwpGw=;
 b=HWUHIYGgJ33YtbfI974Hahm1oRvWQfjVjeAcXiH8CTmMN20n2hcu/cS1
 N59eMtBIL2DtcYa75u7ZGKtB3wXZHlaAA8F+5uZaGDon7vKylct8HfxMi
 zI+M+eqi5VQ3vj09cPZOucDNGY3qfFBKAE4aJq/lYSC8ufZD1RiR7/7kr
 IrnW90faTqK+Ccebze6KDqWCTIchIBHP2r3C+DWW3RX8mkE0hRUP+TQOU
 z22iF109+nR+wutO4BftArr4rqVCpE6sIaQU+4QHHe9P97sdEVJV91XjD
 MWXaFHb6ihhOjuqZj63Hnjd0QbUnQo8nLMc5tOFrAUc2GBOMkT9UYWzd4 g==;
IronPort-SDR: DCKR/n3xI1lc0r/UNKqEIBlzIMIpGSPo4Xv1v0povZDaKmjCNwXMSSwrQp3oCXJpuZxRqg3p0E
 Gq+MyTCNtfy2sLSojPifPKJ5AFSoQ2z6TbskgdqaEDkQcxbXRcfj0yiOwIyfIPQSebE/GLOYp/
 4qHbrNwa2s4EA6EyoIW/YS8V/yC6vTX5O4PntMhTTrRx0p+nAcfK47dN8HRsq2JFx1YDeZ148F
 ENdxUXdRDbeOT0yRS7/seTFao7JEZ8UtQRWCiF021drb2DSfJ0vewTg0A86jNsjaPX09DiUoCP
 ytHtFMdvuHlbeJVvU18zKIoZ
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141189247"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:20 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 04/14] mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups()
 only when SFDP is defined
Date: Fri, 3 Dec 2021 16:22:46 +0200
Message-ID: <20211203142256.47370-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062322_268203_353B0ADC 
X-CRM114-Status: GOOD (  15.09  )
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
