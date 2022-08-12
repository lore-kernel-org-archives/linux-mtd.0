Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86658C00140
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Aug 2022 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJt3lJHD9g8mBIZWc/tkef2RSnWYgtHAa0Tw62hSjKI=; b=KHuvjVVgIL56Pf
	SabG7zNSGtvLd2zHaRzqw0uN1hHlS4J3bXXRRko3Gd2rGI8rdzjfRgfhLEijrXB47NOPqcbAtXH/Z
	3ZSz30BVK4ghsVtDveJQjq+yrQHNRAehNh6hBylXzb8FN2OXOOQyMMrsWc0nz3FegbwoW0+817CrE
	BpTL0n6awnZWsRbmSJY9v7tWc5tK5GqhKv+V2qSHXfbtxfw4yiSxoVVO48yoObDWfK6LweCJyiG5K
	b6shjhBnG0V/xFNaDnLbZyUiX0+bTI1FLQnQw8Q27bZY5wL8tCgxutprU0yk12kUOM06eO23QlExr
	GfKdmHjPgPPSdbsrWN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPhc-002V2Z-N8; Fri, 12 Aug 2022 08:07:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPhJ-002UTC-Ba
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2022 08:07:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id a8so324383pjg.5
        for <linux-mtd@lists.infradead.org>; Fri, 12 Aug 2022 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lvRrH/UQjtY9wWgGPlxUog7WaOl+uB+5I8N2soyG+hw=;
        b=lcotQ3tse4/IzAWxjtgFckSnJev8GOKJJEGVtrQEP9RZoIUEVlKmErJgHCBttFwR+k
         nlVmiAODWM2wtR6OAc8s4Gz+DOTi9BWX7rcLkoWtH9joTphqAPnKzq2SdL5CN1Gqb59O
         6pI4Cc26M7vHEq0NukzBPSTKf+7pwbhQVd1s4qFn8XdokJsyhCwvV+spUcx24a9UJ2W0
         pG1JJIEQitr5xrCa0l4IX3wFmglDBebvm7jW6afcYBcGNZYFphVeK9SPoHvlMUf3+a7o
         zWpKvZ9UqulSs0hgQr0/ZEHw0G08k74wCX66UbNP0L/oAwwHwJjOtaQp6TAevYo7Kwkt
         KPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lvRrH/UQjtY9wWgGPlxUog7WaOl+uB+5I8N2soyG+hw=;
        b=e6tYV2z9V5brnabCTYLfViwYnArPhUXWQuOZ4HR8ulh+89+sn2zGFI9AugGvR6/F1B
         5iX+A3n3djA78ZMvV9CBs92Zymdj7NzqyrBaLXXQTxyJbfcGwpJio3o5PWAwSjKlIzMC
         cipK223ltuOY4haHAJh/HGn8ZTZYD6IdkMUm5ZP8iBEn/jQ4cz1g3L8I/xIhC91GgTyS
         VhbFC66z0V2ngmwbYH5UlRSIozca20Cck2yPQP3UBSIOvrBIIjQsohkaePwQa/l3c/EY
         /l7VcE9N54Z3fijN65lcngO7P+Jy1BNV2RYmhyhh9u8NpmqyxJN+QIYs/lxM8lJLLAMe
         XMqA==
X-Gm-Message-State: ACgBeo0mpD8dBspeZvmOLRHIzn3eB4Eb6qmOGcq5vNBD0WLYPRPGaRdm
	le9bqJ+1W+Qt6AzLHJCiQwYQ6aWrkEg=
X-Google-Smtp-Source: AA6agR7DMbkGPxF6Q50/0obxnpufZkCdNabCFgCcW0LIsjgrDkOg8+PSlKtk1v9+eDeaO1X6XNXaUw==
X-Received: by 2002:a17:90b:38cc:b0:1f7:2835:d45e with SMTP id nn12-20020a17090b38cc00b001f72835d45emr2854592pjb.177.1660291632328;
        Fri, 12 Aug 2022 01:07:12 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id y192-20020a6264c9000000b0052dce4edceesm960013pfb.169.2022.08.12.01.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:07:12 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Discover current address mode by CRC
Date: Fri, 12 Aug 2022 17:06:33 +0900
Message-Id: <53d37eead9bdd09744af555b93381af477643a46.1660291281.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
References: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_010713_444371_EF0F6EFB 
X-CRM114-Status: GOOD (  22.12  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In some Infineon devices, the address mode (3- or 4-byte) is configurable
in both volatile and non-volatile registers. Determining current address
mode prior to SMPT parse is crucial because Read Any Reg op used in SMPT
takes 3- or 4-byte address depending on current address mode. The current
address mode is found in CFR2V[7] but CFR2V can be read by Read Any Reg
op (chicken-and-egg). This patch introduce a way to discover the current
address mode by using on-die CRC feature in Infineon SEMPER family.

The data integrity CRC (on-die CRC) calculation is conducted by issuing
a specific command followed by start and end addresses on which CRC is
calculated. The flash becomes busy state during calculation so we need to
poll status and wait for the completion. The calculated CRC value is
stored in Data Integrity Check CRC registers (DCRV) and can be read by
Read Any Reg op. We can try with 3- and 4-byte addresses to read DCRV then
compare it with expected CRC value calculated by offline. Both CRC should
match only when we perform Read Any Reg op with correct number of address
bytes.

The offline CRC calculation is done by CRC32C algorithm with 0x1edc6f41
polynomial. The data is read by READ_4B (13h) opcode.

BFPT DWORD16 is used to determine factory default of address mode,
assuming factory default is 3-byte in case power cycle exits 4-byte
address mode.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.h     |   1 +
 drivers/mtd/spi-nor/spansion.c | 130 +++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index bbf80d2990ab..d7e1620bd870 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -90,6 +90,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
 
+#define BFPT_DWORD16_EX4B_PWRCYC		BIT(21)
 #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
 
 #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 676ffd6d12ec..8ed4b2d53403 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -23,7 +23,9 @@
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
+#define SPINOR_REG_CYPRESS_DCRV			0x00800095
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_OP_CYPRESS_DI_CRC		0x5b
 
 /* Cypress SPI NOR flash operations. */
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
@@ -213,11 +215,139 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+#define CRC32C_POLY	0x1edc6f41
+static u32 cypress_nor_calc_crc32c(u32 len, u8 *buf)
+{
+	u32 crc = 0;
+	int i;
+
+	while (len--) {
+		crc ^= *buf++ << 24;
+		for (i = 0; i < 8; i++)
+			crc = (crc << 1) ^ ((crc & 0x80000000) ? CRC32C_POLY :
+					    0);
+	}
+
+	return crc;
+}
+
+static int cypress_nor_data_integrity_crc(struct spi_nor *nor, u32 addr,
+					  u32 len)
+{
+	struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CYPRESS_DI_CRC, 0),
+				   SPI_MEM_OP_ADDR(4, addr, 0),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(4, nor->bouncebuf, 0));
+	u32 end_addr = addr + len - 1;
+	int ret;
+
+	nor->bouncebuf[0] = (end_addr >> 24) & 0xff;
+	nor->bouncebuf[1] = (end_addr >> 16) & 0xff;
+	nor->bouncebuf[2] = (end_addr >> 8) & 0xff;
+	nor->bouncebuf[3] = end_addr & 0xff;
+
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	return spi_nor_wait_till_ready(nor);
+}
+
+/**
+ * cypress_nor_verify_crc() - Compare CRC and data integrity CRC registers.
+ * @nor:		pointer to 'struct spi_nor'.
+ * @addr_nbytes:	number of address bytes used in Read Any Reg op
+ * @crc:		CRC value to compare with registers
+ *
+ * Return: 1 if match, 0 if not match, -errno on errors.
+ */
+static int cypress_nor_verify_crc(struct spi_nor *nor, u8 addr_nbytes, u32 crc)
+{
+	struct spi_mem_op op =
+			CYPRESS_NOR_RD_ANY_REG_OP(addr_nbytes,
+						  SPINOR_REG_CYPRESS_DCRV,
+						  nor->bouncebuf);
+	int i, ret;
+
+	for (i = 0; i < 4; i++) {
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			return ret;
+
+		if ((crc & 0xff) != nor->bouncebuf[0])
+			return 0;
+
+		crc >>= 8;
+		op.addr.val++;
+	}
+
+	return 1;
+}
+
+static int cypress_nor_discover_addr_mode(struct spi_nor *nor)
+{
+	u32 addr = 0;
+	u32 len = 4;
+	u32 crc;
+	u8 addr_nbytes;
+	int ret;
+
+	/* Read flash memory array */
+	ret = spi_nor_alt_read(nor, addr, len, nor->bouncebuf,
+			       SPINOR_OP_READ_4B, 4, 0);
+	if (ret)
+		return ret;
+
+	/* Calculate CRC32C of read data */
+	crc = cypress_nor_calc_crc32c(len, nor->bouncebuf);
+
+	/* Perform on-die CRC calculation */
+	ret = cypress_nor_data_integrity_crc(nor, addr, len);
+	if (ret)
+		return ret;
+
+	/* Read and verify CRC registers with current addr_mode_nbytes */
+	ret = cypress_nor_verify_crc(nor, nor->params->addr_mode_nbytes, crc);
+	if (ret < 0)
+		return ret;
+	if (ret)
+		return 0;
+
+	/* Read and verify CRC registers with another number of address bytes */
+	addr_nbytes = nor->params->addr_mode_nbytes == 3 ? 4 : 3;
+	ret = cypress_nor_verify_crc(nor, addr_nbytes, crc);
+	if (ret < 0)
+		return ret;
+	if (ret)
+		nor->params->addr_mode_nbytes = addr_nbytes;
+	else
+		dev_warn(nor->dev, "Failed to discover current address mode. Assuming default %d-byte.\n",
+			 nor->params->addr_mode_nbytes);
+
+	return 0;
+}
+
 static int
 s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_parameter_header *bfpt_header,
 			const struct sfdp_bfpt *bfpt)
 {
+	int ret;
+
+	/*
+	 * Discover flash's current address mode. Determine factory default
+	 * address mode in advance by checking if power cycle exits 4-byte
+	 * address mode, meaning factory default is 3-byte.
+	 */
+	nor->params->addr_mode_nbytes =
+		bfpt->dwords[BFPT_DWORD(16)] & BFPT_DWORD16_EX4B_PWRCYC ? 3 : 4;
+	ret = cypress_nor_discover_addr_mode(nor);
+	if (ret)
+		return ret;
+
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
