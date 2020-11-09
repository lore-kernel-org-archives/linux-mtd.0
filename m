Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9B3C388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:28:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1823520663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iAMUwsra";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDxwDos0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1823520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m0U7AHkcmqgMB9xyxvG+4Lp065Be46xfb7GFTvPis/s=; b=iAMUwsraOYpl2vFw4CZTRk7Tk
	Fnip/1UBPujQ8+MrcSbbqOkCarT67kxmQjOM91A3k4vqMmhJ0+5bIQU0G+/5ruEYnzT1ZQ5eV+rfQ
	mt0JE/K+DSS59GSvSBTD47idIyabdJw4q8qsl0XMzC63DjmCF3Hk46b737crovqMlln9oERFVc7AQ
	Kh8fHVNF5PF/3+YbdJ+T90h4L7FO5Jxv0zQhdJ4bl8f/rYx3H6AQOncczBVi5XIG1hnqPOsXpC6eX
	UiCc2PH/meW+2plHaH01b8KIZwD4aG+JRBE9DAayMq8CDyg2XzMGNnu6qYvPUwFRUXwE4nQejKz8p
	Wy4CIC42w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBsT-00037y-EF; Mon, 09 Nov 2020 18:26:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoc-00016T-1E
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:23:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id l1so5401166wrb.9
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+vNLwe5F16Z2TBJiX30i47rVXn5mHmSvb3WUTRtIMc=;
 b=IDxwDos0ZqyXaUBmX8kcKVFpfxXiUnyoyn8FO4jGl5UHzO5yZ4HZfVuTkc/T9PDm9G
 qrv/jg/JfJyTaspuL9X9Gr5MEwUrLHznOHHsMb+Zyktq+JH1sxpOozZVwXfNXKVC/ixj
 ve357FCE6UgYCsWZHawY1Tdr7onDrq8uMxtEzMeugxb5QND4NyqY25qDmQmjBOtBr3wt
 2A2CpCENAnHDNbPYtz3//dG0iBseKMSs+74zBO+MDI221fFg0txgIZBiDpcJdi8SpgA1
 duuT8VdM96odaPJ6LBorG83zVDmP1WqCKZkoc1tPSgS7Me31R7wbOKF6/4QiQCuUiFqm
 akHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+vNLwe5F16Z2TBJiX30i47rVXn5mHmSvb3WUTRtIMc=;
 b=kZZLTyhCoXPrQPJGIqfzMNQyGqXDdp1vJsDcU0910aSqtap6WtWpJ3DPT94XKRslws
 wlE5vqiOc9lzMhdVWsouOjPsJxmYD+tnKB9V6sNGSCW7PRhObz/gqkYpsTmx7AgROjw4
 u8hlA5/yAyjDv0m3vM01ED73nsOp+NuLKYnjLAAVMbCzxb2rjViOxJ+lnrNFkwcYQRb0
 hnGXpuqhOBY72GRrGvY32d8FYVUaARxAg+GDdaBGshJPCwuFuk09B1WsW25M0cPy3DGP
 ocrJ0IPMv4FPpnVKme71W8MOyhcrTx1M1OgBMZRn0Ah8JR2llbTVXCQLkOsur8HyloqG
 0mKA==
X-Gm-Message-State: AOAM5328Z943FC/cmE8FIaxkXfJOkqR77ir5CF6aaV3zARYdcF4E/DnO
 +DX55dzOpL3lrs0BfF58m9BmlcxWpYqpb/zy
X-Google-Smtp-Source: ABdhPJwlWC9twFBtFzruUjBpFp6whGUUQ1fu9D7vijyIxobnG+zIexFYe1UHFnSg3p8n1aCqNSOs1Q==
X-Received: by 2002:a5d:60c4:: with SMTP id x4mr20715233wrt.175.1604946172941; 
 Mon, 09 Nov 2020 10:22:52 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 22/23] mtd: onenand: Fix some kernel-doc misdemeanours
Date: Mon,  9 Nov 2020 18:22:05 +0000
Message-Id: <20201109182206.3037326-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132254_180922_FB355687 
X-CRM114-Status: GOOD (  19.24  )
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
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'mtd' not described in 'onenand_ooblayout_32_64_ecc'
 drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'section' not described in 'onenand_ooblayout_32_64_ecc'
 drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'oobregion' not described in 'onenand_ooblayout_32_64_ecc'
 drivers/mtd/nand/onenand/onenand_base.c:1436: warning: bad line:
 drivers/mtd/nand/onenand/onenand_base.c:1971: warning: Function parameter or member 'ops' not described in 'onenand_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:1971: warning: Excess function parameter 'len' description in 'onenand_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:1971: warning: Excess function parameter 'retlen' description in 'onenand_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:1971: warning: Excess function parameter 'buf' description in 'onenand_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:1971: warning: Excess function parameter 'mode' description in 'onenand_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:2156: warning: Function parameter or member 'block_size' not described in 'onenand_multiblock_erase'
 drivers/mtd/nand/onenand/onenand_base.c:2156: warning: Excess function parameter 'region' description in 'onenand_multiblock_erase'
 drivers/mtd/nand/onenand/onenand_base.c:2771: warning: Function parameter or member 'ops' not described in 'onenand_otp_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:2771: warning: Excess function parameter 'len' description in 'onenand_otp_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:2771: warning: Excess function parameter 'retlen' description in 'onenand_otp_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:2771: warning: Excess function parameter 'buf' description in 'onenand_otp_write_oob_nolock'
 drivers/mtd/nand/onenand/onenand_base.c:3387: warning: Function parameter or member 'mtd' not described in 'flexonenand_get_boundary'
 drivers/mtd/nand/onenand/onenand_base.c:3387: warning: Excess function parameter 'onenand_info' description in 'flexonenand_get_boundary'
 drivers/mtd/nand/onenand/onenand_base.c:3509: warning: Function parameter or member 'mtd' not described in 'flexonenand_check_blocks_erased'
 drivers/mtd/nand/onenand/onenand_base.c:3509: warning: Excess function parameter 'mtd_info' description in 'flexonenand_check_blocks_erased'
 drivers/mtd/nand/onenand/onenand_base.c:3557: warning: Function parameter or member 'die' not described in 'flexonenand_set_boundary'
 drivers/mtd/nand/onenand/onenand_base.c:3557: warning: Function parameter or member 'boundary' not described in 'flexonenand_set_boundary'
 drivers/mtd/nand/onenand/onenand_base.c:3557: warning: Function parameter or member 'lock' not described in 'flexonenand_set_boundary'

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/onenand/onenand_base.c | 36 +++++++++++--------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 9fca3988ee236..a9fdea26ea464 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -132,7 +132,7 @@ static const struct mtd_ooblayout_ops onenand_oob_128_ooblayout_ops = {
 	.free = onenand_ooblayout_128_free,
 };
 
-/**
+/*
  * onenand_oob_32_64 - oob info for large (2KB) page
  */
 static int onenand_ooblayout_32_64_ecc(struct mtd_info *mtd, int section,
@@ -271,7 +271,7 @@ static int onenand_page_address(int page, int sector)
  * @dataram1:	DataRAM index
  * @sectors:	the sector address
  * @count:		the number of sectors
- * @return		the start buffer value
+ * Return:		the start buffer value
  *
  * Setup Start Buffer Register (F200h)
  */
@@ -1433,7 +1433,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
  * @mtd:		MTD device structure
  * @from:		offset to read from
  * @ops:		oob operation description structure
-
+ *
  * Read main and/or out-of-band
  */
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
@@ -1958,11 +1958,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 /**
  * onenand_write_oob_nolock - [INTERN] OneNAND write out-of-band
  * @mtd:		MTD device structure
- * @to:		offset to write to
- * @len:		number of bytes to write
- * @retlen:	pointer to variable to store the number of written bytes
- * @buf:		the data to write
- * @mode:		operation mode
+ * @to:			offset to write to
+ * @ops:                oob operation description structure
  *
  * OneNAND write out-of-band
  */
@@ -2146,7 +2143,7 @@ static int onenand_multiblock_erase_verify(struct mtd_info *mtd,
  * onenand_multiblock_erase - [INTERN] erase block(s) using multiblock erase
  * @mtd:		MTD device structure
  * @instr:		erase instruction
- * @region:	erase region
+ * @block_size:		block size
  *
  * Erase one or more blocks up to 64 block at a time
  */
@@ -2759,10 +2756,8 @@ static int onenand_otp_command(struct mtd_info *mtd, int cmd, loff_t addr,
 /**
  * onenand_otp_write_oob_nolock - [INTERN] OneNAND write out-of-band, specific to OTP
  * @mtd:		MTD device structure
- * @to:		offset to write to
- * @len:		number of bytes to write
- * @retlen:	pointer to variable to store the number of written bytes
- * @buf:		the data to write
+ * @to:			offset to write to
+ * @ops:                oob operation description structure
  *
  * OneNAND write out-of-band only for OTP
  */
@@ -3380,9 +3375,9 @@ static int onenand_check_maf(int manuf)
 }
 
 /**
-* flexonenand_get_boundary	- Reads the SLC boundary
-* @onenand_info:		- onenand info structure
-**/
+ * flexonenand_get_boundary	- Reads the SLC boundary
+ * @mtd:		MTD data structure
+ */
 static int flexonenand_get_boundary(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
@@ -3493,9 +3488,9 @@ static void flexonenand_get_size(struct mtd_info *mtd)
 
 /**
  * flexonenand_check_blocks_erased - Check if blocks are erased
- * @mtd_info:	- mtd info structure
- * @start:		- first erase block to check
- * @end:		- last erase block to check
+ * @mtd:	mtd info structure
+ * @start:	first erase block to check
+ * @end:	last erase block to check
  *
  * Converting an unerased block from MLC to SLC
  * causes byte values to change. Since both data and its ECC
@@ -3548,9 +3543,8 @@ static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int
 	return 0;
 }
 
-/**
+/*
  * flexonenand_set_boundary	- Writes the SLC boundary
- * @mtd:			- mtd info structure
  */
 static int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 				    int boundary, int lock)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
