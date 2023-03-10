Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00E7C74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i0K72GSz8PA1mBszc1m8qGMTNi+jnnue9PCQGj8YFHE=; b=TH4Rdp4h6ncdOM
	5A0RPhYeoUso/VnT2GBUelzGyeNNSdFUmfnTyNocC9TQ8/QzNuy64v/xfi/5rtYac9HZdvoioAiTk
	3IBilfz2FhNn4pr6NIMjzpcXCfyJ9NL30W6TMbmBA9m8bHG7TVskeji9v5EJqAvrHYNs8/hrXJ/XC
	BFYfwqfOuHjZDQ35816ohgIwsSbMo0b05RwJOC8wKaiJ9vYQh15d5lmq5w2ste38e9n88wTcdOgBn
	LMtRA2MUozsjWZF8DZ6wqPyxw9FLxygn0hGxLKAbvb5tTdFxTXsvmzWLRvTThfaLxf9daoD6qdzkP
	fFRAnyxJiOM/35FG0x2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae48-00EnxA-0M; Fri, 10 Mar 2023 14:49:52 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae2j-00En7k-5o; Fri, 10 Mar 2023 14:48:27 +0000
Received: by mail-ot1-f48.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso3036960oti.8;
        Fri, 10 Mar 2023 06:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrdFa+kbLMKBorg/N02iIyUwqoSJ0NfzGmn1ysWc/dk=;
        b=uMwBGYnT3OBdlMAiBZhq/rtN0+mp3lzxtoKjpzRm4F4lO9pUsHS9+P7N+YJNL8Y86A
         g0r8dKVD6qhI2ZfKEjvIAS1X0LMOBhfXL7Yb1DyDRVcQUNiFUJZ4Cu0oFRMibt8gX8GV
         Dx0n8qzDuxzQ11bG5eyUANsXsjGy2f/zRmiDslDAt+1FQiEMnhfBmbFpQWlPrfsFzu4H
         l+0rWHEX7fqtdGpBuo8QCqCLExsa3u1WWTQujVql2X5bjE6PBRA+2ruvXDE/7YsfnnOe
         FLThRqH2Hpl1Re8b5yfjKET1+sg/Dp/bmh6mjK2La4pJnpF5K/ujV8I+rrQQM4/xsAJP
         +hvA==
X-Gm-Message-State: AO0yUKUEBhug+SI6Uz4p2emW8rDjHKEcf1aPtOxqpBICBA0emq403PzH
	klNdHD60kdwy6MOMbP/Agw==
X-Google-Smtp-Source: AK7set86eN4WoTusNTUyoUqLmafcF6+IvhdKnbV2zSrB36IVEA9DRtbNcoDjmuNaSOhbl1eeeSGHPw==
X-Received: by 2002:a9d:1e7:0:b0:694:3979:726e with SMTP id e94-20020a9d01e7000000b006943979726emr11529393ote.29.1678459703877;
        Fri, 10 Mar 2023 06:48:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 63-20020a9d0845000000b00690f6d9a737sm135452oty.8.2023.03.10.06.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:23 -0800 (PST)
Received: (nullmailer pid 1544040 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:16 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:47:15 -0600
Message-Id: <20230310144716.1543995-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_064825_244810_D173CFBD 
X-CRM114-Status: GOOD (  14.57  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mtd/devices/spear_smi.c             | 4 ++--
 drivers/mtd/maps/sun_uflash.c               | 2 +-
 drivers/mtd/mtdcore.c                       | 2 +-
 drivers/mtd/nand/raw/fsmc_nand.c            | 2 +-
 drivers/mtd/nand/raw/nand_macronix.c        | 5 ++---
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 4 ++--
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index f58742486d3d..cc17133be297 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -820,8 +820,8 @@ static int spear_smi_probe_config_dt(struct platform_device *pdev,
 		pdata->board_flash_info->mem_base = be32_to_cpup(&addr[0]);
 		pdata->board_flash_info->size = be32_to_cpup(&addr[1]);
 
-		if (of_get_property(pp, "st,smi-fast-mode", NULL))
-			pdata->board_flash_info->fast_mode = 1;
+		pdata->board_flash_info->fast_mode =
+			of_property_read_bool(pp, "st,smi-fast-mode");
 
 		i++;
 	}
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index 6c0c91bfec05..860b19f77090 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -112,7 +112,7 @@ static int uflash_probe(struct platform_device *op)
 	/* Flashprom must have the "user" property in order to
 	 * be used by this driver.
 	 */
-	if (!of_find_property(dp, "user", NULL))
+	if (!of_property_read_bool(dp, "user"))
 		return -ENODEV;
 
 	return uflash_devinit(op, dp);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0feacb9fbdac..5ba4227daf7f 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -739,7 +739,7 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mutex_unlock(&mtd_table_mutex);
 
-	if (of_find_property(mtd_get_of_node(mtd), "linux,rootfs", NULL)) {
+	if (of_property_read_bool(mtd_get_of_node(mtd), "linux,rootfs")) {
 		if (IS_BUILTIN(CONFIG_MTD)) {
 			pr_info("mtd: setting mtd%d (%s) as root device\n", mtd->index, mtd->name);
 			ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 6b2bda815b88..0d34d433b732 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -880,7 +880,7 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 		}
 	}
 
-	if (of_get_property(np, "nand-skip-bbtscan", NULL))
+	if (of_property_read_bool(np, "nand-skip-bbtscan"))
 		nand->options |= NAND_SKIP_BBTSCAN;
 
 	host->dev_timings = devm_kzalloc(&pdev->dev,
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 1472f925f386..385957eb6762 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -93,14 +93,13 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
 	struct nand_parameters *p = &chip->parameters;
 	struct nand_onfi_vendor_macronix *mxic;
 	struct device_node *dn = nand_get_flash_node(chip);
-	int rand_otp = 0;
+	int rand_otp;
 	int ret;
 
 	if (!p->onfi)
 		return;
 
-	if (of_find_property(dn, "mxic,enable-randomizer-otp", NULL))
-		rand_otp = 1;
+	rand_otp = of_property_read_bool(dn, "mxic,enable-randomizer-otp");
 
 	mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
 	/* Subpage write is prohibited in randomizer operatoin */
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index ab3990e6ac25..794c7b7d5c92 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -305,10 +305,10 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 		}
 	}
 
-	if (of_find_property(np, "spi-cpha", NULL))
+	if (of_property_read_bool(np, "spi-cpha"))
 		mode |= SPI_CPHA;
 
-	if (of_find_property(np, "spi-cpol", NULL))
+	if (of_property_read_bool(np, "spi-cpol"))
 		mode |= SPI_CPOL;
 
 	/* Setup control register defaults */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
