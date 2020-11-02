Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703F1C4742C
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:00:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F28223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G3I1thw7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zOqV3h84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F28223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AXJ2M9QIZa03KB7S3CdjaRpI5issr7an+0WBpvPoQs8=; b=G3I1thw733mk8Gm8POuX3xUjA
	NzhFVKMenuDDv0KryDfdWLz+Dm7NL3htm/MSl4xl4gEx3p7TP0scIbMb7woiSWYrxcEL9Z6ewsqv0
	6uY93MUA9G/auKNt/RvXZzR/Cx47FvrhHO+TWsoLr2kyHAbPjZcqIZ4LQkhpJD48bZiR40qAeXlr4
	Pxw6Ck4alq6zTQ5Kicb3VDr+k5UaHshQwHZDxSolDszd7N3l4BV1ZfBwm4Q7tB2hI7ZPlcuMTfzeh
	vJLL3sRplpK/kRmVSI/nxWjlljxEKLen98pWhlIFJ9qjlrkO65wIUl0Qd2rZOuHiTRJoOOTBbNRtl
	s2GJutAtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYUY-0000Mt-2q; Mon, 02 Nov 2020 11:59:18 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ6-00023J-5y
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:54 +0000
Received: by mail-wm1-x342.google.com with SMTP id k18so9213252wmj.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHW6hv3HQDhXKb7Tcc3axGr3ISjQx/RmYNs9PyUPWj4=;
 b=zOqV3h84h029TT5fJvetDC+KOHjw7I73frFXei4HPfT9kMBV6k87o3mJu6HyXOLp5j
 1FCKrFdGkqRSw6lHtre/f9wzjrgRhsrXQhdw/mNXOE84Pd5/53U8zTNyjA4GE9CT77yr
 te+T5YjreoGpTEih+OIN0oNqcvHvmvJIHznh0vrgl0Owj9DOGPHZHQIz1xbEpcy9L4GJ
 oYNHWR6RBdETZvYKqkcepncxc1bVx+19tzC8ufVduy+G9AhtsxWJXGljFwNesOp4WhLW
 cGAP2NC19m5JgDW3fKlWPM+1VwzuBAfk38ZfDfAd60uR0UZt6UIn/eSZcgS6C5RTtZGt
 0c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHW6hv3HQDhXKb7Tcc3axGr3ISjQx/RmYNs9PyUPWj4=;
 b=OeLm87cLlyeH/XjpXexDuKrv0LZ8k7QV0kXz4W0oTz6D+gD7AYbjdG/l4XM9fT3TPJ
 f+trHxSDuvWFN87KP0pUhe+5VVyxlZlmBT9pxU5sDLlvoukGi7Z0SHkiUXPssUDNymBa
 cDu+/Zyhb1/PhghWVGNYt1XuZDgHPZ3ey22+hlGBtzAc3hUf/iyZ+NmHVqvL58chOeSw
 bAAnaYshX9Wx9a92rFeYEjTahWiBZqlnYOWZNlLI3FLzEiyrYLQPz3FDoaJ/OWl3bcpt
 +wWqMpP7vCFNr4S8BnwM4CtWUwAz3upuoX3o48Kz7pE5UjRRcUNRt8F4cXxwtLeovsYn
 QIhg==
X-Gm-Message-State: AOAM531ProAhyZbu2xa9tb25S63hh9rt/+SCa4qVXrfR6Kw9AbwBocb2
 fV5XjqZFwUlfa2S+PN1I/Y9w8g==
X-Google-Smtp-Source: ABdhPJzL7VS6H+GFjoiylbSU4BHxRU7+xCN+rhO9bKEOfTW57Gr+2WQ+gOc4bmpja0a6RXHx0h7zkA==
X-Received: by 2002:a1c:df89:: with SMTP id
 w131mr16752508wmg.164.1604318080867; 
 Mon, 02 Nov 2020 03:54:40 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 22/23] mtd: nand: onenand: onenand_base: Fix some kernel-doc
 misdemeanours
Date: Mon,  2 Nov 2020 11:54:05 +0000
Message-Id: <20201102115406.1074327-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065442_422361_59573C5D 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'mtd' not described in 'onenand_ooblayout_32_64_ecc'
 drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'section' not described in 'onenand_ooblayout_32_64_ecc'
 drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'oobregion' not described in 'onenand_ooblayout_32_64_ecc'
 drivers/mtd/nand/onenand/onenand_base.c:279: warning: Function parameter or member 'dataram1' not described in 'onenand_buffer_address'
 drivers/mtd/nand/onenand/onenand_base.c:279: warning: Excess function parameter 'dataram' description in 'onenand_buffer_address'
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
Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/onenand/onenand_base.c | 38 +++++++++++--------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 35f851bf90a3c..a9fdea26ea464 100644
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
@@ -268,10 +268,10 @@ static int onenand_page_address(int page, int sector)
 
 /**
  * onenand_buffer_address - [DEFAULT] Get buffer address
- * @dataram:1	DataRAM index
+ * @dataram1:	DataRAM index
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
