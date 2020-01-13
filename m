Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365F0C33CAE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:39:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77612082E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RZ6iUTHj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Qr7bNEJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77612082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=I4dYYbiPqAazFdEAnhzdAiUfs2I1TzxkHOcNOTLdGyQ=; b=RZ6iUTHjJdFqKZ
	wO2rOb+viBce1vr03Q42E4mj6mzRChQdgFjE90dPkPEzMlh4S5CWcxZC4Niud570MlM2zdDd8YwSG
	P4fPaDjUnkhyj166FRVKDBvOVrRPVy68WEtdd9uyZ66zwvJlHxQ5vu6fzyb40wQcP8WYproSqvbxa
	8FrCOIKmeQubSWlevXejy9U44t5MDS88smsOIrFFgp3vZADSEAd2CtpWSqwPe8AxFzqfoAhccT8wH
	aNYmhhXc07pXo/DvrrEnA/zCkR7jaLYe0x47OQOnvF6puU0f7ZAtEQtV1LCxt6IJMgVjl5C3grquU
	W1+RF0hsR7ERnZTV3z2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqsRr-0004N0-1c; Mon, 13 Jan 2020 05:39:35 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqsQN-0002yn-F7
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 05:38:06 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200113053758epoutp0258d711435c393145692651c2dfe5be01~pW54QhMnZ2191921919epoutp02K
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 05:37:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200113053758epoutp0258d711435c393145692651c2dfe5be01~pW54QhMnZ2191921919epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578893878;
 bh=ZT9gk3Qr65aOLdt/Ucet4AAG0kIErlyp2QZ2AQ3M2Sk=;
 h=From:To:Subject:Date:References:From;
 b=Qr7bNEJSQmzihwU+uVakJdYT4sTS9tIf8dKrOFi8+BxDrczvtSciv/NWLPLAKe9t7
 DTD2QnzywzmntUgRzoRXuBF7QnJcn0EeSCWLIejxZgzKj2wX8YlSZr1fM45Int8VVj
 MSyDtWtH0u1vzXfY6J4qCmO1dgB4gQ25gjAu7JkY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200113053758epcas1p43bb2ffef40316957b4a76d93f5526766~pW53-T_ab1289412894epcas1p4_;
 Mon, 13 Jan 2020 05:37:58 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.162]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 47x2Rn4MjpzMqYkf; Mon, 13 Jan
 2020 05:37:57 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 AE.DC.51241.5320C1E5; Mon, 13 Jan 2020 14:37:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200113053757epcas1p180df652be844a99d8320a900496b7dce~pW52wAvAi2077120771epcas1p10;
 Mon, 13 Jan 2020 05:37:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200113053757epsmtrp298ed89ae0fa8d7f80648e8c35e9f9f6f~pW52vezjc0588805888epsmtrp22;
 Mon, 13 Jan 2020 05:37:57 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-aa-5e1c023580ec
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FF.62.10238.5320C1E5; Mon, 13 Jan 2020 14:37:57 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200113053757epsmtip10f4749aa2674daa158317ee533ae7eb4~pW52k9NVt2824828248epsmtip1h;
 Mon, 13 Jan 2020 05:37:57 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com
Subject: [PATCH v2 1/3] mtd: spi-nor: introduce SR_BP_SHIFT define
Date: Mon, 13 Jan 2020 14:37:51 +0900
Message-Id: <20200113053753.8184-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7bCmnq4pk0ycwe0ueYu/c94xWTy6+ZvV
 YnfTMnaLj0scLP6f/cDuwOqxc9Zddo/NS+o97vxYyujRt2UVo8fxG9uZAlijcmwyUhNTUosU
 UvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgHYrKZQl5pQChQISi4uV
 9O1sivJLS1IVMvKLS2yVUgtScgoMDQr0ihNzi0vz0vWS83OtDA0MjEyBKhNyMqYf3cVecFe8
 ouX5CpYGxqdCXYycHBICJhJbu54yg9hCAjsYJTa/D+xi5AKyPzFK7Fv/kgXC+cYocezNExaY
 jmM/uqESexklNr5fxgbhfGaUWPazkxWkik1AS+LG702sIAkRgcWMEj1vLzOCJIQFnCRObjrK
 DmKzCKhKnHx3EWwsr4CFRPe5VewQK+QlVm84wAzSLCHwklVi0cpNjBAJF4k5605DFQlLvDq+
 BcqWkvj8bi8bhF0ssXPlRHaI5hZGiUfLl0AVGUu8e7sWaCoHB7OApsT6XfoQYUWJnb/ngs1n
 FuCTePe1hxWkREKAV6KjDRpIShJvHrRAvS8hceFxLyuE7SHRvXo6CyTwYiUm3VjLNoFRZhbC
 ggWMjKsYxVILinPTU4sNC0yRo2YTIzgVaVnuYDx2zucQowAHoxIP74Eq6Tgh1sSy4srcQ4wS
 HMxKIrybzknFCfGmJFZWpRblxxeV5qQWH2I0BYbeRGYp0eR8YJrMK4k3NDUyNja2MDEzNzM1
 VhLn5fhxMVZIID2xJDU7NbUgtQimj4mDU6qBUUNNp3YPP8urb8xKXW5TNjbfqjkZ5f4qTSqs
 uGw1Z7h2ukOwZcQC25+r6g++aRJnTZjM7NN0Sd1j72H+6cxfVybsMbd/ucrmYnXwFQm2KasX
 le6MUy252+rqZHzU0ve79baqP3nRa14ozfwnfNq9jvXUurYzP5nuJv4I9XrH/Taj5MvXFolE
 JZbijERDLeai4kQAYTEOMFsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCJMWRmVeSWpSXmKPExsWy7bCSnK4pk0ycwb2zbBZ/57xjsnh08zer
 xe6mZewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNGjb8sqRo/jN7YzBbBGcdmkpOZklqUW
 6dslcGVMP7qLveCueEXL8xUsDYxPhboYOTkkBEwkjv3oZgGxhQR2M0qsPGkNEZeQeLTzC1Cc
 A8gWljh8uLiLkQuo5COjxJJTq1lBatgEtCRu/N7ECpIQEVjOKHH+5112kISwgJPEyU1HwWwW
 AVWJk+8ugi3gFbCQ6D63ih1igbzE6g0HmCcwci9gZFjFKJlaUJybnltsWGCYl1quV5yYW1ya
 l66XnJ+7iREcFlqaOxgvL4k/xCjAwajEwytRKx0nxJpYVlyZe4hRgoNZSYR30zmpOCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8T/OORQoJpCeWpGanphakFsFkmTg4pRoYfa2LtOfLPbqqsG6R
 U/9rv8x79jPmmBWs/HXgU8H78pnabw7Exxt4TZzwmbOlc7ZzgJLU3M5z55lCNx+/GX8vy1c+
 y+6iupesx9ovUr7bV0t82cNfu87qz/a2zbLhq58t2akos6p26lez350xLMejlh79uqahluHn
 lt/Z1w579/2RbVtXmF3orcRSnJFoqMVcVJwIAN74RBoHAgAA
X-CMS-MailID: 20200113053757epcas1p180df652be844a99d8320a900496b7dce
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113053757epcas1p180df652be844a99d8320a900496b7dce
References: <CGME20200113053757epcas1p180df652be844a99d8320a900496b7dce@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_213803_991733_3230826A 
X-CRM114-Status: GOOD (  17.20  )
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
is fixed on all known flashes.

Introduce SR_BP_SHIFT define and let them used by stm_* functions
to replace ffs operation to get shift value.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 11 +++++------
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index addb6319fcbb..e3da6a8654a8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1767,7 +1767,6 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
-	int shift = ffs(mask) - 1;
 	int pow;
 
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
@@ -1778,7 +1777,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 		*ofs = 0;
 		*len = 0;
 	} else {
-		pow = ((sr & mask) ^ mask) >> shift;
+		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
 		*len = mtd->size >> pow;
 		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
 			*ofs = 0;
@@ -1860,7 +1859,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1909,7 +1908,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << shift);
+	val = mask - (pow << SR_BP_SHIFT);
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1946,7 +1945,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 tb_mask = SR_TB_BIT5;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1997,7 +1996,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-		val = mask - (pow << shift);
+		val = mask - (pow << SR_BP_SHIFT);
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7e32adce72f7..541c06d042e8 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -137,6 +137,8 @@
 
 #define SR1_QUAD_EN_BIT6	BIT(6)
 
+#define SR_BP_SHIFT		2
+
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
