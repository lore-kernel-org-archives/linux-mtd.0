Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4EFC2D0DB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 17:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4112071E
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 17:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NbIPmhiH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="GnzEeY10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4112071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MmRPjNbkALtAp8qlep/p5PKuyNg30RcI9zrCf/x8BV0=; b=NbIPmhiHcVoTuW
	eLTnioGL+iIiujVImdf11MIncacK2SCQZTXTRJvXaY2V7ukBwxl2envgObD4/Vl24DCIx5J240LJp
	B5NgU+kTt4Zi+OGfVJVeSNjvz8hVwgSNNLdQysOzotRhdQHvxCiBWGuGFNriZlvDroBrDte1RuL2h
	VN7hPmljswE4vTOsOQik5rRbGl6P4FM99DviNTliyCyfKbbNJx0uIWWUmBIUQAIFex08NnuiXZIbr
	PEEX9Fi4EZeDDuypTMFYoBltNJ2Z2+frIjfJ0WOlWdTvbLdUYlRoW+/uHJ16gRgtfbqyr+BSnd9PF
	r1FuV167L2QvWXBseWMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iufs3-0002qn-Ru; Thu, 23 Jan 2020 17:02:19 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iufs0-0002pf-Il
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 17:02:18 +0000
Received: from mwalle01.sab.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6727A22FAD;
 Thu, 23 Jan 2020 18:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1579798931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nmIg70snHQ9F1ZTiqnhlVl06NP5Op1ImwxNDLTa/QwQ=;
 b=GnzEeY10qlJ53LSxb4rjyvvjjiZSvOt2aDlLNwKXdXlqve3Q36xyf4gWuh1DdykGQMqi1q
 rldt+G/D6PFHF9aUZgWe8hPsCf0v+0vOkxEHc8ZaB94nQEfMjwl9E5Gh5EoqO9jfIHibes
 MY13A9Gr4BGVpVtS4uvnj2LwYYpcRdQ=
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: [RFC PATCH] mtd: spi-nor: fix locking for flashes <32MBit
Date: Thu, 23 Jan 2020 18:01:30 +0100
Message-Id: <20200123170130.8289-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 6727A22FAD
X-Spamd-Result: default: False [4.90 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM(-0.00)[-0.798];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:12941, ipnet:213.135.0.0/19, country:DE]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_090216_932714_7ADE4C6A 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are flashes which support locking and are smaller than 32Mbit, for
example the gd25q16. The formula in stm_lock() and stm_unlock() will
give wrong results, because it assumes that there are no holes in the
locking configuration and that the second to last BP configuration is
always "protect half the flash". This is only true for flashes larger
than or equal to 32MBit.

Introduce a function which calculates the number of "unused" BP
configuration slots and take them into account when calculating the BP
bits.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Hi Jungseung and all,

I've prototyped these functions in userspace. And just compile-tested it
with linux.

This should also fix the new 4th BP bit calculation if you adapt the masks.

Maybe better description is needed and/or a rewrite of the
stm_lock()/stm_unlock() functions. But hopefully this patch shows that
we don't need two different formulas for 3 and 4 BP bits.

 drivers/mtd/spi-nor/spi-nor.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ede7ae80ad92..3278708cc329 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1761,6 +1761,49 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
+/*
+ * Return the number of "unused" slots for the BP bits.
+ *
+ * Sample table portion for 1MB flash (Winbond w25q80bv):
+ *
+ *    BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
+ *  -----------------------------------------------------------
+ *     0   |   0   |   0   |  NONE         | NONE
+ *     0   |   0   |   1   |  64 KB        | Upper 1/16
+ *     0   |   1   |   0   |  128 KB       | Upper 1/8
+ *     0   |   1   |   1   |  256 KB       | Upper 1/4
+ *     1   |   0   |   0   |  512 KB       | Upper 1/2
+ *     1   |   0   |   1   |  1 MB         | ALL
+ *     1   |   1   |   0   |  1 MB         | ALL
+ *     1   |   1   |   1   |  1 MB         | ALL
+ *
+ * For the example above the function would return 2, because
+ * two slots (BP=6 and BP=7) are "unused".
+ */
+#define STM_LOCK_SECTOR_SIZE (64 * 1024)
+static int stm_pow_offset(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	int shift = ffs(mask) - 1;
+	int free_slots;
+
+	/* We have 2^3 slots available */
+	free_slots = (mask >> shift) + 1;
+
+	/* We need one for "protect none" and one for "protect all" */
+	free_slots -= 2;
+
+	/*
+	 * And we need log2(flash_size / sector size) slots for in-between
+	 * configurations.
+	 */
+	free_slots -= ilog2(mtd->size / STM_LOCK_SECTOR_SIZE);
+
+	/* make sure we don't return negative values */
+	return max(0, free_slots);
+}
+
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
@@ -1779,6 +1822,9 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 		*len = 0;
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
+		pow -= stm_pow_offset(nor);
+		/* make sure we don't get negative */
+		pow = max(0, pow);
 		*len = mtd->size >> pow;
 		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
 			*ofs = 0;
@@ -1909,6 +1955,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
+	pow += stm_pow_offset(nor);
 	val = mask - (pow << shift);
 	if (val & ~mask)
 		return -EINVAL;
@@ -1994,6 +2041,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
 	 */
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
+	pow += stm_pow_offset(nor);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
