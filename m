Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20DFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE2661351
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EE2661351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+uYINc1Jrxqc+0obmG+6wtp7r7PC3vRqKLRxrfqdow=; b=Ctsk8WthDnpSvp
	Tr4HbITzYPqS1R1IrJk8LrHUXDdHiQeiXEckrvCZyb5sSazVSDamIhVpbAgmdgckIc4UsNP30/zEw
	MXae04u28ZBH5Lqbq7pZq6HaaiUypI5XXbi3u7MCrbNrf56YOnA2auH/itX53aknpzozPiTzCaAQ0
	yP5NjwQe9hHqJnQM4mcnhLbnUSCDrYkwpP2egf8TVwwIUDxJU0+USVq1H6a+28bomZIGiwxI1DPQ4
	0qHA5IQVvqQ+67GLGD2x4cNhbTHBsbwO74kV/dc6ODZ+QjTiSCptIF3c1C3AxfZrskIY5XUSQFig/
	7qcY5+rb/wXCeM9aN74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo5Qi-00Amvj-Ni; Fri, 19 Nov 2021 15:03:56 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo5QF-00AmmC-Lv
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 15:03:29 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPA id 7D06B1C0003;
 Fri, 19 Nov 2021 15:03:25 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 2/4] mtd: rawnand: Fix nand_choose_best_timings() on
 unsupported interface
Date: Fri, 19 Nov 2021 16:03:14 +0100
Message-Id: <20211119150316.43080-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119150316.43080-1-herve.codina@bootlin.com>
References: <20211119150316.43080-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_070327_896688_F7D44951 
X-CRM114-Status: GOOD (  13.95  )
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

Fix this uninitialized returned value.

nand_choose_best_sdr_timings() is pretty similar to
nand_choose_best_nvddr_timings(). Even if onfi->sdr_timing_modes
should never be seen as 0, nand_choose_best_sdr_timings() returned
value is fixed.

Fixes: a9ecc8c814e9 ("mtd: rawnand: Choose the best timings, NV-DDR included")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
- New patch in v2 series

Changes v2 -> v3:
- Fix commit log typo

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
