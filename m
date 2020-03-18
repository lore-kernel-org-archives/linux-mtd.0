Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FE7C10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 12:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 909372076D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 12:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szgoOrzU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Gko7S8R6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 909372076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMZQFcvD/2Nz6qA9sYYw0azZf0ndVaA8IEM6ss0pTGE=; b=szgoOrzU7uh2cI
	LBQzP1mZjG/lFnFU9n/+shr1bJoOciX8WKrK6Jag1kxF50vl7wz14iTH6VDOrltALjYFLEDLhEDMT
	5pvoiwqpRZgfGWq/VHmLwj58m21+uCCdHFQJT1h+43fAZKrYdES9MoJuHpbZPzAQrzwIcO9Db7ph8
	kAhdQDEUS0JFuQ69qOe1j3rg1n7QgU/PmnOzoxcGIAdYjGFeoSkJ4FXWnN/nAmCxK5CEf49N9BPTm
	Xs4G0tw8tcaKWNrsASRdROp4C6kA3BiOfU2DK88lPAMUFJv368kgJKTAQcmXpmoCjc8tJ7AN7oCmA
	qhxpHswxgU9QMO0jrArA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEXUd-0006KR-4L; Wed, 18 Mar 2020 12:08:15 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEXUY-0006GC-Ln
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 12:08:12 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200318120805epoutp038765309eb849414f2cef0102ba2a87f5~9ZKDVgpKY0364603646epoutp03G
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 12:08:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200318120805epoutp038765309eb849414f2cef0102ba2a87f5~9ZKDVgpKY0364603646epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584533285;
 bh=XJiEOAozgm+yH1zcp2YaIdeCCLJBRQ1Kv9UZuvK8GMQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gko7S8R6+uGqqmordyoj22D+Z6GbB7+1rNC50urX6p1QU1qWzqcbupHST+osFhnmc
 i4BFBAyfrizYMHsdkPgX68GBBUaownstPOFL1ZHxJCWwQD9IoFfoXirDhNt2fFmvsp
 ReZRCnfu2YjKbHw+X8nAI3Sgm3bkGdzdwIg+Olbg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200318120804epcas1p2827a459212296927710decbf473eae6d~9ZKCXGO9C1986319863epcas1p2u;
 Wed, 18 Mar 2020 12:08:04 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48j81v6Hb9zMqYkZ; Wed, 18 Mar
 2020 12:08:03 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.6C.04074.32F027E5; Wed, 18 Mar 2020 21:08:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200318120803epcas1p34570b795db84b2fd429b299a9ab317bd~9ZKBBqji-3102231022epcas1p3F;
 Wed, 18 Mar 2020 12:08:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200318120803epsmtrp12e38c038e36c0792baf0448fdf0d64d6~9ZKBA6Z7T1252812528epsmtrp1B;
 Wed, 18 Mar 2020 12:08:03 +0000 (GMT)
X-AuditID: b6c32a39-58bff70000000fea-48-5e720f235081
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 78.9F.04024.32F027E5; Wed, 18 Mar 2020 21:08:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200318120803epsmtip2c206a421f0193cddf5def14519368beb~9ZKAyEkjd0042900429epsmtip2H;
 Wed, 18 Mar 2020 12:08:03 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 chenxiang <chenxiang66@hisilicon.com>, Michael Walle <michael@walle.cc>,
 John Garry <john.garry@huawei.com>, js07.lee@samsung.com
Subject: [PATCH v2 2/3] mtd: spi-nor: add 4bit block protection support
Date: Wed, 18 Mar 2020 21:06:14 +0900
Message-Id: <20200318120615.4639-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318120615.4639-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXd2tqO0PEyXb8PMTkWpzDbX9GguhMxOKSH0zQ9bBz3M1W7u
 bNGF0ORoopa6bpQapeYtSjPLG2pNyUSywlCTrLBPRVomXcyktp1Fffu9z///8FzeB0OkC6gc
 M1ocjN1CmwhRoPD+YKRCsTHIrlNWFavIyYkXgGwfKEDJlep5ATn7chklewsaxOTcaJuYXKhP
 Jn8/+SxOxqjuKzNi6l3NHTHFDc2h1N36POrVjxuAOtvRAqjhqU4B9aCPE2VgmaakHIbOZuwR
 jCXLmm20GLRE2gH9Lr0mTqlSqBLIeCLCQpsZLZGSnqFINZo8nRERR2iT0xPKoFmW2LYzyW51
 OpiIHCvr0BKMLdtkUyltMSxtZp0WQ0yW1ZyoUipjNR7nQVPOWM+MwDaedHRufEWYD15Hl4AA
 DOLb4fPye6AEBGJSvAvAwbImMf/4AmDt4xm/8g3AUyNeG+ZL6et1eLOleB+AhR/Sec8igOfy
 C4ReQYRHwanldtQrhOAuAeSa+lGvEIzvgUWuUsTLQnwzvFhzWeRlCU7CiguFgO9pPbzZ9sDn
 CcATYMHDCYSPd4jgUrmW5xR4dXZWyHMw/DDcIeZZDt+XF/mZhd3Nlb5xIM4BONtY7xfUcH7u
 FuKdBsEjYWvPNj68AXYv1/h6QPDVcP5rGcoPLIHFRVLeQsCPbzl/WQifvTuD8kzB0dJO/7Iq
 ALx0uxatAOuu/KtwDYAWsIaxsWYDw6psmv9/qR34zi0qoQs8Gkt3AxwDxCoJ1mbTSVH6CHvM
 7AYQQ4gQSV2uVSeVZNPHjjN2q97uNDGsG2g8m6xE5LIsq+d4LQ69ShOrVqvJ7XHxcRo1ESq5
 MGnSSXED7WAOM4yNsf/NE2AB8nywtWooOr6yccbaEmqMjBmRdTSvdnGuhPC3v5zTjuWmsO69
 tK7yp/mjvMXMvclswiXVaW25XPrS9UiZdn/dvsmk0z1Bh7iG3tSnziGD65ksrKq/6OSqmE/k
 JuOWgNQdY2vrvgvP52VuCt/trjYkPlJMTg+8GpSVuU9E6RsWy1sZQsjm0KooxM7SfwAlsxeo
 hAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJLMWRmVeSWpSXmKPExsWy7bCSvK4yf1GcwZn9fBbXr11htNi0v4nV
 4u+cd0wWj27+ZrXY3bSM3eLt6Q3sFh+XOFj8P/uB3YHDY+esu+wej+duZPdoOfKW1WPzknqP
 Oz+WMnr0bVnF6HH8xnYmjwN7W9gCOKK4bFJSczLLUov07RK4Ms7tustUcNmm4u3lvywNjPe0
 uxg5OCQETCT27i7pYuTiEBLYzSgx4fZnli5GTqC4hMSjnV9YIGqEJQ4fLgYJCwl8ZJTYu5Qf
 xGYT0JK48XsTK0iviMAsJonF+3uYQRLCAu4SbZO6wWwWAVWJaXNnsoHYvAIWEhOmtjJCzJeX
 WL3hAFgNp4ClRNPBa8wQC+wk9t5dwDyBkXcBI8MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS9
 5PzcTYzgANTS3MF4eUn8IUYBDkYlHt6ETQVxQqyJZcWVuYcYJTiYlUR4FxfmxwnxpiRWVqUW
 5ccXleakFh9ilOZgURLnfZp3LFJIID2xJDU7NbUgtQgmy8TBKdXAqF/3Wzh2klKD57O+DUeP
 JJ9dfff8Xnmvl8os7U3x7+1+bp60PWKpYUrG07Wrc/80xSuvy9xwO7mGvWZj1z9pl/TWMucH
 X7+L/Pv/7+rCu4bfFnj/OBLrsvneiXv3V3krMKlscmBul/1+pFP5ctb9V0e+2tTdPDrN+HD5
 vIkJH02EVl+Neb3t9ywlluKMREMt5qLiRACZGRYFPAIAAA==
X-CMS-MailID: 20200318120803epcas1p34570b795db84b2fd429b299a9ab317bd
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200318120803epcas1p34570b795db84b2fd429b299a9ab317bd
References: <y> <20200318120615.4639-1-js07.lee@samsung.com>
 <CGME20200318120803epcas1p34570b795db84b2fd429b299a9ab317bd@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_050810_909431_4CFB6526 
X-CRM114-Status: GOOD (  21.70  )
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

Currently, we are supporting block protection only for flash chips with
3 block protection bits in the SR register.

This patch enables block protection support for flashes with 4 block
protection bits(bp0-3).

Added a flag to inform that this flash has 4 block protection bit,
and added another flag for some flashes in which bp3 bit is not adjacent
to other bp bits.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/core.c  | 62 ++++++++++++++++++++++++++++++++++---
 drivers/mtd/spi-nor/core.h  | 10 ++++++
 include/linux/mtd/spi-nor.h |  2 ++
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e4ed8553aae8..842e2fabdb20 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1516,7 +1516,15 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
 {
-	return SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+		return mask | SR_BP3_BIT6;
+
+	if (nor->flags & SNOR_F_HAS_4BIT_BP)
+		return mask | SR_BP3;
+
+	return mask;
 }
 
 static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
@@ -1532,7 +1540,8 @@ static int spi_nor_get_min_prot_length(struct spi_nor *nor)
 	int bp_slots, bp_slots_needed;
 	u8 mask = spi_nor_get_bp_mask(nor);
 
-	bp_slots = (mask >> SR_BP_SHIFT) + 1;
+	/* 2 ^ number_of_bp_bit slots available */
+	bp_slots = 1 << hweight8(mask);
 
 	/* Reserved one for "protect none" and one for "protect all". */
 	bp_slots = bp_slots - 2;
@@ -1553,7 +1562,12 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	int min_prot_len;
 	u8 mask = spi_nor_get_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_tb_mask(nor);
-	u8 bp = (sr & mask) >> SR_BP_SHIFT;
+	u8 bp, val = sr & mask;
+
+	if (val & SR_BP3_BIT6)
+		val = (val & ~SR_BP3_BIT6) | SR_BP3;
+
+	bp = val >> SR_BP_SHIFT;
 
 	if (!bp) {
 		/* No protection */
@@ -1611,7 +1625,7 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
- * Supports the block protection bits BP{0,1,2} in the status register
+ * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
  *   - CMP: complement protect - only support CMP=0 (range is not complemented)
@@ -1619,7 +1633,7 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  * Support for the following is provided conditionally for some flash:
  *   - TB: top/bottom protect
  *
- * Sample table portion for 8MB flash (Winbond w25q64fw):
+ * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
  *
  *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
  *  --------------------------------------------------------------------------
@@ -1639,6 +1653,32 @@ static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
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
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
@@ -1690,6 +1730,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		min_prot_len = spi_nor_get_min_prot_length(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
+
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 	}
 
 	if (val & ~mask)
@@ -1772,6 +1815,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
 
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+			val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
@@ -3131,6 +3177,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
 
+	if (info->flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (info->flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3ce826b35ad1..6f2f6b27173f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -24,6 +24,8 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_16BIT_SR	= BIT(9),
 	SNOR_F_NO_READ_CR	= BIT(10),
 	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
+	SNOR_F_HAS_4BIT_BP      = BIT(12),
+	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
 };
 
 struct spi_nor_read_command {
@@ -301,6 +303,14 @@ struct flash_info {
 					 * status register. Must be used with
 					 * SPI_NOR_HAS_TB.
 					 */
+#define SPI_NOR_4BIT_BP		BIT(17) /*
+					 * Flash SR has 4 bit fields (BP0-3)
+					 * for block protection.
+					 */
+#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
+					 * BP3 is bit 6 of status register.
+					 * Must be used with SPI_NOR_4BIT_BP.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e656858b50a5..1e2af0ec1f03 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -111,7 +111,9 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_BP3			BIT(5)	/* Block protect 3 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
