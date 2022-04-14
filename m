Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E452C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRG1y/zJNbTmKca/Crolu2jHRKGbYT+qr2aEIV52j58=; b=uO3GHcjkK+TkwR
	OeaS9BE7UBTCGVW6UcaMPnECrxiK3+XzJ5F6PkvZyL2oj86rZkeBhMl3NpvZgzm0h6tXbCI+ZSN/K
	gy2IyE2zB//6CSmP/+I2j9VLiLz/2GLhZgBTh/9i3XtYouKxiVXepQ7tK7r4qZNM0C/GmfoHdANSX
	I8Tb0wFlg8TgGI0E+Fb1JfBXYp9Dgq7DeJF0qNAf/T2oMfyyG1B5Ye8DGE6/xZhxea14AHxcIM+us
	HWfh4HwpJ0s7/PLQxN7sshjX2l2Qirlee3zNPM/SlDfrCVdNpWX6Lta2e4jHfB334PUZVQNAXIxF6
	QepDrjCb8ehK+AWyc2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf0Yd-0061f9-CY; Thu, 14 Apr 2022 14:34:51 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf0Ya-0061c5-6u
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 14:34:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id s137so4935302pgs.5
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8XpPS8fF6//JWfsSd8RX2fW6+WaMSPbmBOhZGi8MbQ=;
 b=jx2Nrf2VkS8q76IMPSON7sYZumK4VxWREXX+8G8xMt0+IvbBEkw28ugTypfP52JZU+
 kPl43iO94PcgSFCd5MbuFZw/nWXCXCGJtGJfFZeXdctU46OqDsNjSmkJG493x5tFwsFm
 pnYkQFt/b6NHNwsYP48D8e+uju9FirrxS6WA2EZPt4HUMba+fDeRY7bOlcD15rDnEtaS
 NCYD7lm+BuSYz8FNYYizuPLVDtWXkVjPsV4p39/PGezqC30DFTgHDNuoWnRrI1bHJjVK
 juG6/AkukOFByjK25Vex48lwNP0kt8dWUTiRJ0RK2TlUdpMjF5iltfoyjN2ZjCiQhl35
 f1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J8XpPS8fF6//JWfsSd8RX2fW6+WaMSPbmBOhZGi8MbQ=;
 b=fK4NVIgIOdUDdVRx/2uj5T5WY3NeynRTfYJ2FWbpRO5cHRl4UL5Q39t664sw1iTFd7
 TlUo4XmxxHPwcT9sGgj/Xx0wBi3Jm34MGLPlsE8NPp4sU20xGFs28SdRvdLkOvEk6789
 2+ONoyhm0JvcdOJsRnkuGcwCIWlHsmlboi9JloAk1HKQVal1hSltIg+sMvPK1ldUxCnW
 6iXbLtEONUrg9QQer2Dp1Rqrpcl94wQiM+Wkwu3uC1UFhgGcUBv/J1uF6IaDguzHsbwD
 v4CHjhg/4q6Q2FrRrmL9s8ccQ8L31anadcHvR5RLWeZZIi9BYSc+cdAzn2ZOsAhc7lyH
 IAyg==
X-Gm-Message-State: AOAM531zA/NQBJLbFsD1szsbDcosNApLltWWWpvLVOemPsITQ1wL1OVs
 ZB/55NnL9sRDREd1/nHz8BFgqzAXMiwB0Fvy
X-Google-Smtp-Source: ABdhPJxg6LkhK/f+4dkzBNst6mLyHzIY5tyPpKXHH/ea82lbmQG9WigxzTBaAvxHsT91GmLMfKHTnA==
X-Received: by 2002:a05:6a02:206:b0:399:3c9:f465 with SMTP id
 bh6-20020a056a02020600b0039903c9f465mr2640670pgb.388.1649946885024; 
 Thu, 14 Apr 2022 07:34:45 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a17090ac50500b001cd5ffcca96sm4411017pjt.27.2022.04.14.07.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:34:44 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: spinand: probe Winbond W25N01GV/W using param page
Date: Thu, 14 Apr 2022 22:34:26 +0800
Message-Id: <20220414143426.723168-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414143426.723168-1-gch981213@gmail.com>
References: <20220414143426.723168-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_073448_295199_1D03C2B6 
X-CRM114-Status: GOOD (  12.75  )
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
 drivers/mtd/nand/spi/onfi.c    |  4 +++-
 drivers/mtd/nand/spi/winbond.c | 25 ++++++++++++++++---------
 include/linux/mtd/spinand.h    |  3 +++
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/onfi.c b/drivers/mtd/nand/spi/onfi.c
index 5cc888e3d038..27484e0cd22d 100644
--- a/drivers/mtd/nand/spi/onfi.c
+++ b/drivers/mtd/nand/spi/onfi.c
@@ -141,7 +141,9 @@ static void nand_bit_wise_majority(const void **srcbufs, unsigned int nsrcbufs,
 	}
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
