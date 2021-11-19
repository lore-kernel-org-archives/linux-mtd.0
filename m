Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3258EC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:05:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0188161351
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0188161351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opQIlmx5NgHeXihCu8O9LauyDX3uJO6KVwQ/rbbtKAA=; b=tr4joERdF0MCai
	gVEXn7KjHf1vRmhFvT68kspOQYm3Yy87JZPwTcToGK7BmpPgQJRxdtrvzitkYLm3qfytZ5zc2eUD5
	c+lcQZNLuZzOgJDTS4EbSIfRmvAt6IVeAqJfO9eGxAHuJdFo+C0G6BYleR+fbDtw1mlcFLGtTphIB
	HaHwtzNt4cbDmcAwMB3bttgkrS+g7f4/f3Xn6WobOEIBiOBeVPUgnhCjKDwRsv9bmAf/xVdr7HZL0
	m++w7CCCU8z3Nk1gzuDQSmIthKLXCfW9+Ttkgf7vtCJh57f/R8u5rFNBwxuVUDUKgFfnB7YDUvS6Y
	Rv6sLs08N2izGEe8hO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo5RT-00AnE5-9E; Fri, 19 Nov 2021 15:04:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo5QJ-00Amo7-JH
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 15:03:33 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPA id 5C01F1C0017;
 Fri, 19 Nov 2021 15:03:29 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 4/4] mtd: rawnand: fsmc: Fix timing computation
Date: Fri, 19 Nov 2021 16:03:16 +0100
Message-Id: <20211119150316.43080-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119150316.43080-1-herve.codina@bootlin.com>
References: <20211119150316.43080-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_070331_947022_9F12A18D 
X-CRM114-Status: GOOD (  18.40  )
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

Under certain circumstances, the timing settings calculated by
the FSMC NAND controller driver were inaccurate.
These settings led to incorrect data reads or fallback to
timing mode 0 depending on the NAND chip used.

The timing computation did not take into account the following
constraint given in SPEAr3xx reference manual:
  twait >= tCEA - (tset * TCLK) + TOUTDEL + TINDEL

Enhance the timings calculation by taking into account this
additional constraint.

This change has no impact on slow timing modes such as mode 0.
Indeed, on mode 0, computed values are the same with and
without the patch.

NANDs which previously stayed in mode 0 because of fallback to
mode 0 can now work at higher speeds and NANDs which were not
working at all because of the corrupted data work at high
speeds without troubles.

Overall improvement on a Micron/MT29F1G08 (flash_speed tool):
                        mode0       mode3
eraseblock write speed  3220 KiB/s  4511 KiB/s
eraseblock read speed   4491 KiB/s  7529 KiB/s

Fixes: d9fb079571833 ("mtd: nand: fsmc: add support for SDR timings")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
- Commit log reword
- Added performance details in commit log
- Used #define for TOUTDEL and TINDEL and
  Fixed coding style
- Used max3()

Changes v2 -> v3:
- Improved commit log
- Added 'Fixes' reference
- Changed comment in source code

 drivers/mtd/nand/raw/fsmc_nand.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0a6c9ef0ea8b..6b2bda815b88 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -94,6 +94,14 @@
 
 #define FSMC_BUSY_WAIT_TIMEOUT	(1 * HZ)
 
+/*
+ * According to SPEAr300 Reference Manual (RM0082)
+ *  TOUDEL = 7ns (Output delay from the flip-flops to the board)
+ *  TINDEL = 5ns (Input delay from the board to the flipflop)
+ */
+#define TOUTDEL	7000
+#define TINDEL	5000
+
 struct fsmc_nand_timings {
 	u8 tclr;
 	u8 tar;
@@ -278,7 +286,7 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 {
 	unsigned long hclk = clk_get_rate(host->clk);
 	unsigned long hclkn = NSEC_PER_SEC / hclk;
-	u32 thiz, thold, twait, tset;
+	u32 thiz, thold, twait, tset, twait_min;
 
 	if (sdrt->tRC_min < 30000)
 		return -EOPNOTSUPP;
@@ -310,13 +318,6 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
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
@@ -325,6 +326,21 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 	else if (tims->tset > FSMC_TSET_MASK)
 		tims->tset = FSMC_TSET_MASK;
 
+	/*
+	 * According to SPEAr300 Reference Manual (RM0082) which gives more
+	 * information related to FSMSC timings than the SPEAr600 one (RM0305),
+	 *   twait >= tCEA - (tset * TCLK) + TOUTDEL + TINDEL
+	 */
+	twait_min = sdrt->tCEA_max - ((tims->tset + 1) * hclkn * 1000)
+		    + TOUTDEL + TINDEL;
+	twait = max3(sdrt->tRP_min, sdrt->tWP_min, twait_min);
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
