Return-Path: <SRS0=TiF7=OA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D937C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E21D461208
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E21D461208
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFFtCSS34Pl4mfwT9zbsiMANG3A/xOcQ2JQ1wk2utjY=; b=znNYmVHTNa8EJx
	uPHuWepu6jnIwsWuy7cjHZyOoI1VbIcHTp5WFQw49MCxagwtgqNvypKmtqDsTS8T+7fAdRtowDwJg
	fkQb3BdNQr4rUngG87DsdEUJcY1x7JzPZLHxJRtQNCuWUHXe+zHEIV5jlxaOuQ2YC89c7qlYoQIoI
	SbaLTLHNJLEudrhyoHJc1qlKXCOsYSdHpGP0jScArK6jdzkGKYM3I3VEJf6f6kC26/KvChlvaOtRm
	aS2RjeCTDR0JX0Lh6b+BMt8VRxb66ZL/7E0gtJNepjhAKprKdIw68gQ6f3yvzUndD3HIEAyVFTSKX
	m0RzZrp/UjCjHMhQMmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOnrK-00DpOe-SF; Fri, 10 Sep 2021 21:14:54 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOnqv-00DpIp-PG
 for linux-mtd@lists.infradead.org; Fri, 10 Sep 2021 21:14:31 +0000
Received: by mail-qk1-x72f.google.com with SMTP id a66so3594530qkc.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Sep 2021 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=6WTst5B+Vo4rXyO/8cCPSCC2WYypLD/fqsFsmevkLeo=;
 b=fZaZO4ZbKFHcc66MYh28+FeFVpGx7cRD9K2golDuBbt2Ife0j/EC+hM8Y0CVgtU1/N
 2+TWymVpwoYiPO5ySxyvWx1hbP64tJEJOTrHkpoXrRqI3hRqe2Q7OXTQY/bjwPlcfFga
 +3UaZz1gtgPsFTV2xxDLIzdYgK0HAbhujgOBsDExRqXj9rKOcVZSJlaiBZ66GVlCu/pT
 pCMT1jLyVmFR1f7Oa8VmI00AwsImMB+77lwiisCIOWMBBKTQd2RmIh3Q6v07viRq5GJy
 2EGJ2F2XiDv30txLgVjeBpygMkQHY8/Ck3utV2GNHZ9MG3Av6Fs5iMc2retyB3eAlnvw
 vmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=6WTst5B+Vo4rXyO/8cCPSCC2WYypLD/fqsFsmevkLeo=;
 b=VNFUSdjuJFP2aj9RlgGTi2DfRkBew5b39PulkqbPAA29h2crwcxoVe4ArNEFz2ZHWy
 Mj5LVd7tlyC1uhuu4uXpy7p40DR+FVo6GZ4tE/AKxLv4sWl9b8pPLLjtFHochju34NIn
 6vxHrZB3dsvUVBOGCtQ6SZPltclLrC0LHW4nYDgGLnhg42MLKLKVDlli15MskuLJmlPf
 1B98nPfk6DQWmYK/ymw9PPWnoc6aY9wrviRZJYU4DrlEtp+blTdwjP1fw0Sd74iTpXp4
 u/28jXQMYq1juxw2BNc1wwDLjTFSpqr/u7ivwND3r8MjT60795Yca3YlybcMCBz0T0Zn
 c1Ug==
X-Gm-Message-State: AOAM530j6W0S0GimDbNbaSNmimP9yqxjWFjBr/TLG9AE/KzmyzPKRq12
 EMeCp3P2PR63i+WHevezLof+IRV5mDgVwpyqhEglQN4XJOXZq4lMGie+Q8wk+G8ssE6U6EbVEF4
 zX6xXnZrddmnFA1JOysFHyEFmA13R6sBJ7//x/j2z09v5s5liVcGDAicJgsKoEsQEHOCvWsMzGk
 pyWWWqg+gX7A==
X-Google-Smtp-Source: ABdhPJx7gIWjxochpKxdZNdrVWO+r/odHBPHuWpjnmyYAafOq/Mj8vYjioS+uPwbdiU7tiHGSbZkeg==
X-Received: by 2002:a05:620a:1210:: with SMTP id
 u16mr9582317qkj.390.1631308468469; 
 Fri, 10 Sep 2021 14:14:28 -0700 (PDT)
Received: from localhost ([186.122.181.76])
 by smtp.gmail.com with UTF8SMTPSA id u13sm4380580qki.38.2021.09.10.14.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:14:28 -0700 (PDT)
From: Mauro Lima <mauro.lima@eclypsium.com>
To: linux-mtd@lists.infradead.org
Cc: daniel.gutson@eclypsium.com, richard@hughsie.com,
 tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, mika.westerberg@linux.intel.com, mauro.lima@eclypsium.com
Subject: [PATCH 2/4] mtd: intel-spi: move chip internals into a defs.h
Date: Fri, 10 Sep 2021 18:13:46 -0300
Message-Id: <20210910211348.642103-3-mauro.lima@eclypsium.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910211348.642103-1-mauro.lima@eclypsium.com>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_141429_877907_B68E625E 
X-CRM114-Status: GOOD (  19.77  )
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

Move definitions about chip and internal spi structure to a defs
header file.
Add types.h to .../platform_data/x86/intel-spi.h so it doesn't
depends in the order of include files from intel-spi-base.
Forward declare struct device to be able to compile.

Suggested-by: Daniel Gutson <daniel.gutson@eclypsium.com>
Suggested-by: Richard Hughes <richard@hughsie.com>
Signed-off-by: Mauro Lima <mauro.lima@eclypsium.com>
---
 .../mtd/spi-nor/controllers/intel-spi-base.c  | 151 +----------------
 .../mtd/spi-nor/controllers/intel-spi-base.h  |   1 +
 .../mtd/spi-nor/controllers/intel-spi-defs.h  | 157 ++++++++++++++++++
 include/linux/platform_data/x86/intel-spi.h   |   2 +
 4 files changed, 161 insertions(+), 150 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-defs.h

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-base.c b/drivers/mtd/spi-nor/controllers/intel-spi-base.c
index 362fb41b969e..04ff1c381f1d 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-base.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-base.c
@@ -6,157 +6,8 @@
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/iopoll.h>
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/sizes.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/spi-nor.h>
-
 #include "intel-spi-base.h"
-
-/* Offsets are from @ispi->base */
-#define BFPREG				0x00
-
-#define HSFSTS_CTL			0x04
-#define HSFSTS_CTL_FSMIE		BIT(31)
-#define HSFSTS_CTL_FDBC_SHIFT		24
-#define HSFSTS_CTL_FDBC_MASK		(0x3f << HSFSTS_CTL_FDBC_SHIFT)
-
-#define HSFSTS_CTL_FCYCLE_SHIFT		17
-#define HSFSTS_CTL_FCYCLE_MASK		(0x0f << HSFSTS_CTL_FCYCLE_SHIFT)
-/* HW sequencer opcodes */
-#define HSFSTS_CTL_FCYCLE_READ		(0x00 << HSFSTS_CTL_FCYCLE_SHIFT)
-#define HSFSTS_CTL_FCYCLE_WRITE		(0x02 << HSFSTS_CTL_FCYCLE_SHIFT)
-#define HSFSTS_CTL_FCYCLE_ERASE		(0x03 << HSFSTS_CTL_FCYCLE_SHIFT)
-#define HSFSTS_CTL_FCYCLE_ERASE_64K	(0x04 << HSFSTS_CTL_FCYCLE_SHIFT)
-#define HSFSTS_CTL_FCYCLE_RDID		(0x06 << HSFSTS_CTL_FCYCLE_SHIFT)
-#define HSFSTS_CTL_FCYCLE_WRSR		(0x07 << HSFSTS_CTL_FCYCLE_SHIFT)
-#define HSFSTS_CTL_FCYCLE_RDSR		(0x08 << HSFSTS_CTL_FCYCLE_SHIFT)
-
-#define HSFSTS_CTL_FGO			BIT(16)
-#define HSFSTS_CTL_FLOCKDN		BIT(15)
-#define HSFSTS_CTL_FDV			BIT(14)
-#define HSFSTS_CTL_SCIP			BIT(5)
-#define HSFSTS_CTL_AEL			BIT(2)
-#define HSFSTS_CTL_FCERR		BIT(1)
-#define HSFSTS_CTL_FDONE		BIT(0)
-
-#define FADDR				0x08
-#define DLOCK				0x0c
-#define FDATA(n)			(0x10 + ((n) * 4))
-
-#define FRACC				0x50
-
-#define FREG(n)				(0x54 + ((n) * 4))
-#define FREG_BASE_MASK			0x3fff
-#define FREG_LIMIT_SHIFT		16
-#define FREG_LIMIT_MASK			(0x03fff << FREG_LIMIT_SHIFT)
-
-/* Offset is from @ispi->pregs */
-#define PR(n)				((n) * 4)
-#define PR_WPE				BIT(31)
-#define PR_LIMIT_SHIFT			16
-#define PR_LIMIT_MASK			(0x3fff << PR_LIMIT_SHIFT)
-#define PR_RPE				BIT(15)
-#define PR_BASE_MASK			0x3fff
-
-/* Offsets are from @ispi->sregs */
-#define SSFSTS_CTL			0x00
-#define SSFSTS_CTL_FSMIE		BIT(23)
-#define SSFSTS_CTL_DS			BIT(22)
-#define SSFSTS_CTL_DBC_SHIFT		16
-#define SSFSTS_CTL_SPOP			BIT(11)
-#define SSFSTS_CTL_ACS			BIT(10)
-#define SSFSTS_CTL_SCGO			BIT(9)
-#define SSFSTS_CTL_COP_SHIFT		12
-#define SSFSTS_CTL_FRS			BIT(7)
-#define SSFSTS_CTL_DOFRS		BIT(6)
-#define SSFSTS_CTL_AEL			BIT(4)
-#define SSFSTS_CTL_FCERR		BIT(3)
-#define SSFSTS_CTL_FDONE		BIT(2)
-#define SSFSTS_CTL_SCIP			BIT(0)
-
-#define PREOP_OPTYPE			0x04
-#define OPMENU0				0x08
-#define OPMENU1				0x0c
-
-#define OPTYPE_READ_NO_ADDR		0
-#define OPTYPE_WRITE_NO_ADDR		1
-#define OPTYPE_READ_WITH_ADDR		2
-#define OPTYPE_WRITE_WITH_ADDR		3
-
-/* CPU specifics */
-#define BYT_PR				0x74
-#define BYT_SSFSTS_CTL			0x90
-#define BYT_BCR				0xfc
-#define BYT_BCR_WPD			BIT(0)
-#define BYT_FREG_NUM			5
-#define BYT_PR_NUM			5
-
-#define LPT_PR				0x74
-#define LPT_SSFSTS_CTL			0x90
-#define LPT_FREG_NUM			5
-#define LPT_PR_NUM			5
-
-#define BXT_PR				0x84
-#define BXT_SSFSTS_CTL			0xa0
-#define BXT_FREG_NUM			12
-#define BXT_PR_NUM			6
-
-#define CNL_PR				0x84
-#define CNL_FREG_NUM			6
-#define CNL_PR_NUM			5
-
-#define LVSCC				0xc4
-#define UVSCC				0xc8
-#define ERASE_OPCODE_SHIFT		8
-#define ERASE_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
-#define ERASE_64K_OPCODE_SHIFT		16
-#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
-
-#define INTEL_SPI_TIMEOUT		5000 /* ms */
-#define INTEL_SPI_FIFO_SZ		64
-
-/**
- * struct intel_spi - Driver private data
- * @dev: Device pointer
- * @info: Pointer to board specific info
- * @nor: SPI NOR layer structure
- * @base: Beginning of MMIO space
- * @pregs: Start of protection registers
- * @sregs: Start of software sequencer registers
- * @nregions: Maximum number of regions
- * @pr_num: Maximum number of protected range registers
- * @writeable: Is the chip writeable
- * @locked: Is SPI setting locked
- * @swseq_reg: Use SW sequencer in register reads/writes
- * @swseq_erase: Use SW sequencer in erase operation
- * @erase_64k: 64k erase supported
- * @atomic_preopcode: Holds preopcode when atomic sequence is requested
- * @opcodes: Opcodes which are supported. This are programmed by BIOS
- *           before it locks down the controller.
- */
-struct intel_spi {
-	struct device *dev;
-	const struct intel_spi_boardinfo *info;
-	struct spi_nor nor;
-	void __iomem *base;
-	void __iomem *pregs;
-	void __iomem *sregs;
-	size_t nregions;
-	size_t pr_num;
-	bool writeable;
-	bool locked;
-	bool swseq_reg;
-	bool swseq_erase;
-	bool erase_64k;
-	u8 atomic_preopcode;
-	u8 opcodes[8];
-};
+#include "intel-spi-defs.h"
 
 static bool writeable;
 module_param(writeable, bool, 0);
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-base.h b/drivers/mtd/spi-nor/controllers/intel-spi-base.h
index f2871179fd34..ac01c0756888 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-base.h
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-base.h
@@ -11,6 +11,7 @@
 
 #include <linux/platform_data/x86/intel-spi.h>
 
+struct device;
 struct intel_spi;
 struct resource;
 
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-defs.h b/drivers/mtd/spi-nor/controllers/intel-spi-defs.h
new file mode 100644
index 000000000000..89da3f38fdbe
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-defs.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel PCH/PCU SPI flash driver.
+ *
+ * Copyright (C) 2016, Intel Corporation
+ * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/sizes.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/spi-nor.h>
+
+/* Offsets are from @ispi->base */
+#define BFPREG				0x00
+
+#define HSFSTS_CTL			0x04
+#define HSFSTS_CTL_FSMIE		BIT(31)
+#define HSFSTS_CTL_FDBC_SHIFT		24
+#define HSFSTS_CTL_FDBC_MASK		(0x3f << HSFSTS_CTL_FDBC_SHIFT)
+
+#define HSFSTS_CTL_FCYCLE_SHIFT		17
+#define HSFSTS_CTL_FCYCLE_MASK		(0x0f << HSFSTS_CTL_FCYCLE_SHIFT)
+/* HW sequencer opcodes */
+#define HSFSTS_CTL_FCYCLE_READ		(0x00 << HSFSTS_CTL_FCYCLE_SHIFT)
+#define HSFSTS_CTL_FCYCLE_WRITE		(0x02 << HSFSTS_CTL_FCYCLE_SHIFT)
+#define HSFSTS_CTL_FCYCLE_ERASE		(0x03 << HSFSTS_CTL_FCYCLE_SHIFT)
+#define HSFSTS_CTL_FCYCLE_ERASE_64K	(0x04 << HSFSTS_CTL_FCYCLE_SHIFT)
+#define HSFSTS_CTL_FCYCLE_RDID		(0x06 << HSFSTS_CTL_FCYCLE_SHIFT)
+#define HSFSTS_CTL_FCYCLE_WRSR		(0x07 << HSFSTS_CTL_FCYCLE_SHIFT)
+#define HSFSTS_CTL_FCYCLE_RDSR		(0x08 << HSFSTS_CTL_FCYCLE_SHIFT)
+
+#define HSFSTS_CTL_FGO			BIT(16)
+#define HSFSTS_CTL_FLOCKDN		BIT(15)
+#define HSFSTS_CTL_FDV			BIT(14)
+#define HSFSTS_CTL_SCIP			BIT(5)
+#define HSFSTS_CTL_AEL			BIT(2)
+#define HSFSTS_CTL_FCERR		BIT(1)
+#define HSFSTS_CTL_FDONE		BIT(0)
+
+#define FADDR				0x08
+#define DLOCK				0x0c
+#define FDATA(n)			(0x10 + ((n) * 4))
+
+#define FRACC				0x50
+
+#define FREG(n)				(0x54 + ((n) * 4))
+#define FREG_BASE_MASK			0x3fff
+#define FREG_LIMIT_SHIFT		16
+#define FREG_LIMIT_MASK			(0x03fff << FREG_LIMIT_SHIFT)
+
+/* Offset is from @ispi->pregs */
+#define PR(n)				((n) * 4)
+#define PR_WPE				BIT(31)
+#define PR_LIMIT_SHIFT			16
+#define PR_LIMIT_MASK			(0x3fff << PR_LIMIT_SHIFT)
+#define PR_RPE				BIT(15)
+#define PR_BASE_MASK			0x3fff
+
+/* Offsets are from @ispi->sregs */
+#define SSFSTS_CTL			0x00
+#define SSFSTS_CTL_FSMIE		BIT(23)
+#define SSFSTS_CTL_DS			BIT(22)
+#define SSFSTS_CTL_DBC_SHIFT		16
+#define SSFSTS_CTL_SPOP			BIT(11)
+#define SSFSTS_CTL_ACS			BIT(10)
+#define SSFSTS_CTL_SCGO			BIT(9)
+#define SSFSTS_CTL_COP_SHIFT		12
+#define SSFSTS_CTL_FRS			BIT(7)
+#define SSFSTS_CTL_DOFRS		BIT(6)
+#define SSFSTS_CTL_AEL			BIT(4)
+#define SSFSTS_CTL_FCERR		BIT(3)
+#define SSFSTS_CTL_FDONE		BIT(2)
+#define SSFSTS_CTL_SCIP			BIT(0)
+
+#define PREOP_OPTYPE			0x04
+#define OPMENU0				0x08
+#define OPMENU1				0x0c
+
+#define OPTYPE_READ_NO_ADDR		0
+#define OPTYPE_WRITE_NO_ADDR		1
+#define OPTYPE_READ_WITH_ADDR		2
+#define OPTYPE_WRITE_WITH_ADDR		3
+
+/* CPU specifics */
+#define BYT_PR				0x74
+#define BYT_SSFSTS_CTL			0x90
+#define BYT_BCR				0xfc
+#define BYT_BCR_WPD			BIT(0)
+#define BYT_FREG_NUM			5
+#define BYT_PR_NUM			5
+
+#define LPT_PR				0x74
+#define LPT_SSFSTS_CTL			0x90
+#define LPT_FREG_NUM			5
+#define LPT_PR_NUM			5
+
+#define BXT_PR				0x84
+#define BXT_SSFSTS_CTL			0xa0
+#define BXT_FREG_NUM			12
+#define BXT_PR_NUM			6
+
+#define CNL_PR				0x84
+#define CNL_FREG_NUM			6
+#define CNL_PR_NUM			5
+
+#define LVSCC				0xc4
+#define UVSCC				0xc8
+#define ERASE_OPCODE_SHIFT		8
+#define ERASE_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
+#define ERASE_64K_OPCODE_SHIFT		16
+#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
+
+#define INTEL_SPI_TIMEOUT		5000 /* ms */
+#define INTEL_SPI_FIFO_SZ		64
+
+/**
+ * struct intel_spi - Driver private data
+ * @dev: Device pointer
+ * @info: Pointer to board specific info
+ * @nor: SPI NOR layer structure
+ * @base: Beginning of MMIO space
+ * @pregs: Start of protection registers
+ * @sregs: Start of software sequencer registers
+ * @nregions: Maximum number of regions
+ * @pr_num: Maximum number of protected range registers
+ * @writeable: Is the chip writeable
+ * @locked: Is SPI setting locked
+ * @swseq_reg: Use SW sequencer in register reads/writes
+ * @swseq_erase: Use SW sequencer in erase operation
+ * @erase_64k: 64k erase supported
+ * @atomic_preopcode: Holds preopcode when atomic sequence is requested
+ * @opcodes: Opcodes which are supported. This are programmed by BIOS
+ *           before it locks down the controller.
+ */
+struct intel_spi {
+	struct device *dev;
+	const struct intel_spi_boardinfo *info;
+	struct spi_nor nor;
+	void __iomem *base;
+	void __iomem *pregs;
+	void __iomem *sregs;
+	size_t nregions;
+	size_t pr_num;
+	bool writeable;
+	bool locked;
+	bool swseq_reg;
+	bool swseq_erase;
+	bool erase_64k;
+	u8 atomic_preopcode;
+	u8 opcodes[8];
+};
diff --git a/include/linux/platform_data/x86/intel-spi.h b/include/linux/platform_data/x86/intel-spi.h
index 7f53a5c6f35e..4092a104f266 100644
--- a/include/linux/platform_data/x86/intel-spi.h
+++ b/include/linux/platform_data/x86/intel-spi.h
@@ -9,6 +9,8 @@
 #ifndef INTEL_SPI_PDATA_H
 #define INTEL_SPI_PDATA_H
 
+#include <linux/types.h>
+
 enum intel_spi_type {
 	INTEL_SPI_BYT = 1,
 	INTEL_SPI_LPT,
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
