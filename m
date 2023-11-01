Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16DBC0018C
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMju3oNTq7DBiRrhpKj+y8Wp97FtB5ps+vy/eAMKZd0=; b=ioP9o7B2/kMVda
	LbYGeiCoYGwzudpcvMvvamDF455fYvvDcu5bbACbEqC64q8T5BPitRPnQ/Tv/6DlB84VS6Fn4DDgl
	O3SOhvd9sZ1hehVCX4CdXRO5qelzlpX92HzWaa/sMswClmONLwkx0arthOPYnR/zskiwtFAvAyRIr
	4wMjeDzfnn29nYMQia0TqMqwOyiOC9jM7A/d7uU0eLYse7tuHIkFIJFdTNee9NuoDy0pGkUNlqIhP
	4RbfQlRzxQrPUmdhTsZemt8s8PCo75k4YuhK/6M5Jet7/1iK5YmAJoSxMGyaaokrf2Zlev4KngzPL
	esRS2skTQPCaYOGa9izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgd-007gjW-0w;
	Wed, 01 Nov 2023 14:59:15 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgS-007gdF-2q
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d216597f64so624740266b.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850741; x=1699455541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4tJ4GOKVAMYiRqtkpPxgpMnp8wqfNy+IrCACp9J/W0=;
        b=CP5V/TZGTMYhltsT7fLlAxRpfSlXTckHx65rR/NOvMT6HEkqG7F2dPZMz6+psDOb3p
         Sazn2RiQ5GMoi7JIK4oYU2fA0QgsiVihyUthgC3U2iBB5FQVPYWXfIHcUOsDNUCTCNKC
         z2+9Q5VggC8hUo/sEBJYydhPf2z8sGbmnac/Sa4spUl6yWtfMT1lzShz3bSwcWN8v1vF
         2hV9r6UzhzG1YWMBDQUNyoubgEp/8zmYNxgtcii9aRkFJ/lGFMgpNJisZspbBLycZsWU
         Wo2FxJg80Ivlh4dInGAe4jRWVR5NSCj8+hTyk6n38l9xHbYejtHf2DLtOIWi7Pkr0hfQ
         eA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850741; x=1699455541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4tJ4GOKVAMYiRqtkpPxgpMnp8wqfNy+IrCACp9J/W0=;
        b=fbFjc6Z/0NNhnT3LG0GBNLSF74itbrvxeBuSW2HQZnzNU7IT1cbfj2cvXK5mmswOhV
         rcWcJQTOfpN1P+yWGP+XU3EKh3P4mA9Ya3uh0w4T51U3tbFQvbPAFMiW3Atpa8WUCNbo
         oza8M6pWB550t46EsrapybQgAVf+ON8b1zw6DiuQKb6+H7RGNat2wxTH90HPzc39o5yJ
         AcJRmlf9IkNPg6DDYCWnWWHyDMg8+DcAv5Tln3RXxoXsJ3VYrM9L5EWdebEiZYnh64hA
         1iztxfdBSkU/F4xIUNXgOXnQR+oGpWlaGFTW1Oyg0dP0kioZorGoWyye3DXyy24elPD+
         8hhA==
X-Gm-Message-State: AOJu0YzpLkUEodXtGx67i6EJW4j4hhQeNx9wWXwGUfOTuwLU6akKv+gT
	H5wHurz5H8Tk/blmaLU61xn/7w==
X-Google-Smtp-Source: AGHT+IH/8gsOuXf6sYmJYsmU54xjggL87VxdM5USH1Sap1Lr2Wch+iERnHSu6OWTllRrz12qntgw9A==
X-Received: by 2002:a17:906:db0d:b0:9d3:ccd1:a922 with SMTP id xj13-20020a170906db0d00b009d3ccd1a922mr2114912ejb.58.1698850740759;
        Wed, 01 Nov 2023 07:59:00 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:59:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Date: Wed,  1 Nov 2023 14:58:49 +0000
Message-ID: <20231101145853.524045-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075904_921373_32D651DA 
X-CRM114-Status: GOOD (  25.83  )
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

JESD216 defines a chip as a die, one and the other are the same thing.
JESD216 clarifies that the chip erase time defined in BFPT dword(11)
applies separately to each die for multi-die devices in which the dice
are individually accessed. Based on this, update the
spi_nor_erase_chip() method to support multi-die devices.

For now, benefit of the die erase when addr and len are aligned with die
size. This could be improved however for the uniform and non-uniform
erases cases to use the die erase when possible. For example if one
requests that an erase of a 2 die device starting from the last 64KB of
the first die to the end of the flash size, we could use just 2
commands, a 64KB erase and a die erase. This improvement is left as an
exercise for the reader, as I don't have multi die flashes at hand.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c    | 104 +++++++++++++++++++++++-----------
 drivers/mtd/spi-nor/core.h    |   8 ++-
 drivers/mtd/spi-nor/debugfs.c |   2 +-
 3 files changed, 78 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 25a64c65717d..ac2651e76285 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1065,19 +1065,25 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_erase_chip(struct spi_nor *nor)
+static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
 {
+	bool multi_die = nor->mtd.size == die_size;
 	int ret;
 
-	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
+	dev_dbg(nor->dev, " %lldKiB\n", (long long)(die_size >> 10));
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
+		struct spi_mem_op op =
+			SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
+					     nor->addr_nbytes, addr, multi_die);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
+		if (multi_die)
+			return -EOPNOTSUPP;
+
 		ret = spi_nor_controller_ops_write_reg(nor,
 						       SPINOR_OP_CHIP_ERASE,
 						       NULL, 0);
@@ -1792,6 +1798,51 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 	return ret;
 }
 
+static int spi_nor_erase_dice(struct spi_nor *nor, loff_t addr,
+			      size_t len, size_t die_size)
+{
+	unsigned long timeout;
+	int ret;
+
+	/*
+	 * Scale the timeout linearly with the size of the flash, with
+	 * a minimum calibrated to an old 2MB flash. We could try to
+	 * pull these from CFI/SFDP, but these values should be good
+	 * enough for now.
+	 */
+	timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
+		      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
+		      (unsigned long)(nor->mtd.size / SZ_2M));
+
+	do {
+		ret = spi_nor_lock_device(nor);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_write_enable(nor);
+		if (ret) {
+			spi_nor_unlock_device(nor);
+			return ret;
+		}
+
+		ret = spi_nor_erase_die(nor, addr, die_size);
+
+		spi_nor_unlock_device(nor);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
+		if (ret)
+			return ret;
+
+		addr += die_size;
+		len -= die_size;
+
+	} while (len);
+
+	return 0;
+}
+
 /*
  * Erase an address range on the nor chip.  The address range may extend
  * one or more erase sectors. Return an error if there is a problem erasing.
@@ -1799,7 +1850,10 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	u8 n_dice = nor->params->n_dice;
+	bool multi_die_erase = false;
 	u32 addr, len, rem;
+	size_t die_size;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
@@ -1814,39 +1868,22 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
+	if (n_dice) {
+		die_size = div_u64(mtd->size, n_dice);
+		if (len == die_size && (addr & (die_size - 1)))
+			multi_die_erase = true;
+	} else {
+		die_size = mtd->size;
+	}
+
 	ret = spi_nor_prep_and_lock_pe(nor, instr->addr, instr->len);
 	if (ret)
 		return ret;
 
-	/* whole-chip erase? */
-	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
-		unsigned long timeout;
-
-		ret = spi_nor_lock_device(nor);
-		if (ret)
-			goto erase_err;
-
-		ret = spi_nor_write_enable(nor);
-		if (ret) {
-			spi_nor_unlock_device(nor);
-			goto erase_err;
-		}
-
-		ret = spi_nor_erase_chip(nor);
-		spi_nor_unlock_device(nor);
-		if (ret)
-			goto erase_err;
-
-		/*
-		 * Scale the timeout linearly with the size of the flash, with
-		 * a minimum calibrated to an old 2MB flash. We could try to
-		 * pull these from CFI/SFDP, but these values should be good
-		 * enough for now.
-		 */
-		timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
-			      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
-			      (unsigned long)(mtd->size / SZ_2M));
-		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
+	/* chip (die) erase? */
+	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) ||
+	    multi_die_erase) {
+		ret = spi_nor_erase_dice(nor, addr, len, die_size);
 		if (ret)
 			goto erase_err;
 
@@ -2902,6 +2939,9 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
+	if (!nor->params->die_erase_opcode)
+		nor->params->die_erase_opcode = SPINOR_OP_CHIP_ERASE;
+
 	/* Default method kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index a456042379ee..b43ea2d49e74 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -85,9 +85,9 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPI_NOR_CHIP_ERASE_OP						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CHIP_ERASE, 0),		\
-		   SPI_MEM_OP_NO_ADDR,					\
+#define SPI_NOR_DIE_ERASE_OP(opcode, addr_nbytes, addr, dice)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
+		   SPI_MEM_OP_ADDR(dice ? addr_nbytes : 0, addr, 0),	\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
@@ -362,6 +362,7 @@ struct spi_nor_otp {
  *			command in octal DTR mode.
  * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
+ * @die_erase_opcode:	die erase opcode. Defaults to SPINOR_OP_CHIP_ERASE.
  * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
@@ -399,6 +400,7 @@ struct spi_nor_flash_parameter {
 	u8				rdsr_addr_nbytes;
 	u8				n_banks;
 	u8				n_dice;
+	u8				die_erase_opcode;
 	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 6e163cb5b478..2dbda6b6938a 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -138,7 +138,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", SPINOR_OP_CHIP_ERASE, buf);
+		seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");
-- 
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
