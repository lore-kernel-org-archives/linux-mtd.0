Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24A9C433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 00:06:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D93B650AA
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 00:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D93B650AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uSU2TLZNPV3SSGpMQMb4X1cli+gOyq3+4VNdQh4emYM=; b=eljv/ka7Iyqqydj5+p2/MPNOx
	6WNkAgaa8AK1bcqC62ROsTHh+30DOv5QlD8JMsebpeSuVI51l8uLxGoh8LFWEmb4TjmQ0vpXGKXaI
	eWXyv/L2iVHoBhsmeNYXt/swSIZptiBKmQS6vZ37wdwSyjarCoAEE3/EM6yQ6UHkv8LfPzzMZHFBz
	ezT1DwckiN6NJ/vJ+QgiEDIRp1WZoUJi+BcUK/+KLUJBXUzRwEptSAvugNzAjmmZGPWadZPBiDLxz
	w4IUt612IgS8g1+M9k6PYr5S8lWtwfsHiMo1Y6/46MIydKtxT7CFnjNmNGmRR5CGPc8Fge/r0wKAJ
	z2dFrjqTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIKSM-00HHN2-CK; Sat, 06 Mar 2021 00:06:06 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIKS3-00HHEV-Ni
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 00:05:52 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2CA2D22234;
 Sat,  6 Mar 2021 01:05:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614989147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqQNslft2DFJ1qUx8R7Et19hRAFsFtbLVljEtaEmLfc=;
 b=nt90sCNMJ80JTnZVwBwRs8cHJvZXsWAP7niawhXhtsxKl4m5uABSzukCLVwOh4CBzBVo9B
 o5nEEGzI3bSY7e8ElIFOiZqtxsgq+7FdBHeXVJgGs9pEY1rZ1hAkfd00/dH6nRTQ20bKRE
 Y5OUr9ezL+saCVCVvuRzRd4UqR8Toxc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v4 2/4] mtd: spi-nor: implement OTP support for Winbond and
 similar flashes
Date: Sat,  6 Mar 2021 01:05:33 +0100
Message-Id: <20210306000535.9890-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306000535.9890-1-michael@walle.cc>
References: <20210306000535.9890-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_000548_996045_B9E6789E 
X-CRM114-Status: GOOD (  22.26  )
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

Use the new OTP ops to implement OTP access on Winbond flashes. Most
Winbond flashes provides up to four different OTP regions ("Security
Registers").

Winbond devices use a special opcode to read and write to the OTP
regions, just like the RDSFDP opcode. In fact, it seems that the
(undocumented) first OTP area of the newer flashes is the actual SFDP
table.

On a side note, Winbond devices also allow erasing the OTP regions as
long as the area isn't locked down.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c  |   2 +-
 drivers/mtd/spi-nor/core.h  |   6 ++
 drivers/mtd/spi-nor/otp.c   | 164 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h |   9 ++
 4 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0c5c757fa95b..ef7df26896f1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1034,7 +1034,7 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
+int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
 {
 	int ret;
 	u8 *sr_cr = nor->bouncebuf;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ec8da1243846..dfbf6ba42b57 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -496,6 +496,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
 int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
+int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
 
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
@@ -503,6 +504,11 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 			   const u8 *buf);
 
+int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
+int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
+int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
+int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
+
 int spi_nor_hwcaps_read2cmd(u32 hwcaps);
 u8 spi_nor_convert_3to4_read(u8 opcode);
 void spi_nor_set_read_settings(struct spi_nor_read_command *read,
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 4e301fd5156b..4e8da9108c77 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -15,6 +15,170 @@
 #define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
 #define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
 
+/**
+ * spi_nor_otp_read_secr() - read OTP data
+ * @nor:	pointer to 'struct spi_nor'
+ * @from:       offset to read from
+ * @len:        number of bytes to read
+ * @buf:        pointer to dst buffer
+ *
+ * Read OTP data from one region by using the SPINOR_OP_RSECR commands. This
+ * method is used on GigaDevice and Winbond flashes.
+ *
+ * Return: number of bytes read successfully, -errno otherwise
+ */
+int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
+{
+	u8 addr_width, read_opcode, read_dummy;
+	struct spi_mem_dirmap_desc *rdesc;
+	enum spi_nor_protocol read_proto;
+	int ret;
+
+	read_opcode = nor->read_opcode;
+	addr_width = nor->addr_width;
+	read_dummy = nor->read_dummy;
+	read_proto = nor->read_proto;
+	rdesc = nor->dirmap.rdesc;
+
+	nor->read_opcode = SPINOR_OP_RSECR;
+	nor->addr_width = 3;
+	nor->read_dummy = 8;
+	nor->read_proto = SNOR_PROTO_1_1_1;
+	nor->dirmap.rdesc = NULL;
+
+	ret = spi_nor_read_data(nor, addr, len, buf);
+
+	nor->read_opcode = read_opcode;
+	nor->addr_width = addr_width;
+	nor->read_dummy = read_dummy;
+	nor->read_proto = read_proto;
+	nor->dirmap.rdesc = rdesc;
+
+	return ret;
+}
+
+/**
+ * spi_nor_otp_write_secr() - write OTP data
+ * @nor:        pointer to 'struct spi_nor'
+ * @to:         offset to write to
+ * @len:        number of bytes to write
+ * @buf:        pointer to src buffer
+ *
+ * Write OTP data to one region by using the SPINOR_OP_PSECR commands. This
+ * method is used on GigaDevice and Winbond flashes.
+ *
+ * Please note, the write must not span multiple OTP regions.
+ *
+ * Return: number of bytes written successfully, -errno otherwise
+ */
+int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
+{
+	enum spi_nor_protocol write_proto;
+	struct spi_mem_dirmap_desc *wdesc;
+	u8 addr_width, program_opcode;
+	int ret, written;
+
+	program_opcode = nor->program_opcode;
+	addr_width = nor->addr_width;
+	write_proto = nor->write_proto;
+	wdesc = nor->dirmap.wdesc;
+
+	nor->program_opcode = SPINOR_OP_PSECR;
+	nor->addr_width = 3;
+	nor->write_proto = SNOR_PROTO_1_1_1;
+	nor->dirmap.wdesc = NULL;
+
+	/*
+	 * We only support a write to one single page. For now all winbond
+	 * flashes only have one page per OTP region.
+	 */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		goto out;
+
+	written = spi_nor_write_data(nor, addr, len, buf);
+	if (written < 0)
+		goto out;
+
+	ret = spi_nor_wait_till_ready(nor);
+
+out:
+	nor->program_opcode = program_opcode;
+	nor->addr_width = addr_width;
+	nor->write_proto = write_proto;
+	nor->dirmap.wdesc = wdesc;
+
+	return ret ?: written;
+}
+
+static int spi_nor_otp_lock_bit_cr(unsigned int region)
+{
+	static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
+
+	if (region >= ARRAY_SIZE(lock_bits))
+		return -EINVAL;
+
+	return lock_bits[region];
+}
+
+/**
+ * spi_nor_otp_lock_sr2() - lock the OTP region
+ * @nor:        pointer to 'struct spi_nor'
+ * @region:     OTP region
+ *
+ * Lock the OTP region by writing the status register-2. This method is used on
+ * GigaDevice and Winbond flashes.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region)
+{
+	u8 *cr = nor->bouncebuf;
+	int ret, lock_bit;
+
+	lock_bit = spi_nor_otp_lock_bit_cr(region);
+	if (lock_bit < 0)
+		return lock_bit;
+
+	ret = spi_nor_read_cr(nor, cr);
+	if (ret)
+		return ret;
+
+	/* no need to write the register if region is already locked */
+	if (cr[0] & lock_bit)
+		return 0;
+
+	cr[0] |= lock_bit;
+
+	return spi_nor_write_16bit_cr_and_check(nor, cr[0]);
+}
+
+/**
+ * spi_nor_otp_is_locked_sr2() - get the OTP region lock status
+ * @nor:        pointer to 'struct spi_nor'
+ * @region:     OTP region
+ *
+ * Retrieve the OTP region lock bit by reading the status register-2. This
+ * method is used on GigaDevice and Winbond flashes.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
+{
+	u8 *cr = nor->bouncebuf;
+	int ret, lock_bit;
+
+	lock_bit = spi_nor_otp_lock_bit_cr(region);
+	if (lock_bit < 0)
+		return lock_bit;
+
+	ret = spi_nor_read_cr(nor, cr);
+	if (ret)
+		return ret;
+
+	return cr[0] & lock_bit;
+}
+
 static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, int region)
 {
 	const struct spi_nor_otp_organization *org = nor->params->otp.org;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a0d572855444..6d1956049e90 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -107,6 +107,11 @@
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
 
+/* Used for GigaDevices and Winbond flashes. */
+#define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
+#define SPINOR_OP_PSECR		0x42	/* Program Security registers */
+#define SPINOR_OP_RSECR		0x48	/* Read Security registers */
+
 /* Status Register bits. */
 #define SR_WIP			BIT(0)	/* Write in progress */
 #define SR_WEL			BIT(1)	/* Write enable latch */
@@ -138,8 +143,12 @@
 
 /* Status Register 2 bits. */
 #define SR2_QUAD_EN_BIT1	BIT(1)
+#define SR2_LB1			BIT(3)	/* Security Register Lock Bit 1 */
+#define SR2_LB2			BIT(4)	/* Security Register Lock Bit 2 */
+#define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
+
 /* Supported SPI protocols */
 #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
 #define SNOR_PROTO_INST_SHIFT	16
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
