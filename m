Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABE3C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A34B20897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5Y9yO8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A34B20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YghD54WdbeQwkcakfaDpgNR8GLvHriUmXGgRn2wd0RM=; b=h5Y9yO8+nZv0xLAxlpXV3fdbp
	anojcl18HJV4O+rIVxndNXl1YHEk4xLAtG6VuTl9wz+bouX9Lcbh+OxH/D17MIbXo/vF0aSp+pWPJ
	wzSDW9CS/Voxerl0zEh2ZCNnKnPZvO6yakiqpvi2ZkY/q2OLJmSMxKhy9qWi5HllXBgQ/lzkYvC8/
	/Bp3MfNwJPifo/apVDeIEvvTc5TQOOZ813G3SR1Dv4B0ZRpc8fNF+Nui0Z52IQqXLEbsqlYBbc2/w
	4xSA+gKiZQ2wX0Km3D4srjs/hjzmOxKo5lSqsvDxtFj4JjbhgJmyTGIxuveeyTwOBUo6i7l28xUoS
	DiVHrOY3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOe1-0001ff-F8; Tue, 29 Sep 2020 23:02:49 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcy-0001FD-Nn
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:46 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0C061200017;
 Tue, 29 Sep 2020 23:01:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/20] mtd: nand: ecc-hamming: Cleanup and style fixes
Date: Wed, 30 Sep 2020 01:01:18 +0200
Message-Id: <20200929230124.31491-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190144_900193_93A1E75F 
X-CRM114-Status: GOOD (  12.80  )
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

Various style fixes.

There is not functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 2f6f98557e82..771e27ed8883 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -115,19 +115,18 @@ static const char addressbits[256] = {
 void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 			  unsigned char *code, bool sm_order)
 {
+	const u32 *bp = (uint32_t *)buf;
+	const u32 eccsize_mult = eccsize >> 8;
+	/* current value in buffer */
+	u32 cur;
+	/* rp0..rp17 are the various accumulated parities (per byte) */
+	u32 rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8, rp9, rp10, rp11, rp12,
+		rp13, rp14, rp15, rp16, rp17;
+	/* Cumulative parity for all data */
+	u32 par;
+	/* Cumulative parity at the end of the loop (rp12, rp14, rp16) */
+	u32 tmppar;
 	int i;
-	const uint32_t *bp = (uint32_t *)buf;
-	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult = eccsize >> 8;
-	uint32_t cur;		/* current value in buffer */
-	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
-	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
-	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16;
-	uint32_t rp17;
-	uint32_t par;		/* the cumulative parity for all data */
-	uint32_t tmppar;	/* the cumulative parity for this iteration;
-				   for rp12, rp14 and rp16 at the end of the
-				   loop */
 
 	par = 0;
 	rp4 = 0;
@@ -372,10 +371,9 @@ int __nand_correct_data(unsigned char *buf,
 			unsigned char *read_ecc, unsigned char *calc_ecc,
 			unsigned int eccsize, bool sm_order)
 {
+	const u32 eccsize_mult = eccsize >> 8;
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
-	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult = eccsize >> 8;
 
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
