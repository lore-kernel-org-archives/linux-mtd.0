Return-Path: <SRS0=YvPJ=ZY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787B4C432C0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 06:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C63720881
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 06:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7KY004y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EwZSgD0L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C63720881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ/Y4+aL3RaRJAQZZxYwlB60TPV9+b/eXtse2a00irY=; b=p7KY004yaifhe+
	mRwZv3qvr09EF6SHZ5snhDIFqMkUWNU6tZTklYLoJCPxs3BO23RdHz9u1UIreT1l5bLOH/0mqI0KL
	7av0iomLwZr0pXm6WAH70okdaONN4YZAIYUlqCio5qbIzajI9C+0q/5OMUyIWyIBytvCWCa5qzhNw
	EVJdjYVTaGBAcScDhrASpkPP0z8xXXUp8VRDPnrAZDznEkfHRsEj5dQDDcZUAdG2zX18DgZEmtawO
	Za2x3vsDnkhLQs6bgn8s/38jPklbYW0uiThDxpdUO6lEoBAA5PaiDYhXlGx3nm2oRIK+VN1XR53+q
	61ZUZoU4/hwpb7SygHeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibfJ3-0004te-D7; Mon, 02 Dec 2019 06:35:37 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibfIq-0004ih-IJ
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2019 06:35:26 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20191202063519epoutp049fe6708b86ec37f557919173b967ae76~cel9kjIp82931229312epoutp04j
 for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2019 06:35:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20191202063519epoutp049fe6708b86ec37f557919173b967ae76~cel9kjIp82931229312epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1575268519;
 bh=291PqnZn46mmCIQME2HKoXUA8jOrYIrKm2XmXblqMyw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EwZSgD0LJNnMvQOHEC1b2z0H2b/RXgFGwEUHI4MSSDmLUbfohX+gHwvj1Ihn1dPA2
 SOuf+jd5kv0Lp4k0GySmwPtHlMFaV8uQjXmz3Q0NLW7yquzcdaKG3nSSpx4lcKazpW
 A7J/6uXbARrB6NyO1z/4rEvnOYayon7lRrYW4frs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20191202063519epcas1p4b31f4774f8adbd9b90eb439762e561af~cel9RPZtp0512905129epcas1p4A;
 Mon,  2 Dec 2019 06:35:19 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.164]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47RFjL2jV0zMqYkx; Mon,  2 Dec
 2019 06:35:18 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.7E.57028.6A0B4ED5; Mon,  2 Dec 2019 15:35:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8~cel79UrMC2429024290epcas1p1M;
 Mon,  2 Dec 2019 06:35:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191202063518epsmtrp10a193912b37193a07c84fce1ce9aa348~cel78vpZ30427804278epsmtrp1c;
 Mon,  2 Dec 2019 06:35:18 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-da-5de4b0a6a8f6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DE.79.10238.5A0B4ED5; Mon,  2 Dec 2019 15:35:18 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191202063517epsmtip254a8e3835a2eab7cd7154e3a3c4b16b8~cel71Jdpf2970329703epsmtip2m;
 Mon,  2 Dec 2019 06:35:17 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: js07.lee@gmail.com, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 js07.lee@samsung.com
Subject: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
Date: Mon,  2 Dec 2019 15:35:06 +0900
Message-Id: <20191202063507.21311-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202063507.21311-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7bCmru6yDU9iDW4/FrH4O+cdk8Wjm79Z
 LXY3LWO3OLrnHrPFxyUODqweO2fdZffYvKTe486PpYwefVtWMQawROXYZKQmpqQWKaTmJeen
 ZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gCtVVIoS8wpBQoFJBYXK+nb2RTl
 l5akKmTkF5fYKqUWpOQUGBoU6BUn5haX5qXrJefnWhkaGBiZAlUm5GTM+7ybraBDo+LY1Q+s
 DYz75LsYOTkkBEwkjs5tZu5i5OIQEtjBKHF911pWCOcTo8SOrZ9YIJxvjBKvmk6wwLScvfiD
 EcQWEtjLKHFlYQpE0WdGiekt99lAEmwCWhI3fm8CGyUisJBRYt6lJ0wgCWEBN4neb0dYQWwW
 AVWJuSsOg9m8ApYS33qvM0NskJdYveEAmM0pYCWx8PNydpBBEgJ/WSWmnZ/DClHkIvH8/CR2
 CFtY4tXxLVC2lMTL/jYou1hi58qJUM0tjBKPli+BShhLvHu7FmgDBwezgKbE+l36EGFFiZ2/
 54K9xizAJ/Huaw8rSImEAK9ER5sQRImSxJsHLdCQkJC48LgX6hwPif/LHkJDpZdR4vMvxQmM
 srMQFixgZFzFKJZaUJybnlpsWGCIHE2bGMGJSct0B+OUcz6HGAU4GJV4eA1ePI4VYk0sK67M
 PcQowcGsJMJ7XelhrBBvSmJlVWpRfnxRaU5q8SFGU2BITmSWEk3OBybNvJJ4Q1MjY2NjCxMz
 czNTYyVxXo4fF2OFBNITS1KzU1MLUotg+pg4OKUaGO3f2lTuNF32hbHy9tx1GT8OlfiLq9x/
 wPL+18MXtTpW86/MOP56mXOw2bL2oCcbZ2+586ziScXxD6funM9LaZFlfsivuq2g5K3mLz6N
 NNP3Rm0z3K4cSNZ2OsG63eV+9GZNpbu60/8xvz+U8EM+Pk54b57QzTrXm7axxesniHfm1/g6
 PBZc80iJpTgj0VCLuag4EQB1IQKfYgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnluLIzCtJLcpLzFFi42LZdlhJXnfZhiexBuebGS3+znnHZPHo5m9W
 i91Ny9gtju65x2zxcYmDA6vHzll32T02L6n3uPNjKaNH35ZVjAEsUVw2Kak5mWWpRfp2CVwZ
 8z7vZivo0Kg4dvUDawPjPvkuRk4OCQETibMXfzB2MXJxCAnsZpQ49LSRFSIhIfFo5xeWLkYO
 IFtY4vDhYpCwkMBHoJq9ziA2m4CWxI3fm1hBekUEljJKXLnygREkISzgJtH77QjYHBYBVYm5
 Kw6D2bwClhLfeq8zQ8yXl1i94QCYzSlgJbHw83J2iAWWEj/XXWSfwMi7gJFhFaNkakFxbnpu
 sWGBYV5quV5xYm5xaV66XnJ+7iZGcPBoae5gvLwk/hCjAAejEg9vx6vHsUKsiWXFlbmHGCU4
 mJVEeK8rPYwV4k1JrKxKLcqPLyrNSS0+xCjNwaIkzvs071ikkEB6YklqdmpqQWoRTJaJg1Oq
 gVE862X3sdyYtVw/3rw5yrNzTena6QoTnnT9mju5JChSbadbu9+WJUe2FKx+eb956YyOqcX8
 P78zGmTdaHiZdynhgM8ZWf3rJysM/5SoMt60cpdx1olLEf5+K+Vlkc+uyM2ylx7WNk0qiTis
 5LCE+2/ck31PTHlv2hVOn2K59rbfxjBGn5aC+J9KLMUZiYZazEXFiQBmr5GpGgIAAA==
X-CMS-MailID: 20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8
References: <20191202063507.21311-1-js07.lee@samsung.com>
 <CGME20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_223524_959636_A555240D 
X-CRM114-Status: GOOD (  18.64  )
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

There are some flashes to use bit 6 of status register for Top/Bottom (TB).
Use top/bottom bit variable instead of fixed value and support this case.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 34 +++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7dea5734f085..227b56b0a5b0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -196,7 +196,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -233,6 +233,11 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_TB_SR_BIT6	BIT(16)	/*
+					 * Top/Bottom (TB) is bit 6 of
+					 * status register. Must be used with
+					 * SPI_NOR_HAS_TB.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1761,9 +1766,13 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 tb_mask = SR_TB_BIT5;
 	int shift = ffs(mask) - 1;
 	int pow;
 
+	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
+		tb_mask = SR_TB_BIT6;
+
 	if (!(sr & mask)) {
 		/* No protection */
 		*ofs = 0;
@@ -1771,7 +1780,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
 			*ofs = 0;
 		else
 			*ofs = mtd->size - *len;
@@ -1850,6 +1859,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 tb_mask = SR_TB_BIT5;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1886,6 +1896,9 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
+	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
+		tb_mask = SR_TB_BIT6;
+
 	/*
 	 * Need smallest pow such that:
 	 *
@@ -1903,13 +1916,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
+	status_new = (status_old & ~mask & ~tb_mask) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB_BIT5;
+		status_new |= tb_mask;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -1932,6 +1945,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 tb_mask = SR_TB_BIT5;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1968,6 +1982,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs;
 
+	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
+		tb_mask = SR_TB_BIT6;
 	/*
 	 * Need largest pow such that:
 	 *
@@ -1987,14 +2003,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
+	status_new = (status_old & ~mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new &= ~SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB_BIT5;
+		status_new |= tb_mask;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -5142,8 +5158,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (info->flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
-	if (info->flags & SPI_NOR_HAS_TB)
+	if (info->flags & SPI_NOR_HAS_TB) {
 		nor->flags |= SNOR_F_HAS_SR_TB;
+		if (info->flags & SPI_NOR_TB_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
+	}
+
 	if (info->flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 	if (info->flags & USE_CLSR)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5124c306f60b..7e32adce72f7 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -245,6 +245,7 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_LOCK		= BIT(8),
 	SNOR_F_HAS_16BIT_SR	= BIT(9),
 	SNOR_F_NO_READ_CR	= BIT(10),
+	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
 
 };
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
