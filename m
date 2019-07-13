Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5403EC32751
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9F020B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObO7Ivag";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dGtTMZxS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9F020B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp25seINjOFQyJ7bHsfDGYY5cLR/BT7VUlR7HS5Cscw=; b=ObO7IvagEy2Lvr
	hQ1040r+LPLlKwyi0o3rtdTUJK14ADDbOLtVQwmk0sJCf7ONk/pvuomV4ifoL/rZ8fhBdP3IuL8zz
	/Qxf4jOSpXsYj72DmLHZTuPmKfhl3cp5ijmWgPDotMK3BFuqxTXMCcXmHD5eQWD/1sRRx6FdLKt3K
	s0GQt+OLT47AL9WbAF1PPR8TjoyP7IMbFT5t8acYt5M5R9F5ujz66Q8OMmGI6LicFPoXiL275raZj
	3ueHkXLPRA8jzZWXjdt8P7r5m0vbjpsNh7x1CPcGbbQ0PleIOJ7TDSbbzxBLORLyAhErdIG9A33/W
	cF27KiEVVh09iIt0haRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht0TI-00081s-F7; Thu, 01 Aug 2019 02:05:36 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht0T6-0007ia-5a
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 02:05:26 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190801020522epoutp043177c0483f31a5a175e74beab7905c5b~2qkJFpc-_2682626826epoutp04n
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 02:05:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190801020522epoutp043177c0483f31a5a175e74beab7905c5b~2qkJFpc-_2682626826epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564625122;
 bh=Tjb0Xd7PQguo2goskCorEn8GNqy8fZ17RgsxnNeoAkk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dGtTMZxSaakV3YFtJe/tFMOaCjf+zRuHQ+Loekk0PcoViGNPpOnZJ4YLvWrBvIntX
 Tw4DkdliIHjWp5/2gMGpGEwhoqxCRYTZFmJTj+N4+sQnrk6lvsfutjyzGMM6Puj6+z
 xwehTmH28I46KFbyaEKfFpLWuViJE9TXhk8KZVUA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190801020521epcas1p2c67a128951d0f8e7b50647ba14a3f08e~2qkIgLVuS1618016180epcas1p22;
 Thu,  1 Aug 2019 02:05:21 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.162]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 45zYXc4BlJzMqYkV; Thu,  1 Aug
 2019 02:05:20 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.F8.04066.0E8424D5; Thu,  1 Aug 2019 11:05:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190801020520epcas1p3a9d8fc8175a5cc74be9077c2c6ee678c~2qkHWnbR80077600776epcas1p32;
 Thu,  1 Aug 2019 02:05:20 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190801020520epsmtrp1dc0a909d83aaa1d874cb4a14e3e2c799~2qkHVo_jT1828718287epsmtrp1X;
 Thu,  1 Aug 2019 02:05:20 +0000 (GMT)
X-AuditID: b6c32a37-e3fff70000000fe2-11-5d4248e0ba94
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CD.3B.03638.0E8424D5; Thu,  1 Aug 2019 11:05:20 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190801020520epsmtip28e649b385464072fc74b06d33e6bf351~2qkHI_K9o0926809268epsmtip2Y;
 Thu,  1 Aug 2019 02:05:20 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v3 3/4] mtd: spi-nor: add 4bit block protection support
Date: Sat, 13 Jul 2019 16:15:40 +0900
Message-Id: <20190713071541.22090-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713071541.22090-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRTn293jKq0u0/RDiOYlKwfLzW16HZnrQd5ISiqCIrGLu2zSXu5u
 lkEPQkSttcaszLQH2sO3aaWW5TRDqTSrP0qyECVTWyPtNZCobdeo/873e5zz43wHRUQ/eTFo
 rslGW02UAeeHc+8+ipdKx8gNWTLHXCxRX3geEH3DjQjhqnUjxK9KH4cYH5nnEfdPXBcQj7ve
 I4S70wuI2RoN8dblBppwsrPinYBsuykhW+tK+GRbzTFy1H8NkCOX8kjnLxl5+nYdyET3Gtbq
 aUpLW8W0KceszTXpUvGtO7M3ZquSZHKpPIVIxsUmykin4psyMqWbcw2BgLg4nzLYA1AmxTB4
 wrq1VrPdRov1ZsaWitMWrcEil1nWMJSRsZt0a3LMRrVcJktUBZT7Dfqm/gaBpV996FzZluNg
 SFoKwlCIKaGz6QG/FISjIqwDQLdjFgkSImwOwMnZXSzxA0BvcUVAhYYcP55oWPwBgJ7pW4B9
 fAXwdXEVJ+jmYxL4Zr6VFyQisSkO/PzwIi9IRGDp8IOnBwRrLhYHT75yh8YJsRR4YcTFYzMt
 h/UtnhAehqnhYLkPCTaCWAcfTninFmJsgmWjElYfAWf6bwvYOgZOO4sWagZ21roErLcQwPEb
 NQuEAvo+NyLBPggWD5vvJbBwLOycrwplQ7DF0Pf9FI8dJYTFRSJWgkPvWCGXrSEcnnAsRCZh
 6dRDDrsIB4A/28fBGbCs4t+EKwDUgSjawhh1NCO3KP7/pFYQOjpJcgdoGcroBRgK8EXCgZL1
 WSIelc8UGHsBRBE8UlgdnZYlEmqpgsO01ZxttRtopheoApt0ITFLc8yBEzbZsuWqRIVCQSiT
 kpNUCjxaeNVPZIkwHWWjD9C0hbb+9XHQsJjj4HRiXvzbiKgzaEa6Lm1vZsFZTEUfeDnYeGzP
 THuSkdkof3HHPDW3xN9l2FfePbatqnWHrdKndEVt9/SN7bYfshx0Xky51aN/CqL9iuFq66um
 b1u+pFV2uQeGtIOTDtdHRvlpRdVRTdzzlq0NJSufHll92f8sp7t5Bufjv9Wr5nU4l9FTcgli
 Zag/MRri0IoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSvO4DD6dYgy1fuC1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugStj3fE17AXHrSqm
 TfFsYDyn28XIwSEhYCLx7ZRDFyMXh5DAbkaJheffMnUxcgLFJSQe7fzCAlEjLHH4cDFEzUdG
 iccv74PVsAloSdz4vYkVJCEi8IFJ4vKkUywgCWEBd4mnBw4ygtgsAqoS3ZcnM4PYvAKWEjNv
 TmSFWCAvsXrDAbA4p4CVxNkZ78BsIaCae31drBMYeRcwMqxilEwtKM5Nzy02LDDKSy3XK07M
 LS7NS9dLzs/dxAgORy2tHYwnTsQfYhTgYFTi4T3R6RgrxJpYVlyZe4hRgoNZSYR3sbh9rBBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXFe+fxjkUIC6YklqdmpqQWpRTBZJg5OqQbG1ncr/Kyq6sIb
 bnGVV/1P53fak6rz90PSfKY983dnnmhtsss4qKYg+kqlqHT390/7Fi3evdTmUPzft2/Pan3a
 XakrxXDAm/0Kw2IW7ckbXbftOfLy43dG+R8tZ3fOF5/NenXyyYkbzAosU5wMi+Ys6r/tKBOn
 Xujkeyds0ofISJGHT+eUemy0VWIpzkg01GIuKk4EADC/319DAgAA
X-CMS-MailID: 20190801020520epcas1p3a9d8fc8175a5cc74be9077c2c6ee678c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801020520epcas1p3a9d8fc8175a5cc74be9077c2c6ee678c
References: <20190713071541.22090-1-js07.lee@samsung.com>
 <CGME20190801020520epcas1p3a9d8fc8175a5cc74be9077c2c6ee678c@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_190524_590246_84EA019D 
X-CRM114-Status: GOOD (  27.10  )
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
 drivers/mtd/spi-nor/spi-nor.c | 87 +++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h   |  5 ++
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dd12d3c83029..0d0b92de62db 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -96,6 +96,7 @@ enum spi_nor_pp_command_index {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u16				n_sectors;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -250,7 +251,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -279,6 +280,7 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BP3		BIT(16)	/* use 4 bits filed for block protect */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1088,21 +1090,43 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	int pow;
+	u8 sr_masked, mask, tmp;
+	int pow = 0;
 
-	if (!(sr & mask)) {
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = SR_BP3_BIT6 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	sr_masked = sr & mask;
+
+	if (!sr_masked) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
-	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
-			*ofs = 0;
+		return;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		if (sr_masked & SR_BP3_BIT6)
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
+
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -1176,12 +1200,16 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 pow, val;
+	u8 mask, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = SR_BP3_BIT6 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -1221,7 +1249,16 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << SR_BP_SHIFT);
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+		if (val & BIT(5))
+			val = (val & ~BIT(5)) | SR_BP3_BIT6;
+	} else {
+		val = mask - (pow << SR_BP_SHIFT);
+	}
+
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1256,12 +1293,16 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 pow, val;
+	u8 mask, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = SR_BP3_BIT6 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -1303,13 +1344,19 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
+	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+		if (val & BIT(5))
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
 	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
 
 	/* Don't protect status register if we're fully unlocked */
@@ -3580,6 +3627,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	memset(params, 0, sizeof(*params));
 
 	/* Set SPI NOR sizes. */
+	params->n_sectors = info->n_sectors;
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
@@ -4091,12 +4139,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
index b8f4439c30b1..751b6ea0776a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -129,7 +129,9 @@
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Used for STM and Micron flashes */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 /* Used for Winbond and GigaDevice flashes */
+#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 */
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
 
 #define SR_BP_SHIFT		2
@@ -249,6 +251,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_4BAIT	= BIT(8),
+	SNOR_F_HAS_SR_BP3	= BIT(9),
 };
 
 /**
@@ -352,6 +355,7 @@ struct flash_info;
  * @dev:		point to a spi device, or a spi nor controller device.
  * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
+ * @n_sectors:		number of sector
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -388,6 +392,7 @@ struct spi_nor {
 	struct device		*dev;
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
