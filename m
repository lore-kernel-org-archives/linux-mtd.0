Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966E2C3F2CD
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 11:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC5120705
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 11:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sSvCWkJ0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Qvx1rJGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC5120705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=TQc2cunFBsTNMz+Rv4XFr+SQ7VBa5BpoBqbMAx6z4zU=; b=sSvCWkJ0vd5z1P
	YXxoy8LvSLWCjTkzcIlsXx32wP6eEEsyEp1U78D+RNj4ECYfDgbx2fzBT3HI8MtiZPDunTov2PICK
	+OpGqket4rFhNGTIYO1E3RJsaG4NnUsCb2ejA3PgsEwgQzYSRQwWc3CMbJnpgQzzP894yjB/U9jYF
	z9kfKF3cLsLZ6JjhFIksgX9J57CDMAbo2Mjm0q5XjjlXwUAEoI6So4zEl4ZSZw+aZ8xcTo6CGxIry
	FHCwT7mEOz9U5u2wR1gHt7Kfe/iefunqtF+fPoFODSkeF3H7dt7dkvbW7Ov9RnxmoYo/0ddUjGSKv
	vp7zf7xvHheb3SKjIkDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9RtJ-0001a7-Pf; Wed, 04 Mar 2020 11:08:41 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RtG-0001Z0-B8
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2020 11:08:40 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200304110833epoutp04e2d27f527d4c9626feb188c2c4f5e016~5FUEfVK232040120401epoutp04w
 for <linux-mtd@lists.infradead.org>; Wed,  4 Mar 2020 11:08:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200304110833epoutp04e2d27f527d4c9626feb188c2c4f5e016~5FUEfVK232040120401epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583320113;
 bh=Xiw4yVoKhTnm1zSVspxbc62kK1cOKmwF1yclDFqV09Q=;
 h=From:To:Subject:Date:References:From;
 b=Qvx1rJGczKKck5LWzDFR9Jf9gwwhKFR+e/3eJWHppw7GsCGGyG0Cq8s0ykR7iVO4o
 kl0PncfIM356BigjrzDVg8XLRryEg498ivVMkytcfYtTCgFmqstHL4wUTEexTsDIJX
 NdGsLM172+HLpTvCTO3w+JUNVcCbzeOlxMUxqfxk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200304110832epcas1p1b08eee320c51590e50ba5d36c48a1f5c~5FUDv83TC2446524465epcas1p16;
 Wed,  4 Mar 2020 11:08:32 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.165]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48XWMg5NNFzMqYkV; Wed,  4 Mar
 2020 11:08:31 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CF.1D.48498.F2C8F5E5; Wed,  4 Mar 2020 20:08:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200304110830epcas1p168bd480847959dc497ac5cc272fa2f80~5FUBvB-tf1132111321epcas1p19;
 Wed,  4 Mar 2020 11:08:30 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200304110830epsmtrp1f321660046ca3b020259e4cf4f5e55a0~5FUBuaRt71892518925epsmtrp1d;
 Wed,  4 Mar 2020 11:08:30 +0000 (GMT)
X-AuditID: b6c32a36-a3dff7000001bd72-ba-5e5f8c2f63f3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DE.E7.06569.E2C8F5E5; Wed,  4 Mar 2020 20:08:30 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200304110830epsmtip11fe01a23d085059580dc4bac16cafd87~5FUBlb7tc3112431124epsmtip1d;
 Wed,  4 Mar 2020 11:08:30 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com, chenxiang <chenxiang66@hisilicon.com>, Michael Walle
 <michael@walle.cc>
Subject: [PATCH 1/3] mtd: spi-nor: reimplement block protection handling
Date: Wed,  4 Mar 2020 20:07:58 +0900
Message-Id: <20200304110800.20658-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm23E7p2h1mF1eR5Se8IemuYubJ9GQkjrRxUE/SrOtgx6mtZ2N
 nU0qikRHWlkmBYEphHmhlWRqXqaupYg/uke27het6KaU0gVG1OaZ1L+H5/I97/d+H4EpnkqV
 RDHv5Bw8a6Fkc6O6hhJSklOqTEZVxbsEOvDoIaJ/101K6LEnQSndV9aM0xM323D6W2MW/ef2
 VzwLZ3prX+DMeP1VnOloPMw8/9WEmJOdHsSMPO6WMP4Bt8yA51kyiji2kHPEcnyBrbCYN2dS
 m7aZ1pl0epU6Wb2aTqNiedbKZVLZmw3J64stoXmo2BLW4gpRBlYQqJQ1GQ6by8nFFtkEZybF
 2QstdrXKvkpgrYKLN68qsFnT1SqVRhdy7rYUXS+7L7F3r9z3ZnoUlaJA3DE0hwAyFU4/vSU5
 huYSCrIHwauzD1BYUJBTCJqeIVH4gaDZ/wHNJny+95goDCCo6aiOxKcRDN8ISMIuGZkIj4Pt
 0jBeSE4iuN+XFcbRJAOjdydCJxFEFBkPw5V7w7ScXA3jfWOYWLAcLrX5ZwqArJJB4M4RXBSy
 YXTom1TE0fBppDPCK+Fj9axHgN6LNbgYdiMYa2mMCFqYnGjFwsUYmQBXvCkiHQe9wfqZm2Hk
 fJj8XiUNW4CUQ+URhWih4Mtrd5SIAe6Nn4iMwMBl993ItnbB4Ilh7BRaWvuv4DxCHrSYswtW
 Myeo7Zr/H6YdzfyrRH0ParizeRCRBKLmyWGj0aiQsiXCfusgAgKjFsqjdSajQl7I7j/AOWwm
 h8vCCYNIF1peDaZcVGAL/VLeaVLrNFqtlk7Vp+l1WmqJ/E1uglFBmlknt5fj7JxjNich5ihL
 0Zb8pH5Z2hchh/rZ/VZWsfVU8OGS/E7lhhh0oWmBL3DwaHnq2rdn9hS7WrTvO/Hvhqob220v
 vDka35NGz4raz70xhvKpkRzzMh6ln2slPEKctM6V59W41gwc/5wz7D0Uk2/u4lFSRv/Xhsxr
 /TGj8V7hpZ/LLelYNhTw3N6xk4oSilh1IuYQ2L+wynz3bQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42LZdlhJTlevJz7O4OADKYvr164wWvyd847J
 4tHN36wWu5uWsVu8Pb2B3eLjEgeL/2c/sDuwe+ycdZfd4/Hcjewem5fUe9z5sZTRo2/LKkaP
 4ze2M3kc2NvCFsAexWWTkpqTWZZapG+XwJWxv+kiU8F27YqHn68yNjBeV+xi5OSQEDCR2Lfv
 GXMXIxeHkMBuRonji/rYIBISEo92fmHpYuQAsoUlDh8uhqj5yChxY8EBZpAaNgEtiRu/N7GC
 JEQEvjBKXN58kBUkISzgIXH1/FtGkGYWAVWJox3ZIGFeAUuJx7sfMUPMl5dYveEA8wRG7gWM
 DKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYLDR0trB+OJE/GHGAU4GJV4eCU84+KE
 WBPLiitzDzFKcDArifAKm8bHCfGmJFZWpRblxxeV5qQWH2KU5mBREueVzz8WKSSQnliSmp2a
 WpBaBJNl4uCUamCc90uvSD5Auvvg24h47cJfDxfdXRQUs5/twCvB26vawyYtOHTFk1eOPcnL
 SNMy/vP/KO9Hjp7b26ZyWD/b/ykpwPKmSOejQPY/eXsr7HbeV9keazq5f2N4jV1ozdovho5X
 rcQ+HD3EcvfNX7vvGafDzmR0SR4LPcSfdvd/eNhK1/Xl2fKCF1yUWIozEg21mIuKEwGYuS8p
 GwIAAA==
X-CMS-MailID: 20200304110830epcas1p168bd480847959dc497ac5cc272fa2f80
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200304110830epcas1p168bd480847959dc497ac5cc272fa2f80
References: <CGME20200304110830epcas1p168bd480847959dc497ac5cc272fa2f80@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_030838_896647_71F3C329 
X-CRM114-Status: GOOD (  18.71  )
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

This patch changes block protection handling logic based on min_prot_length.
It is suitable for the overall flashes with exception of some corner case
and easy to extend and apply for the case of 2bit or 4bit block protection.

[1] http://lists.infradead.org/pipermail/linux-mtd/2020-February/093934.html

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 110 ++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index caf0c109cca0..c58c27552a74 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1784,29 +1784,64 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
+static int stm_get_min_prot_length(struct spi_nor *nor)
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
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 tb_mask = SR_TB_BIT5;
-	int pow;
+	int min_prot_len;
+	u8 mask = spi_nor_get_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_tb_mask(nor);
+	u8 bp = (sr & mask) >> SR_BP_SHIFT;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
-
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
+	min_prot_len = stm_get_min_prot_length(nor);
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
@@ -1880,8 +1915,9 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1918,20 +1954,14 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
-		tb_mask = SR_TB_BIT6;
+	if (lock_len == mtd->size) {
+		val = mask; /* fully locked */
+	} else {
+		min_prot_len = stm_get_min_prot_length(nor);
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
@@ -1966,8 +1996,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -2004,22 +2035,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
+		min_prot_len = stm_get_min_prot_length(nor);
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
