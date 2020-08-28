Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62142C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 01:14:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07422080C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 01:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrZHZ1uU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Do8Emqvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F07422080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSVdKTSXuOCSnAGYazd4gD5RsPo9Oxhih/aVRaPQ/zo=; b=LrZHZ1uUD5MzIsGrhl1IpSGIyC
	XvANyFqDsHclvEHiCdxsTUgILhBtqbJdTRwHf/Oy/MtuteaiO0X7jfrnCNFhAXjhyxJL6utC4sSDV
	mAX1SyJHCaYN+8vdqIVjq2vsscTes2GlG6TNezfCiPzv1xE4sWxbeEj2H86sPRp7xQ0pU17WxnSCR
	+AQ61T7nVUDqKzgSoD2KCZdE2gCGo9oMe9L+gFVzzfTjXxoiAQ9AvHuaLR9E1CAiuxD9gyShbwtnq
	qjyAyDW2zUIuZX2zUZxQc7aFHBmdFhQiDhylf5VOvBLPRFeYrywosv+089jjBB9r+3zBqDhzmDpwj
	zuuA18oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBSwv-00064y-PT; Fri, 28 Aug 2020 01:13:01 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBSwo-00063A-US
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2020 01:12:56 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 18D8684487;
 Fri, 28 Aug 2020 13:12:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1598577161;
 bh=HzQ2JRxwOvIbNaDzkQVH6yxpHLoPkEl245xKkJP6A9M=;
 h=From:To:Cc:Subject:Date;
 b=Do8EmqvxJfgCyQE0o10P41/CO4lNjrQXyh50aXrRRFV3eROqfbuPK+ToRTX2Gl0ZC
 qTeWHMUfOf5QTEolYcOxZKUYeLJT+sfO8N+pfyrKf4dgvTDUsYuVvguvlbf9MMbdTH
 bBA67naUZo/Q9z7zjS4w70BRqESTrdlf//pz2I+noV8jx9rvc5Jc1eW2l0gObJKWSO
 xoI0g8m3xIqn5M6JSfOjDOWNkqCxRs4jStJj+tT5gB9re062FXNoUlTk3cDd4Sod92
 Y1qy7rliZogberCYDOKHeTK5b6nSUurIjNQrCS+tznWyNbDaBD1xbHHDmngemd7nwq
 Qu2Q1gomvNq7g==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5f485a080000>; Fri, 28 Aug 2020 13:12:40 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id B0E2713EEB7;
 Fri, 28 Aug 2020 13:12:40 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id BF23B280060; Fri, 28 Aug 2020 13:12:40 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: rawnand: marvell: Support panic_write for mtdoops
Date: Fri, 28 Aug 2020 13:12:37 +1200
Message-Id: <20200828011237.22066-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_211255_240519_F48DA625 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Under a panic context we can't get an interrupt. Actively poll for the
RB status when performing a panic_write.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/marvell_nand.c | 38 +++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 8482d3bd8b1f..a81bc50f5ec8 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -685,9 +685,31 @@ static int marvell_nfc_wait_cmdd(struct nand_chip *chip)
 	return marvell_nfc_end_cmd(chip, cs_flag, "CMDD");
 }
 
+static int marvell_nfc_poll_status(struct marvell_nfc *nfc, u32 mask,
+				   u32 expected_val, unsigned long timeout_ms)
+{
+	unsigned long limit;
+	u32 st;
+
+	limit = jiffies + msecs_to_jiffies(timeout_ms);
+	do {
+		st = readl_relaxed(nfc->regs + NDSR);
+		if (st & NDSR_RDY(1))
+			st |= NDSR_RDY(0);
+
+		if ((st & mask) == expected_val)
+			return 0;
+
+		cpu_relax();
+	} while (time_after(limit, jiffies));
+
+	return -ETIMEDOUT;
+}
+
 static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 {
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	u32 pending;
 	int ret;
 
@@ -695,12 +717,18 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 	if (!timeout_ms)
 		timeout_ms = IRQ_TIMEOUT;
 
-	init_completion(&nfc->complete);
+	if (mtd->oops_panic_write) {
+		ret = marvell_nfc_poll_status(nfc, NDSR_RDY(0),
+					      NDSR_RDY(0),
+					      timeout_ms);
+	} else {
+		init_completion(&nfc->complete);
 
-	marvell_nfc_enable_int(nfc, NDCR_RDYM);
-	ret = wait_for_completion_timeout(&nfc->complete,
-					  msecs_to_jiffies(timeout_ms));
-	marvell_nfc_disable_int(nfc, NDCR_RDYM);
+		marvell_nfc_enable_int(nfc, NDCR_RDYM);
+		ret = wait_for_completion_timeout(&nfc->complete,
+						  msecs_to_jiffies(timeout_ms));
+		marvell_nfc_disable_int(nfc, NDCR_RDYM);
+	}
 	pending = marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));
 
 	/*
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
