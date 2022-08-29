Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0311ECAAD2
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Aug 2022 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHQjXxUU2HTENak/4YXbkflhg5irE8V+wj8aiI0BBxE=; b=cJ4VdxdCzV8ycZ
	INI8e7uZ7ecNIVCvtEio3qJoeMECEJeYabsVvki/EVkvFNMvgkuclJHal0KeJFVWZ+XXg6tTBZmfl
	vf78quF7VJskhgiywfMkDDRtftKybkLGVO1sE6n8yLRYBM261SKDuLEvkcV4Gr34sVSU6JQfLtQTh
	NlNMOy3qUcQIuywBLjbQZJTdZ49b6pK5nxIhLS/qkK+FGuBas4NhDlvoDsKv8nI+WrUsIjFNUZb2w
	Ah9YBcs+7pZl3OoHDHVbDlrDlio/eHwwLKAJf6DtXeydSARTMSkBkBOFVPU/V5rw6hg4d81I2KQm3
	X+hrqyEgo3BKq/eYI5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZ9I-005dI0-19; Mon, 29 Aug 2022 07:25:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZ9C-005dFP-6k
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2022 07:25:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id y1so5289376plb.2
        for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2022 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=llUXHfR+l0PFyNB0mrid+zrs5d7WT2x0BOrJ1Da1epE=;
        b=qTI3E2ENdbZibOFavgZdihyoPVrrbwRN111tui7s8o0vurtxY3xEgAEBU76RcEWpBY
         MgU/Qhlc58Z7jW9uQ0y2BS6OhvQ6Pckpkd0sq57+VBYbBM9/EBwMpj3m9umLzz19FxoP
         eeNp3Lh3k2tMf/XJ8AHuJLuXjAOj7bUJnS6F7/f5cTmEbF6BmRz9xo94qJhFTf6g17Ct
         qz0urI5VUeLeYOTwgmL/lo3ZyUASIb3UWBwU7N8B4afXYGrXljTxCSmh247UF1Fok9T8
         LyvdHvYTE5rOckZL9dPaxiQkM7abp069tg1F9QhdAcQrsfh/4qVcbhG9skkxRRkiHRYd
         w9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=llUXHfR+l0PFyNB0mrid+zrs5d7WT2x0BOrJ1Da1epE=;
        b=qCevfYjxbCYSFAlYWUJEyz4UUmkofJL6OQUBhpWvju5X65YeTNxW4RfP8jlZJ9yUez
         Yk/I65H+gyX3NbnquYwdm7DVSNOu9xRx4wg4alsFXRIPJLHkFFy8/Sed6fqUWkMbKkLs
         6PVW0OCdlZFlZEhQP8PA7DXmjXOfO5Ji9gJtHR7PIMdCEpnAIgr7DIXtmfNmdKnCnqTa
         UHbIuy46G2u9wPiGhewJ8FeqLRkJvzt30e62H9MBX+S0iBEAduZua78Iz+vXiuMLXtoa
         KZWPLQm92OY1To6yLZmrG0AIji4XFaqtkUGd2DGkvsQVKrXRIE186u2lDQpw/VVrDD80
         1+eg==
X-Gm-Message-State: ACgBeo3xzB4KN1twW852jy8y5EBpD3r45qqvx4ENInaQEHFbLjj9aa7I
	AhIVEfH5v3KhUKKVZp+KtZYcP09YDYA=
X-Google-Smtp-Source: AA6agR5idKPgG/PKGZ+hYQF82b17zBHhxjBRuM8Bp2YhUT2dkjnJyrrHPQlRjGyXTFmeIjHVZoHadw==
X-Received: by 2002:a17:902:7294:b0:173:2c59:5664 with SMTP id d20-20020a170902729400b001732c595664mr15215419pll.22.1661757924138;
        Mon, 29 Aug 2022 00:25:24 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id cp17-20020a170902e79100b0016d9b101413sm6628953plb.200.2022.08.29.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 00:25:23 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v2 1/1] mtd: rawnand: Cache read sequential
Date: Mon, 29 Aug 2022 15:24:52 +0800
Message-Id: <20220829072452.15342-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220829072452.15342-1-jaimeliao.tw@gmail.com>
References: <20220829072452.15342-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_002526_282759_4B5308CF 
X-CRM114-Status: GOOD (  25.75  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For reducing instruction in command operation and time of read sequence
which address are continuous.
Adding cache read sequential feature support in raw nand existing architecture.
Creating nand_exec_continue_read_page_op function for read command extend.
Adding command select in nand_lp_exec_read_page_op and taking readlen to
judge the last page for read.
Command of read cache sequential can be separate 3 parts.

First part is 00-ADDR-30-31-DATA_IN, it means read cache sequential enabled and next
page data can be prepare while cache data reading.

Second part is 31-DATA_IN, means flash will prepare next page data for reducing
time cost.

Last part is 3F-DATA_IN, means the last cache read and flash don't need to prepare
next page data.

Example for 2 page read operation, as below is the NAND operation instructions:
Normal read mode:
        00 -- ADDR1 -- 30 -- WAIT_RDY(tR+tRR) -- DATA1_IN
        00 -- ADDR2 -- 30 -- WAIT_RDY(tR+tRR) -- DATA2_IN

Cache read sequential mode:
        00 -- ADDR1 -- 30 -- WAIT_RDY(tR) -- 31 -- WAIT_RDY(tRCBSY+tRR) -- DATA1_IN
        3F -- WAIT_RDY(tRCBSY+tRR) -- DATA2_IN

tR     is about 20 microsecond
tRCBSY is about 5 microsecond
tRR    is about 20 nanosecond

As below is mtd_speedtest result between normale read and cache read
sequential on NXP i.MX6 VAR-SOM-SOLO mapping mode.

===============Normal read 33M===================
mtd_speedtest: MTD device: 0
mtd_speedtest: MTD device size 2097152, eraseblock size 131072, page size 2048,
count of eraseblocks 16, pages per eraseblock 64, OOB size 64
mtd_test: scanning for bad eraseblocks
mtd_test: scanned 16 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 3864 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 15633 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 3561 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 15515 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 3690 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 15398 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 227555 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 227555 KiB/s
mtd_speedtest: finished
=================================================

============Cache reade Sequential 33MHz===========
mtd_speedtest: MTD device: 0
mtd_speedtest: MTD device size 2097152, eraseblock size 131072, page size 2048,
count of eraseblocks 16, pages per eraseblock 64, OOB size 64
mtd_test: scanning for bad eraseblocks
mtd_test: scanned 16 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 4120 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 18285 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 4031 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 15875 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 3946 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 16253 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 227555 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 227555 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 227555 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 204800 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 204800 KiB/s
mtd_speedtest: finished
=================================================

The result could have about 5% improvement between 2 modes when 2 pages read.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c    | 96 +++++++++++++++++++++++++++--
 drivers/mtd/nand/raw/nand_timings.c | 12 ++++
 include/linux/mtd/rawnand.h         |  7 +++
 3 files changed, 110 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..7400816f0627 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1176,6 +1176,39 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 	const struct nand_interface_config *conf =
 		nand_get_interface_config(chip);
 	u8 addrs[5];
+
+	/* Command sequence select to 00-30-31 when read cache sequential is enabled */
+	if (chip->ops.conti_read_require) {
+		struct nand_op_instr instrs[] = {
+			NAND_OP_CMD(NAND_CMD_READ0, 0),
+			NAND_OP_ADDR(4, addrs, 0),
+			NAND_OP_CMD(NAND_CMD_READSTART, NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max), 0),
+			NAND_OP_CMD(NAND_CMD_READCONTI, NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tRCBSY_min),
+					 NAND_COMMON_TIMING_NS(conf, tRR_min)),
+			NAND_OP_DATA_IN(len, buf, 0),
+		};
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		int ret;
+
+		if (!len)
+			op.ninstrs--;
+
+		ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
+		if (ret < 0)
+			return ret;
+
+		addrs[2] = page;
+		addrs[3] = page >> 8;
+
+		if (chip->options & NAND_ROW_ADDR_3) {
+			addrs[4] = page >> 16;
+			instrs[1].ctx.addr.naddrs++;
+		}
+
+		return nand_exec_op(chip, &op);
+	}
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
 		NAND_OP_ADDR(4, addrs, 0),
@@ -1206,6 +1239,32 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 	return nand_exec_op(chip, &op);
 }
 
+static int nand_exec_continue_read_page_op(struct nand_chip *chip,
+					    void *buf, unsigned int len)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	bool conti_read_last = false;
+	const struct nand_interface_config *conf =
+		nand_get_interface_config(chip);
+	/* Set conti_read_last true before the last aligned page reading */
+	if (chip->ops.conti_readlen >= mtd->writesize && chip->ops.conti_readlen < 2*mtd->writesize)
+		conti_read_last = true;
+	struct nand_op_instr instrs[] = {
+		NAND_OP_CMD(conti_read_last?NAND_CMD_READLAST:NAND_CMD_READCONTI,
+					    NAND_COMMON_TIMING_NS(conf, tWB_max)),
+		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tRCBSY_min),
+				 NAND_COMMON_TIMING_NS(conf, tRR_min)),
+		NAND_OP_DATA_IN(len, buf, 0),
+	};
+	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+
+	/* Drop the DATA_IN instruction if len is set to 0. */
+	if (!len)
+		op.ninstrs--;
+
+	return nand_exec_op(chip, &op);
+}
+
 /**
  * nand_read_page_op - Do a READ PAGE operation
  * @chip: The NAND chip
@@ -1231,10 +1290,15 @@ int nand_read_page_op(struct nand_chip *chip, unsigned int page,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		if (mtd->writesize > 512)
-			return nand_lp_exec_read_page_op(chip, page,
-							 offset_in_page, buf,
-							 len);
+		if (mtd->writesize > 512) {
+			/* Selecting read command sequence  */
+			if (!chip->ops.conti_read_first_page && chip->ops.conti_read_require)
+				return nand_exec_continue_read_page_op(chip, buf, len);
+			else
+				return nand_lp_exec_read_page_op(chip, page,
+								 offset_in_page, buf,
+								 len);
+		}
 
 		return nand_sp_exec_read_page_op(chip, page, offset_in_page,
 						 buf, len);
@@ -3362,7 +3426,6 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
-
 		if (!aligned)
 			use_bounce_buf = 1;
 		else if (chip->options & NAND_USES_DMA)
@@ -3381,6 +3444,25 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 						 __func__, buf);
 
 read_retry:
+			/*
+			 * Read cache sequential command can be separate 3 parts.
+			 * For distinguishing that flash driver set value to
+			 * conti_read_first_page for checking whether the first page
+			 * and set conti_read_require to select command sequence.
+			 * And take readlen to conti_readlen for checking whether the
+			 * last page or not.
+			 */
+			if (!col && readlen >= (2*mtd->writesize)) {
+				if (chip->ops.conti_read_require == 0)
+					chip->ops.conti_read_first_page = 1;
+				else
+					chip->ops.conti_read_first_page = 0;
+				chip->ops.conti_read_require = 1;
+				chip->ops.conti_readlen = readlen;
+			} else if (chip->ops.conti_read_require) {
+				chip->ops.conti_read_first_page = 0;
+				chip->ops.conti_readlen = readlen;
+			}
 			/*
 			 * Now read the page into the buffer.  Absent an error,
 			 * the read methods return max bitflips per ecc step.
@@ -3468,6 +3550,10 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			retry_mode = 0;
 		}
 
+		/* set conti_read_require 0 when finish the last aligned page read */
+		if (readlen < mtd->writesize)
+			chip->ops.conti_read_require = 0;
+
 		if (!readlen)
 			break;
 
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 7b41afc372d2..cec5d9e526fe 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -27,6 +27,7 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tADL_min = 400000,
@@ -72,6 +73,7 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tADL_min = 400000,
@@ -117,6 +119,7 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tADL_min = 400000,
@@ -162,6 +165,7 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tADL_min = 400000,
@@ -207,6 +211,7 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tADL_min = 400000,
@@ -252,6 +257,7 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tADL_min = 400000,
@@ -300,6 +306,7 @@ static const struct nand_interface_config onfi_nvddr_timings[] = {
 		.timings.nvddr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tAC_min = 3000,
@@ -342,6 +349,7 @@ static const struct nand_interface_config onfi_nvddr_timings[] = {
 		.timings.nvddr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tAC_min = 3000,
@@ -384,6 +392,7 @@ static const struct nand_interface_config onfi_nvddr_timings[] = {
 		.timings.nvddr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tAC_min = 3000,
@@ -426,6 +435,7 @@ static const struct nand_interface_config onfi_nvddr_timings[] = {
 		.timings.nvddr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tAC_min = 3000,
@@ -468,6 +478,7 @@ static const struct nand_interface_config onfi_nvddr_timings[] = {
 		.timings.nvddr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tAC_min = 3000,
@@ -510,6 +521,7 @@ static const struct nand_interface_config onfi_nvddr_timings[] = {
 		.timings.nvddr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
+			.tRCBSY_min = 40000000,
 			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
 			.tAC_min = 3000,
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b2f9dd3cbd69..49f1249ba852 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -67,6 +67,8 @@ struct gpio_desc;
 
 /* Extended commands for large page devices */
 #define NAND_CMD_READSTART	0x30
+#define NAND_CMD_READCONTI     0x31
+#define NAND_CMD_READLAST      0x3f
 #define NAND_CMD_RNDOUTSTART	0xE0
 #define NAND_CMD_CACHEDPROG	0x15
 
@@ -436,6 +438,7 @@ struct nand_sdr_timings {
 	u32 tCCS_min;
 	u64 tPROG_max;
 	u64 tR_max;
+	u64 tRCBSY_min;
 	u32 tALH_min;
 	u32 tADL_min;
 	u32 tALS_min;
@@ -525,6 +528,7 @@ struct nand_nvddr_timings {
 	u32 tCCS_min;
 	u64 tPROG_max;
 	u64 tR_max;
+	u64 tRCBSY_min;
 	u32 tAC_min;
 	u32 tAC_max;
 	u32 tADL_min;
@@ -1173,6 +1177,9 @@ struct nand_chip_ops {
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
 	int (*choose_interface_config)(struct nand_chip *chip,
 				       struct nand_interface_config *iface);
+	bool conti_read_require;
+	bool conti_read_first_page;
+	int conti_readlen;
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
