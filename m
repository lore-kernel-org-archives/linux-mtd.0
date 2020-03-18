Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D020AC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 12:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8207B2076D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 12:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JYrGV9Ax";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ehOmXenI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8207B2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFMUNwff0/xGkT4fdAz7F8/DvSdJRTxaLbLEK8G8BNQ=; b=JYrGV9AxaAy7HN
	G0wbqPklj6E+YAV5OmzehcE/aA6+l+hUYrIhsMk/nQjcYiDrfn9U4esUSWHDGgfFTCTIYwtZgBdIb
	pj98qKCENUAoGDgpzeoE3VqLDMXasOvfnCAhaf4SBOjI/SJj2hiKmjy6QRJIhANxX+rLr4olJCAL0
	lTxtY+cN4Z9XGamaodf0K6xhLaxkVBj0X4RZWg39ty6Egl8r1hJcgPSJaTvbUbyQveHn0gieGFtUl
	y3B8BhqdQBeiJG1vTJMM57/90AV1Z1KBF7lDRG00O90UYieJidIW9RSp0fGT4O1XF4JzYW1Sq1b0H
	Gw3Ks9e7PV88athCS1qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEXUY-0006GJ-Vz; Wed, 18 Mar 2020 12:08:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEXUU-0006FZ-MA
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 12:08:09 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200318120804epoutp04e4829387c032d0ab97d3eb62eea0f4f6~9ZKBoHdYC0152901529epoutp04P
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 12:08:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200318120804epoutp04e4829387c032d0ab97d3eb62eea0f4f6~9ZKBoHdYC0152901529epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584533284;
 bh=PPYHV+CBoxTXpxlJ6bdSDa8DBGJUtT/uuaVoHXHTIco=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ehOmXenI1JrVoa1AqFRlyLHDTsgZk03gSH3V8ZJ9PHbMseQjLDKDhzzFdGSf8cKF6
 CuXu39reyAzb7F6ERBrA7zBew1/HX4DvbHAMYja5w88fdkgIi0IApGxMAM25bCiHJc
 Ue30kANznMWZNUt7VSwNVp2S3loZsD9dOk/Qit7s=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200318120803epcas1p329f65b6ceb6c60bc1dbb50f410e0bb3c~9ZKA3ygkO0782907829epcas1p3N;
 Wed, 18 Mar 2020 12:08:03 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48j81t229ZzMqYkb; Wed, 18 Mar
 2020 12:08:02 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.6C.04074.22F027E5; Wed, 18 Mar 2020 21:08:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200318120801epcas1p3845986eadf5f4aea47233f71e4e60508~9ZJ-fMdgQ0782907829epcas1p3I;
 Wed, 18 Mar 2020 12:08:01 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200318120801epsmtrp2c4887fec0c444bb45b412abf9b7c201f~9ZJ-ec3d-2606926069epsmtrp26;
 Wed, 18 Mar 2020 12:08:01 +0000 (GMT)
X-AuditID: b6c32a39-58bff70000000fea-44-5e720f22e6bd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.00.04158.12F027E5; Wed, 18 Mar 2020 21:08:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200318120801epsmtip27b87ed0a20ed70e0e33f6f64e2b00d09~9ZJ-T3wHX0265402654epsmtip2U;
 Wed, 18 Mar 2020 12:08:01 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 chenxiang <chenxiang66@hisilicon.com>, Michael Walle <michael@walle.cc>,
 John Garry <john.garry@huawei.com>, js07.lee@samsung.com
Subject: [PATCH v2 1/3] mtd: spi-nor: reimplement block protection handling
Date: Wed, 18 Mar 2020 21:06:13 +0900
Message-Id: <20200318120615.4639-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <y>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPKsWRmVeSWpSXmKPExsWy7bCmga4Sf1GcwYuf3BbXr11htNi0v4nV
 4u+cd0wWj27+ZrXY3bSM3eLt6Q3sFh+XOFj8P/uB3YHDY+esu+wej+duZPdoOfKW1WPzknqP
 Oz+WMnr0bVnF6HH8xnYmjwN7W9gCOKJybDJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0t
 LcyVFPISc1NtlVx8AnTdMnOALlNSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFBga
 FOgVJ+YWl+al6yXn51oZGhgYmQJVJuRk3Hn8lrXgvnZFU+dXlgbGf4pdjJwcEgImEpv33GUC
 sYUEdjBKzJ2qBWF/YpS4tUiyi5ELyP7GKPH00wNmmIbr1w+wQyT2AiX2XWWG6PjMKLHzvD+I
 zSagJXHj9yZWkCIRgUlMEi0r9rGCJIQFvCVWHLgMto5FQFXiRfcEsGZeAQuJRes2Q22Ql1i9
 4QCYzSkgILH71io2kEESAhvYJHbc7maEKHKRWLKukQ3CFpZ4dXwLO4QtJfH53V6oeLHEzpUT
 2SGaWxglHi1fAlVkLPHu7VqgDRwczAKaEut36UOEFSV2/p4LNp9ZgE/i3dceVpASCQFeiY42
 IYgSJYk3D1pYIGwJiQuPe6FKPCRWf8uGhEOyxLqlF5gnMMrOQpi/gJFxFaNYakFxbnpqsWGB
 KXIcbWIEJzYtyx2Mx875HGIU4GBU4uHl2FAQJ8SaWFZcmXuIUYKDWUmEd3FhfpwQb0piZVVq
 UX58UWlOavEhRlNgQE5klhJNzgcm3bySeENTI2NjYwsTM3MzU2Mlcd6p13PihATSE0tSs1NT
 C1KLYPqYODilGhinPTqT12mgvfKcsEVPfMic8tiAhVz3Dm7qeqVfYMA/5++WN0ei2v7evCu5
 0dkyiO3oOrGt7f2X+W/WRX82f5O3wS+0SX3nJBfl5+dvuN9bNuPo2h71hxObrFUyV+y59MA8
 ZN352VMP+t7c5iViYznvS2BadkLQ9yURucatupsr86o/npziLcGgxFKckWioxVxUnAgAWKM1
 tIIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFLMWRmVeSWpSXmKPExsWy7bCSvK4if1GcwaetahbXr11htNi0v4nV
 4u+cd0wWj27+ZrXY3bSM3eLt6Q3sFh+XOFj8P/uB3YHDY+esu+wej+duZPdoOfKW1WPzknqP
 Oz+WMnr0bVnF6HH8xnYmjwN7W9gCOKK4bFJSczLLUov07RK4Mu48fstacF+7oqnzK0sD4z/F
 LkZODgkBE4nr1w+wdzFycQgJ7GaUePDvIRNEQkLi0c4vLF2MHEC2sMThw8UgYSGBj4wSC85J
 gdhsAloSN35vYgXpFRGYxSSxeH8PM0hCWMBbYsWBy2BzWARUJV50TwCL8wpYSCxat5kZYr68
 xOoNB8BsTgEBid23VrFBLOCXWHdiBcsERt4FjAyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1
 kvNzNzGCQ1BLawfjiRPxhxgFOBiVeHgTNhXECbEmlhVX5h5ilOBgVhLhXVyYHyfEm5JYWZVa
 lB9fVJqTWnyIUZqDRUmcVz7/WKSQQHpiSWp2ampBahFMlomDU6qBcfapbZznQpTmJLje6psm
 7Vmpv+tLnZ5j1qNtnQLmT/TWrLVKrXv54PI148KCHZe2CTxSPqMlFB3M+lLk4pKpBx+e1+7n
 dO2cInS29VvwnZ5dU8u0z1od2qLvYFag0xFw8rpl+y0W9kVXhJ4+KXNXsjsdcf5op8a5jgOR
 00TbbjyVmBcs7DFngxJLcUaioRZzUXEiAH+6ZSA9AgAA
X-CMS-MailID: 20200318120801epcas1p3845986eadf5f4aea47233f71e4e60508
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200318120801epcas1p3845986eadf5f4aea47233f71e4e60508
References: <y>
 <CGME20200318120801epcas1p3845986eadf5f4aea47233f71e4e60508@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_050807_148604_1C53B060 
X-CRM114-Status: GOOD (  19.53  )
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

The current mainline locking was restricted and could only be applied
to flashes that has 3 block protection bit and fixed locking ratio.

A new method of normalization was reached at the end of the discussion [1].

    (1) - if bp slot is insufficient.
    (2) - if bp slot is sufficient.

    if (bp_slots_needed > bp_slots)    // (1)
        min_prot_length = sector_size << (bp_slots_needed - bp_slots);
    else                               // (2)
        min_prot_length = sector_size;

This patch changes logic to handle block protection based on min_prot_length.
It is suitable for the overall flashes with exception of some corner case
and easy to extend and apply for the case of 2bit or 4bit block protection.

[1] http://lists.infradead.org/pipermail/linux-mtd/2020-February/093934.html

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/core.c | 110 ++++++++++++++++++++++---------------
 1 file changed, 66 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 877557dbda7f..e4ed8553aae8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1514,29 +1514,64 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
+static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
+{
+	return SR_BP2 | SR_BP1 | SR_BP0;
+}
+
+static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
+{
+	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
+		return SR_TB_BIT6;
+	else
+		return SR_TB_BIT5;
+}
+
+static int spi_nor_get_min_prot_length(struct spi_nor *nor)
+{
+	int bp_slots, bp_slots_needed;
+	u8 mask = spi_nor_get_bp_mask(nor);
+
+	bp_slots = (mask >> SR_BP_SHIFT) + 1;
+
+	/* Reserved one for "protect none" and one for "protect all". */
+	bp_slots = bp_slots - 2;
+
+	bp_slots_needed = ilog2(nor->info->n_sectors);
+
+	if (bp_slots_needed > bp_slots)
+		return nor->info->sector_size <<
+			(bp_slots_needed - bp_slots);
+	else
+		return nor->info->sector_size;
+}
+
 static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 					uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
-	int pow;
-
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
+	int min_prot_len;
+	u8 mask = spi_nor_get_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_tb_mask(nor);
+	u8 bp = (sr & mask) >> SR_BP_SHIFT;
 
-	if (!(sr & mask)) {
+	if (!bp) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
-	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
-			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
+		return;
 	}
+
+	min_prot_len = spi_nor_get_min_prot_length(nor);
+	*len = min_prot_len << (bp - 1);
+
+	if (*len > mtd->size)
+		*len = mtd->size;
+
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -1610,8 +1645,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int ret, status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
+	int min_prot_len;
+	u8 mask = spi_nor_get_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1648,20 +1684,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
+	if (lock_len == mtd->size) {
+		val = mask; /* fully locked */
+	} else {
+		min_prot_len = spi_nor_get_min_prot_length(nor);
+		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
+		val = pow << SR_BP_SHIFT;
+	}
 
-	/*
-	 * Need smallest pow such that:
-	 *
-	 *   1 / (2^pow) <= (len / size)
-	 *
-	 * so (assuming power-of-2 size) we do:
-	 *
-	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
-	 */
-	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << SR_BP_SHIFT);
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1696,8 +1726,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int ret, status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
+	int min_prot_len;
+	u8 mask = spi_nor_get_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1734,22 +1765,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
-	/*
-	 * Need largest pow such that:
-	 *
-	 *   1 / (2^pow) >= (len / size)
-	 *
-	 * so (assuming power-of-2 size) we do:
-	 *
-	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
-	 */
-	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-		val = mask - (pow << SR_BP_SHIFT);
+		min_prot_len = spi_nor_get_min_prot_length(nor);
+		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
+		val = pow << SR_BP_SHIFT;
+
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
