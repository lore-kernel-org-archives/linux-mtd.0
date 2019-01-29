Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4945DC4151A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:08:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CC62087F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sx4pT5S7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="ZLQUHmHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CC62087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tppXwFSdS2Q+653TtSRk/J5/Dar+XrYj8eGPSr+vLGQ=; b=Sx4pT5S795QosE
	uKavfw0OIr5GqPpiTQYj9kfNraItTt15+OkCgSrUdefTdfR/coYutfeohSbE5jny8xW10KsBMiAdy
	wqFP8JtX7IOgQyoJqAhmcE25HatOKlVVrveC4Uem+eUrNbvXwo9dSqJORfwlpmPbsmzFXO8Wwi5EC
	rWfeG0Lp1r/6yh/Gk56RhE4oIZvxmTJNdLcWXHGGXFtFyPQgXM9JgqW9e+ajVDeWNZlHB6QqV9exy
	JDZNfNFWV8VdMAqBBjnTCI1nBisXPirl70D/HDz60CpL1YcRKxGmT/Kw3Xf8Dhw8lUprzbvZSq5eo
	Reg9V2LMVC8I7X60/1Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gobY0-00088h-Vx; Tue, 29 Jan 2019 22:08:01 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gobXQ-0007UX-JQ
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 22:07:30 +0000
Received: by mail-lf1-x143.google.com with SMTP id z13so15841056lfe.11
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2019 14:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U4GzOre06m3zuu0NjzIjONYKKQD1b7kGyvXURqIoJoc=;
 b=ZLQUHmHbsWguyVhMWLUTSpZ6NDuDYnrCokhcQrrS27/dTBM2QmF6PCoU3ohUXRRX/0
 /UuFaiX65xy4YD1/B27torAQ6p3UC5sayVcoTb9YXtMUs4Cbj1FdL9Cl3AQqa780AvQO
 WI4ty9Fu4gwSFJeB+3/6GVRilRChCqroGjqJ8PJ2T6Br82G4geBtKA7QSu/PlDuvgsRI
 4bhcdqEgVQdlCG8KZ8hhuEzjCU90elD/y/grUMr+oqMOe7r48yAHCc7oymUjbQPL29e7
 hellYCEp4L+H1jW/7uD5jlFFwXUfjd2WSGB/mj+G1Jzeq2TThpqGd6paCFRi51XQADA6
 qvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U4GzOre06m3zuu0NjzIjONYKKQD1b7kGyvXURqIoJoc=;
 b=aTXU06BkYu2dW4tPBWhDspgmOpjjqtDXPMuirc2oim1syq9rhu5Ws1TAmiyxQ7lasq
 F72Z57kc+MtFokTdszjGdrmnjuv9heouo5LS5yRQDw2n4Ucc2vOPNF9FBpNaKssMjbsc
 4aj2mj8BhUpyuul8H7YIWL/L7FMAq0pN0KifWtwAfJP2WAl5rQjVYxjdlxonqoMAtXUs
 iTJuzi6UuF0Pq7UB1V3AMwnlTogj5xEJT0jtPMVA3PuQbvlo2Iw6i8d96rUBw77DXVEE
 kCoqiaJEzRj26cEPdIU35gYPT/Sc0QlV0MhndqAcxgnEgVBEGKPb20qdsSUqA1E9f7+o
 aafg==
X-Gm-Message-State: AJcUukduGS4EE9PV4kfpCE7PP65skiyuWly4cLC/94Wnvm1menw4ZVsL
 p5GRl2F6UuNlsDLwTpajBgGmbPok+IQ=
X-Google-Smtp-Source: ALg8bN4PAShvCKsvNpKqGIKL54edYTm8lJwI7DxWMSc41HpqD6udlrf71lakUazF3RcEXSOVTcQfAg==
X-Received: by 2002:a19:8096:: with SMTP id b144mr20897429lfd.8.1548799641200; 
 Tue, 29 Jan 2019 14:07:21 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id c15-v6sm3821045ljf.76.2019.01.29.14.07.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 14:07:20 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/3] mtd: spi-nor: allow setting the BPNV (default locked)
 bit
Date: Tue, 29 Jan 2019 23:07:05 +0100
Message-Id: <20190129220705.5143-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129220705.5143-1-jonas@norrbonn.se>
References: <20190129220705.5143-1-jonas@norrbonn.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_140724_794562_1606FE06 
X-CRM114-Status: GOOD (  24.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Jonas Bonn <jonas@norrbonn.se>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Setting the BPNV bit defaults the block protection bits BP0-2 to 1 at
reset.  This means that all the flash sectors are protected until they
are explicity unlocked by the user.

Together with protection of the status register via the SRWD bit and the
WP# signal, this allows a flash device to be effectively protected from
erasure by unauthorized actors.

The patch has been tested with a Cypress s25fl512s and works as
advertised.  The concern that I have with this, though, is that the BPNV
bit is "write once":  if somebody inadvertently sets this feature on the
device, it is irrevocable!  Whether or not this actually belongs in the
mainline kernel is therefore up for debate...

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: Brian Norris <computersforpeace@gmail.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/mtdchar.c         |   6 ++
 drivers/mtd/mtdcore.c         |   8 +++
 drivers/mtd/spi-nor/spi-nor.c | 102 +++++++++++++++++++++++-----------
 include/linux/mtd/mtd.h       |   2 +
 include/linux/mtd/spi-nor.h   |   1 +
 include/uapi/mtd/mtd-abi.h    |   1 +
 6 files changed, 88 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index affb0ac39928..31dd308d34b1 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -803,6 +803,12 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+	case MEMSETDEFAULTLOCKED:
+	{
+		ret = mtd_set_default_locked(mtd);
+		break;
+	}
+
 	case MEMLOCK:
 	{
 		struct erase_info_user einfo;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 254c3b413213..3cae22f161cb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1759,6 +1759,14 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
 }
 EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
 
+int mtd_set_default_locked(struct mtd_info *mtd)
+{
+	if (!mtd->_set_default_locked)
+		return -EOPNOTSUPP;
+	return mtd->_set_default_locked(mtd);
+}
+EXPORT_SYMBOL_GPL(mtd_set_default_locked);
+
 /* Chip-supported device locking */
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d6840c2b15dd..4f9b82ff87ce 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -250,7 +250,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -279,6 +279,10 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BPNV	BIT(16) /* Block protection bits can be set
+					 * non-volatile, meaning all blocks
+					 * are protected by default at reset
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1324,6 +1328,36 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return write_sr_and_check(nor, status_new, mask);
 }
 
+/*
+ * Write status Register and configuration register with 2 bytes
+ * The first byte will be written to the status register, while the
+ * second byte will be written to the configuration register.
+ * Return negative if error occurred.
+ */
+static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
+{
+	int ret;
+
+	write_enable(nor);
+
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while writing configuration register\n");
+		return -EINVAL;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret) {
+		dev_err(nor->dev,
+			"timeout while writing configuration register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+
 /*
  * Check if a region of the flash is (completely) locked. See stm_lock() for
  * more info.
@@ -1342,6 +1376,35 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return stm_is_locked_sr(nor, ofs, len, status);
 }
 
+static int spi_nor_set_default_locked(struct mtd_info *mtd)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct device *dev = nor->dev;
+	u8 sr_cr[2];
+	int ret;
+
+	ret = read_cr(nor);
+	if (ret < 0) {
+		dev_err(dev, "error while reading configuration register\n");
+		return -EINVAL;
+	}
+
+	if (ret & CR_BPNV)
+		return 0;
+
+	sr_cr[1] = ret | CR_BPNV;
+
+	/* Keep the current value of the Status Register. */
+	ret = read_sr(nor);
+	if (ret < 0) {
+		dev_err(dev, "error while reading status register\n");
+		return -EINVAL;
+	}
+	sr_cr[0] = ret;
+
+	return write_sr_cr(nor, sr_cr);
+}
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
@@ -1387,35 +1450,6 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-/*
- * Write status Register and configuration register with 2 bytes
- * The first byte will be written to the status register, while the
- * second byte will be written to the configuration register.
- * Return negative if error occurred.
- */
-static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
-{
-	int ret;
-
-	write_enable(nor);
-
-	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
-	if (ret < 0) {
-		dev_err(nor->dev,
-			"error while writing configuration register\n");
-		return -EINVAL;
-	}
-
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret) {
-		dev_err(nor->dev,
-			"timeout while writing configuration register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /**
  * macronix_quad_enable() - set QE bit in Status Register.
  * @nor:	pointer to a 'struct spi_nor'
@@ -1886,8 +1920,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
-	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BPNV | USE_CLSR) },
+	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BPNV | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
@@ -4066,6 +4100,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->_is_locked = spi_nor_is_locked;
 	}
 
+	if (info->flags & SPI_NOR_HAS_BPNV) {
+		mtd->_set_default_locked = spi_nor_set_default_locked;
+	}
+
 	/* sst nor chips use AAI word program */
 	if (info->flags & SST_WRITE)
 		mtd->_write = sst_write;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b78e2c1b27b1..a07468b6677d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -346,6 +346,7 @@ struct mtd_info {
 	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*_sync) (struct mtd_info *mtd);
+	int (*_set_default_locked) (struct mtd_info *mtd);
 	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -535,6 +536,7 @@ static inline void mtd_sync(struct mtd_info *mtd)
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_set_default_locked(struct mtd_info *mtd);
 int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs);
 int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs);
 int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 2353af8bac99..c7cc84a5c8f6 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -144,6 +144,7 @@
 #define FSR_PT_ERR		BIT(1)	/* Protection error bit */
 
 /* Configuration Register bits. */
+#define CR_BPNV			BIT(3)	/* Block protection non-volatile */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
 /* Status Register 2 bits. */
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index aff5b5e59845..27b752796efa 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -204,6 +204,7 @@ struct otp_info {
  * without OOB, e.g., NOR flash.
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
+#define MEMSETDEFAULTLOCKED	_IO('M', 25)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
