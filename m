Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125BAC87FD3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmtoKlbcEqySD4FPDFFiIs1MRcCJbIGhgmkiut2Lwno=; b=VGFoQ/ZgaJAYpY
	2Nx4VDYh11NfLVZUd9ylPMH68CSlFoEz4ZLh9NhSNZrcYf+S4yqXcxLCrDTet/5HtMnRo0WOcMduS
	MBuaoiOh9NXcyDvjXgAPcowzArQ5iYlCzE4uTQMTEdM0QlDIvzPjdskNOXlAnRrnVaNyKx7q0XjFO
	UZ53vDR7wjGfPcmMN7gp4pgVO8UCJ4FqObtO85M98PparsEGNrNSUGVUVuUFqSUptAvNeX7yHq3/i
	vgN2Cv+ZeUMUaHrEJCGZRtTcfp034wNIGOY4VOv8sR5XNjFromxJwfZNJkDE7YAnYBPC8CHoU6RYx
	BDHLvCHZA88q6mkuJXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJqY-00000002VBz-3UME;
	Fri, 08 Aug 2025 09:57:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJqW-00000002VBL-2x4k
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 09:57:09 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-31ee880f7d2so2324644a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754647028; x=1755251828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OVTgABZH1eW9cOhxAzGHFpTTStHmIxA1l5/HnxfnLs=;
        b=WxzObYa+yXyHfhvlw/GZvl+8MLS7/mH4aNgtVyTEURu/H5WkSNcOqB4UsYRsOM8HPq
         5HQ+51g6Y3PrBLeZp4EaqXSDluLpxmNFE+fljLeGo3iWDdLBQwGY7gUCq7Z+FaoHACCR
         XyJTRQfjA69K2UPrX6u8HGNa3rvjablM3MMya3OWELpJf0YV8LJQNLwtm+gK9bssQY2L
         i2D6XkWxsWmmS7D5FF+ItQIHhbrGIV0q2UbTh0AWvuOjR8snZpvwXfLk2PClLkKc8K3O
         wZ7pJ8Wcd/6Z+pOwMnNA6CE96DNRibo9q4mQh5jdUi7vKvsHRILjaSzg206FFyuv1r6g
         SAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754647028; x=1755251828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OVTgABZH1eW9cOhxAzGHFpTTStHmIxA1l5/HnxfnLs=;
        b=qU3DBSSVF8qTL+p3CrqTd9lKALD2SMRE1jww42zXk180TrZe9+iqMlZCFpxeWmUlEP
         Z7CqSlQazHP49WobUEuP/+QzPFxQEpjvSvKJDeWhonPOIX7lPyy1im56xKUtTM7WOsWk
         +/HNvw5wvtS+iqWEVJ7g9+VKVUwkpCBsTAKyZjBdLT+tpaALHAl93m0G/kHFif95W/2k
         nc3drqA/03kTAtWl1SG2Tz8LmYOf89vgUAMdBJSbx3uy1RH8jNBZ0q1KwouzXZub41Yv
         P7pOebfdl4NhpxoexUTpFVLf1TcJ4uWistUXBN0a/7EP0sxAZWddelI3pLwMxyxsaEU+
         021Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSRsO6qrQ8jVXFZnQ5qLEzTsVHxPTzVRnyvGuzKPzaUCHvwtLJvNcbbHlZyzjmZ39YC1KH6N72dO4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJ2NGeYxMHTsreIKQpwx0WuClahTpmik3E43rMmARfKTzvH4v
	6TsQ1MEzQvgCQqKJ126aBq/amw8tyIfoGuv+knqJStRZtVjaHfpwVe8w
X-Gm-Gg: ASbGncsJOCTm4bKuuA90v2+xyFM058LkcCx17UzVtfLMsOU4QuEO2aUqBXLFj6rcfrS
	+SKUNaKvoUIG1IzyE8BGbYywnD4mOHneqYgWPowogr6q3etZEuH2BjrU+XUtC60jBR8kHw5hNpE
	kmnmPI/BeoTVjOf7Q6pLr2N8GYkak284wlmjmSpKWoPQsxDVxAe6gPvCTpywbonmeFfPHT6hvBo
	gepqRoH8GueB9NbRwLnAso3l8WInQH1R8c79r502KaKksOxP1QrDCkA+tT0gCk7D2s3vmL/qajo
	zUBzSbv6WltCkhS7QLScYhdNoEeFrKY26sfdh4L2mkbYvQHw/FvVQb30fGqvXVW/mYOzWeDZXrb
	gpD+RWFF384iQi2tBqTxJsfuDS0nIPFf+q0QGI4yrmk+vhccl3Ok=
X-Google-Smtp-Source: AGHT+IGDJdzPEqI+NrI+BZKZRyH15rqS8CWsZNaelZV3fAi4K16ew+DBUD9XLeBVmI1G95AZ80Oh1Q==
X-Received: by 2002:a17:90b:5104:b0:31e:998f:7b75 with SMTP id 98e67ed59e1d1-321839e51c9mr3522987a91.9.1754647027985;
        Fri, 08 Aug 2025 02:57:07 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bacbb74sm17375439a12.42.2025.08.08.02.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 02:57:07 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 11509804B8;
	Fri,  8 Aug 2025 18:02:37 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
Date: Fri,  8 Aug 2025 17:55:03 +0800
Message-Id: <20250808095503.906244-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808095503.906244-1-linchengming884@gmail.com>
References: <20250808095503.906244-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025708_743549_9A252119 
X-CRM114-Status: GOOD (  13.53  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Enable randomizer function by specific flowchart to set the default value
of RANDEN to 1.

Randomizer introduces two new DT properties for child nodes to configure
the randomizer functionality and coverage options.
 - mxic,enable-randomizer-otp: Specify whether to activate the randomizer
                               feature.
 - mxic,randopt: Define the randomizer area per page.

The penalty of randomizer are subpage accesses prohibited and more time
period is needed in program operation and entering deep power-down mode.
i.e., tPROG 320us to 360us (randomizer enabled).

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 94 +++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index edf63b9996cf..5354b1894bb4 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -14,6 +14,10 @@
 #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
 #define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
 #define MACRONIX_CFG_CONT_READ         BIT(2)
+#define MACRONIX_CFG_ENPGM BIT(0)
+#define MACRONIX_CFG_RANDEN BIT(1)
+#define MACRONIX_CFG_RANDOPT BIT(2)
+#define MACRONIX_FEATURE_ADDR_RANDOMIZER 0x10
 #define MACRONIX_FEATURE_ADDR_READ_RETRY 0x70
 #define MACRONIX_NUM_READ_RETRY_MODES 5
 
@@ -155,6 +159,66 @@ static int macronix_set_read_retry(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
+static int macronix_set_randomizer(struct spinand_device *spinand)
+{
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct device_node *dn = nanddev_get_of_node(nand);
+	int rand_dt, randopt, ret;
+	u8 cfg, status, check;
+
+	rand_dt = of_property_read_bool(dn, "mxic,enable-randomizer-otp");
+	if (!rand_dt)
+		return 0;
+
+	ret = spinand_read_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, &cfg);
+	if (ret)
+		return ret;
+	if (cfg)
+		return 0;
+
+	cfg = MACRONIX_CFG_ENPGM | MACRONIX_CFG_RANDEN;
+	randopt = of_property_read_bool(dn, "mxic,randopt");
+	if (randopt)
+		cfg |=  MACRONIX_CFG_RANDOPT;
+
+	ret = spinand_write_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, cfg);
+	if (ret)
+		return ret;
+
+	ret = spinand_write_enable_op(spinand);
+	if (ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &exec_op);
+	if (ret)
+		return ret;
+
+	ret = spinand_wait(spinand,
+			   SPINAND_WRITE_INITIAL_DELAY_US,
+			   SPINAND_WRITE_POLL_DELAY_US,
+			   &status);
+	if (ret)
+		return ret;
+
+	if (status & STATUS_PROG_FAILED)
+		return -EIO;
+
+	ret = spinand_read_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, &check);
+	if (ret)
+		return ret;
+	if (check != cfg)
+		return -EIO;
+
+	cfg &= ~MACRONIX_CFG_ENPGM;
+	ret = spinand_write_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -213,7 +277,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -225,7 +290,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -236,7 +302,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -248,7 +315,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -259,7 +327,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -305,7 +374,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -317,7 +387,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -355,7 +426,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -367,7 +439,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -413,7 +486,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+			 SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF1GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
