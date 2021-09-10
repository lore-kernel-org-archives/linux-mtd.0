Return-Path: <SRS0=TiF7=OA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F760C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66312611BF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66312611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqH9O08bz4GqtAHQY2KPlrihtbI7Fp++oZ/p/mkQ1NM=; b=ZceFSLQM7OhBVX
	bT5PleR77QgHlQj5Uw1WDf3HQy4q55COivcaKGawfn7CpssEdT4Zy+G+A5jS6Nu2MwXLwtXE7Ga/B
	MMyMefjkzDIirJ/ixxfW8I6Bx9GvaoKCZ15TsFZBM8faMkzm0aAmqcsS7/UAPrJOx3uxjGiOEU/BR
	yJkx6ukZdenNHbggpNXfRu8vhZEemgOqW4yik7y4fJuIjwooo5CpMzFm18qbLDc3/zafhx0T7KHzd
	p7Ss9r9wrDmBcfKGnCY/drdwcabMdhLCZv8gK5CgWExDAeZK2Ul8TlhHr/4861c1Ll/wJYqbMWDNq
	WbjaAe4mVQ0RvRsmR7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOnrc-00DpTI-Lp; Fri, 10 Sep 2021 21:15:12 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOnqz-00DpJT-Ht
 for linux-mtd@lists.infradead.org; Fri, 10 Sep 2021 21:14:36 +0000
Received: by mail-qk1-x734.google.com with SMTP id a66so3594682qkc.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Sep 2021 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=WKdtQzLjt8F7xEUYeQccJRGSPNA+ugd63eKhlKcN0/E=;
 b=ZsvsA/jg05o82RXc6fOEq2invW78x0NypDBLSHTzZk1KNXENKUqmEJEr4aSRO+YoV8
 m+zYzfNA0h0ykQcjG1EeqjLC0sHARNPjmL8VzPkvWNFM9IioLDzvOWZJY1JD3J+pKHWT
 Yan5o3ZdCoApo3e8XU/FV+s0DqBIeoTsjXZ5g1zz1NywCp8LCrnUzAfbfvf6Qq+MXqAo
 hhqS1Lbv+hg1rr5Qrh8geBsW7i25wPDpSVPfnc9a3huqzoKRHj5kWtAX7D7YSAMPqi0t
 Mxdjvc4IM279DQDdyOzG6BYoU0A+VxR4OO9TGhZ/aPp7bK77lpiOa5GhhBWWK7x3vpbG
 fWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=WKdtQzLjt8F7xEUYeQccJRGSPNA+ugd63eKhlKcN0/E=;
 b=Rka9TFPpwqmPR6wP3cZtxLDfJXYz9m9h2YCd+QUkagAXUIGwpYYpoVtGL/TiMvyE6B
 S5R1sd0zD2Z7Vl00xnkFALf53s5444U6iABBRS7p7M21ZTeJOtqyus9z7zpGovsl8W77
 nIEOfgAMDVpO65a7ygscaLp9q8K3mVZRqiYtWp7U6maWDTOgdOE2snzOgWtPkp5+ggWL
 wr9bjWkcExKsgfdG+DK6nhBaje10DIB+qizR4Gukz62hWjcRrvCkJMjyAXxiP5+iRH92
 etaqAQiHZTd7U0Hr0pHAHEW7yAzGCBAcBiP2heO46oMJsJlR9vmckXSjHxNczNcHt+aD
 JrYw==
X-Gm-Message-State: AOAM531N0cwdrcm9UOrMMhQ14dU1CJi1Y4J0qSP/njv8/B7DnnjuEL9o
 M2KaSPzPVrf2LnqnsALwtdE97W1bmT89Wz+40Gw7JvaVQEm6FxRbN7a91o/ZkKRXacgw1iXL7Ef
 5KvAaItsDjds1O2BBhjk/ZZuiYG2HvMuMF6nTcmg+rocuMcKpvIYsqimD1eDaKqQ9w52nzbl8SD
 95Pq0jL4V2kw==
X-Google-Smtp-Source: ABdhPJzHHLbg8078E3Msq7Mp/QJp073mfG9fRS3P8Ysnq4EEQPJRRntz3vOl3MiouaFXGKFp89fA5g==
X-Received: by 2002:a05:620a:cd0:: with SMTP id
 b16mr9978793qkj.136.1631308471986; 
 Fri, 10 Sep 2021 14:14:31 -0700 (PDT)
Received: from localhost ([186.122.181.76])
 by smtp.gmail.com with UTF8SMTPSA id c10sm4005716qtb.20.2021.09.10.14.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:14:31 -0700 (PDT)
From: Mauro Lima <mauro.lima@eclypsium.com>
To: linux-mtd@lists.infradead.org
Cc: daniel.gutson@eclypsium.com, richard@hughsie.com,
 tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, mika.westerberg@linux.intel.com, mauro.lima@eclypsium.com
Subject: [PATCH 3/4] mtd: intel-spi: moving write/erase functions
Date: Fri, 10 Sep 2021 18:13:47 -0300
Message-Id: <20210910211348.642103-4-mauro.lima@eclypsium.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910211348.642103-1-mauro.lima@eclypsium.com>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_141433_662129_DB047BA5 
X-CRM114-Status: GOOD (  29.43  )
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

Split the write/erase behavior. In order to avoid code duplication,
we are going to move all the write/erase functionality to a new
file 'intel-spi-w.c' and left the base file as a common place for
both write and read only ops.
Change the make of intel-spi so we don't have to export
all the symbols used between 'intel-spi-w' and 'intel-spi-base'.
Add MODULE_LICENSE() to be able to compile as M.
Remove the module param flag, this will be set through menuconfig.

This is the new include diagram:

                    +--------------------+
                    |/include/intel-spi.h|
                    +--------^-----------+
                             |
                             |                  intel-spi-defs.h
                             |                         ^
                             |                         |
{pci|platform} -----> intel-spi-base.h          intel-spi-rw.h
                              ^                 ^       ^
                              |       +---------+       |
                              |       |                 |
                              |       |                 |
                              |       |                 |
                        intel-spi-base.c         intel-spi-w.c

Suggested-by: Daniel Gutson <daniel.gutson@eclypsium.com>
Suggested-by: Richard Hughes <richard@hughsie.com>
Signed-off-by: Mauro Lima <mauro.lima@eclypsium.com>
---
 drivers/mtd/spi-nor/controllers/Makefile      |   2 +-
 .../mtd/spi-nor/controllers/intel-spi-base.c  | 291 ++----------------
 .../mtd/spi-nor/controllers/intel-spi-rw.h    |  23 ++
 drivers/mtd/spi-nor/controllers/intel-spi-w.c | 289 +++++++++++++++++
 4 files changed, 345 insertions(+), 260 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-rw.h
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-w.c

diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-nor/controllers/Makefile
index fa2dc480d2c8..1933a7c2c30b 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -3,6 +3,6 @@ obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
 obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
-intel-spi-y := intel-spi-base.o
+intel-spi-y := intel-spi-base.o intel-spi-w.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-base.c b/drivers/mtd/spi-nor/controllers/intel-spi-base.c
index 04ff1c381f1d..7cb5109ad0d4 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-base.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-base.c
@@ -7,11 +7,8 @@
  */
 
 #include "intel-spi-base.h"
-#include "intel-spi-defs.h"
 
-static bool writeable;
-module_param(writeable, bool, 0);
-MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");
+#include "intel-spi-rw.h"
 
 static void intel_spi_dump_regs(struct intel_spi *ispi)
 {
@@ -116,28 +113,7 @@ static int intel_spi_read_block(struct intel_spi *ispi, void *buf, size_t size)
 	return 0;
 }
 
-/* Writes max INTEL_SPI_FIFO_SZ bytes to the device fifo */
-static int intel_spi_write_block(struct intel_spi *ispi, const void *buf,
-				 size_t size)
-{
-	size_t bytes;
-	int i = 0;
-
-	if (size > INTEL_SPI_FIFO_SZ)
-		return -EINVAL;
-
-	while (size > 0) {
-		bytes = min_t(size_t, size, 4);
-		memcpy_toio(ispi->base + FDATA(i), buf, bytes);
-		size -= bytes;
-		buf += bytes;
-		i++;
-	}
-
-	return 0;
-}
-
-static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
+int intel_spi_wait_hw_busy(struct intel_spi *ispi)
 {
 	u32 val;
 
@@ -157,8 +133,8 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
 
 static int intel_spi_init(struct intel_spi *ispi)
 {
-	u32 opmenu0, opmenu1, lvscc, uvscc, val;
-	int i;
+	u32 opmenu0, opmenu1, val;
+	int i, ret;
 
 	switch (ispi->info->type) {
 	case INTEL_SPI_BYT:
@@ -168,17 +144,7 @@ static int intel_spi_init(struct intel_spi *ispi)
 		ispi->pr_num = BYT_PR_NUM;
 		ispi->swseq_reg = true;
 
-		if (writeable) {
-			/* Disable write protection */
-			val = readl(ispi->base + BYT_BCR);
-			if (!(val & BYT_BCR_WPD)) {
-				val |= BYT_BCR_WPD;
-				writel(val, ispi->base + BYT_BCR);
-				val = readl(ispi->base + BYT_BCR);
-			}
-
-			ispi->writeable = !!(val & BYT_BCR_WPD);
-		}
+		__intel_byt_rw_config(ispi);
 
 		break;
 
@@ -195,7 +161,9 @@ static int intel_spi_init(struct intel_spi *ispi)
 		ispi->pregs = ispi->base + BXT_PR;
 		ispi->nregions = BXT_FREG_NUM;
 		ispi->pr_num = BXT_PR_NUM;
-		ispi->erase_64k = true;
+
+		__intel_bxt_rw_config(ispi);
+
 		break;
 
 	case INTEL_SPI_CNL:
@@ -214,28 +182,9 @@ static int intel_spi_init(struct intel_spi *ispi)
 	val &= ~HSFSTS_CTL_FSMIE;
 	writel(val, ispi->base + HSFSTS_CTL);
 
-	/*
-	 * Determine whether erase operation should use HW or SW sequencer.
-	 *
-	 * The HW sequencer has a predefined list of opcodes, with only the
-	 * erase opcode being programmable in LVSCC and UVSCC registers.
-	 * If these registers don't contain a valid erase opcode, erase
-	 * cannot be done using HW sequencer.
-	 */
-	lvscc = readl(ispi->base + LVSCC);
-	uvscc = readl(ispi->base + UVSCC);
-	if (!(lvscc & ERASE_OPCODE_MASK) || !(uvscc & ERASE_OPCODE_MASK))
-		ispi->swseq_erase = true;
-	/* SPI controller on Intel BXT supports 64K erase opcode */
-	if (ispi->info->type == INTEL_SPI_BXT && !ispi->swseq_erase)
-		if (!(lvscc & ERASE_64K_OPCODE_MASK) ||
-		    !(uvscc & ERASE_64K_OPCODE_MASK))
-			ispi->erase_64k = false;
-
-	if (ispi->sregs == NULL && (ispi->swseq_reg || ispi->swseq_erase)) {
-		dev_err(ispi->dev, "software sequencer not supported, but required\n");
-		return -EINVAL;
-	}
+	ret = __configure_lvscc_uvscc(ispi);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * Some controllers can only do basic operations using hardware
@@ -296,7 +245,7 @@ static int intel_spi_opcode_index(struct intel_spi *ispi, u8 opcode, int optype)
 	return 0;
 }
 
-static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
+int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
 {
 	u32 val, status;
 	int ret;
@@ -309,7 +258,10 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
 		val |= HSFSTS_CTL_FCYCLE_RDID;
 		break;
 	case SPINOR_OP_WRSR:
-		val |= HSFSTS_CTL_FCYCLE_WRSR;
+		if (is_write_enabled())
+			val |= HSFSTS_CTL_FCYCLE_WRSR;
+		else
+			return -EINVAL;
 		break;
 	case SPINOR_OP_RDSR:
 		val |= HSFSTS_CTL_FCYCLE_RDSR;
@@ -339,8 +291,8 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
 	return 0;
 }
 
-static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, size_t len,
-			      int optype)
+int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, size_t len,
+		       int optype)
 {
 	u32 val = 0, status;
 	u8 atomic_preopcode;
@@ -367,29 +319,12 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, size_t len,
 	val |= SSFSTS_CTL_FCERR | SSFSTS_CTL_FDONE;
 	val |= SSFSTS_CTL_SCGO;
 	if (atomic_preopcode) {
-		u16 preop;
-
-		switch (optype) {
-		case OPTYPE_WRITE_NO_ADDR:
-		case OPTYPE_WRITE_WITH_ADDR:
-			/* Pick matching preopcode for the atomic sequence */
-			preop = readw(ispi->sregs + PREOP_OPTYPE);
-			if ((preop & 0xff) == atomic_preopcode)
-				; /* Do nothing */
-			else if ((preop >> 8) == atomic_preopcode)
-				val |= SSFSTS_CTL_SPOP;
-			else
-				return -EINVAL;
-
-			/* Enable atomic sequence */
-			val |= SSFSTS_CTL_ACS;
-			break;
-
-		default:
-			return -EINVAL;
-		}
-
+		ret = __intel_sw_cycle_write(ispi, optype, atomic_preopcode);
+		if (ret < 0)
+			return ret;
+		val |= ret;
 	}
+
 	writel(val, ispi->sregs + SSFSTS_CTL);
 
 	ret = intel_spi_wait_sw_busy(ispi);
@@ -429,59 +364,7 @@ static int intel_spi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 			       size_t len)
 {
-	struct intel_spi *ispi = nor->priv;
-	int ret;
-
-	/*
-	 * This is handled with atomic operation and preop code in Intel
-	 * controller so we only verify that it is available. If the
-	 * controller is not locked, program the opcode to the PREOP
-	 * register for later use.
-	 *
-	 * When hardware sequencer is used there is no need to program
-	 * any opcodes (it handles them automatically as part of a command).
-	 */
-	if (opcode == SPINOR_OP_WREN) {
-		u16 preop;
-
-		if (!ispi->swseq_reg)
-			return 0;
-
-		preop = readw(ispi->sregs + PREOP_OPTYPE);
-		if ((preop & 0xff) != opcode && (preop >> 8) != opcode) {
-			if (ispi->locked)
-				return -EINVAL;
-			writel(opcode, ispi->sregs + PREOP_OPTYPE);
-		}
-
-		/*
-		 * This enables atomic sequence on next SW sycle. Will
-		 * be cleared after next operation.
-		 */
-		ispi->atomic_preopcode = opcode;
-		return 0;
-	}
-
-	/*
-	 * We hope that HW sequencer will do the right thing automatically and
-	 * with the SW sequencer we cannot use preopcode anyway, so just ignore
-	 * the Write Disable operation and pretend it was completed
-	 * successfully.
-	 */
-	if (opcode == SPINOR_OP_WRDI)
-		return 0;
-
-	writel(0, ispi->base + FADDR);
-
-	/* Write the value beforehand */
-	ret = intel_spi_write_block(ispi, buf, len);
-	if (ret)
-		return ret;
-
-	if (ispi->swseq_reg)
-		return intel_spi_sw_cycle(ispi, opcode, len,
-					  OPTYPE_WRITE_NO_ADDR);
-	return intel_spi_hw_cycle(ispi, opcode, len);
+	return __intel_spi_write_reg(nor, opcode, buf, len);
 }
 
 static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
@@ -558,126 +441,12 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 			       const u_char *write_buf)
 {
-	struct intel_spi *ispi = nor->priv;
-	size_t block_size, retlen = 0;
-	u32 val, status;
-	ssize_t ret;
-
-	/* Not needed with HW sequencer write, make sure it is cleared */
-	ispi->atomic_preopcode = 0;
-
-	while (len > 0) {
-		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
-
-		/* Write cannot cross 4K boundary */
-		block_size = min_t(loff_t, to + block_size,
-				   round_up(to + 1, SZ_4K)) - to;
-
-		writel(to, ispi->base + FADDR);
-
-		val = readl(ispi->base + HSFSTS_CTL);
-		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
-		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
-		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
-		val |= HSFSTS_CTL_FCYCLE_WRITE;
-
-		ret = intel_spi_write_block(ispi, write_buf, block_size);
-		if (ret) {
-			dev_err(ispi->dev, "failed to write block\n");
-			return ret;
-		}
-
-		/* Start the write now */
-		val |= HSFSTS_CTL_FGO;
-		writel(val, ispi->base + HSFSTS_CTL);
-
-		ret = intel_spi_wait_hw_busy(ispi);
-		if (ret) {
-			dev_err(ispi->dev, "timeout\n");
-			return ret;
-		}
-
-		status = readl(ispi->base + HSFSTS_CTL);
-		if (status & HSFSTS_CTL_FCERR)
-			ret = -EIO;
-		else if (status & HSFSTS_CTL_AEL)
-			ret = -EACCES;
-
-		if (ret < 0) {
-			dev_err(ispi->dev, "write error: %llx: %#x\n", to,
-				status);
-			return ret;
-		}
-
-		len -= block_size;
-		to += block_size;
-		retlen += block_size;
-		write_buf += block_size;
-	}
-
-	return retlen;
+	return __intel_spi_write(nor, to, len, write_buf);
 }
 
 static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
 {
-	size_t erase_size, len = nor->mtd.erasesize;
-	struct intel_spi *ispi = nor->priv;
-	u32 val, status, cmd;
-	int ret;
-
-	/* If the hardware can do 64k erase use that when possible */
-	if (len >= SZ_64K && ispi->erase_64k) {
-		cmd = HSFSTS_CTL_FCYCLE_ERASE_64K;
-		erase_size = SZ_64K;
-	} else {
-		cmd = HSFSTS_CTL_FCYCLE_ERASE;
-		erase_size = SZ_4K;
-	}
-
-	if (ispi->swseq_erase) {
-		while (len > 0) {
-			writel(offs, ispi->base + FADDR);
-
-			ret = intel_spi_sw_cycle(ispi, nor->erase_opcode,
-						 0, OPTYPE_WRITE_WITH_ADDR);
-			if (ret)
-				return ret;
-
-			offs += erase_size;
-			len -= erase_size;
-		}
-
-		return 0;
-	}
-
-	/* Not needed with HW sequencer erase, make sure it is cleared */
-	ispi->atomic_preopcode = 0;
-
-	while (len > 0) {
-		writel(offs, ispi->base + FADDR);
-
-		val = readl(ispi->base + HSFSTS_CTL);
-		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
-		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
-		val |= cmd;
-		val |= HSFSTS_CTL_FGO;
-		writel(val, ispi->base + HSFSTS_CTL);
-
-		ret = intel_spi_wait_hw_busy(ispi);
-		if (ret)
-			return ret;
-
-		status = readl(ispi->base + HSFSTS_CTL);
-		if (status & HSFSTS_CTL_FCERR)
-			return -EIO;
-		else if (status & HSFSTS_CTL_AEL)
-			return -EACCES;
-
-		offs += erase_size;
-		len -= erase_size;
-	}
-
-	return 0;
+	return __intel_spi_erase(nor, offs);
 }
 
 static bool intel_spi_is_protected(const struct intel_spi *ispi,
@@ -778,7 +547,11 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 
 	ispi->dev = dev;
 	ispi->info = info;
-	ispi->writeable = info->writeable;
+
+	if (is_write_enabled())
+		ispi->writeable = info->writeable;
+	else
+		ispi->writeable = false;
 
 	ret = intel_spi_init(ispi);
 	if (ret)
@@ -797,7 +570,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	intel_spi_fill_partition(ispi, &part);
 
 	/* Prevent writes if not explicitly enabled */
-	if (!ispi->writeable || !writeable)
+	if (!ispi->writeable || !is_write_enabled())
 		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
 
 	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-rw.h b/drivers/mtd/spi-nor/controllers/intel-spi-rw.h
new file mode 100644
index 000000000000..46c6461a8a7b
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-rw.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef INTEL_SPI_RW_H
+#define INTEL_SPI_RW_H
+
+#include "intel-spi-defs.h"
+
+#include <linux/platform_data/x86/intel-spi.h>
+
+int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, size_t len, int optype);
+int intel_spi_wait_hw_busy(struct intel_spi *ispi);
+int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len);
+
+bool is_write_enabled(void);
+int  __intel_spi_erase(struct spi_nor *nor, loff_t offs);
+ssize_t  __intel_spi_write(struct spi_nor *nor, loff_t to, size_t len, const u_char *write_buf);
+int  __intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
+			   size_t len);
+int  __configure_lvscc_uvscc(struct intel_spi *ispi);
+int  __intel_sw_cycle_write(struct intel_spi *ispi, int optype, u8 atomic_preopcode);
+void  __intel_bxt_rw_config(struct intel_spi *ispi);
+void  __intel_byt_rw_config(struct intel_spi *ispi);
+
+#endif /* INTEL_SPI_RW_H */
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-w.c b/drivers/mtd/spi-nor/controllers/intel-spi-w.c
new file mode 100644
index 000000000000..ffe940611b57
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-w.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "intel-spi-rw.h"
+
+bool is_write_enabled(void)
+{
+	return true;
+}
+
+/* Writes max INTEL_SPI_FIFO_SZ bytes to the device fifo */
+static int intel_spi_write_block(struct intel_spi *ispi, const void *buf,
+				 size_t size)
+{
+	size_t bytes;
+	int i = 0;
+
+	if (size > INTEL_SPI_FIFO_SZ)
+		return -EINVAL;
+
+	while (size > 0) {
+		bytes = min_t(size_t, size, 4);
+		memcpy_toio(ispi->base + FDATA(i), buf, bytes);
+		size -= bytes;
+		buf += bytes;
+		i++;
+	}
+
+	return 0;
+}
+
+int __intel_spi_erase(struct spi_nor *nor, loff_t offs)
+{
+	size_t erase_size, len = nor->mtd.erasesize;
+	struct intel_spi *ispi = nor->priv;
+	u32 val, status, cmd;
+	int ret;
+
+	/* If the hardware can do 64k erase use that when possible */
+	if (len >= SZ_64K && ispi->erase_64k) {
+		cmd = HSFSTS_CTL_FCYCLE_ERASE_64K;
+		erase_size = SZ_64K;
+	} else {
+		cmd = HSFSTS_CTL_FCYCLE_ERASE;
+		erase_size = SZ_4K;
+	}
+
+	if (ispi->swseq_erase) {
+		while (len > 0) {
+			writel(offs, ispi->base + FADDR);
+
+			ret = intel_spi_sw_cycle(ispi, nor->erase_opcode,
+						 0, OPTYPE_WRITE_WITH_ADDR);
+			if (ret)
+				return ret;
+
+			offs += erase_size;
+			len -= erase_size;
+		}
+
+		return 0;
+	}
+
+	/* Not needed with HW sequencer erase, make sure it is cleared */
+	ispi->atomic_preopcode = 0;
+
+	while (len > 0) {
+		writel(offs, ispi->base + FADDR);
+
+		val = readl(ispi->base + HSFSTS_CTL);
+		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
+		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
+		val |= cmd;
+		val |= HSFSTS_CTL_FGO;
+		writel(val, ispi->base + HSFSTS_CTL);
+
+		ret = intel_spi_wait_hw_busy(ispi);
+		if (ret)
+			return ret;
+
+		status = readl(ispi->base + HSFSTS_CTL);
+		if (status & HSFSTS_CTL_FCERR)
+			return -EIO;
+		else if (status & HSFSTS_CTL_AEL)
+			return -EACCES;
+
+		offs += erase_size;
+		len -= erase_size;
+	}
+
+	return 0;
+}
+
+ssize_t __intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
+			  const u_char *write_buf)
+{
+	struct intel_spi *ispi = nor->priv;
+	size_t block_size, retlen = 0;
+	u32 val, status;
+	ssize_t ret;
+
+	/* Not needed with HW sequencer write, make sure it is cleared */
+	ispi->atomic_preopcode = 0;
+
+	while (len > 0) {
+		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
+
+		/* Write cannot cross 4K boundary */
+		block_size = min_t(loff_t, to + block_size,
+				   round_up(to + 1, SZ_4K)) - to;
+
+		writel(to, ispi->base + FADDR);
+
+		val = readl(ispi->base + HSFSTS_CTL);
+		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
+		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
+		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
+		val |= HSFSTS_CTL_FCYCLE_WRITE;
+
+		ret = intel_spi_write_block(ispi, write_buf, block_size);
+		if (ret) {
+			dev_err(ispi->dev, "failed to write block\n");
+			return ret;
+		}
+
+		/* Start the write now */
+		val |= HSFSTS_CTL_FGO;
+		writel(val, ispi->base + HSFSTS_CTL);
+
+		ret = intel_spi_wait_hw_busy(ispi);
+		if (ret) {
+			dev_err(ispi->dev, "timeout\n");
+			return ret;
+		}
+
+		status = readl(ispi->base + HSFSTS_CTL);
+		if (status & HSFSTS_CTL_FCERR)
+			ret = -EIO;
+		else if (status & HSFSTS_CTL_AEL)
+			ret = -EACCES;
+
+		if (ret < 0) {
+			dev_err(ispi->dev, "write error: %llx: %#x\n", to,
+				status);
+			return ret;
+		}
+
+		len -= block_size;
+		to += block_size;
+		retlen += block_size;
+		write_buf += block_size;
+	}
+
+	return retlen;
+}
+
+int __intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf, size_t len)
+{
+	struct intel_spi *ispi = nor->priv;
+	int ret;
+
+	/*
+	 * This is handled with atomic operation and preop code in Intel
+	 * controller so we only verify that it is available. If the
+	 * controller is not locked, program the opcode to the PREOP
+	 * register for later use.
+	 *
+	 * When hardware sequencer is used there is no need to program
+	 * any opcodes (it handles them automatically as part of a command).
+	 */
+	if (opcode == SPINOR_OP_WREN) {
+		u16 preop;
+
+		if (!ispi->swseq_reg)
+			return 0;
+
+		preop = readw(ispi->sregs + PREOP_OPTYPE);
+		if ((preop & 0xff) != opcode && (preop >> 8) != opcode) {
+			if (ispi->locked)
+				return -EINVAL;
+			writel(opcode, ispi->sregs + PREOP_OPTYPE);
+		}
+
+		/*
+		 * This enables atomic sequence on next SW sycle. Will
+		 * be cleared after next operation.
+		 */
+		ispi->atomic_preopcode = opcode;
+		return 0;
+	}
+
+	/*
+	 * We hope that HW sequencer will do the right thing automatically and
+	 * with the SW sequencer we cannot use preopcode anyway, so just ignore
+	 * the Write Disable operation and pretend it was completed
+	 * successfully.
+	 */
+	if (opcode == SPINOR_OP_WRDI)
+		return 0;
+
+	writel(0, ispi->base + FADDR);
+
+	/* Write the value beforehand */
+	ret = intel_spi_write_block(ispi, buf, len);
+	if (ret)
+		return ret;
+
+	if (ispi->swseq_reg)
+		return intel_spi_sw_cycle(ispi, opcode, len,
+					  OPTYPE_WRITE_NO_ADDR);
+	return intel_spi_hw_cycle(ispi, opcode, len);
+}
+
+int __configure_lvscc_uvscc(struct intel_spi *ispi)
+{
+	u32 lvscc, uvscc;
+	/*
+	 * Determine whether erase operation should use HW or SW sequencer.
+	 *
+	 * The HW sequencer has a predefined list of opcodes, with only the
+	 * erase opcode being programmable in LVSCC and UVSCC registers.
+	 * If these registers don't contain a valid erase opcode, erase
+	 * cannot be done using HW sequencer.
+	 */
+	lvscc = readl(ispi->base + LVSCC);
+	uvscc = readl(ispi->base + UVSCC);
+	if (!(lvscc & ERASE_OPCODE_MASK) || !(uvscc & ERASE_OPCODE_MASK))
+		ispi->swseq_erase = true;
+	/* SPI controller on Intel BXT supports 64K erase opcode */
+	if (ispi->info->type == INTEL_SPI_BXT && !ispi->swseq_erase)
+		if (!(lvscc & ERASE_64K_OPCODE_MASK) ||
+		    !(uvscc & ERASE_64K_OPCODE_MASK))
+			ispi->erase_64k = false;
+
+	if (ispi->sregs == NULL && (ispi->swseq_reg || ispi->swseq_erase)) {
+		dev_err(ispi->dev, "software sequencer not supported, but required\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int __intel_sw_cycle_write(struct intel_spi *ispi, int optype, u8 atomic_preopcode)
+{
+	u32 val = 0;
+	u16 preop;
+
+	switch (optype) {
+	case OPTYPE_WRITE_NO_ADDR:
+	case OPTYPE_WRITE_WITH_ADDR:
+		/* Pick matching preopcode for the atomic sequence */
+		preop = readw(ispi->sregs + PREOP_OPTYPE);
+		if ((preop & 0xff) == atomic_preopcode)
+			; /* Do nothing */
+		else if ((preop >> 8) == atomic_preopcode)
+			val |= SSFSTS_CTL_SPOP;
+		else
+			return -EINVAL;
+
+		/* Enable atomic sequence */
+		val |= SSFSTS_CTL_ACS;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return val;
+}
+
+void __intel_byt_rw_config(struct intel_spi *ispi)
+{
+	u32 val;
+
+	/* Disable write protection */
+	val = readl(ispi->base + BYT_BCR);
+	if (!(val & BYT_BCR_WPD)) {
+		val |= BYT_BCR_WPD;
+		writel(val, ispi->base + BYT_BCR);
+		val = readl(ispi->base + BYT_BCR);
+	}
+
+	ispi->writeable = !!(val & BYT_BCR_WPD);
+}
+
+void __intel_bxt_rw_config(struct intel_spi *ispi)
+{
+	ispi->erase_64k = true;
+}
+MODULE_LICENSE("GPL v2");
-- 
2.31.1


-- 


This e-mail and any attachments may contain information that is 
privileged, confidential,  and/or exempt from disclosure under applicable 
law.  If you are not the intended recipient, you are hereby notified that 
any disclosure, copying, distribution or use of any information contained 
herein is strictly prohibited. If you have received this transmission in 
error, please immediately notify the sender and destroy the original 
transmission and any attachments, whether in electronic or hard copy 
format, without reading or saving.













______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
