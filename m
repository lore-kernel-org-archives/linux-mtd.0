Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD23C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 07:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A6661AFF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75A6661AFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpcRL3u+dpUgrw4XMGoFGC4WJMa2aM/d9PrR3ZKVxp8=; b=gSLMQbsE1FN4s/
	Tr8o+RLR55ymXKpdF5XRCQf7AfVWQsuDhnljwaFrI93eqWWrJCL5XvCfR+o07qDpOnVfgt0QmcCyx
	6UFkvSei45nQ+f0LBBq0fdVDrWED/5tzcz86f4Al+gQId6wdC/EkjjDzA4ajDYLXkfEL7XiyHC5sB
	I6dMbm9lWTyQFu8WyShG8EaL745Bvm4PihvCdT/nfE2TFmFVYkbDxL1KNZVOSbxD9G40chrSuA52c
	ALG7YibdQr9KFkGNvCkd7hQ5PIMIKD2kwVwE+1Qw0BCKV2WjWaHYutxwgG0ltzT0/bYXZrsPDIi+m
	q/hvCTgP7FkLmq1i2SzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnyUu-009d2s-Qd; Fri, 19 Nov 2021 07:39:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnyUV-009cxd-2x
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 07:39:24 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPA id 6AF6A2000D;
 Fri, 19 Nov 2021 07:39:20 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 2/4] mtd: rawnand: Fix nand_choose_best_timings() on
 unsupported interface
Date: Fri, 19 Nov 2021 08:39:07 +0100
Message-Id: <20211119073909.1492538-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119073909.1492538-1-herve.codina@bootlin.com>
References: <20211119073909.1492538-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_233923_289501_7AE4EB51 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When the NV-DDR interface is not supported by the NAND chip,
the value of onfi->nvddr_timing_modes is 0. In this case,
the best_mode variable value in nand_choose_best_nvddr_timings()
is -1. The last for-loop is skipped and the function returns an
uninitialized value.
If this returned value is 0, the nand_choose_best_sdr_timings()
is not executed and no 'best timing' are set. This leads the host
controller and the NAND chip working at default mode 0 timing
even if a better timing can be used.

Fix this uninitialzed returned value.

nand_choose_best_sdr_timings() is pretty similar to
nand_choose_best_nvddr_timings(). Even if onfi->sdr_timing_modes
should never be seen as 0, nand_choose_best_sdr_timings() returned
value is fixed.

Fixes: a9ecc8c814e9 ("mtd: rawnand: Choose the best timings, NV-DDR included")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
- New patch in v2 series

 drivers/mtd/nand/raw/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 5c6b065837ef..a130320de412 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -926,7 +926,7 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 				 struct nand_sdr_timings *spec_timings)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
-	int best_mode = 0, mode, ret;
+	int best_mode = 0, mode, ret = -EOPNOTSUPP;
 
 	iface->type = NAND_SDR_IFACE;
 
@@ -977,7 +977,7 @@ int nand_choose_best_nvddr_timings(struct nand_chip *chip,
 				   struct nand_nvddr_timings *spec_timings)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
-	int best_mode = 0, mode, ret;
+	int best_mode = 0, mode, ret = -EOPNOTSUPP;
 
 	iface->type = NAND_NVDDR_IFACE;
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
