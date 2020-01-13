Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB95C33CAB
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:59:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E550214D8
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dl0KKO5Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="psIBuTJx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E550214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQTPD0CTBPQBheJC1Xou4w57r4Ol3AZhZDJtt8uoQmg=; b=dl0KKO5Yayp0mw
	aMQBNpFeQZDU9+ZcVswydNKKAe8jU+NpSFOLPN6X3NMn4kxGCz1JYdNbnWbp279roieWVvxl3m+6w
	GiZLP+FPWCKzTKkKe/oH9MBEbFr060T3EqjVviKu1lab9noYzETAbAZencIcoHZV1AHjoBm2F91pE
	dVItvBoNZGS9MDwv257p06yVW4Ce/wgnZDZd1xzP54GmEzM0Wbxs+x2ZaaW15ljQGggbS3NpsSS7B
	D9AOt4n+WmoeUNJAIO1+xolmUrCPnv0sY9mWFYesigLVv9cONTHB/T0UqHVwFV+L3Me2eHnMaOi1G
	8g4+wk8vAQ3A+LZ/DpqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqsl4-0004EX-1D; Mon, 13 Jan 2020 05:59:26 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqskt-00044a-4L
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 05:59:17 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200113055912epoutp020c42c0b6f83df960f9bdfbba009d09e9~pXMaMT_Pd0701407014epoutp02l
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 05:59:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200113055912epoutp020c42c0b6f83df960f9bdfbba009d09e9~pXMaMT_Pd0701407014epoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578895152;
 bh=AGh/AJ00qVBFql/rBXL/Asg2ZgsX/9/Ry0gGOyma1u4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=psIBuTJxpi/iy9om5CHpyH0hiH4VPHFczJWmuUVWZSRIhlAwmnteamidZdYJiRHue
 XyZFPeXZM+dHcc+0wSGfZSrgHC5KAzEq6T7no8JtEJ7WlP8UnWUXJ1f/Ak2e8xw5av
 xZWzCLsXD9IwCRn9pgZjBDOFZAVQ/wbyu/GmZc9A=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200113055911epcas1p4f9ddf8dbd37d749e1758ca83a08dacee~pXMZ4ihZf2756427564epcas1p4q;
 Mon, 13 Jan 2020 05:59:11 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.162]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 47x2wG6Cj1zMqYkq; Mon, 13 Jan
 2020 05:59:10 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 BA.F6.48019.E270C1E5; Mon, 13 Jan 2020 14:59:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e~pXMYm9Jo82338223382epcas1p3P;
 Mon, 13 Jan 2020 05:59:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200113055910epsmtrp1f985b17e9b6bc0a2d8ad568d959416a4~pXMYmOy3n0741507415epsmtrp1C;
 Mon, 13 Jan 2020 05:59:10 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-6d-5e1c072e0d22
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 61.85.06569.E270C1E5; Mon, 13 Jan 2020 14:59:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200113055910epsmtip1fcc2f4ff573715c192b0f6fa90f0ae48~pXMYZu9Lg1136611366epsmtip13;
 Mon, 13 Jan 2020 05:59:10 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com
Subject: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Date: Mon, 13 Jan 2020 14:59:06 +0900
Message-Id: <20200113055907.9029-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113055907.9029-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRmVeSWpSXmKPExsWy7bCmvq4eu0ycwbfLBhZ/57xjsnh08zer
 xe6mZewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNGjb8sqRo/jN7YzBbBG5dhkpCampBYp
 pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
 6dvZFOWXlqQqZOQXl9gqpRak5BQYGhToFSfmFpfmpesl5+daGRoYGJkCVSbkZFzc7lHwI7ii
 4UozcwPjVZsuRk4OCQETiaZta9lBbCGBHYwSd9c6dzFyAdmfGCWetH5nhnC+MUo82t/FCNMx
 49MEqMReRomH3VvYIJzPjBJz7ywAq2IT0JK48XsTK0hCRGAxo0TP28tACQ4OYQF3iTttFiA1
 LAKqEt8OXmQFsXkFLCS+/b/CBrFBXmL1hgPMIOWcApYSb+apgYyREGhkk9i/dglUjYtE87RT
 zBC2sMSr41vYIWwpiZf9bVB2scTOlRPZIZpbgF5YvgQqYSzx7u1asAXMApoS63fpQ4QVJXb+
 ngt2P7MAn8S7rz2sICUSArwSHW1CECVKEm8etLBA2BISFx73skLYHhI/nuxghYRDD6PEl7ff
 2SYwys5C2LCAkXEVo1hqQXFuemqxYYEJciRtYgSnJy2LHYx7zvkcYhTgYFTi4ZWolY4TYk0s
 K67MPcQowcGsJMK76ZxUnBBvSmJlVWpRfnxRaU5q8SFGU2BITmSWEk3OB6bOvJJ4Q1MjY2Nj
 CxMzczNTYyVxXo4fF2OFBNITS1KzU1MLUotg+pg4OKUaGLlfhWQ4+s2/LNNaFC7eoxfuWXWi
 O4W3TyJmg8OOJcs6bJQuPjIxlvK2LqrJ9GiSnPhoIUODqhez5tKr713PslYkzMqWvVL+n2F2
 cViR9KqJt9YxnL+uIbQz6IfVbGeuqP7iT0+Mvv0/ahIVXaQ3ZZ7mzf2n3mcKpr03X7ZlTmPW
 gaVb/8j/UmIpzkg01GIuKk4EAF2lIZhlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupiluLIzCtJLcpLzFFi42LZdlhJTlePXSbOoHevmMXfOe+YLB7d/M1q
 sbtpGbvFxyUOFv/PfmB3YPXYOesuu8fmJfUed34sZfTo27KK0eP4je1MAaxRXDYpqTmZZalF
 +nYJXBkXt3sU/AiuaLjSzNzAeNWmi5GTQ0LARGLGpwnMXYxcHEICuxklGr+8YINISEg82vmF
 pYuRA8gWljh8uBii5iOjxIuPx5lAatgEtCRu/N7ECpIQEVjOKHH+5112kAZhAXeJO20WIDUs
 AqoS3w5eZAWxeQUsJL79vwI1X15i9YYDzCDlnAKWEm/mqYGEhYBKFmw+wTyBkXcBI8MqRsnU
 guLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgENLS2sF44kT8IUYBDkYlHt4DVdJxQqyJZcWV
 uYcYJTiYlUR4N52TihPiTUmsrEotyo8vKs1JLT7EKM3BoiTOK59/LFJIID2xJDU7NbUgtQgm
 y8TBKdXAKCb4yIHF9iUzQ/OrJUvjvjyenZ21K5XzjvB83/2bT1beas60Urom6/za6Eqxl0L0
 Ac8LTV/XuOn3Gh9lamLOfzvVLXOu7LQDhvM1PrJ9iL43bSmra/jO9OesF7bMPJ2kvXEB32/B
 yZunqpgUlOduMjj1NbUy9+FnvaglnZ736s9lczlq3nOLUmIpzkg01GIuKk4EAKyzqWkdAgAA
X-CMS-MailID: 20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_215915_588107_382736B4 
X-CRM114-Status: GOOD (  25.58  )
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
v3 :
  Fix wrong ofs calculation on v2 patch
v2 :
  Add sample table portion about 4bit block protection on the comment
  Trivial coding style change

 drivers/mtd/spi-nor/spi-nor.c | 127 +++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |   8 +++
 2 files changed, 119 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e3da6a8654a8..7e8af6c4fdfa 100644
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
@@ -1767,23 +1775,47 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
-	int pow;
+	u8 bp;
+	int pow = 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		tb_mask = SR_TB_BIT6;
 
-	if (!(sr & mask)) {
-		/* No protection */
-		*ofs = 0;
-		*len = 0;
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
+		if (!bp) {
+			*ofs = 0;
+			*len = 0;
+			return;
+		}
+		if (bp <= ilog2(nor->n_sectors))
+			pow = ilog2(nor->n_sectors) + 1 - bp;
 	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+		bp = (sr & mask) >> SR_BP_SHIFT;
+		if (!bp) {
 			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
+			*len = 0;
+			return;
+		}
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
@@ -1823,7 +1855,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
- * Supports the block protection bits BP{0,1,2} in the status register
+ * Supports the block protection bits BP{0,1,2,3} in the status register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
  *   - CMP: complement protect - only support CMP=0 (range is not complemented)
@@ -1831,7 +1863,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  * Support for the following is provided conditionally for some flash:
  *   - TB: top/bottom protect
  *
- * Sample table portion for 8MB flash (Winbond w25q64fw):
+ * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
  *
  *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
  *  --------------------------------------------------------------------------
@@ -1851,6 +1883,32 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  *    0   |   1   |   1   |   0   |   1   |  2 MB         | Lower 1/4
  *    0   |   1   |   1   |   1   |   0   |  4 MB         | Lower 1/2
  *
+ * Sample table portion for 64MB flash (Micron n25q512ax3 / BP0-3):
+ *
+ *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
+ *  --------------------------------------------------------------------------
+ *    0   |   0   |   0   |   0   |   0   |  NONE         | NONE
+ *    0   |   0   |   0   |   0   |   1   |   64 KB       | Upper 1/1024
+ *    0   |   0   |   0   |   1   |   0   |  128 KB       | Upper 1/512
+ *    0   |   0   |   0   |   1   |   1   |  256 KB       | Upper 1/256
+ *   ...
+ *    0   |   1   |   0   |   0   |   1   |  16 MB        | Upper 1/4
+ *    0   |   1   |   0   |   1   |   0   |  32 MB        | Upper 1/2
+ *    0   |   1   |   0   |   1   |   1   |  64 MB        | ALL
+ *    0   |   1   |   1   |   0   |   0   |  64 MB        | ALL
+ *   ...
+ *  ------|-------|-------|-------|-------|---------------|-------------------
+ *    1   |   0   |   0   |   0   |   0   |   NONE        | NONE
+ *    1   |   0   |   0   |   0   |   1   |   64 KB       | Lower 1/1024
+ *    1   |   0   |   0   |   1   |   0   |  128 KB       | Lower 1/512
+ *    1   |   0   |   0   |   1   |   1   |  256 KB       | Lower 1/256
+ *   ...
+ *    1   |   1   |   0   |   0   |   1   |  16 MB        | Lower 1/4
+ *    1   |   1   |   0   |   1   |   0   |  32 MB        | Lower 1/2
+ *    1   |   1   |   0   |   1   |   1   |  64 MB        | ALL
+ *    1   |   1   |   1   |   0   |   0   |  64 MB        | ALL
+ *   ...
+ *
  * Returns negative on errors, 0 on success.
  */
 static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
@@ -1898,6 +1956,12 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1908,7 +1972,17 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1983,6 +2057,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
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
@@ -1995,13 +2076,20 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
+	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) + 1 - pow;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask & SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | BIT(6);
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
 	status_new = (status_old & ~mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
@@ -4736,6 +4824,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
+	params->n_sectors = info->n_sectors;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
@@ -5192,6 +5281,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
@@ -5199,6 +5293,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
