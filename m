Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4ADC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB14B2184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jW5z1NH9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="X11CV2ja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB14B2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5Ra9vWzmJG6I8EnPw1Q8Wbbu6vVuiq+9+AOxoBXtwk=; b=jW5z1NH9ZO2e0l
	vgtGB7eGplKMeqJEXWPoOwU5fJUBrJ5bA/Dhlw6kB4yhYIU9RjiHaLQKoB+Iupp+Ab5KvrBtIJ9MV
	o8sxCwoiVpZh5OcoypC6RjOBc2UjsXN2yUG1qov5Dp9Hi7oZWsmblZ1XSTt1OgDLyT0vJ9hWvj3zG
	fnm6g7iIVWB4FZvAMsYD1UjdSBdEs0qvS0q46CVP9b2/q0K549M6Pct/4MbpkZfH2iLUHa8l7QuWR
	0+B6hyeRPuqzTF3F7FKYTb7QxNzGTdZm6QuaJEzczWB7yBikJtXiANIs2IPajFvtitJtl5rHzLU8h
	IRQbhONBld8aF5N+Dy2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6VSq-0000BJ-Eo; Wed, 20 Mar 2019 07:16:40 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VSP-00080g-Mf
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:16:16 +0000
Received: by mail-lf1-x143.google.com with SMTP id g7so1037939lfh.10
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2+quHtqZReGMZuEOlP8ZHTeRpV+i8ahdsq1JBBHQV0=;
 b=X11CV2jazRxKZlwKmJnSlH2WjDUJx2/5m1/G3vdvNdtramLXIGOEMOV5FLGh6027nx
 rzVsKegWVjGvtTEO51UpHgfPTzajOxuuLYdYbzullSvwa3LeqOLyT2P2v771VUmFEYIX
 Wgw9lorTCnBmJOveoLX/CRH+F9Y/EJFXhyOmLRoFKd5VgX+QPHW22eZWRHGu+Xu0wWRC
 A88bsLhkp3GDtIwMaJw6tcF3JmExe1mY9hvJ+CYRotQQ9o0BD4slXv2q2YmdpfWRaOKi
 zdK3Utrq9IX15oO/qq+Kew/GXSqi7ppu6evyqiAWfGsfyyWibrmH7FeD84RiPKBHnzPt
 Wnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2+quHtqZReGMZuEOlP8ZHTeRpV+i8ahdsq1JBBHQV0=;
 b=tDdGpNKE7EfzGqZmA5PdGwWYxA1XILSQYk29vcEHjQzzjbjAGKEoYZmLxrfskof8ui
 w1Nu1i4GLMC8ZEy9WlTBhtdgheVIQBLuF7KwJk77B2t2SIzmseNQF3Uh3HahhV2LAshv
 JN9B2apF5shCWtb50mP0QtRiC5nB1X1DDl4EV8xYqL2GnICN8tmv4dbM/UDcTlmLZBRa
 +3iBktncRF3nW8rWHvvc7QwY1ceiZjVLIxh7XmUB4JMS+3TQlEXKtDo/8PUhc7AnsSK1
 c7hntAc11oLTYVBm8Ojr98Wg2QO5tdRILyoIv9/Ho1WP3m5O/Kmt0H0k01Z+T0v2bN/p
 m/GQ==
X-Gm-Message-State: APjAAAUKfFBvwVk+W16nAupx6ysGR2u4ibNeguplVjyp8QX+LHb/L5D/
 X2bftyIfVuLb6KLnepPPdi9Xd4RiyfA=
X-Google-Smtp-Source: APXvYqzvOyWw/bjNse6kbFt9g1hEaar4TzdF9nrt+E/cxY3tIJl0x3SQjojttHDMS69S0+GUPrcwnQ==
X-Received: by 2002:ac2:4142:: with SMTP id c2mr15351824lfi.84.1553066171492; 
 Wed, 20 Mar 2019 00:16:11 -0700 (PDT)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id s14sm217243ljh.0.2019.03.20.00.16.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 00:16:10 -0700 (PDT)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 3/3] spi-nor: allow setting the BPNV (default locked) bit
Date: Wed, 20 Mar 2019 08:16:05 +0100
Message-Id: <20190320071605.4289-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190320071605.4289-1-jonas@norrbonn.se>
References: <20190320071605.4289-1-jonas@norrbonn.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_001613_743846_722686DC 
X-CRM114-Status: GOOD (  21.15  )
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
Cc: Jonas Bonn <jonas@norrbonn.se>, tudor.ambarus@microchip.com
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
---
 drivers/mtd/mtdchar.c         |   6 ++
 drivers/mtd/mtdcore.c         |   8 +++
 drivers/mtd/spi-nor/spi-nor.c | 103 +++++++++++++++++++++++-----------
 include/linux/mtd/mtd.h       |   2 +
 include/linux/mtd/spi-nor.h   |   1 +
 include/uapi/mtd/mtd-abi.h    |   1 +
 6 files changed, 88 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 02389528f622..72842308087b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -800,6 +800,12 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
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
index 76b4264936ff..811fe0f3c24a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1681,6 +1681,14 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
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
index 9abac9e326a1..8a30cdac6f88 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -250,7 +250,8 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u16		__unused16;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -279,6 +280,10 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BPNV	BIT(16) /* Block protection bits can be set
+					 * non-volatile, meaning all blocks
+					 * are protected by default at reset
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1324,6 +1329,36 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1342,6 +1377,35 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1387,35 +1451,6 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
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
@@ -1898,9 +1933,7 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
-			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BPNV | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
@@ -4082,6 +4115,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
index 677768b21a1d..30ee6f1c1142 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -313,6 +313,7 @@ struct mtd_info {
 	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*_sync) (struct mtd_info *mtd);
+	int (*_set_default_locked) (struct mtd_info *mtd);
 	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -451,6 +452,7 @@ static inline void mtd_sync(struct mtd_info *mtd)
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_set_default_locked(struct mtd_info *mtd);
 int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs);
 int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs);
 int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b0ee3d..40d575a1431f 100644
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
