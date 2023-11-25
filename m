Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C4C61D9D
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+4SG0IZWW70Q+SUdsYoRCuh4wG7GAnzzDGY26h4zGE=; b=tQpiEYqZKOyuVb
	ocdN5pPbgNCAgLFHpSHDm5CRax8Y1pR8sh7gzIvKxW0bTSrXI8S7wYrkTCsIzOAARDGbkOFbop29m
	x/jayrQGIJNRwKdNZhKvve0cpCBkHNACjC60Xz4ZTJ4eu/+14QgPjy/PeZhNhZZ0/wCS8hLg0Efr0
	hHCdLW+hzAJ72WYEdTh9VVKuYKQmugpVDRT9aqyRkuJIyI9KkmRx0u9ymSgeJWB8RspM3bb1uF0Yu
	D+SvVZ8FHMmijLms+OmXzqsVZsAEWDefLZtZ2WqdVKQdTO5au8SU6NUGgf1SSNo7r3uaDJdRERjgw
	ZLyiOufJdIGltFdNbIrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt0-009Eet-1b;
	Sat, 25 Nov 2023 12:35:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rsw-009EdU-2g
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:35:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a0b7f793b8aso52843566b.2
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915744; x=1701520544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwaGFfjTp3MdUyu4HXIQJE1nTK+r/9eQj8Xn3+U7IOY=;
        b=XIptENGWgCp0WdQtWZXhF49JG3IGENsZg14lQbk1rw1MCjuU1wW9VNwtIkXWozTgWc
         8Iea2zgbDXRl90T/Q0tIfd39aI1l4/QyvIvW/bess47sr6ZQUqBdNJcXl9szc+ZNIVSm
         1zfz2+sZcT8BxfQ8okctXSHzBkDDZ48FAihH3ocSGrWXO4q1+NZux4qI6vrc9VMyErai
         6+u5Q1h15efDlKm/q8alxz+LcXwnQ4+SRLyG5KWCsCXDepvuVlD681FK6n2D0ZW6jOjq
         mUjbOHkzzttBoZgR5Z9dnkdMhy8NbLysT2xTkpKNYNkH606rsIaeW7oj6az77Z/KWtZI
         8oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915744; x=1701520544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwaGFfjTp3MdUyu4HXIQJE1nTK+r/9eQj8Xn3+U7IOY=;
        b=tQTcPzzF8FnaFgWTaQe49LP/X8MlqOE9vth6sMdg0KGhfQ5E2WlVGTtG7EfiYAQQge
         BrsW6kCnF8Ki9g4UjHau8JfcEs6jGPpFOjAzYb6IHFornUC4/EeLyDMC1Qgo1sFRFL/U
         WDEzpmhvz3Y+NZF+HNlQtsZk/a4MVLCRd8sJDucmGHqz3P/exY0GKXY+8o4LRZOpyAI5
         abXwnO6M+amjkDGf1QlD6AtVlcPdNNeqtzjiS45L5HTJpZPi6uxVOXoXq0qXLx15Gc35
         fTCnjYl/zuQJ7IfEt0Lz7Tk0LnQsD6WB3R484wvmCbMFZN0ooswupGIWkIfQYJ/CEwN7
         isgg==
X-Gm-Message-State: AOJu0YzwFxlQMUKOJkDGB60vrIvh9eL68n5RcT0HWP+K8m7VQ2r2/fyu
	VX+q7gRAmW39zRoN6LPin3ZUVg==
X-Google-Smtp-Source: AGHT+IGAh8jsiUhl6UtIFWsfJXyXGD8USUMSqmsXSBl7NLyfM3hjWivAsEVjOn/OjRies6EwkILwrA==
X-Received: by 2002:a17:906:155a:b0:9fd:6400:b62f with SMTP id c26-20020a170906155a00b009fd6400b62fmr3524464ejd.29.1700915744021;
        Sat, 25 Nov 2023 04:35:44 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm3390163ejb.209.2023.11.25.04.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 04:35:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/5] mtd: spi-nor: add erase die (chip) capability
Date: Sat, 25 Nov 2023 14:35:25 +0200
Message-Id: <20231125123529.55686-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8121; i=tudor.ambarus@linaro.org; h=from:subject; bh=uU48oE12zCECngrtZ3sUBC2BQtjDfvVFXHi6d9CaOqQ=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYeoQhHeDSJc4wiPTk6XJTim0AsXkv6rjkK0Cp YDgSMagl5KJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWHqEAAKCRBLVU9HpY0U 6eCHCACrxWZqJGEc+n/OAVwbhdvsO1HgFyeZOf1qnlAeawV/pFBqiN8ur0ubOchAOvmGC1GoZY3 ekciT8gDpgHU5yGQek3Zkz0aS4gWQG91a7Xy7Pmr/SLSV49mciQTWe8c7S4GbKWIiDk3PshiyJV ymrVUoQIN2+qRJS4DDPzeljInD2YjGoWSNc3xRbStozqffIymYNv0uhj++jUnBIXPAXzp9H9fiS NYt36qSTZTGJtZlNxda+oaR9B351q6ssUkaAAC2fi8rdXEjsoNjq70IMGQU2qKjSl1sp6IZJsQ9 ai8WEzvGWc9DbTVLwqYDR4OzyRGR/7gIcr1MwYZHo0pTgzS3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043546_871437_B5466121 
X-CRM114-Status: GOOD (  27.92  )
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

JESD216 mentions die erase, but does not provide an opcode for it.
Check BFPT dword 11, bits 30:24, "Chip Erase, Typical time", it says:

"Typical time to erase one chip (die). User must poll device busy to
determine if the operation has completed. For a device consisting of
multiple dies, that are individually accessed, the time is for each die
to which a chip erase command is applied."

So when a flash consists of a single die, this is the erase time for the
full chip (die) erase, and when it consists of multiple dies, it's the
die erase time. Chip and die are the same thing.

Add support for die erase. For now, benefit of the die erase when addr
and len are aligned with die size. This could be improved however for
the uniform and non-uniform erases cases to use the die erase when
possible. For example if one requests that an erase of a 2 die device
starting from the last 64KB of the first die to the end of the flash
size, we could use just 2 commands, a 64KB erase and a die erase.
This improvement is left as an exercise for the reader.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c    | 108 +++++++++++++++++++++++-----------
 drivers/mtd/spi-nor/core.h    |   8 ++-
 drivers/mtd/spi-nor/debugfs.c |   2 +-
 3 files changed, 81 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 25a64c65717d..479494cf00c9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1060,24 +1060,32 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 }
 
 /**
- * spi_nor_erase_chip() - Erase the entire flash memory.
+ * spi_nor_erase_die() - Erase the entire die.
  * @nor:	pointer to 'struct spi_nor'.
+ * @addr:	address of the die.
+ * @die_size:	size of the die.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_erase_chip(struct spi_nor *nor)
+static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
 {
+	bool multi_die = nor->mtd.size != die_size;
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
@@ -1792,6 +1800,51 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
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
@@ -1799,7 +1852,10 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	u8 n_dice = nor->params->n_dice;
+	bool multi_die_erase = false;
 	u32 addr, len, rem;
+	size_t die_size;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
@@ -1814,39 +1870,22 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
+	if (n_dice) {
+		die_size = div_u64(mtd->size, n_dice);
+		if (!(len & (die_size - 1)) && !(addr & (die_size - 1)))
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
 
@@ -2902,6 +2941,9 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
