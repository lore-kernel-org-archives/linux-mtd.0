Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9C9C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 03:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gI6qwuRwKdxspcaCMH0Rm1GgW/Znd9Z2P/LNqf49SlE=; b=X9AbQRYIRm7Yl0
	UinFF5HWstr0JFGTslFEMPT1DRaslWCcUKLoaS4ZKOSlg+inoRDqHs4/jhaJtLY9xd5ayfKR0SgK5
	prk0wm6gS1gH3Ph0cruqW6CKniBgBG1qIzHLEPtrBOvz31kesl2DX7KQXwkvWVh64gNSXDPaDKTAo
	dkKd7NE5mBX9fS08zdsyRlsrntrbG/BLmvAq4OO8BOMSdLK3GzUdd0ZapjOgIyTxFDMN3mU5P61gp
	7HWuKMGmVc99Y0tlj0I9UrZ5RpX9fsMjAUwQfH4rByCFLq1ySO4m2UUnM1oH3Q2rJrr4fTYHGwNyj
	5kamBswALWSDiuUK3xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfCxI-008H2r-L9; Fri, 15 Apr 2022 03:49:08 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfCxE-008Gzv-UV
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 03:49:07 +0000
Received: by mail-pf1-x430.google.com with SMTP id w7so6408870pfu.11
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 20:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cOu5HOeeJxgrmt06WrnIN1Ju5cm6rMHpTJlllT1DDNQ=;
 b=EfClDapPtVo1yqlijxLL7X/Bucnv+wzfD1WZpi+OSqW7b1vd1WdluJYO1IYUQNZo+w
 ozmZqNDNuZvrXsGLeqcWeoL6igjv8JCq42Yoo475fX/0Qi7F4LzGmsMEoc21T3UTOn00
 smYHgJnX/0AZSY0oqwPFydf37jkzkQWFxkaXWnOpvzvOrHxfxKq3l4QTML1j25nDjejM
 KDN4vV2uuk6dtE9f40LGRijb4RH5tQ5x2iE8Pd2n2vtgO4WzktBe11AdOqRYNJ0d1YZY
 D5z9oWDnkdzhKgnv7yv/ypS+u//K0WNp46OHHeCj4oDXG3e+MuAWzlKfM7EPq5gd7//q
 9e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOu5HOeeJxgrmt06WrnIN1Ju5cm6rMHpTJlllT1DDNQ=;
 b=P0j3jfFYvUw8hlectzj5R3ggY5Dg4yNyFROW1dDT5iLLWkG7fghLXzkGpl7JHOmIHF
 jEYaPthmVeGE9yJQ3tYtr3PuelqW/9rYdKZBDKh65xB65BHtxDOnSAqO6/kEKhWvmc39
 kaFjcNhApsWslxsyILpKz6X9cg990A0pehRDZMjbUTEWPxSUWOF7jrRm/Cfg1kPNHoVV
 kawA6ANbkwhxPwPJObv/xHuZ9I7mDlEfpYoj2Czus+S9n3ZFekC49/K+zL8ix+7NbY00
 KMX2KxQ1KnB2tsAFwHEOTCshGQTPEiV8+26a9KiUJv7wvJOXyUZZiBdWZzedKyPeidzG
 zZvQ==
X-Gm-Message-State: AOAM530DtVky10aQ1/CIpJGVuFCR67ml2qcm3HQrc6wbLYFDqG1qc4WN
 pQqLWYeYl5A4mqIWySktRBnXFrzKXBLZEmjA
X-Google-Smtp-Source: ABdhPJxMzGvfNso7R08vvW0ZL/vN9D5T1cMUnBq1Ng2xq0RpC/6Iq+Ah2wKErNe4ZbEWQRxxDe752Q==
X-Received: by 2002:a63:cf41:0:b0:399:3e74:d249 with SMTP id
 b1-20020a63cf41000000b003993e74d249mr4880310pgj.475.1649994542974; 
 Thu, 14 Apr 2022 20:49:02 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm7426380pjb.25.2022.04.14.20.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 20:49:02 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mtd: spinand: add support for detection with param page
Date: Fri, 15 Apr 2022 11:48:43 +0800
Message-Id: <20220415034844.1024538-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415034844.1024538-1-gch981213@gmail.com>
References: <20220415034844.1024538-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_204905_033717_7C425669 
X-CRM114-Status: GOOD (  31.04  )
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

SPI-NAND detection using chip ID isn't always reliable.
Here are two known cases:
1. ESMT uses JEDEC ID from other vendors. This may collapse with future
   chips.
2. Winbond W25N01KV uses the exact same JEDEC ID as W25N01GV while
   having completely different chip parameters.

Recent SPI-NANDs have a parameter page which is stored in the same
format as raw NAND ONFI data. There are strings for chip manufacturer
and chip model. Chip ECC requirement and memory organization are
available too.
This patch adds support for detecting SPI-NANDs with the parameter page
after ID matching failed. In this detection, memory organization and
ECC requirements are taken from the parameter page, and other SPI-NAND
specific parameters are obtained by matching chip model string with
a separated table.

It's common for vendors to release a series of SPI-NANDs with the same
SPI-NAND parameters in different voltages and/or capacities. The chip
table defined in this patch supports multiple model strings in one
entry, and multiple chip models can be covered using only one entry.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
The parameter page has sufficient checking to reject garbage data,
and the reading sequence seems to be the same across vendors.
So I think it isn't necessary to keep it vendor-private.

Change since v1: drop duplicated code from rawnand and use extracted
functions instead.

 drivers/mtd/nand/spi/Makefile |   2 +-
 drivers/mtd/nand/spi/core.c   |  23 ++--
 drivers/mtd/nand/spi/onfi.c   | 217 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |  50 ++++++++
 4 files changed, 280 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/onfi.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 9662b9c1d5a9..a4e057cbdaf7 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
+spinand-objs := core.o gigadevice.o macronix.o micron.o onfi.o paragon.o toshiba.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index ff8336870bc0..3b51ca7232d0 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -20,7 +20,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
-static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
+int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
 						      spinand->scratchbuf);
@@ -34,7 +34,7 @@ static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 	return 0;
 }
 
-static int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
+int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
 	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
 						      spinand->scratchbuf);
@@ -339,7 +339,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
 		engine_conf->status = status;
 }
 
-static int spinand_write_enable_op(struct spinand_device *spinand)
+int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
 
@@ -496,10 +496,8 @@ static int spinand_erase_op(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
-static int spinand_wait(struct spinand_device *spinand,
-			unsigned long initial_delay_us,
-			unsigned long poll_delay_us,
-			u8 *s)
+int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
+		 unsigned long poll_delay_us, u8 *s)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
 						      spinand->scratchbuf);
@@ -1006,7 +1004,7 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
-static const struct spi_mem_op *
+const struct spi_mem_op *
 spinand_select_op_variant(struct spinand_device *spinand,
 			  const struct spinand_op_variants *variants)
 {
@@ -1117,9 +1115,12 @@ static int spinand_detect(struct spinand_device *spinand)
 
 	ret = spinand_id_detect(spinand);
 	if (ret) {
-		dev_err(dev, "unknown raw ID %*phN\n", SPINAND_MAX_ID_LEN,
-			spinand->id.data);
-		return ret;
+		ret = spinand_onfi_detect(spinand);
+		if (ret) {
+			dev_err(dev, "unknown raw ID %*phN\n",
+				SPINAND_MAX_ID_LEN, spinand->id.data);
+			return ret;
+		}
 	}
 
 	if (nand->memorg.ntargets > 1 && !spinand->select_target) {
diff --git a/drivers/mtd/nand/spi/onfi.c b/drivers/mtd/nand/spi/onfi.c
new file mode 100644
index 000000000000..6d3a7e7c4f6e
--- /dev/null
+++ b/drivers/mtd/nand/spi/onfi.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Detect and match SPI-NAND info using ONFI parameter page
+ *
+ * Author:
+ *	Chuanhong Guo <gch981213@gmail.com>
+ *
+ * Part of this code comes from nand_onfi.c in raw nand support.
+ *
+ */
+#include <linux/mtd/onfi.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_IDR_EN BIT(6)
+#define SPINAND_PARAM_PAGE 1
+#define ONFI_PARAM_PAGES 3
+
+static int spinand_onfi_read(struct spinand_device *spinand, void *buf,
+			     size_t len)
+{
+	const struct spi_mem_op load_page =
+		SPINAND_PAGE_READ_OP(SPINAND_PARAM_PAGE);
+	struct spi_mem_op read_cache =
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, buf, len);
+	int ret;
+	u8 cfg;
+
+	ret = spinand_read_reg_op(spinand, REG_CFG, &cfg);
+	if (ret)
+		return ret;
+
+	ret = spinand_write_enable_op(spinand);
+	if (ret)
+		return ret;
+
+	ret = spinand_write_reg_op(spinand, REG_CFG, cfg | SPINAND_IDR_EN);
+	if (ret)
+		return ret;
+
+	ret = spinand_read_reg_op(spinand, REG_CFG, &cfg);
+	if (ret)
+		return ret;
+
+	if (!(cfg & SPINAND_IDR_EN))
+		return -EINVAL;
+
+	ret = spi_mem_exec_op(spinand->spimem, &load_page);
+	if (ret)
+		goto cleanup;
+
+	ret = spinand_wait(spinand, SPINAND_READ_INITIAL_DELAY_US,
+			   SPINAND_READ_POLL_DELAY_US, NULL);
+	if (ret)
+		goto cleanup;
+
+	while (len) {
+		ret = spi_mem_adjust_op_size(spinand->spimem, &read_cache);
+		if (ret)
+			goto cleanup;
+		ret = spi_mem_exec_op(spinand->spimem, &read_cache);
+		if (ret)
+			goto cleanup;
+		read_cache.addr.val += read_cache.data.nbytes;
+		read_cache.data.buf.in += read_cache.data.nbytes;
+		len -= read_cache.data.nbytes;
+		read_cache.data.nbytes = len;
+	}
+cleanup:
+	spinand_write_reg_op(spinand, REG_CFG, cfg & ~SPINAND_IDR_EN);
+	return ret;
+}
+
+static bool spinand_onfi_validate(const struct nand_onfi_params *p)
+{
+	u16 crc;
+
+	if (strncmp("ONFI", p->sig, 4))
+		return false;
+	crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)p, sizeof(*p) - 2);
+	return crc == le16_to_cpu(p->crc);
+}
+
+static const struct spinand_manufacturer *spinand_onfi_manufacturers[] = {};
+
+static const struct spinand_onfi_info *
+spinand_onfi_chip_match(struct nand_onfi_params *p,
+			const struct spinand_manufacturer *m)
+{
+	size_t i, j;
+
+	for (i = 0; i < m->nchips; i++)
+		for (j = 0; m->onfi_chips[i].models[j]; j++)
+			if (!strcasecmp(m->onfi_chips[i].models[j], p->model))
+				return &m->onfi_chips[i];
+	return NULL;
+}
+
+static const struct spinand_onfi_info *
+spinand_onfi_manufacturer_match(struct spinand_device *spinand,
+				struct nand_onfi_params *p)
+{
+	const struct spinand_onfi_info *ret;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(spinand_onfi_manufacturers); i++) {
+		if (strcasecmp(spinand_onfi_manufacturers[i]->name,
+			       p->manufacturer))
+			continue;
+		spinand->manufacturer = spinand_onfi_manufacturers[i];
+		ret = spinand_onfi_chip_match(p, spinand_onfi_manufacturers[i]);
+		if (ret)
+			return ret;
+	}
+	return NULL;
+}
+
+/**
+ * spinand_onfi_detect() - match SPI-NAND using ONFI parameter page
+ * @spinand: spinand private structure
+ *
+ * Return:
+ *  0: Success
+ *  -EINVAL: failed to read a valid parameter page
+ *  -EOPNOTSUPP: chip isn't supported
+ */
+int spinand_onfi_detect(struct spinand_device *spinand)
+{
+	struct nand_onfi_params *p = NULL, *pbuf;
+	size_t params_len = sizeof(*pbuf) * ONFI_PARAM_PAGES;
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct nand_memory_organization *memorg = nanddev_get_memorg(nand);
+	const struct spi_mem_op *op;
+	const struct spinand_onfi_info *info;
+	int i, ret;
+
+	pbuf = kzalloc(params_len, GFP_KERNEL);
+	if (!pbuf)
+		return -ENOMEM;
+
+	ret = spinand_onfi_read(spinand, pbuf, params_len);
+	if (ret)
+		goto cleanup;
+
+	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
+		if (spinand_onfi_validate(&pbuf[i])) {
+			p = &pbuf[i];
+			break;
+		}
+	}
+
+	if (!p) {
+		const void *srcbufs[ONFI_PARAM_PAGES];
+		unsigned int j;
+
+		for (j = 0; j < ONFI_PARAM_PAGES; j++)
+			srcbufs[j] = pbuf + j;
+		onfi_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
+				       sizeof(*pbuf));
+		if (spinand_onfi_validate(pbuf))
+			p = pbuf;
+	}
+
+	if (!p) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	onfi_sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+	onfi_sanitize_string(p->model, sizeof(p->model));
+
+	info = spinand_onfi_manufacturer_match(spinand, p);
+	if (!info) {
+		dev_err(&spinand->spimem->spi->dev, "unknown chip: %s %s",
+			p->manufacturer, p->model);
+		ret = -EOPNOTSUPP;
+		goto cleanup;
+	}
+
+	onfi_parse_memorg(p, memorg);
+	memorg->ntargets = 1;
+
+	if (p->ecc_bits != 0xff) {
+		struct nand_ecc_props requirements = {
+			.strength = p->ecc_bits,
+			.step_size = p->data_bytes_per_ppage,
+		};
+
+		nanddev_set_ecc_requirements(nand, &requirements);
+	} else {
+		ret = -EINVAL;
+	}
+
+	/* setup spi-nand specific ops */
+	spinand->eccinfo = info->eccinfo;
+	spinand->flags = info->flags;
+	spinand->id.len = 0;
+	spinand->select_target = info->select_target;
+
+	op = spinand_select_op_variant(spinand, info->op_variants.read_cache);
+	if (!op)
+		return -EOPNOTSUPP;
+
+	spinand->op_templates.read_cache = op;
+
+	op = spinand_select_op_variant(spinand, info->op_variants.write_cache);
+	if (!op)
+		return -EOPNOTSUPP;
+
+	spinand->op_templates.write_cache = op;
+
+	op = spinand_select_op_variant(spinand, info->op_variants.update_cache);
+	spinand->op_templates.update_cache = op;
+
+cleanup:
+	kfree(pbuf);
+	return ret;
+}
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 3aa28240a77f..dc218082d773 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -255,6 +255,7 @@ struct spinand_manufacturer {
 	u8 id;
 	char *name;
 	const struct spinand_info *chips;
+	const struct spinand_onfi_info *onfi_chips;
 	const size_t nchips;
 	const struct spinand_manufacturer_ops *ops;
 };
@@ -386,6 +387,46 @@ struct spinand_info {
 		__VA_ARGS__						\
 	}
 
+/**
+ * struct spinand_onfi_info - Structure used to describe SPI NAND with ONFI
+ *			      parameter page
+ * @models: Model name array. Null terminated.
+ * @flags: OR-ing of the SPINAND_XXX flags
+ * @eccinfo: on-die ECC info
+ * @op_variants: operations variants
+ * @op_variants.read_cache: variants of the read-cache operation
+ * @op_variants.write_cache: variants of the write-cache operation
+ * @op_variants.update_cache: variants of the update-cache operation
+ * @select_target: function used to select a target/die. Required only for
+ *		   multi-die chips
+ *
+ * Each SPI NAND manufacturer driver should have a spinand_onfi_info table
+ * describing all the chips supported by the driver.
+ */
+struct spinand_onfi_info {
+	const char **const models;
+	u32 flags;
+	struct spinand_ecc_info eccinfo;
+	struct {
+		const struct spinand_op_variants *read_cache;
+		const struct spinand_op_variants *write_cache;
+		const struct spinand_op_variants *update_cache;
+	} op_variants;
+	int (*select_target)(struct spinand_device *spinand,
+			     unsigned int target);
+};
+
+#define SPINAND_ONFI_MODELS(...)					\
+	.models = (const char *[]){ __VA_ARGS__, NULL }
+
+#define SPINAND_ONFI_INFO(__models, __op_variants, __flags, ...)	\
+	{								\
+		__models,						\
+		.op_variants = __op_variants,				\
+		.flags = __flags,					\
+		__VA_ARGS__						\
+	}
+
 struct spinand_dirmap {
 	struct spi_mem_dirmap_desc *wdesc;
 	struct spi_mem_dirmap_desc *rdesc;
@@ -511,7 +552,16 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			   unsigned int table_size,
 			   enum spinand_readid_method rdid_method);
 
+int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val);
+int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val);
+int spinand_write_enable_op(struct spinand_device *spinand);
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
+int spinand_onfi_detect(struct spinand_device *spinand);
+const struct spi_mem_op *
+spinand_select_op_variant(struct spinand_device *spinand,
+			  const struct spinand_op_variants *variants);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
+int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
+		 unsigned long poll_delay_us, u8 *s);
 
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
