Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC7CC4742C
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2283206DD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnvTNJkp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sC18CI5/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iii8iIXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2283206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FdHUdYbOjTj9uNdmj/OrxQq7qSpek3Reln56G24h7GQ=; b=hnvTNJkpkSqWJ7UV3DQIQI+8H
	SarGa70zmvB6BF93ZvsKZppiLJGMJF66JwJnf6Xd25LUHG1nrEPeJ4wuxhdmxboRcL5wg023R2nsT
	7RN4u33gpkn9vYHBje1mNIRfWxpDlb0jkWG1vLfzAGS2onDTo7tSz9/qSF+SZ8tltG2YstpVjvttj
	QQ0R3nwZoHgGldF68BSueq1SSPeaQamhaVCwmDq3rwGUF6yK/IBLG7WBVpIMbR7OGTAhmx/hx/dkn
	sOb+CAXjep93V0KH8BjgpqNVtksAmkwHSjW2ZP6EBvVr6if6D1fZaWe3pNvI392U4v3cubC+6bXDp
	ZjzX1dZRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYgo-0003wm-La; Mon, 02 Nov 2020 12:11:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgm-0003p2-T4
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TuX3K0j4y5py35J7qAVJzMeaaIIyoaLFFbYRmFexlrI=; b=sC18CI5/IHTJ9+fbHkMP98HXpn
 28Slc55PLl9/L9fs6FNbLwdN4ZQDKdK0/K3sRpQD0VQVk2o1pW/IyzJuHIXcEHO2k+a55g9T/PMOQ
 vzfZ6WC3+GGFgOacDMt1yp7B2V8fWtpcp0K++mbskMDHdaiLy7eyPKRELTXqiDaACJCUCpQ4leydZ
 O9rvRkW0GMwOSQQPFeX5LckxkxFAZ977euSlPRF3ShB2zp7L6jNWmTl2I0yrN5D6cPoqBMblA6Ulj
 pBvVLi/hSHNABEFV/jZDoTRbvHMTtm3DF3GcQv4N1ZnB8QXpKIQM75RZQSe0Tp2OmrLrt/27mlpmG
 rhPR5ipg==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ2-0004uS-JX
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id k10so12906946wrw.13
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TuX3K0j4y5py35J7qAVJzMeaaIIyoaLFFbYRmFexlrI=;
 b=Iii8iIXFz3DaP8nBi80kVmkd0bNqhbz3hOwZ0JAgeSDj+ym7hsWQII9Jw99dOraG5X
 tmxMuDtVnQVfF/PgryImz3XyitN1xI+MWhG4G+QhCqazJ3M8NqVRYPKllLpURJQC7IIk
 /Qh8H948PpmTgd3wGCxyeMi2vptbnlJbf9qwudoND2ktnCrdyLw8x4+WPlOR92qfff6t
 MGEhk8463TPQkH84ONyGrS69oSglz3jJYZA2cRNSNV27dtyYwTifKXiNSySDjPBeKLkR
 ws9R3MpPV98EczJnIgIctrHj5l1A0fB06BS2qJKK/i4yF87MIxXSq1fci/XAsUrCkObp
 etSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuX3K0j4y5py35J7qAVJzMeaaIIyoaLFFbYRmFexlrI=;
 b=FM7Q+NActHrjqCn3YA+/SobZRKvfJ5DDG+95iQrQfIQuWGly4OwQAh+lP5v7C8ylt8
 3O2WHYLs2hSboA4s1jJTGLmW24h14BZlPN5wsNhFQDh9wG+YFoE/CLDI0iWwFPDrlSpE
 CoqpsQpjtpC/2+AGvgZO4/nxzqB/R8xLlOXZ0sUmnThLeZed/jM2BkzqTCHvMmKOlKZe
 0BHK4UMcpPUQibLOFQVyPwTIY1s0z0QsOTqYeoN25EuuprKW/bGPE0TfFYTNjv78AE0t
 KWuYWoqKEXDY8cgx+wa9NFP97ZYuKp18tcmpC8k3F424TuBjG+04BcvunGhGwzFg/Dse
 JQBg==
X-Gm-Message-State: AOAM5322+N9HpwRWIsopSVxZWkMsOyJjJpRq7C09zJpkaYmXqgbJdV38
 YDMk9jLAZyQSrp8YUIIAhnK2Z0TmrvC6Bw==
X-Google-Smtp-Source: ABdhPJwkwSPh4YydZUXKyXcEwuNF+QhoKqd2AVHhHg0i6w8Z0Q1QNhwf3X5qfyoPDuxKJ7tzrYvE7w==
X-Received: by 2002:a5d:4207:: with SMTP id n7mr19616409wrq.76.1604318077273; 
 Mon, 02 Nov 2020 03:54:37 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 19/23] mtd: nand: raw: omap2: Fix a bunch of kernel-doc
 misdemeanours
Date: Mon,  2 Nov 2020 11:54:02 +0000
Message-Id: <20201102115406.1074327-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115440_629209_6957A3B3 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jian Zhang <jzhang@ti.com>, Lee Jones <lee.jones@linaro.org>
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
index 4cc47ab7f01ad..b5a2d8971bfdd 100644
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
+ * @ecc_calc:	The ecc_code buffer
  *
  * Support calculating of BCH4/8/16 ECC vectors for one sector. This is used
  * when SW based correction is required as ECC is required for one sector
@@ -1274,7 +1275,7 @@ static int omap_calculate_ecc_bch_sw(struct nand_chip *chip,
  * omap_calculate_ecc_bch_multi - Generate ECC for multiple sectors
  * @mtd:	MTD device structure
  * @dat:	The pointer to data on which ecc is computed
- * @ecc_code:	The ecc_code buffer
+ * @ecc_calc:	The ecc_code buffer
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
