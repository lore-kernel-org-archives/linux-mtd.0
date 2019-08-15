Return-Path: <SRS0=q3Mz=WL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E7C3A589
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 22:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1302320644
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 22:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8tBxYrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1302320644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=mFrTkKPwFtI+/kh7fLueVSDinMdrrjtbO8S46i8PCgI=; b=I8t
	BxYrwVvsBeK5Rw4/B7K+nisK8BX+6h3C59dXw7Tw7PXoxIPPO4boI9U8hQplQX2JJRKj4ms333UUu
	3tm8ZKzO8YC+XMnAXHSu4gL9EgyI3Haxm6sKXNKdyFpsKbpDYK6SfVcykxU+qP7zDMC45IsyIG+bd
	ZIsRne/aD9GxZa328FiguV0qyvALSXHNnf63EXHwou5Uqw5SLQ0V9OZRc3ebEdFS8ADkzVGDtAuGg
	3lDb0qdVbiMsrZXOMUteJnNoM5a6Y3stPUXrZ+AxTvPNfLfqqryJeMyt8pzTXryvbp1qXnLbqgNcf
	ZJ/e0Sx0iJiMdlhujafwDy35oAtpEZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyOct-00040w-Qq; Thu, 15 Aug 2019 22:53:47 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyOcq-00040a-Pr
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2019 22:53:46 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 15:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="179505147"
Received: from tthayer-hp-z620.an.intel.com ([10.122.105.146])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2019 15:53:43 -0700
From: thor.thayer@linux.intel.com
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [RESEND] mtd: spi-nor: Fix Cadence QSPI RCU Schedule Stall
Date: Thu, 15 Aug 2019 17:55:36 -0500
Message-Id: <1565909736-11379-1-git-send-email-thor.thayer@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_155344_853144_92F5615C 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Thor Thayer <thor.thayer@linux.intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Thor Thayer <thor.thayer@linux.intel.com>

The current Cadence QSPI driver sometimes caused a
"rcu_sched self-detected stall" while writing large files.

Stall Report:
'# mtd_debug write /dev/mtd1 0 48816464 blob.img
[ 1815.454227] rcu: INFO: rcu_sched self-detected stall on CPU
[ 1815.459789] rcu:     0-....: (2099 ticks this GP) idle=8c6/1/0x40000002
 softirq=6492/6492 fqs=935
[ 1815.468442] rcu:      (t=2100 jiffies g=8749 q=247)
	<snip> (abbreviated backtrace)
[ 1815.772086] [<c05a3ea0>] (cqspi_exec_flash_cmd) (cqspi_read_reg)
[ 1815.786203] [<c05a5488>] (cqspi_read_reg) from (read_sr)
[ 1815.803790] [<c05a0330>] (read_sr) from
	(spi_nor_wait_till_ready_with_timeout)
[ 1815.816610] [<c05a182c>] (spi_nor_wait_till_ready_with_timeout) from
	(spi_nor_write+0x104/0x1d0)
[ 1815.836791] [<c05a1a44>] (spi_nor_write) from (part_write+0x50/0x58)
	<snip>
[ 1815.997961] cadence-qspi ff809000.spi: Flash command execution timed out.
[ 1816.004733] error -110 reading SR
file_to_flash: write, size 0x2e8e150, n 0x2e8e150
write(): Connection timed out

This was caused by a tight loop in cqspi_wait_for_bit(). Fix by using
readl_relaxed_poll_timeout() which sleeps 10us while polling a register.

Fit onto 80 character line by truncating the bool clear parameter

Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 67f15a1f16fd..7bef63947b29 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -13,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -241,23 +242,13 @@ struct cqspi_driver_platdata {
 
 #define CQSPI_IRQ_STATUS_MASK		0x1FFFF
 
-static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clear)
+static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clr)
 {
-	unsigned long end = jiffies + msecs_to_jiffies(CQSPI_TIMEOUT_MS);
 	u32 val;
 
-	while (1) {
-		val = readl(reg);
-		if (clear)
-			val = ~val;
-		val &= mask;
-
-		if (val == mask)
-			return 0;
-
-		if (time_after(jiffies, end))
-			return -ETIMEDOUT;
-	}
+	return readl_relaxed_poll_timeout(reg, val,
+					  (((clr ? ~val : val) & mask) == mask),
+					  10, CQSPI_TIMEOUT_MS * 1000);
 }
 
 static bool cqspi_is_idle(struct cqspi_st *cqspi)
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
