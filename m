Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBE3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F6F601FA
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3F6F601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZAv/x1iRH4HyFUf5L2GA4ji1vCxs5WjAwJMLtuKM/8=; b=UkF+FF+FZKahTs
	GW/QqNISSEraCldDNBFuG2IA1YLJdwvM1NEQlCFKwzOOD3akYb30A3fO0ksBjQgGdoeEdSHTTDxRs
	Va0Fxq2MCjlLAlQfXM25WWcJC22ChLwZa73kWLEmjWYZk8Z+KlBoLjzBoJUjVZlqm3y+ujNmz5aL5
	TYS7VOWzMyrSsUgQjokX1GpBrulAa56qGLQgWgO5XbOvl+qHgoGiHs0jaf7MpJQzg5EKvoLFpmrpx
	bjzG4NbXRIUzzhuWCxQwAJWte63YoW/TS0RdVwUH9gMJp9GXFmxgPQIsJRb+xt3ZexTfhPiQ0PWU1
	ao6ZJVLygT64L/IC2psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlXxf-00AvwJ-6p; Fri, 12 Nov 2021 14:55:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlXiR-00AqKs-9K
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 14:39:44 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPA id 30CFF40005;
 Fri, 12 Nov 2021 14:39:41 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 4/4] mtd: rawnand: fsmc: Fix timing computation
Date: Fri, 12 Nov 2021 15:38:55 +0100
Message-Id: <20211112143855.2678989-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112143855.2678989-1-herve.codina@bootlin.com>
References: <20211112143855.2678989-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_063943_506931_13295A9A 
X-CRM114-Status: GOOD (  14.88  )
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

The timing setting were incorrect on some nands leading to a
fallback to mode 0 timing on some Micron nand or to incorrect
data reads on some Winbond NAND.

The timing computation did not take into account the following
constraint given in SPEAr3xx reference manual:
  twait >= tCEA - tset*TCLK + TOUTDEL + TINDEL

This patch adds this constraint and fixes the issues on both
nands having the both nands working at mode 3 timing.
The change has no impact on slower timing mode such as mode 0.
Indeed, on mode 0 timing, computed values are the same with and
without the patch.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index bff09219ce3a..a3aa66f30869 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -278,7 +278,7 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 {
 	unsigned long hclk = clk_get_rate(host->clk);
 	unsigned long hclkn = NSEC_PER_SEC / hclk;
-	u32 thiz, thold, twait, tset;
+	u32 thiz, thold, twait, tset, tmp;
 
 	if (sdrt->tRC_min < 30000)
 		return -EOPNOTSUPP;
@@ -310,13 +310,6 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 	else if (tims->thold > FSMC_THOLD_MASK)
 		tims->thold = FSMC_THOLD_MASK;
 
-	twait = max(sdrt->tRP_min, sdrt->tWP_min);
-	tims->twait = DIV_ROUND_UP(twait / 1000, hclkn) - 1;
-	if (tims->twait == 0)
-		tims->twait = 1;
-	else if (tims->twait > FSMC_TWAIT_MASK)
-		tims->twait = FSMC_TWAIT_MASK;
-
 	tset = max(sdrt->tCS_min - sdrt->tWP_min,
 		   sdrt->tCEA_max - sdrt->tREA_max);
 	tims->tset = DIV_ROUND_UP(tset / 1000, hclkn) - 1;
@@ -325,6 +318,24 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 	else if (tims->tset > FSMC_TSET_MASK)
 		tims->tset = FSMC_TSET_MASK;
 
+	twait = max(sdrt->tRP_min, sdrt->tWP_min);
+
+	/* According to SPEAr300 Reference Manual (RM0082) which gives more
+	 * information related to FSMSC timings than the SPEAr600 one (RM0305),
+	 *   twait >= tCEA - tset*TCLK + TOUTDEL + TINDEL
+	 * With TOUTDEL = 7ns (Output delay from the flip-flops to the board)
+	 * and TINDEL = 5ns (Input delay from the board to the flipflop)
+	 */
+	tmp = sdrt->tCEA_max - (tims->tset + 1)*hclkn*1000 + 7000 + 5000;
+	if (twait < tmp)
+		twait = tmp;
+
+	tims->twait = DIV_ROUND_UP(twait / 1000, hclkn) - 1;
+	if (tims->twait == 0)
+		tims->twait = 1;
+	else if (tims->twait > FSMC_TWAIT_MASK)
+		tims->twait = FSMC_TWAIT_MASK;
+
 	return 0;
 }
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
