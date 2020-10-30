Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12406C00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:24:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673592083B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AHpZN5X1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673592083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34yZD/Zb/aq4X2A6QE3GWrc2UeKrhveAAsZ2v7KpvQ4=; b=AHpZN5X1sTNaDTWi7JAhV7kEkn
	iPKExKqdg6psx8ocn3rO0ce/32f/ntky6tV/YmvY9hO6TocYvaJqKuGL+ksbjMpuldCnjGDwmoDh0
	KHkHX0yAOKxh6PE0JyWtg7bkX6w8C3a8nDjMy4S+09aYPqfjKDVfLcbfqya1IvfqcjI7NkJjIqf2j
	msYk3diki/FzTAhpSE+cDh8MhLcY+t28NL52sZAPvWq7Rky6Ld6FoUVC/X20UEN539btig9rYigsM
	LCjXNGxVnjiwlIR/7ADn+eL22jHoeEg6+MKlSnTNe4QTTecHBavStQtcuUs/j7eA2xI/8hsBDMn2o
	GdTORSkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYY7p-0004GG-0R; Fri, 30 Oct 2020 17:23:41 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYY7n-0004Fn-F0
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:23:40 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 976A4240005;
 Fri, 30 Oct 2020 17:23:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: nand: ecc-hamming: Clarify the logic around rp17
Date: Fri, 30 Oct 2020 18:23:33 +0100
Message-Id: <20201030172333.28390-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132339_622515_06C3B574 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This code has been written in 2008 and is fine, but in order to keep
robots happy, I think it's time to change a little bit this code just
to clarify the different possible values of eccsize_mult. Indeed, this
variable may only take the value 1 or 2 because step_size, in the case
of the software Hamming ECC engine may only be 256 or 512. Depending
on the value of eccsize_mult, an extra rp17 variable is set, or not
and triggers the following warning:

     smatch warnings:
     ecc_sw_hamming_calculate() error: uninitialized symbol 'rp17'.

As highlighted by Dan Carpenter, if the only possible values for
eccsize_mult are 1 and 2, then the code is fine, but "it's hard to
tell just from looking".

So instead of shifting step_size, let's use a ternary condition to
assign to eccsize_mult the only two possible values and clarify the
driver's logic.

Now that the situation is clarified for humans, ensure rp17 is
initialized to 0 to keep compilers and robots silent as well.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 334e619b35c9..77e6005a22b0 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -116,7 +116,7 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			     unsigned char *code, bool sm_order)
 {
 	const u32 *bp = (uint32_t *)buf;
-	const u32 eccsize_mult = step_size >> 8;
+	const u32 eccsize_mult = (step_size == 256) ? 1 : 2;
 	/* current value in buffer */
 	u32 cur;
 	/* rp0..rp17 are the various accumulated parities (per byte) */
@@ -136,6 +136,7 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 	rp12 = 0;
 	rp14 = 0;
 	rp16 = 0;
+	rp17 = 0;
 
 	/*
 	 * The loop is unrolled a number of times;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
