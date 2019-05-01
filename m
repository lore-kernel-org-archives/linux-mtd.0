Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C1AC43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 04:42:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F7B2081C
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 04:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/3eJ/Li";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="aTsJc7BQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F7B2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qqn55YfDO40tu2LhMS5zcFY1G42hQZmrYfpZh64zwQ=; b=V/3eJ/Li9PblR1
	vmYVS9Wb/+qmaq5Ift7uqQBDywGtflXoqWGj6d/x00w1Q1Dt9GCvBwROakxi90trXmzgl9pUq4gib
	6eiucnQcBhOySg5GXthXBdHq1saIx/EkTY9pjSA2ELvjG32pH1blH6ENu28wldMJ/U6w2dBrYUPZX
	Zup/l6gapt4uMhOH8WmBWb5MwZ43bn7Y4PDc7EV283a/eUS3P9ITGGQzOYaW43R7pMxy31nUFLJuI
	Ivp/yBsEGGr39drnShUnOznz+QFk3kiXM/eDLBJ75jvnH+PZ2c6xl4vZ1Yfr+cKQUIugxky2vHEFk
	FY8zG2FyU9eGWvMTS7dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLh52-00019o-Kh; Wed, 01 May 2019 04:42:52 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLh4w-00019Q-69
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 04:42:48 +0000
Received: by mail-lj1-x241.google.com with SMTP id y8so8313563ljd.3
 for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2019 21:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFKZ3qWR1fzsmVVlpCD1yttle3taO3ys5Kg21L9NP94=;
 b=aTsJc7BQcF/MbLnzC6+PsZo3KhAJ+fuZD4kswQ/V1fz/bgaJbrymhmHgyQkC7Iy2X/
 Wsb+qFveHTRR0KGvXFq1cqTiACUp/PntUR4rUovjsqsH42HE235DiRdBGug0Z4bxIvA1
 C4bWHM/WtRCEampfPEwh2z8D+6NBNOVznr7cwjoLD8BGxH0cGgvCA3cjb0gXvLDgHEO/
 NujVlCPDGKIVRyB1GbcSoOs3TAIzlhVsrXV7RAhIS7GsSaN6mb29H6Yn5YqSfr0GyDsu
 ou4p4uVIgLF3ybamYkC6pHnKlAM6cCNE9dUT4DalWV2AXfO+VudVuW+pqLe3FQfx56aQ
 opEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFKZ3qWR1fzsmVVlpCD1yttle3taO3ys5Kg21L9NP94=;
 b=mK6q8AnuywBUsKkZKQcoh1sNo3hXMHhKnOSropHJ2bqQQmWhj09+Aly/7qYFRbRNh+
 QnhiOoUKg7XKZSzvMjV4n/toqAQ0fS5vJ2ANQqdaYDjqjnum68jVGFsQ0EtxxRYQMlM2
 Tyap1OB1+eYtUi9ZG4IB9wwSpn2x2S87jBykEYAqTOagSRh3kyxQijicZtO/2IcIGU2l
 b//Wv7cAtF84qIMwsxTk7FqV5+L0L1rNOvNvtZECoMzOQYLXXTGqLUZ9eyH3TTPrlelw
 EuCEjKdKkvILUUUQDK5ZY2VKYmBjzxsB5EsSSqljIbPMdj/DBpANa69OQGqgA9EPqHQ5
 Ndsw==
X-Gm-Message-State: APjAAAXfel9BMUL1ZF/4qEW+VeCrA3q2pBdBwOpy/NqO5kf3J+42v7gQ
 r6tdaa9v5s0Em3ZNGtMkzjY0YZZyiZY=
X-Google-Smtp-Source: APXvYqyfFYwnfjQcqqfTfe+BkikBkajymnUQIQ1HHaYtTjaG1tg4Y7H3kfxFbZQspRRMgf/dOe5exA==
X-Received: by 2002:a2e:4457:: with SMTP id r84mr8476379lja.112.1556685763298; 
 Tue, 30 Apr 2019 21:42:43 -0700 (PDT)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id o1sm5176264ljd.74.2019.04.30.21.42.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 21:42:42 -0700 (PDT)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org,
	vigneshr@ti.com
Subject: [PATCH v5 1/1] spi-nor: allow setting the BPNV (powerup lock) bit
Date: Wed,  1 May 2019 06:42:39 +0200
Message-Id: <20190501044239.3263-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b42b6d1d-4b7e-dca9-6cb8-02bbcc47c092@ti.com>
References: <b42b6d1d-4b7e-dca9-6cb8-02bbcc47c092@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_214246_279720_5CFC7D03 
X-CRM114-Status: GOOD (  20.01  )
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

Setting the BPNV bit forces the block protection bits BP0-2 to 1 at
reset.  This means that all the flash sectors are protected until they
are explicitly unlocked by the user.

Together with protection of the status register via the SRWD bit and the
WP# signal, this allows a flash device to be effectively protected from
erasure by unauthorized actors.

NB:  the BPNV bit is an OTP bit so this setting is irreversible.

Tested with a Cypress s25fl512s.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 drivers/mtd/mtdchar.c         |  6 ++++
 drivers/mtd/mtdcore.c         |  8 +++++
 drivers/mtd/spi-nor/spi-nor.c | 59 +++++++++++++++++++++++++++++++++--
 include/linux/mtd/mtd.h       |  2 ++
 include/linux/mtd/spi-nor.h   |  1 +
 include/uapi/mtd/mtd-abi.h    |  4 +++
 6 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 02389528f622..c14ee4c6e3d3 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -800,6 +800,12 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+	case MEMSETPOWERUPLOCK:
+	{
+		ret = mtd_set_powerup_lock(mtd);
+		break;
+	}
+
 	case MEMLOCK:
 	{
 		struct erase_info_user einfo;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 76b4264936ff..f2296e6845ca 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1681,6 +1681,14 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
 }
 EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
 
+int mtd_set_powerup_lock(struct mtd_info *mtd)
+{
+	if (!mtd->_set_powerup_lock)
+		return -EOPNOTSUPP;
+	return mtd->_set_powerup_lock(mtd);
+}
+EXPORT_SYMBOL_GPL(mtd_set_powerup_lock);
+
 /* Chip-supported device locking */
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a3f551413539..e8d008c4ff75 100644
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
@@ -279,6 +279,11 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BPNV	BIT(16) /* Block protection bits can be set
+					 * volatile, meaning all blocks
+					 * are protected by default at reset
+					 * (BP[0-2] reset to 1 at power up)
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1345,6 +1350,43 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return stm_is_locked_sr(nor, ofs, len, status);
 }
 
+static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr);
+
+static int spi_nor_set_powerup_lock(struct mtd_info *mtd)
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
+	ret = write_sr_cr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	mtd->flags |= MTD_POWERUP_LOCK;
+
+	return 0;
+}
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
@@ -1903,7 +1945,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			SPI_NOR_HAS_BPNV | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
@@ -4074,6 +4117,18 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->_is_locked = spi_nor_is_locked;
 	}
 
+	if (info->flags & SPI_NOR_HAS_BPNV) {
+		mtd->_set_powerup_lock = spi_nor_set_powerup_lock;
+
+		ret = read_cr(nor);
+		if (ret >= 0) {
+			if (ret & CR_BPNV)
+				mtd->flags |= MTD_POWERUP_LOCK;
+		} else {
+			dev_err(dev, "error reading configuration register\n");
+		}
+	}
+
 	/* sst nor chips use AAI word program */
 	if (info->flags & SST_WRITE)
 		mtd->_write = sst_write;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 677768b21a1d..15d04b065182 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -313,6 +313,7 @@ struct mtd_info {
 	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*_sync) (struct mtd_info *mtd);
+	int (*_set_powerup_lock) (struct mtd_info *mtd);
 	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -451,6 +452,7 @@ static inline void mtd_sync(struct mtd_info *mtd)
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_set_powerup_lock(struct mtd_info *mtd);
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
index aff5b5e59845..a78b2dce084f 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -204,6 +204,10 @@ struct otp_info {
  * without OOB, e.g., NOR flash.
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
+/* Set device to revert to locked state at reset; NB, on some devices this
+ * is an OTP bit so this setting may be irreversible
+ */
+#define MEMSETPOWERUPLOCK	_IO('M', 25)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
