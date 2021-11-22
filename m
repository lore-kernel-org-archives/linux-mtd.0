Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB981C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIrNZiSHvda+2Bahs1QfowC9ra/oXcKgcoEZNQBqnck=; b=uCXkMNcIBihDO8
	T+EKoRpsdFAx16exsbhNLknDA83HEik7dBBySHFWQEQyXjUjuBmMo/rbmL7tNbvlDc2drwQTQDqXQ
	/5fgKhoAKrP/0AbLMHVdGAKYTg8U7V/Tygl1Smdziy50+sMY7rVtbEc0QyokmH9VutCkkieV6taOS
	/ECBoRKE+ShFW0WBPKGsOdhGaayFWnZEkSxLYgr0Um2xFKQ+gGHPz2l4P59tCaKb+HbRWk52tuMyx
	01rTEGsg9oHPjBigZJfGUWlmfPU1j993Is+DpDBgF8ZoXnRrN+qBJ1TGWkH6oXh+aAWsgmKgAtAzc
	g21eUOR7NgF0M2ed67Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6LA-00FnO5-3u; Mon, 22 Nov 2021 10:14:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yG-00FgrG-0K; Mon, 22 Nov 2021 09:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574643; x=1669110643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkVyjLJBOGMq8kMGfm2aO9rm3DsjvkDQSF4AWNEdtvw=;
 b=JaJqdW1HuMJClp8W/F+l87ZvdtbzWJNr3x8NegxD+E+SFRKYdKroR3nT
 EVIIes6LCqEHPCowlpL5ZKxVk4LpOZbOIp6Q8rGp1QaxuxjeEowsqLdC0
 PehQhsWmT4/43537ohClpzcrssqXj9U//qF9Hixnm64i2kQrttJvO82KQ
 dtwp9SvOOcLZOTobPzIgedcpTlEafTX9zEMa5s1y+c4zfyC4K4puWk6GI
 LaVWTPvevoXvKWviuQDv2cp3ksWCOMhbJT6KT4SqvR4gFPySff6P0WM/b
 AmuB+SvNVKQlXrYqMYyP0onIpfuX4YPlz4GcVCfyfKiLbX5EB6vd/wXUV Q==;
IronPort-SDR: BW9TtqndmmNuDdOum+G36T0KzYz3d3L3wi5zNxblM+9LHambM1O9jsf7tSFiZUFf72lBfh4PaT
 raMUJytQuSjG1XESSbo88xcdVS0t98K3Wz+bBNpmeDQUf+uJfPLW6dgBmdf9DYBGHW/5qhCFxr
 0qL4+wUQK3aW5ppSQ6AY4IOfzjVNbJM+OFKJHVwqZTSumFqGgc3Td5U+wmV8MJvQd2PbLnabZK
 VM9j0/8L1rpqBtCViVX1p7Sbpf51eLb/ldufOwEJDeJWcQ83MAQ+nangd7ZB5jucov5OrteIRH
 jTeYtCZT6aC6+YkwF5GQgs6n
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="144713185"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:50:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:50:42 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:37 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 03/13] mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups()
 only when SFDP is defined
Date: Mon, 22 Nov 2021 11:50:10 +0200
Message-ID: <20211122095020.393346-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015044_161881_2B83EA4C 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
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
---
v4:
- move spi_nor_post_sfdp_fixups in sfdp.c
- drop R-b tags


 drivers/mtd/spi-nor/core.c | 33 ++++-----------------------------
 drivers/mtd/spi-nor/sfdp.c | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c2da885f4d8d..644f3b7976c9 100644
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
