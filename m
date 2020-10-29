Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EB5C55178
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 08:39:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69AB620780
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 08:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z01dj/zZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69AB620780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJB4EqgaYHJ5xvQVhS00ngCpt0NEM/5sIdt8Pv96GoY=; b=Z01dj/zZo6kQ3vJp3cI1rRTjFp
	wSpzR3Opsk0lIKPMjTUPD0oW1QZ2YdpCvRPyhC1cZw8AyMHBCbseJkVTh5xO4n1qTudvNMnxdKAhp
	gw/W8iQdQiXpU2zXwMbTHUEWHrsn/5oGyq4ZPfLuL/wn4FNS2ELxlElLIX+xz2y+uVAWYIdvLnK9i
	crpHg56Z57cV9UNk4auAdW3EGDlGsyuTSMkZHCpIJofL1uHzbj8YGZr3PbVvwkRoiMao7QkB0EflI
	sZxEuZ2o9quzrY2bsM6qClYKgXOOst9bPq0SnVFvt2ZUOIn7+VWwKc4uCO3kWU260pppZc38ijClO
	1Mj14usw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY3SW-0001Cw-J9; Thu, 29 Oct 2020 08:39:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY3ST-0001BE-Qa
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 08:38:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 535581BF215;
 Thu, 29 Oct 2020 08:38:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: ecc-hamming: Clarify the logic around rp17
Date: Thu, 29 Oct 2020 09:38:47 +0100
Message-Id: <20201029083847.21128-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_043857_954272_3C2EE56D 
X-CRM114-Status: GOOD (  13.29  )
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

Now that the situation is clarified for humans, set rp17 to 0 in an
else block to keep robots silent as well.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 334e619b35c9..9a1aa9005970 100644
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
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
