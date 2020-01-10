Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90504C33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 10:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6167320721
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 10:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btK/7xCK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C2PCjMl2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6167320721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/zfU15mEGUpv5InUGY1wVmJicIZ3rEmlsEAE/EYB0M=; b=btK/7xCKrQyJoG
	+9yBF2jvXQlqp2+g+n/N1vOWnwuM0G+h7sQ5BMQlzq6glwfK19HwH8rsrjYOBCNxNsWCtCe1xygZm
	0EZUbVuD5PT/PTba0F9os8bnFabaxzdOroS5kdz5rSYZHSY8uYKWSamzVsnDsecndZyMzVHaJmo/F
	MauDs1cTLQd89RviYc3VjZkhmpB1lrXQhI5DIGdsYK4P4puXR+gvBzylveH5syt+agTUMQ1RSP4j+
	q6SU+up9Q46LeECNAsLL0Ks7lXtwvAINgW0Mtu5TXbFbxnjiXA8nxLq12mleOm7CLzS1F91Qng6zS
	NO40qJBpnetFL6evx/Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iprRu-0006DG-U3; Fri, 10 Jan 2020 10:23:26 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iprRj-00063a-5X
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 10:23:17 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200110102312epoutp02d0becef90f4f3b1ad1ef83044ee1e9ae~of3Dejpuh2442224422epoutp02g
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 10:23:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200110102312epoutp02d0becef90f4f3b1ad1ef83044ee1e9ae~of3Dejpuh2442224422epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578651792;
 bh=0+ZSXgsQ2I++g702VBfKoQUwALSvvtgE54uBWY13Se0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C2PCjMl21Mc1v3wJJxOhi0h4/ydQGSPTxwraq/41b9Tzr7i07cTuNofjAt+EqxIFs
 iEyxBqz7pbXRD062ZGYRgKcDr1+DXtDQBhLu93ch2646RNNavX1nXzc4vN9ZnyNf0K
 QIwQaDum/UXNSQb3Ls2Hy1aTTKjuhfZOm9069Jj8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200110102311epcas1p32d2f598c9fc65eca773ae022efb20a62~of3DGOb2d1533215332epcas1p3u;
 Fri, 10 Jan 2020 10:23:11 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.166]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 47vJwG4XBgzMqYlp; Fri, 10 Jan
 2020 10:23:10 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 85.9A.57028.E80581E5; Fri, 10 Jan 2020 19:23:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200110102310epcas1p40589cbb4370dcd4db08efa4008deb755~of3BowlKo2290222902epcas1p47;
 Fri, 10 Jan 2020 10:23:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200110102310epsmtrp28880cfc647fccaa104f8a4ca86e685a5~of3BoAI3q3044730447epsmtrp2k;
 Fri, 10 Jan 2020 10:23:10 +0000 (GMT)
X-AuditID: b6c32a35-4f3ff7000001dec4-22-5e18508e9969
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 64.79.06569.E80581E5; Fri, 10 Jan 2020 19:23:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200110102310epsmtip2b1ad884fde2e6eb256ed3d479f895886~of3Bg7glh1253612536epsmtip2x;
 Fri, 10 Jan 2020 10:23:10 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com
Subject: [PATCH 2/3] mtd: spi-nor: add 4bit block protection support
Date: Fri, 10 Jan 2020 19:22:56 +0900
Message-Id: <20200110102257.28883-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110102257.28883-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3uuqu0uMxHB0NcNyq01M25efNRghKjAgdRf0ht3dyvTbx7
 sLtJ9qAVYla6sgR7WUZmZEgve2iIa2JmkaQJrdIoo38iVyaVIGWbN6n/vpzz+X4PnHMoQjFM
 JlJldjd22TmeiYqR3u1NUaX5DGBUfetXsr/OhSTs+KsZkn1wsFXGTrYUsLPPvsoKSH3nmTGZ
 /nbLfv3o9GWk93W0IX1/8J7EQJbweVbMmbFLie2lDnOZ3ZLPbNhkKjRpdSp1mno1m80o7ZwN
 5zNFGw1p68r48GxGWcHxnnDJwAkCk7Emz+XwuLHS6hDc+Qx2mnmnWuVMFzib4LFb0ksdthy1
 SpWpDZPbeetge5Bw+nJ29Rzuk3jR7KojKJoCOguGD3+SHEExlIK+j+Dn3YfSSENBf0Pw9EKF
 2PiBoHfqnHTe0fTdKxGhbgS1b5JEPYVguM8d0VF0KgRnbpERcxx9KcxMvECRRixdBIdOfCQi
 Wkovg6G6pnAoRcnp1VB/aJ+YnwzXbvjnkGg6By6OTBCRHKAPRMF0lx+JUBH4HoUIUcfCp/4O
 magTYSrUHSVqATqv1stEcxWC8SstfyENhCbaichggk6B610ZYnkJdM40zeUT9EIIfa8lIwjQ
 cqipVogIA5/fVf3dA8DzD3WkqPVw/vWATFxWHYKR1gB5HCWd+TehGaE2lICdgs2CBbVT/f+R
 bqG5f0rV3kcNgxsDiKYQs0BujV1kVJBchVBpCyCgCCZO3hdMMCrkZq5yN3Y5TC4Pj4UA0oY3
 WU8kxpc6wt9pd5vU2kyNRsNm6bJ1Wg2zSE5ND21T0BbOjcsxdmLXvE9CRSd60fApaQJ/89iO
 O837i1iUu+E2m+wv9jdee5yuH83q+01eWTs0ueCo44RBU7h4T0luT80YKvDGr29vqAx23ytQ
 vF2j1G6b3DK6c+XLkaymFb5G3ZPWGteAuS0bv+8tbyt3dvw8Gdq191kxuy53/emtZz9vXp7p
 /bgUNVcbjD1f+CTMSAUrp04lXAL3B7IeXFhlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJXrcvQCLO4MZRdou/c94xWTy6+ZvV
 YnfTMnaLj0scLP6f/cDuwOqxc9Zddo/NS+o97vxYyujRt2UVo8fxG9uZAlijuGxSUnMyy1KL
 9O0SuDLOrb3BXNBnVbG/8yhTA+N/nS5GTg4JAROJuV8bmLoYuTiEBHYzSiyc9okVIiEh8Wjn
 F5YuRg4gW1ji8OFiiJqPjBKz181nBqlhE9CSuPF7EytIQkRgOaPE+Z932UESwgIuEu2TnoIV
 sQioSlzsnQs2iFfAUmJiey3EfHmJ1RsOgJVwClhJLLzyFswWAir5c/gZ6wRG3gWMDKsYJVML
 inPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYLDSEtrB+OJE/GHGAU4GJV4eDOExeOEWBPLiitz
 DzFKcDArifAevSEWJ8SbklhZlVqUH19UmpNafIhRmoNFSZxXPv9YpJBAemJJanZqakFqEUyW
 iYNTqoHRzqmB2T946QG7DbbnzCwf79qwfHXbv8sSqzNTFtjOLvo5Y63UHQnzySpOX6esvy+f
 ZqBcsc5M3phfSdHp4+edqdO+m61j9v33cu6W+ekvDJwUd5SVtud7qmivcjSY+nCNQ5ms3pOP
 c4N3zFnIsWve5FAr6WffZrU83RM708iHt/d0Eddc1cOZSizFGYmGWsxFxYkAmxMRMB8CAAA=
X-CMS-MailID: 20200110102310epcas1p40589cbb4370dcd4db08efa4008deb755
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200110102310epcas1p40589cbb4370dcd4db08efa4008deb755
References: <20200110102257.28883-1-js07.lee@samsung.com>
 <CGME20200110102310epcas1p40589cbb4370dcd4db08efa4008deb755@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_022315_560322_30DB6CE0 
X-CRM114-Status: GOOD (  22.17  )
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

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 90 +++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |  8 ++++
 2 files changed, 88 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e3da6a8654a8..214f3b733e9b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -238,6 +238,14 @@ struct flash_info {
 					 * status register. Must be used with
 					 * SPI_NOR_HAS_TB.
 					 */
+#define SPI_NOR_HAS_BP3		BIT(17)	/*
+					 * Flash SR has 4 bit fields (BP0-3)
+					 * for block protection.
+					 */
+#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
+					 * BP3 is bit 6 of status register.
+					 * Must be used with SPI_NOR_HAS_BP3.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1766,24 +1774,48 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
-	int pow;
+	u8 tb_mask = SR_TB_BIT5, bp;
+	int pow = 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
 
-	if (!(sr & mask)) {
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		u8 tmp;
+
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+			tmp = sr & (mask | SR_BP3_BIT6);
+		else
+			tmp = sr & (mask | SR_BP3_BIT5);
+
+		if (tmp & SR_BP3_BIT6)
+			tmp = (tmp & ~BIT(6)) | BIT(5);
+
+		bp = tmp >> SR_BP_SHIFT;
+	} else {
+		bp = (sr & mask) >> SR_BP_SHIFT;
+	}
+
+	if (!bp) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
+		return;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		if (bp <= ilog2(nor->n_sectors))
+			pow = ilog2(nor->n_sectors) + 1 - bp;
 	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
-			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
+		pow = bp ^ (mask >> SR_BP_SHIFT);
 	}
+
+	*len = mtd->size >> pow;
+
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -1898,6 +1930,12 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
 
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+			mask = mask | SR_BP3_BIT6;
+		else
+			mask = mask | SR_BP3_BIT5;
+	}
 	/*
 	 * Need smallest pow such that:
 	 *
@@ -1908,7 +1946,17 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << SR_BP_SHIFT);
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) + 1 - pow;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask & SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | BIT(6);
+	} else {
+		val = mask - (pow << SR_BP_SHIFT);
+	}
+
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1983,6 +2031,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+			mask = mask | SR_BP3_BIT6;
+		else
+			mask = mask | SR_BP3_BIT5;
+	}
 	/*
 	 * Need largest pow such that:
 	 *
@@ -1995,6 +2050,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
+	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask & SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | BIT(6);
+		if (val & ~mask)
+			return -EINVAL;
 	} else {
 		val = mask - (pow << SR_BP_SHIFT);
 		/* Some power-of-two sizes are not supported */
@@ -4736,6 +4799,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
+	params->n_sectors = info->n_sectors;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
@@ -5192,6 +5256,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
+	if (info->flags & SPI_NOR_HAS_BP3) {
+		nor->flags |= SNOR_F_HAS_SR_BP3;
+		if (info->flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
 
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
@@ -5199,6 +5268,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->dev.parent = dev;
 	nor->page_size = params->page_size;
 	mtd->writebufsize = nor->page_size;
+	nor->n_sectors = params->n_sectors;
 
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 541c06d042e8..92d550501daf 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -129,7 +129,9 @@
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 */
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
@@ -248,6 +250,8 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_16BIT_SR	= BIT(9),
 	SNOR_F_NO_READ_CR	= BIT(10),
 	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
+	SNOR_F_HAS_SR_BP3	= BIT(12),
+	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
 
 };
 
@@ -519,6 +523,7 @@ struct spi_nor_locking_ops {
  *
  * @size:		the flash memory density in bytes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @n_sectors:		number of sectors
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -541,6 +546,7 @@ struct spi_nor_locking_ops {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u16				n_sectors;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -573,6 +579,7 @@ struct flash_info;
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
+ * @n_sector:		number of sectors
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -599,6 +606,7 @@ struct spi_nor {
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
