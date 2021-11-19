Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0119CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 07:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C600161AFF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 07:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C600161AFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sagFpqDzAvpNZEIxOFQAOWdCGM3AGPqaIyFSEYNkrw=; b=V6zm3J//BKEOWs
	ptV6tIoDnh6kWald7UAu3Li4XiVPJZgRHW1Yw9Vrs3gOQX07EmShXDzxkBXyI9+ise/LQej1tPoHl
	LiV8ElHzZgevZpEoBUCQeUhxrBOzEJzTVNeo89FM4AUPku3ZduArF6nBaSIdMguM60LzqGsuLomU0
	nYHSJzx2SugXE5yU+2eJfTRm3b2MyG2JpzDby44gd459IMRQOeZML2B4yUUzk8/gnQ5Z88yOaTXoY
	Lk2dAIWBnZeUzDAubBpENeFmk8HMlLqVNY3kh6zyfeekwXcUWk92mra4TR5H0x21hMjW8cwCBL2Q/
	FQgIqyRcfPqZySu0r7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnyVU-009dCp-6U; Fri, 19 Nov 2021 07:40:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnyUZ-009czB-Ds
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 07:39:29 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPA id DC69A20009;
 Fri, 19 Nov 2021 07:39:24 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 4/4] mtd: rawnand: fsmc: Fix timing computation
Date: Fri, 19 Nov 2021 08:39:09 +0100
Message-Id: <20211119073909.1492538-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119073909.1492538-1-herve.codina@bootlin.com>
References: <20211119073909.1492538-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_233927_768972_B4806E8B 
X-CRM114-Status: GOOD (  16.85  )
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
These settings lead to incorrect data reads or fallback to
mode 0 timings depending on NAND chip used.

The timing computation did not take into account the following
constraint given in SPEAr3xx reference manual:
  twait >= tCEA - tset*TCLK + TOUTDEL + TINDEL

Enhance the timings calculation by taking into account this
additional constraint.

The change has no impact on slow timing mode such as mode 0.
Indeed, on mode 0 timing, computed values are the same with and
without the patch.

The NAND that previously used the mode 0 fallback timing is
working in mode 3 timing.
The read/writes accesses performances (flash_speed tool result)
are the following:
                        mode0       mode3
eraseblock write speed  3220 KiB/s  4511 KiB/s
eraseblock read speed   4491 KiB/s  7529 KiB/s

The NAND where data reads were previously incorrect are correct
and this NAND is also working at mode 3 timing.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
- Commit log reword
- Added performance details in commit log
- Used #define for TOUTDEL and TINDEL and
  Fixed coding style
- Used max3()

 drivers/mtd/nand/raw/fsmc_nand.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0a6c9ef0ea8b..56b9da252346 100644
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
+	 *   twait >= tCEA - tset*TCLK + TOUTDEL + TINDEL
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
