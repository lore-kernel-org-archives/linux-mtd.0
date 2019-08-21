Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C86C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10FFD22CE3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vj4YgYXG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q5mHPSAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10FFD22CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAhB8dn2fbsY4L6cdQZT5nqn0lsdZgB1q9Am3cZAbLI=; b=Vj4YgYXGSJHMCd
	ukHntGZUFVDWFLaplBlmz2mCNB1Br1zbLfI9LaT4oALu7MHem66rnH6LwLKmwtHD8cGKItCfWxjMD
	DAjGyt8+tEy97qgkTCcqYFHzDCR9q3YctZZO7wAulgSreDCENOEq+khX5vd2cShrr//q/R96Beyig
	dH/kEdPfeTzWI9P1Xevy/i2I7eEN9bcSApC/8DpxY2oVYi9zOHAdJL+7WbAuIe3iwgCbo7++nHYqg
	Ve1imaHV5srgvEK77KTBHVe2D9ZaE/r+mNaHLKM7BG2vLWr4V6uNhhAWtmcN3Bx57zsnFwvnvl9Lk
	URo8ztjIzUwKwwIqXMJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0J08-0004eT-Ge; Wed, 21 Aug 2019 05:17:40 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0IzD-0003jW-0F
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 05:16:46 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190821051639epoutp04ec3b34784bd0c2dfb9cd41341276aa71~82E3lIC_a2482624826epoutp047
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2019 05:16:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190821051639epoutp04ec3b34784bd0c2dfb9cd41341276aa71~82E3lIC_a2482624826epoutp047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566364599;
 bh=VVL8/mMVrmKnmz3yxS/PGtxlbxE1vqBAQvahDqcgUSI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q5mHPSAejkW+YCko4fhoCfjjzIIThy+FnZfkBSRx5Gg6sfXQXJFS4t0rQY5+RpaYl
 o0HJ0xAKAQOSyq0McydzkX42C2MRrbRZQScP1CILfj4TQV+oJr+9vyG7hCKpSCiaGj
 VRIDb+3Pyla3Ol6c3KrgYNqs7v+3Yg3+nEAOtjT0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190821051639epcas1p45052d0d355d3e3aa248bd7b9f53555ec~82E3Nr45w0615806158epcas1p4t;
 Wed, 21 Aug 2019 05:16:39 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.162]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 46Cwr60n2qzMqYly; Wed, 21 Aug
 2019 05:16:38 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.9C.04075.5B3DC5D5; Wed, 21 Aug 2019 14:16:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epcas1p363a032d32b2c20a1382bc3570aa75dd2~82E17XowM2572125721epcas1p3P;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190821051637epsmtrp237a2239a6b3cc3714e795814af79432f~82E16Rl8-0534305343epsmtrp2V;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
X-AuditID: b6c32a36-b61ff70000000feb-e3-5d5cd3b53127
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0B.2C.03638.5B3DC5D5; Wed, 21 Aug 2019 14:16:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epsmtip2c7014c9714551cfbfbfd1200384dfadf~82E1v1yVS0443104431epsmtip2q;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v5 4/5] mtd: spi-nor: add 4bit block protection support
Date: Wed, 21 Aug 2019 14:15:40 +0900
Message-Id: <20190821051541.6083-4-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821051541.6083-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmru62yzGxBpumsFqsbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHVI5NRmpiSmqRQmpecn5KZl66rZJ3cLxz
 vKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtCBSgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJb
 pdSClJwCQ4MCveLE3OLSvHS95PxcK0MDAyNToMqEnIxXx9tZClo8K/a+bmVpYOyx7GLk5JAQ
 MJHouPKQrYuRi0NIYAejxPGzV1khnE+MEosvrWeCcL4xSizvec8C07J30mWolr2MEifPzWOG
 cD4zSjScX8cOUsUmoCVx4/cmsFkiAi+YJN7um80KkhAWcJeYeKATaC4HB4uAqkTLQyOQMK+A
 hcT2N7sZITbIS6zecIAZxOYUsJSY8OYz2BkSAnvYJKbtW8wO0ish4CKxeXU5RL2wxKvjW9gh
 bCmJz+/2skHYxRI7V05kh+htYZR4tHwJVJGxxLu3a5lB5jALaEqs36UPEVaU2Pl7LtgNzAJ8
 Eu++9rBCrOKV6GgTgihRknjzoAUaEBISFx73skLYHhJ/lr+DBl0Po8SU6bfYJzDKzkLYsICR
 cRWjWGpBcW56arFhgRFyNG1iBCc7LbMdjIvO+RxiFOBgVOLh3XEzOlaINbGsuDL3EKMEB7OS
 CG/FnKhYId6UxMqq1KL8+KLSnNTiQ4ymwICcyCwlmpwPTMR5JfGGpkbGxsYWJmbmZqbGSuK8
 C39YxAoJpCeWpGanphakFsH0MXFwSjUwFi3dvag8beFOplV3vQXfF4Yo2znf8jTLDmHcr2L7
 +4nMisVXH/CLKgj9jzinwO53zt/Fq3XuCjNrydPreK32dzOnhR97udttrtEM+fPexwUZlB4+
 vcryjPdvfSybzAWHlyJc/ya4H2CN6zrYvH6fwOlT2m3Xl8049MLl+eGEtTI3eJIeF3zZr8RS
 nJFoqMVcVJwIAOwF0kKMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSvO7WyzGxBh9mqFusbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHFJdNSmpOZllqkb5dAlfGq+PtLAUtnhV7
 X7eyNDD2WHYxcnJICJhI7J10mQ3EFhLYzSgxsZELIi4h8WjnF5YuRg4gW1ji8OHiLkYuoJKP
 jBLbrr0Eq2cT0JK48XsTK0hCROADk8TlSadYQBLCAu4SEw90MoE0swioSrQ8NAIJ8wpYSGx/
 s5sRYr68xOoNB5hBbE4BS4kJbz4zQdxgIbFscSPLBEbeBYwMqxglUwuKc9Nziw0LjPJSy/WK
 E3OLS/PS9ZLzczcxgsNRS2sH44kT8YcYBTgYlXh4d9yMjhViTSwrrsw9xCjBwawkwlsxJypW
 iDclsbIqtSg/vqg0J7X4EKM0B4uSOK98/rFIIYH0xJLU7NTUgtQimCwTB6dUA6OFQ1Xqq89K
 T7dnGMm9u3tS6xZ3RIVc4cJLZZaH5G28k3f9dTnJ8XfDqyRP5yCDs+9+1U532i55btrFX3c6
 ZZKMvAV3Mr5Pmv7AQzc46213wferS81Eznk/yot4fb12yYm1rpWSp3isL/ty80xQUlwf5hd/
 SU9hrodj948DYf9MZJ9Xi50wMVRiKc5INNRiLipOBABvOzyaQwIAAA==
X-CMS-MailID: 20190821051637epcas1p363a032d32b2c20a1382bc3570aa75dd2
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821051637epcas1p363a032d32b2c20a1382bc3570aa75dd2
References: <20190821051541.6083-1-js07.lee@samsung.com>
 <CGME20190821051637epcas1p363a032d32b2c20a1382bc3570aa75dd2@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_221643_720780_BC9C681F 
X-CRM114-Status: GOOD (  25.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, we are supporting block protection only for
flash chips with 3 block protection bits in the SR register.
This patch enables block protection support for some flash with
4 block protection bits(bp0-3).

Because this feature is not universal to all flash that support
lock/unlock, control it via a new flag.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
v5:
 - remake patch based on latest spi-nor/next tree
 - Add BP3 handling on spi_nor_clear_sr_bp()

 drivers/mtd/spi-nor/spi-nor.c | 119 +++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |   5 ++
 2 files changed, 99 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 84522c825ab5..5cb1a6ba2c53 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -97,6 +97,7 @@ enum spi_nor_pp_command_index {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u16				n_sectors;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -251,7 +252,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -280,6 +281,7 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BP3		BIT(16)	/* use 4 bits filed for block protect */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1410,26 +1412,49 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 mask_tb = SR_TB_BIT5;
-	int pow;
+	u8 mask_tb = SR_TB_BIT5, mask_bp3 = SR_BP3_BIT6;
+	u8 sr_masked, mask, tmp;
+	int pow = 0;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
 		mask_tb = SR_TB_BIT6;
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	sr_masked = sr & mask;
 
-	if (!(sr & mask)) {
+	if (!sr_masked) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
-	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
-			*ofs = 0;
+		return;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		if (sr_masked & mask_bp3 && mask_bp3 == SR_BP3_BIT6)
+			tmp = (sr_masked & ~SR_BP3_BIT6) | BIT(5);
 		else
-			*ofs = mtd->size - *len;
+			tmp = sr_masked;
+
+		tmp >>= SR_BP_SHIFT;
+
+		if (ilog2(nor->n_sectors) >= tmp)
+			pow = ilog2(nor->n_sectors) - tmp + 1;
+	} else {
+		pow = (sr_masked ^ mask) >> SR_BP_SHIFT;
 	}
+
+	*len = mtd->size >> pow;
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -1503,9 +1528,8 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 mask_tb = SR_TB_BIT5;
-	u8 pow, val;
+	u8 mask_tb = SR_TB_BIT5, mask_bp3 = SR_BP3_BIT6;
+	u8 mask, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1540,8 +1564,15 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		lock_len = ofs + len;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
 		mask_tb = SR_TB_BIT6;
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
 
 	/*
 	 * Need smallest pow such that:
@@ -1553,7 +1584,17 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << SR_BP_SHIFT);
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask_bp3 == SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | SR_BP3_BIT6;
+	} else {
+		val = mask - (pow << SR_BP_SHIFT);
+	}
+
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1588,9 +1629,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 mask_tb = SR_TB_BIT5;
-	u8 pow, val;
+	u8 mask_tb = SR_TB_BIT5, mask_bp3 = SR_BP3_BIT6;
+	u8 mask, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1625,8 +1665,16 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		lock_len = ofs;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
 		mask_tb = SR_TB_BIT6;
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
 	/*
 	 * Need largest pow such that:
 	 *
@@ -1639,13 +1687,20 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
+	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask_bp3 == SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | SR_BP3_BIT6;
 	} else {
 		val = mask - (pow << SR_BP_SHIFT);
-		/* Some power-of-two sizes are not supported */
-		if (val & ~mask)
-			return -EINVAL;
 	}
 
+	/* Some power-of-two sizes are not supported */
+	if (val & ~mask)
+		return -EINVAL;
+
 	status_new = (status_old & ~mask & ~mask_tb) | val;
 
 	/* Don't protect status register if we're fully unlocked */
@@ -2026,7 +2081,17 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 {
 	int ret;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask, mask_bp3 = SR_BP3_BIT6;
+
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
 
 	ret = read_sr(nor);
 	if (ret < 0) {
@@ -4218,6 +4283,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	memset(params, 0, sizeof(*params));
 
 	/* Set SPI NOR sizes. */
+	params->n_sectors = info->n_sectors;
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
@@ -4760,12 +4826,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
+	if (info->flags & SPI_NOR_HAS_BP3)
+		nor->flags |= SNOR_F_HAS_SR_BP3;
 
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
 	nor->page_size = params.page_size;
+	nor->n_sectors = params.n_sectors;
 	mtd->writebufsize = nor->page_size;
 
 	if (np) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index abbe5f915410..a6b5d5e06455 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -128,7 +128,9 @@
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 (on Winbond/GigaDevice)*/
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect (on Winbond/GigaDevice) */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
@@ -247,6 +249,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_4BAIT	= BIT(8),
+	SNOR_F_HAS_SR_BP3	= BIT(9),
 };
 
 /**
@@ -354,6 +357,7 @@ struct flash_info;
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
+ * @n_sectors:		number of sector
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -394,6 +398,7 @@ struct spi_nor {
 	size_t			bouncebuf_size;
 	const struct flash_info	*info;
 	u32			page_size;
+	u16			n_sectors;
 	u8			addr_width;
 	u8			erase_opcode;
 	u8			read_opcode;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
