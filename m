Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C8AC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 03:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFm7r4qROgXrxmfRwmRS+PfLq0uxJj7E56MVC47FjKk=; b=aVSomrKNncjsfJ
	B3UpbWJ8O7oM+l7bmWE3y86YDqSF8EisxztH7slREGUkLAacZNY/YFf4FXHvZH+0LsFhK+9tfsNLT
	Pp5GyJNRNUt24vs2gTHty3/ZIaF2D1nR3g6SolWbI4Meyvy5PtFEgxQIWVCA71z0XSKIhuGJZwVhQ
	os6IPos5sT80F+qSGqjdZiVZQ8Hnl150631rWuboGllGE+88tpttCGqbFkF5vhWmuEcYotrBCqvy7
	Ml6UaHn0Qz6rOGL17qgU24s13GnapVWRbme8FSXQ/iWUkWddOtgCWjKpNrZh+2EouAl6cVw+CAASP
	4YColCmD0lRXjAsArs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfCxM-008H5V-Rd; Fri, 15 Apr 2022 03:49:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfCxJ-008H2j-Ai
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 03:49:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 c12-20020a17090a020c00b001cba1ebb20cso7301088pjc.0
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 20:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hmXe1JnisYjIy8E3ctv5eLkxXX1YzruQ3DOG/Iu3yuw=;
 b=b/yYhWtksjk3exw7rSoqjIkeOofJYEP5CgsOJkjkYUZBZAFlAsRtUUFTgiUeVy3yKF
 AM1Ooe0GXd2xMR/8a8Qc8v5DRM3sq+IMC5BIa7jBY4ExR4mNjBS+kEla4kEER1WwKqCr
 mXLEupITf2Qkng+472V44axDCkP7C0RV089LF8BmqZ0XlGSpkTvBVPoWM9d5G654Ps8R
 J5YYf1JwO3g6Viwwm+1CeKXprslSbCNdriAPG/pv79bDLpQfoSZhbyMctp23K6F/P1Lp
 QAUzdCJvDatRxT8r9n4DhpxaLRVtFyR0luR2a5DaPIyCMLEJ2rD0ohp7/Fi/EDWamgae
 cXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hmXe1JnisYjIy8E3ctv5eLkxXX1YzruQ3DOG/Iu3yuw=;
 b=gQD3H2nY2mPBkcZZwQ0rZtDhot04lTQWRSZ6yJ0B+RvodweY1tFwuPmsbTgMCK3MQa
 acT1oXhQ9BTBS+Zu/mM+GI04r7Zx/UNnp6192bcoW8xyzqwiQnB9S1Sjr88MjSCSwHuk
 Scv/BGd4WE7gsryvO41i/tFsOpA9DhygG5nmImBuxKPONNj5oMo6cqLPwVHjD1qfpwug
 Ryjiv0rh18JqQ0SYX/xn23SVLr0sgPHklcchop5FYV2JTJvpxdruhSWW+ial87vBYooM
 JafnLOlSKqgRubh6hb7WXQtK4h+5HXY+wmoIUw9m4Aw+tdGaXiWNrsKTv06zyWeASjz1
 o2uw==
X-Gm-Message-State: AOAM531c9yLJ+ja3cVzVfA7R4DmOJzJsD1oN7crWoy52tu4YtoWRlbPo
 bXTyvuWaoQ5uKeBDGE2ynji6+qQFSC+JYQ==
X-Google-Smtp-Source: ABdhPJwG/IiJivi3KNf7cYN8eCaNCZZrwpo7X42fMk+AI66iUpJnCF7j8NSW42TdYA/40tUEUjVhzg==
X-Received: by 2002:a17:902:e891:b0:158:8b58:b94 with SMTP id
 w17-20020a170902e89100b001588b580b94mr15047555plg.161.1649994547585; 
 Thu, 14 Apr 2022 20:49:07 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm7426380pjb.25.2022.04.14.20.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 20:49:07 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] mtd: spinand: probe Winbond W25N01GV/W using param page
Date: Fri, 15 Apr 2022 11:48:44 +0800
Message-Id: <20220415034844.1024538-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415034844.1024538-1-gch981213@gmail.com>
References: <20220415034844.1024538-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_204909_400893_E7FAED01 
X-CRM114-Status: GOOD (  12.57  )
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

The JEDEC ID of EFAA21 is assigned to both W25N01G and W25N01K.
Probing the chip with JEDEC ID isn't reliable anymore. Use parameter
page instead.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Change since v1: none

 drivers/mtd/nand/spi/onfi.c    |  4 +++-
 drivers/mtd/nand/spi/winbond.c | 25 ++++++++++++++++---------
 include/linux/mtd/spinand.h    |  3 +++
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/onfi.c b/drivers/mtd/nand/spi/onfi.c
index 6d3a7e7c4f6e..45447112a96d 100644
--- a/drivers/mtd/nand/spi/onfi.c
+++ b/drivers/mtd/nand/spi/onfi.c
@@ -80,7 +80,9 @@ static bool spinand_onfi_validate(const struct nand_onfi_params *p)
 	return crc == le16_to_cpu(p->crc);
 }
 
-static const struct spinand_manufacturer *spinand_onfi_manufacturers[] = {};
+static const struct spinand_manufacturer *spinand_onfi_manufacturers[] = {
+	&winbond_onfi_spinand_manufacturer,
+};
 
 static const struct spinand_onfi_info *
 spinand_onfi_chip_match(struct nand_onfi_params *p,
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 76684428354e..601316c80b3e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -85,15 +85,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
-	SPINAND_INFO("W25N01GV",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa),
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+};
+
+static const struct spinand_onfi_info winbond_spinand_onfi_table[] = {
+	SPINAND_ONFI_INFO(SPINAND_ONFI_MODELS("W25N01GV", "W25N01GW"),
+			  SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+						   &write_cache_variants,
+						   &update_cache_variants),
+			  0,
+			  SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
@@ -125,3 +125,10 @@ const struct spinand_manufacturer winbond_spinand_manufacturer = {
 	.nchips = ARRAY_SIZE(winbond_spinand_table),
 	.ops = &winbond_spinand_manuf_ops,
 };
+
+const struct spinand_manufacturer winbond_onfi_spinand_manufacturer = {
+	.name = "Winbond",
+	.onfi_chips = winbond_spinand_onfi_table,
+	.nchips = ARRAY_SIZE(winbond_spinand_onfi_table),
+	.ops = &winbond_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index dc218082d773..610320b03773 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -268,6 +268,9 @@ extern const struct spinand_manufacturer paragon_spinand_manufacturer;
 extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
 
+/* SPI NAND manufacturers with ONFI parameter page support */
+extern const struct spinand_manufacturer winbond_onfi_spinand_manufacturer;
+
 /**
  * struct spinand_op_variants - SPI NAND operation variants
  * @ops: the list of variants for a given operation
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
