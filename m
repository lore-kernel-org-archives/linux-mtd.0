Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126FCC4727D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A070B20897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YQLGew/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A070B20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Na+ZgyBnjhIcE5Brhes/JtiHS/VyB+yFQoq8SJUYkY4=; b=YQLGew/ujuvj/wfERSAzddXzn
	AzxEdbx+azYfP/KPrSkQur+116hxCtaSoiC/oXrm1Yd7p2LBPBEi69k3YQo8ZDtTu1OlzCtpldhSa
	6zhuEngcLU/P7vSZJGfdymym+ETuHP+Ak8yEsLzmKpcnYunmEbkCKTbyTQ0QawkP9Zxaa35rs3Q4R
	y2LIOOhxsffpzUSiw8VTcuDNjAGvHiVc/B7CusFYjL2QMV46LXhqNcrWAXUQNIPKhqVY92NtX5+V4
	J0eWxdWirMufTQgxZpsCA/ltNKQ63En9Nrw3EWdxvudw5Pd7W7GRuZyfMmUZryDvCmqwT0j3hZ2Bu
	fvIiBogFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdj-0001Wt-2K; Tue, 29 Sep 2020 23:02:31 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcx-0001F3-Pp
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:45 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0C5BE200016;
 Tue, 29 Sep 2020 23:01:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/20] mtd: nand: ecc-hamming: Drop/fix the kernel doc
Date: Wed, 30 Sep 2020 01:01:17 +0200
Message-Id: <20200929230124.31491-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190144_162333_E18E0848 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some functions should never have been exported (the ones prefixed by
__*), in this case simply drop the documentation, we never want
anybody to use this function from the outside.

For the other functions, enhance the style.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c | 39 ++++++++-----------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index a17faed374a8..2f6f98557e82 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -112,14 +112,6 @@ static const char addressbits[256] = {
 	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f
 };
 
-/**
- * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
- *			 block
- * @buf:	input buffer with raw data
- * @eccsize:	data bytes per ECC step (256 or 512)
- * @code:	output buffer with ECC
- * @sm_order:	Smart Media byte ordering
- */
 void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 			  unsigned char *code, bool sm_order)
 {
@@ -360,11 +352,10 @@ void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 EXPORT_SYMBOL(__nand_calculate_ecc);
 
 /**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
- *			 block
- * @chip:	NAND chip object
- * @buf:	input buffer with raw data
- * @code:	output buffer with ECC
+ * nand_calculate_ecc - Calculate 3-byte ECC for 256/512-byte block
+ * @chip: NAND chip object
+ * @buf: Input buffer with raw data
+ * @code: Output buffer with ECC
  */
 int nand_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
 		       unsigned char *code)
@@ -377,16 +368,6 @@ int nand_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
 }
 EXPORT_SYMBOL(nand_calculate_ecc);
 
-/**
- * __nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @buf:	raw data read from the chip
- * @read_ecc:	ECC from the chip
- * @calc_ecc:	the ECC calculated from raw data
- * @eccsize:	data bytes per ECC step (256 or 512)
- * @sm_order:	Smart Media byte order
- *
- * Detect and correct a 1 bit error for eccsize byte block
- */
 int __nand_correct_data(unsigned char *buf,
 			unsigned char *read_ecc, unsigned char *calc_ecc,
 			unsigned int eccsize, bool sm_order)
@@ -461,13 +442,13 @@ int __nand_correct_data(unsigned char *buf,
 EXPORT_SYMBOL(__nand_correct_data);
 
 /**
- * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @chip:	NAND chip object
- * @buf:	raw data read from the chip
- * @read_ecc:	ECC from the chip
- * @calc_ecc:	the ECC calculated from raw data
+ * nand_correct_data - Detect and correct bit error(s)
+ * @chip: NAND chip object
+ * @buf: Raw data read from the chip
+ * @read_ecc: ECC bytes read from the chip
+ * @calc_ecc: ECC calculated from the raw data
  *
- * Detect and correct a 1 bit error for 256/512 byte block
+ * Detect and correct up to 1 bit error per 256/512-byte block.
  */
 int nand_correct_data(struct nand_chip *chip, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
