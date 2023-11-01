Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D8C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUTUVcCoz6gJK82V22uTZcEwX5rCCq7EJLn6FQRXQmQ=; b=Knf4oLnhUDp4hr
	ZwOl0zf1Q4BCuaDs65X1+jFeWdH+KB24ittWnD0VS9khNLkyqDXTKWvxBzYUk+mMGH7Id1o0KRAPm
	oeTSeqCCIJQyRQ777yOguHDbEfXnjra/+OlZ3TpuprvsrGhMr9k/xB2MDc9McGjCsiTz9RM02tzaH
	jxEsvwfdLe0KRlhVJaL2JuDQgPv7v6qRio2sS8Rtiv/rU4rQKfzcQ0PW15wOrTQ1t357zyUlsg4WM
	ZkbRtPfGQ2MLqpGn7AcxhGMqnnPgGSIj74nG+WFYyKSU2HGw079705qL0RHSXIRuoR8z1oNl63b+y
	mJcaqjiBitgZb8aEgDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lE-006y9u-1X;
	Wed, 01 Nov 2023 09:43:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7l8-006y6g-0d
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9c3aec5f326so136887566b.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831813; x=1699436613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkPPHb9qC7W6kxjffeC/m/sVPn9YkCUQKbt5PruPSUw=;
        b=Ss1xfrnbDJ/4arc9AFb5Og0oL9E7iMhTjjB6KpgGKhjzFfxB6W/xtGWEhyJHibcKtk
         ypzog+nJyQY8pzQo8tTiblnn4OBOPJs49BU2ISL4s6T8b5RlNnsILKM8K3KDetHeCN85
         jmJBTV4OdOEbAlN+MN6clo/tkXoea+M4Sws8rVC0Hlu/NWGYaa36aZuGQKG3pXVk6Nse
         hAvadMebcfwgDtTbnXAKtBRirR5kpHORKxgWmcG7GZGDeZDfHy+b/quqKWTMwAZhzbVy
         shlH2xQlnl3eox1VFy+/jSF4v2iBWkatV1dx+VKsMbYRIWNgC6XMCOytwFyvNd09ft7L
         24Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831813; x=1699436613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkPPHb9qC7W6kxjffeC/m/sVPn9YkCUQKbt5PruPSUw=;
        b=seBJLFh3igp4hbw1X8g4dbt1s6FTl1hTRqhYf7JXsJKs+NvZ9VXCSgsKLujxM0uLug
         GhUccGYVshJtj3XnU6DxYVQD1XFYosHLHpWl1XokyexRn1MlcO/nfpydLwzKv5SRm/fV
         4ZqscGsDsh4jWEIrTL1B1n6uM3APomIMWb5cNzp63kKh0alEDV+wG7y+xeSbWH4D3Uza
         P9F7zcbhlUQ1ms421qA07LViOhGuByoAPWKUZKSVDtfKlVxT0th/bncYyVZwrbhcqCVg
         QRHwAIV6Gsn8phYyWv5OA5VMYwlgwJA4VANVqKUp2xLDZLtO/4fRK5tgbXP1xSmcOAxJ
         z+pg==
X-Gm-Message-State: AOJu0Yyy62DPhL903ipfhGFMypDXtXN5B4Dpd0S4Ze9H/GhXRhoQICz4
	x0KZPPDFyUmV5gu7A0G9UVjzMAtb/YnHCtRyOMA=
X-Google-Smtp-Source: AGHT+IEH4LEoiXVQ0c3/6OSVEP6L58mMC3j7lpyLCC+hIa+qOFDB2YsCAmCGWZcygG1a79/RDpCAsQ==
X-Received: by 2002:a17:907:948e:b0:9bd:a66a:a22 with SMTP id dm14-20020a170907948e00b009bda66a0a22mr1508558ejc.15.1698831812998;
        Wed, 01 Nov 2023 02:43:32 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/6] mtd: spi-nor: add erase die (chip) capability
Date: Wed,  1 Nov 2023 11:43:21 +0200
Message-Id: <20231101094325.95851-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101094325.95851-1-tudor.ambarus@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5146; i=tudor.ambarus@linaro.org; h=from:subject; bh=Vdvn69AuH1lKrPLL0SQfY8OgpwWgJLdtiv1I6TtDpjQ=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlQh29T9f6MfbIADNw05TejWO4kITgxbmTLTwOd 8Lh2Al34EiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZUIdvQAKCRBLVU9HpY0U 6b+gB/9abmmSwFI+8tk2zdf9oQIrAQVQmfoW7m302eZEjKfn93VWLISHkFKnknxyZqpFSQdeuTy F7enEKpTGXoBjOgENvUPpg1USwEmPA2+X7omZO8lFNfmi+MAnCjtXeWcS5y4Rkn/aL837fH85GU IG5uGzCS1ILktc48N6y3b2K3xD0UKX+yftmo8qacJE1xjD1kaMjx/4sb4smJ7xMEDAaAzgMugU0 T7/wnHYKWkGDmwN2UPEZ53WhP5RdtB6rUfOSrugo/+vED1lMbIphVMj1rR+NzVBu1UoDRkjXa6F 9L4jzwxX7JQrURBLeAzQN/7HSIi/h/c0ULQXYTFTsorwUt//
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024334_244456_BC28EBE9 
X-CRM114-Status: GOOD (  21.37  )
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
 drivers/mtd/spi-nor/core.c    | 22 +++++++++++++++++++---
 drivers/mtd/spi-nor/core.h    |  6 ++++--
 drivers/mtd/spi-nor/debugfs.c |  2 +-
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 25a64c65717d..360fce7ffe82 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1067,17 +1067,21 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
  */
 static int spi_nor_erase_chip(struct spi_nor *nor)
 {
+	u8 opcode = nor->params->chip_erase_opcode;
 	int ret;
 
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
+		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP(opcode);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
+		if (opcode != SPINOR_OP_CHIP_ERASE)
+			return -EOPNOTSUPP;
+
 		ret = spi_nor_controller_ops_write_reg(nor,
 						       SPINOR_OP_CHIP_ERASE,
 						       NULL, 0);
@@ -1799,7 +1803,10 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	u8 n_dice = nor->params->n_dice;
+	bool die_erase = false;
 	u32 addr, len, rem;
+	size_t die_size;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
@@ -1814,12 +1821,18 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
+	if (n_dice) {
+		die_size = div_u64(mtd->size, n_dice);
+		if (len == die_size && (addr & (die_size - 1)))
+			die_erase = true;
+	}
+
 	ret = spi_nor_prep_and_lock_pe(nor, instr->addr, instr->len);
 	if (ret)
 		return ret;
 
-	/* whole-chip erase? */
-	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
+	/* chip (die) erase? */
+	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) || die_erase) {
 		unsigned long timeout;
 
 		ret = spi_nor_lock_device(nor);
@@ -2902,6 +2915,9 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
+	if (nor->params->chip_erase_opcode)
+		nor->params->chip_erase_opcode = SPINOR_OP_CHIP_ERASE;
+
 	/* Default method kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index a456042379ee..f681a139772f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -85,8 +85,8 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPI_NOR_CHIP_ERASE_OP						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CHIP_ERASE, 0),		\
+#define SPI_NOR_CHIP_ERASE_OP(opcode)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD((opcode), 0),				\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
@@ -362,6 +362,7 @@ struct spi_nor_otp {
  *			command in octal DTR mode.
  * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
+ * @chip_erase_opcode:	chip (die) erase opcode. Shouldn't be set for single die devices.
  * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
@@ -399,6 +400,7 @@ struct spi_nor_flash_parameter {
 	u8				rdsr_addr_nbytes;
 	u8				n_banks;
 	u8				n_dice;
+	u8				chip_erase_opcode;
 	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 6e163cb5b478..f242a18e46fc 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -138,7 +138,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", SPINOR_OP_CHIP_ERASE, buf);
+		seq_printf(s, " %02x (%s)\n", nor->params->chip_erase_opcode, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
