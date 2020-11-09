Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270E5C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFEE20663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jReZYR43";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fowc4nWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFEE20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qYFXGHJ+seoQipdoVZO+eC0JavciE+RxMUNfbt8cpEk=; b=jReZYR43j2VIx2yIC+0hw5+Md
	po9nvhpu667XUMJyOlc1f5Dwto1v01n03SIvmVQeeM923ujl2/NewnVSSfIR65kCbrbXWvzaMgKzX
	rfAbS3KOPRvstTM3pJe7pKvOa0jYg1bIr3nObOtrMkv6iRnSXtuPOmNEBGASiU0627txAfCwWdmmS
	BqSFSzGST0pul9nvdFbzxD0F3XnorLgpXbmOeHJYztrUw862QDOT7kRnOKA9chN4aRR1dfPLPiwtI
	c15/E1ZGjmthFUi0jB1DD6/K/DEpHQsuocmFdSaKcZ/pFqJ6X9MmuWtwBGbsp8kqiR/55g5RnNhbz
	70iS//zlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBri-0002kJ-2B; Mon, 09 Nov 2020 18:26:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoW-00014B-S8
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:23:01 +0000
Received: by mail-wr1-x441.google.com with SMTP id r17so5895445wrw.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9e594iGsPQazHtR8mr0tF4GNyBoavTbOlvYUU648dY=;
 b=Fowc4nWIl5UjfkRn1KnlXrVSIhCsQvwnyUJUB8dRFS033HoYYZsVbJCQp2FL/nW24N
 5ftinzvGbPsxHO6fOkiDCp5ivHx2mvHosErMhnQHv/Wuq2/GYBgs80xokPb+20OlfEzr
 +FHNhNcL3RNUiKUw4Hz5q9iSekIBsMvDX6H6U8K2WZpIdrKoIKYBO2lzPa6CNIQ2mO/S
 ZNO+Fi6NhxmPWJqrNrlMJnhL5uiADzl56VGSrPt6EembETnexf2swYXdO6DgSyboAa4a
 OmKwsq8Jq/7P4qczzbb/g7ogknbNqLtoTo/wq1gvzxyFgAWtm6skrKgqnqk0jNMXFjit
 LHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9e594iGsPQazHtR8mr0tF4GNyBoavTbOlvYUU648dY=;
 b=iWbrWspVbwYA9zESjSlmYTeib41MPHgBF0c6HRJhbSynesoK2kEGJ66fLFMLMOwzfC
 Vi8soE/4Lqy4NXau+sX88I8pcKxFR6dWkhxzv0+rSdsGeBUYfovdiaWEIMStNniNS6Xk
 HoJV/OwBlkORJwy56EAiMYlWNKnSk9mjPFFuIjyKHADkt9ZGLoevZ/Q0/g2I8gEMcASf
 BAHI6GUeanh+Q6/7Qb7Tk6upJLWPJRpDADtDIuOmE9+YQAR51aAiEaIHrkIUbEq+G7oi
 pfvv0subaOdLjt0+toKVz+k6jsd7gwt0UfYAeYWRwAwr+xjC/7dwscuwrtmfjLGvpETm
 yJDw==
X-Gm-Message-State: AOAM533VNJzFLc22dQ0BJ7/plqwPymRgxFito2GkCxN6wq1CpItNJVIz
 9TJnZFHrxuG2q4Foyyq1MGCl1A==
X-Google-Smtp-Source: ABdhPJxmIJ9Ax6XRUDE0G/dCChXRGe/fAYbAJyqkQ7mX0pIyla0LsBqdxXqXoQObZe3CXyXscaCGkQ==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr20471487wrn.73.1604946167786; 
 Mon, 09 Nov 2020 10:22:47 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 19/23] mtd: rawnand: omap2: Fix a bunch of kernel-doc
 misdemeanours
Date: Mon,  9 Nov 2020 18:22:02 +0000
Message-Id: <20201109182206.3037326-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132249_070227_D04AB407 
X-CRM114-Status: GOOD (  17.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jian Zhang <jzhang@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/omap2.c:191: warning: Function parameter or member 'info' not described in 'omap_prefetch_enable'
 drivers/mtd/nand/raw/omap2.c:221: warning: Function parameter or member 'cs' not described in 'omap_prefetch_reset'
 drivers/mtd/nand/raw/omap2.c:221: warning: Function parameter or member 'info' not described in 'omap_prefetch_reset'
 drivers/mtd/nand/raw/omap2.c:946: warning: Function parameter or member 'chip' not described in 'omap_enable_hwecc'
 drivers/mtd/nand/raw/omap2.c:946: warning: Excess function parameter 'mtd' description in 'omap_enable_hwecc'
 drivers/mtd/nand/raw/omap2.c:1017: warning: Function parameter or member 'chip' not described in 'omap_dev_ready'
 drivers/mtd/nand/raw/omap2.c:1017: warning: Excess function parameter 'mtd' description in 'omap_dev_ready'
 drivers/mtd/nand/raw/omap2.c:1036: warning: Function parameter or member 'chip' not described in 'omap_enable_hwecc_bch'
 drivers/mtd/nand/raw/omap2.c:1036: warning: Excess function parameter 'mtd' description in 'omap_enable_hwecc_bch'
 drivers/mtd/nand/raw/omap2.c:1142: warning: Function parameter or member 'ecc_calc' not described in '_omap_calculate_ecc_bch'
 drivers/mtd/nand/raw/omap2.c:1142: warning: Excess function parameter 'ecc_code' description in '_omap_calculate_ecc_bch'
 drivers/mtd/nand/raw/omap2.c:1270: warning: Function parameter or member 'ecc_calc' not described in 'omap_calculate_ecc_bch_sw'
 drivers/mtd/nand/raw/omap2.c:1270: warning: Excess function parameter 'ecc_code' description in 'omap_calculate_ecc_bch_sw'
 drivers/mtd/nand/raw/omap2.c:1284: warning: Function parameter or member 'ecc_calc' not described in 'omap_calculate_ecc_bch_multi'
 drivers/mtd/nand/raw/omap2.c:1284: warning: Excess function parameter 'ecc_code' description in 'omap_calculate_ecc_bch_multi'
 drivers/mtd/nand/raw/omap2.c:1681: warning: Function parameter or member 'info' not described in 'is_elm_present'
 drivers/mtd/nand/raw/omap2.c:1681: warning: Function parameter or member 'elm_node' not described in 'is_elm_present'
 drivers/mtd/nand/raw/omap2.c:1681: warning: Excess function parameter 'omap_nand_info' description in 'is_elm_present'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Jian Zhang <jzhang@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/omap2.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4cc47ab7f01ad..fbb9955f24671 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -184,6 +184,7 @@ static inline struct omap_nand_info *mtd_to_omap(struct mtd_info *mtd)
  * @dma_mode: dma mode enable (1) or disable (0)
  * @u32_count: number of bytes to be transferred
  * @is_write: prefetch read(0) or write post(1) mode
+ * @info: NAND device structure containing platform data
  */
 static int omap_prefetch_enable(int cs, int fifo_th, int dma_mode,
 	unsigned int u32_count, int is_write, struct omap_nand_info *info)
@@ -213,7 +214,7 @@ static int omap_prefetch_enable(int cs, int fifo_th, int dma_mode,
 	return 0;
 }
 
-/**
+/*
  * omap_prefetch_reset - disables and stops the prefetch engine
  */
 static int omap_prefetch_reset(int cs, struct omap_nand_info *info)
@@ -938,7 +939,7 @@ static int omap_calculate_ecc(struct nand_chip *chip, const u_char *dat,
 
 /**
  * omap_enable_hwecc - This function enables the hardware ecc functionality
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @mode: Read/Write mode
  */
 static void omap_enable_hwecc(struct nand_chip *chip, int mode)
@@ -1008,7 +1009,7 @@ static int omap_wait(struct nand_chip *this)
 
 /**
  * omap_dev_ready - checks the NAND Ready GPIO line
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  *
  * Returns true if ready and false if busy.
  */
@@ -1021,7 +1022,7 @@ static int omap_dev_ready(struct nand_chip *chip)
 
 /**
  * omap_enable_hwecc_bch - Program GPMC to perform BCH ECC calculation
- * @mtd: MTD device structure
+ * @chip: NAND chip object
  * @mode: Read/Write mode
  *
  * When using BCH with SW correction (i.e. no ELM), sector size is set
@@ -1130,7 +1131,7 @@ static u8  bch8_polynomial[] = {0xef, 0x51, 0x2e, 0x09, 0xed, 0x93, 0x9a, 0xc2,
  * _omap_calculate_ecc_bch - Generate ECC bytes for one sector
  * @mtd:	MTD device structure
  * @dat:	The pointer to data on which ecc is computed
- * @ecc_code:	The ecc_code buffer
+ * @ecc_calc:	The ecc_code buffer
  * @i:		The sector number (for a multi sector page)
  *
  * Support calculating of BCH4/8/16 ECC vectors for one sector
@@ -1258,7 +1259,7 @@ static int _omap_calculate_ecc_bch(struct mtd_info *mtd,
  * omap_calculate_ecc_bch_sw - ECC generator for sector for SW based correction
  * @chip:	NAND chip object
  * @dat:	The pointer to data on which ecc is computed
- * @ecc_code:	The ecc_code buffer
+ * @ecc_calc:	Buffer storing the calculated ECC bytes
  *
  * Support calculating of BCH4/8/16 ECC vectors for one sector. This is used
  * when SW based correction is required as ECC is required for one sector
@@ -1274,7 +1275,7 @@ static int omap_calculate_ecc_bch_sw(struct nand_chip *chip,
  * omap_calculate_ecc_bch_multi - Generate ECC for multiple sectors
  * @mtd:	MTD device structure
  * @dat:	The pointer to data on which ecc is computed
- * @ecc_code:	The ecc_code buffer
+ * @ecc_calc:	Buffer storing the calculated ECC bytes
  *
  * Support calculating of BCH4/8/16 ecc vectors for the entire page in one go.
  */
@@ -1673,7 +1674,8 @@ static int omap_read_page_bch(struct nand_chip *chip, uint8_t *buf,
 
 /**
  * is_elm_present - checks for presence of ELM module by scanning DT nodes
- * @omap_nand_info: NAND device structure containing platform data
+ * @info: NAND device structure containing platform data
+ * @elm_node: ELM's DT node
  */
 static bool is_elm_present(struct omap_nand_info *info,
 			   struct device_node *elm_node)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
