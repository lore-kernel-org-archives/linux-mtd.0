Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89108C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 07:47:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587A3207C4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 07:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKAp9sva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587A3207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u13FH4aB2UJQO5Db1HExfKdZR9NDVY0G4sEP4v+uLb0=; b=hKAp9sva6/eig/
	laZaXg/ZAelboPUHF0+I0ZhZ2hnIwxYBMNf6ZedlHYdyNIlKI/rXoEEr0wSbnIAB+CqifiqXIYgke
	LucszrUiudlD5FONjNAlAM1p0NGwUBL3m/H9UN+yyG3SnDEtjR5lZEuIu8aM95LyvFPtVh6Mo5M1H
	yt4R9qHen1TCwbqld1f/JwDJXak9gEgj56z5YFrEqJCV7QYmTv0wTUCiws5oPKKhOdBWaEFyVzrK5
	Oj025Rbc7MZMk78k2cwvssOLXiRT1aqjW007baS2s4bD5uljW5JI2qfT5cxc0008OwgR1hTc7N8Zh
	Nrs7fR3s2iTykxJsP51w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jawxr-0007jf-Mr; Tue, 19 May 2020 07:47:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jawwp-0006qO-J8
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 07:46:01 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4B80624000A;
 Tue, 19 May 2020 07:45:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 4/8] mtd: rawnand: Add nand_extract_bits()
Date: Tue, 19 May 2020 09:45:45 +0200
Message-Id: <20200519074549.23673-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519074549.23673-1-miquel.raynal@bootlin.com>
References: <20200519074549.23673-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_004559_765090_ACDB3833 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are cases where ECC bytes are not byte-aligned. Indeed, BCH
implies using a number of ECC bits, which are not always a multiple of
8. We then need a helper like nand_extract_bits() to extract these
syndromes from a buffer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 42 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  4 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 65e9b2fa2fc5..14387b967e8b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -274,6 +274,48 @@ static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+/** nand_extract_bits - Copy unaligned bits from one buffer to another one
+ * @dst: destination buffer
+ * @dst_off: bit offset at which the writing starts
+ * @src: source buffer
+ * @src_off: bit offset at which the reading starts
+ * @nbits: number of bits to copy from @src to @dst
+ *
+ * Copy bits from one memory region to another (overlap authorized).
+ */
+void nand_extract_bits(u8 *dst, unsigned int dst_off, const u8 *src,
+		       unsigned int src_off, unsigned int nbits)
+{
+	unsigned int tmp, n;
+
+	dst += dst_off / 8;
+	dst_off %= 8;
+	src += src_off / 8;
+	src_off %= 8;
+
+	while (nbits) {
+		n = min3(8 - dst_off, 8 - src_off, nbits);
+
+		tmp = (*src >> src_off) & GENMASK(n - 1, 0);
+		*dst &= ~GENMASK(n - 1 + dst_off, dst_off);
+		*dst |= tmp << dst_off;
+
+		dst_off += n;
+		if (dst_off >= 8) {
+			dst++;
+			dst_off -= 8;
+		}
+
+		src_off += n;
+		if (src_off >= 8) {
+			src++;
+			src_off -= 8;
+		}
+
+		nbits -= n;
+	}
+}
+
 /**
  * nand_select_target() - Select a NAND target (A.K.A. die)
  * @chip: NAND chip object
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0f45b6984ad1..45dd57e2a223 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1412,6 +1412,10 @@ int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
 void nand_select_target(struct nand_chip *chip, unsigned int cs);
 void nand_deselect_target(struct nand_chip *chip);
 
+/* Bitops */
+void nand_extract_bits(u8 *dst, unsigned int dst_off, const u8 *src,
+		       unsigned int src_off, unsigned int nbits);
+
 /**
  * nand_get_data_buf() - Get the internal page buffer
  * @chip: NAND chip object
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
