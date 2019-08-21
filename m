Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA3FC3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB5722CE3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIuBRJxl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JCn+YmxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB5722CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+SmTOVGFd7ABILvfAXf8G4im84h3p+Y7/cVDmv1udc=; b=ZIuBRJxliL6sVN
	CvNzXZQ84tqAQG55L3WD+IsB7FlvlMu3/T8/xM9LSkgW4TQbfBMdeMGezh505B4KqhLOuWpeNonqs
	S8enhqWKKvTSEgBNmRy7QKW1H4dXIhcGc8q2IU541HwM9VXRrXu9BQliWzYlr9eGNMNCzsANWsW6S
	hlb+BjgcxR3fJ4TdP9kFvSZLvxTieB/8Q+EHgaXPg5J9fbV5vwiYzsMXAxcHxSmCXXCNQAigg90tE
	Kot0fAGGp1Pxy1zTFRYq6M9l6yXD7a5bX/didOcJ/dO4EVuVwf+1hNkXbZHhCo/KwJqnNViFeWj+a
	BdJaeOJCmv876BgQY2vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Izw-0004RK-Bq; Wed, 21 Aug 2019 05:17:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0IzD-0003ji-0F
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 05:16:46 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190821051640epoutp040acf48220ca893b55fa65ae08be575af~82E4RCitz2575925759epoutp04B
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2019 05:16:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190821051640epoutp040acf48220ca893b55fa65ae08be575af~82E4RCitz2575925759epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566364600;
 bh=Q9/onpKFVPADeboqDrfFCmMxji2eQ/MznW49/+Wc5Hw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JCn+YmxYIyB79qHU4uBJ8LM0Sop8qGqxkRSGPMOZmgXpMOVssZz3vy8Vdyes6T2ZO
 P/eVaqttjki+ZeOLII8Z3YY8vMO5aLAi6dvTl/5vAt0wfVH2LAL6Mlr4/4xEQ5mwwr
 N9f9WYnYnvQub4nFv2a0dASVpCBaiHb1nSjXVNKQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190821051639epcas1p1b1c6714170f48ffdb43cd01451049a5f~82E37iB8Y1839118391epcas1p12;
 Wed, 21 Aug 2019 05:16:39 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.161]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 46Cwr66bwgzMqYkh; Wed, 21 Aug
 2019 05:16:38 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.C4.04160.5B3DC5D5; Wed, 21 Aug 2019 14:16:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epcas1p3e70e5142c92c2eebb9a9188779217b78~82E16KcRq2849228492epcas1p3n;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190821051637epsmtrp2c3f3504a3d148d22677f87be4d5ab987~82E15VsUc0532805328epsmtrp2q;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
X-AuditID: b6c32a38-fa2059c000001040-13-5d5cd3b54950
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9F.6B.03706.5B3DC5D5; Wed, 21 Aug 2019 14:16:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epsmtip25483c4573349368b427b1250fe1c0f10~82E1pypEu0362803628epsmtip2A;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v5 3/5] mtd: spi-nor: introduce SR_BP_SHIFT define
Date: Wed, 21 Aug 2019 14:15:39 +0900
Message-Id: <20190821051541.6083-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821051541.6083-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH++3ucbUml2l6EEK7ZdZkuTmnt8iQKXUjCaH6pxp60YuT9nJ3
 ExOi8tHDfI0RpaYtXA8nI1ETTY0yK/qjsPqjzB5ilFFzpGIPzGrzKvXf53fO95zv4fwOjsl+
 iqLxQpONtZoYAykOFfbc25So6Hl+SKf01iGqveI8ooZHvBjlaHNi1MJFv4CaGJ0XUf1lVyXU
 /YG3GOXs8yFq2p1OjTmcKD2U7mt8I6G7rsvpTs8ZMd3lPka//nEF0aMtRXTdgpKu7fagbPyA
 YZueZfJZayxryjPnF5oK0sjde3MycjQpSpVCtYVKJWNNjJFNIzOzshU7Cg2BAcnYYsZgD4Sy
 GY4jE7dvs5rtNjZWb+ZsaSRryTdYVErLZo4xcnZTweY8s3GrSqlM0gSUuQa9s7VSZOmHkrHp
 NnQctYdXoRAciGTomHCLgywjehFUV0bxPIPgQUNRFQoN8DcEZTXl4uWCO81NQj4xiGDmqQvx
 j1kE447foqBKTMjh5XynKJiIID4JYOp202IinNDCzPA7QZCFRBx4Br8vtpUSFDxorhDxFjHQ
 3nEHC3IIsQXqfbOCYCMgBsRQOdUl4EWZ0NhQtsTh8Plht4TnaJj1Dy7NykFfm0PCF1cgmLjm
 XhKpwT/lDTjgOEZsghu3EvnwWuibb0ZBxogw8M9Vi4ISIKRw+qSMl5DgG68Q8gww8r5maWYa
 nvXPSPhNVCN49fuusB6tafzn4ELIgyJZC2csYDmVJfn/b+pEi2cnp3rRwJOsIUTgiFwlzX1x
 UCcTMcXcEeMQAhwjI6QlFw/oZNJ85kgpazXnWO0GlhtCmsAqHVj06jxz4IhNthyVJkmtVlPJ
 KakpGjUZJb38g9LJiALGxh5mWQtrXa4T4CHRx5Hh18rI/eb4SX/b/IX6o14iYqNCue/mVUdI
 h29PgqIFn/JJyiO7pru1f4atK1Ifj51z1fpGafdoa0p8TMwur/1r5omPetPk3FnVow26uL3r
 Sj0tK9eXz9GY9os6/szpb9qwqoSjc1s19tTcOu0p307nhz21jy71uLiMhTBF6RU3KeT0jEqO
 WTnmL0VuL0WMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWy7bCSvO7WyzGxBmcvKVqsbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHFJdNSmpOZllqkb5dAlfG5MWtrAW7JSpu
 f1zJ2MC4WriLkZNDQsBE4sDc2SxdjFwcQgK7GSVO37/ABJGQkHi08wtQggPIFpY4fLgYouYj
 o8Tsae/YQWrYBLQkbvzexAqSEBH4wCRxedIpFpCEsICTxKcj98EGsQioSqza+50NxOYVsJA4
 NreFFWKBvMTqDQeYQWxOAUuJCW8+g9ULAdUsW9zIMoGRdwEjwypGydSC4tz03GLDAsO81HK9
 4sTc4tK8dL3k/NxNjOCQ1NLcwXh5SfwhRgEORiUe3h03o2OFWBPLiitzDzFKcDArifBWzImK
 FeJNSaysSi3Kjy8qzUktPsQozcGiJM77NO9YpJBAemJJanZqakFqEUyWiYNTqoGxnD/yRH1B
 ULPRgoRNcStSzIo5/Dpy/+r5Lj+m/evSl23Hfn9Pd2tbm2L8+aXRiuuN3TOqp4a/39JQ8Ns2
 dhqH9B5jkf2FDDPaTUpLj+7yWHBJ8cmJx37R/HGqJR/W+yqqWN7UT/1mXMPcH/c/M/9U9dHZ
 d/q5AvpYjlZ8a7Nh6tysq+l9NE+JpTgj0VCLuag4EQArrFNcRQIAAA==
X-CMS-MailID: 20190821051637epcas1p3e70e5142c92c2eebb9a9188779217b78
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821051637epcas1p3e70e5142c92c2eebb9a9188779217b78
References: <20190821051541.6083-1-js07.lee@samsung.com>
 <CGME20190821051637epcas1p3e70e5142c92c2eebb9a9188779217b78@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_221643_723201_3BDAE038 
X-CRM114-Status: GOOD (  18.30  )
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

The shift variable of SR_BP is conclusive because the first bit of SR_BP
is fixed on known flashes.

Introduce SR_BP_SHIFT define, and let them used by stm_* functions
to replace ffs operation to get shift value.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
v5:
 - remake patch based on latest spi-nor/next tree
 - Fix commit log

 drivers/mtd/spi-nor/spi-nor.c | 11 +++++------
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bed03e61bd0..84522c825ab5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1412,7 +1412,6 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 mask_tb = SR_TB_BIT5;
-	int shift = ffs(mask) - 1;
 	int pow;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
@@ -1424,7 +1423,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 		*ofs = 0;
 		*len = 0;
 	} else {
-		pow = ((sr & mask) ^ mask) >> shift;
+		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
 		*len = mtd->size >> pow;
 		if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
 			*ofs = 0;
@@ -1506,7 +1505,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 mask_tb = SR_TB_BIT5;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1554,7 +1553,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << shift);
+	val = mask - (pow << SR_BP_SHIFT);
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1591,7 +1590,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 mask_tb = SR_TB_BIT5;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1641,7 +1640,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-		val = mask - (pow << shift);
+		val = mask - (pow << SR_BP_SHIFT);
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 654992a829bd..abbe5f915410 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -136,6 +136,8 @@
 
 #define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
 
+#define SR_BP_SHIFT		2
+
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
