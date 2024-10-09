Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A98CCEDD8F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hI/wFRz8Xs5ZRCRip3adWpB4g0cakRLswgtsX19Cirs=; b=n2ZJdy6XzEsE4m
	zrBBUYGCq5XdJwRN9ZHHQeVAqjg2yDBEfuyVfdYGMQeGf6RriKq339hRF6Uhdn/PW3fkB/cxPXGE/
	cnd6cOmqzWF0LuHHCUBo2M1NIHguRGAOQzaajaspD6mdxBL7OLJ5+CqhYt7R/FMMfUrr/nWDS0ncp
	doPS5zklK8gHC2f+CdFdVcYtTPFsdyaPIRhg262qTcdBTv0Ae3t5vX6pCWqd6WdXgdq8vvCqH12Ru
	J0MWyWM4CFRM3rnaQoKD0teAiOIPHLp+k7lWy9AQ1LDSJBF3kfPKcxsoFuFxQioW044Ubvki68ryA
	cfc5omtn2YxTP1JytCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8x-00000009HoU-46pA;
	Wed, 09 Oct 2024 12:50:19 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8o-00000009HfI-0zGY
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 12:50:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 289D61C0010;
	Wed,  9 Oct 2024 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728478206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j58tUS4RsMkK957S9Ourhgng3aiA7Gu/7uvmChWQbgQ=;
	b=N7+kA7jBj3vkCR6BIVf2N/D1Mb1rzqbLdzBJYECo7wZTkXkiNBsI/o5Grp6JBn5m8l1HQ1
	EIdfeX3whiBSPb8kyjXunKXNHmj58jdUWcRDzYgmwbzX1hTviq5DSL4aBUoBIYKctMVNWt
	7xRybNVxED7C5XRdJHDdScYdv6Nz6sHz1Qluh0+OV9k12WMU9k2H6YrJ1IEDP6BHtyT9C6
	fLubaFsUcp6+g7vx4suBp5wJCU862a37SAflGc986W2YsDw1vvWgGIDn2PHGNTiur+pR6x
	FGbdPc0H+xRb+jx7z//UIh70MyRAqhJqvx0CWvmeCVqq3XfOC2jklcFVZpBluw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/4] mtd: spi-nand: winbond: Sort the devices
Date: Wed,  9 Oct 2024 14:50:02 +0200
Message-ID: <20241009125002.191109-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-1-miquel.raynal@bootlin.com>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055010_667616_74A08F97 
X-CRM114-Status: GOOD (  10.21  )
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

Use alphabetical order, not because it's pretty, but because it makes
sense. This way the devices are listed by density, and then by hardware
feature set. Add comments to make the list more understandable.

There is no intended functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 112 +++++++++++++++++----------------
 1 file changed, 58 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index a987df1755c6..e472d0f692c2 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -144,7 +144,46 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 }
 
 static const struct spinand_info winbond_spinand_table[] = {
-	SPINAND_INFO("W25M02GV",
+	/* 512M-bit densities */
+	SPINAND_INFO("W25N512GW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x20),
+		     NAND_MEMORG(1, 2048, 64, 64, 512, 10, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	/* 1G-bit densities */
+	SPINAND_INFO("W25N01GV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x21),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	SPINAND_INFO("W25N01GW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x21),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	SPINAND_INFO("W25N01JW", /* high-speed 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	/* 2G-bit densities */
+	SPINAND_INFO("W25M02GV", /* 2x1G-bit 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xab, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 2),
 		     NAND_ECCREQ(1, 512),
@@ -154,34 +193,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
-	SPINAND_INFO("W25N01GV",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x21),
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N02KV",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
-	SPINAND_INFO("W25N01JW",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N02JW",
+	SPINAND_INFO("W25N02JW", /* high-speed 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
@@ -190,16 +202,16 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N512GW",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x20),
-		     NAND_MEMORG(1, 2048, 64, 64, 512, 10, 1, 1, 1),
-		     NAND_ECCREQ(1, 512),
+	SPINAND_INFO("W25N02KV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N02KW",
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
@@ -208,25 +220,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
-	SPINAND_INFO("W25N04KW",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
-		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
-	SPINAND_INFO("W25N01GW",
-		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x21),
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
-	SPINAND_INFO("W25N04KV",
+	/* 4G-bit densities */
+	SPINAND_INFO("W25N04KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
@@ -235,6 +230,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N04KW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
