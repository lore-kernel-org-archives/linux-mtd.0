Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A504C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 19:59:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516B02072E
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 19:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qeb3jx3m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516B02072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BQX4p5/REy5B96lYHS4EY3EPNQLqFPl42dchQYgYB4=; b=qeb3jx3mko3qEn
	GUi+wJIodMg9jCJK97Mi+3wo4OSHKRQUUpWvQyhM7tCjup5vHMxwnQJC5o2hol7kPTvLGzHQNx2XF
	wqiHsjfjm+ATBxl+lohQLF/dzhQJskibQa+8meXTraQVx4KB+9XWArvZNcd/SzEsoHkyvZdeVa3g4
	xYONgeo1t2GYR3GgjN4dK0wS4CyEBIy55AdWw0SZOhbzN0UD4puzG+PxgSLy9OyJnt+5C9pI9efJ0
	l3nIMuNIFCUZFKMn8lnzydGqUJcLJTtrfHLcX2nJr1Qb1POGcnm/6N2jCBaEr0ZHZi3ffjKApf4dG
	vabIZFCn9nL/bAtAYDcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ0Yr-0000YX-BD; Mon, 30 Mar 2020 19:59:05 +0000
Received: from smtprelay0162.hostedemail.com ([216.40.44.162]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ0Yn-0000X1-V4
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 19:59:03 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id E51E6100E8429;
 Mon, 30 Mar 2020 19:58:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: fly44_309b3b9d6ae39
X-Filterd-Recvd-Size: 3647
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Mon, 30 Mar 2020 19:58:53 +0000 (UTC)
Message-ID: <2e19547dcec386b47923211896f43053b60ebc60.camel@perches.com>
Subject: [RFC PATCH] mtd: lpddr: Fix bad logic in print_drs_error
From: Joe Perches <joe@perches.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Mon, 30 Mar 2020 12:56:59 -0700
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_125902_063239_42A28C13 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update logic for broken test.
Use a more common logging style.

Miscellanea:

o Coalesce formats

Signed-off-by: Joe Perches <joe@perches.com>
---

Found by inspection of include files using printk.

It appears the logic in this function is broken for the
consecutive tests of

	if (prog_status & 0x3)
		...
	else if (prog_status & 0x2)
		...
	else (prog_status & 0x1)
		...

Likely the first test should be

	if ((prog_status & 0x3) == 0x3)

And this function is only used in drivers/mtd/lpddr/lpddr_cmds.c
perhaps it should be moved there.

 include/linux/mtd/pfow.h | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
index 122f343..1c08e75 100644
--- a/include/linux/mtd/pfow.h
+++ b/include/linux/mtd/pfow.h
@@ -127,31 +127,28 @@ static inline void print_drs_error(unsigned dsr)
 	int prog_status = (dsr & DSR_RPS) >> 8;
 
 	if (!(dsr & DSR_AVAILABLE))
-		printk(KERN_NOTICE"DSR.15: (0) Device not Available\n");
-	if (prog_status & 0x03)
-		printk(KERN_NOTICE"DSR.9,8: (11) Attempt to program invalid "
-						"half with 41h command\n");
+		pr_notice("DSR.15: (0) Device not Available\n");
+
+	if ((prog_status & 0x03) == 0x03)
+		pr_notice("DSR.9,8: (11) Attempt to program invalid half with 41h command\n");
 	else if (prog_status & 0x02)
-		printk(KERN_NOTICE"DSR.9,8: (10) Object Mode Program attempt "
-					"in region with Control Mode data\n");
+		pr_notice("DSR.9,8: (10) Object Mode Program attempt in region with Control Mode data\n");
 	else if (prog_status &  0x01)
-		printk(KERN_NOTICE"DSR.9,8: (01) Program attempt in region "
-						"with Object Mode data\n");
+		pr_notice("DSR.9,8: (01) Program attempt in region with Object Mode data\n");
+
 	if (!(dsr & DSR_READY_STATUS))
-		printk(KERN_NOTICE"DSR.7: (0) Device is Busy\n");
+		pr_notice("DSR.7: (0) Device is Busy\n");
 	if (dsr & DSR_ESS)
-		printk(KERN_NOTICE"DSR.6: (1) Erase Suspended\n");
+		pr_notice("DSR.6: (1) Erase Suspended\n");
 	if (dsr & DSR_ERASE_STATUS)
-		printk(KERN_NOTICE"DSR.5: (1) Erase/Blank check error\n");
+		pr_notice("DSR.5: (1) Erase/Blank check error\n");
 	if (dsr & DSR_PROGRAM_STATUS)
-		printk(KERN_NOTICE"DSR.4: (1) Program Error\n");
+		pr_notice("DSR.4: (1) Program Error\n");
 	if (dsr & DSR_VPPS)
-		printk(KERN_NOTICE"DSR.3: (1) Vpp low detect, operation "
-					"aborted\n");
+		pr_notice("DSR.3: (1) Vpp low detect, operation aborted\n");
 	if (dsr & DSR_PSS)
-		printk(KERN_NOTICE"DSR.2: (1) Program suspended\n");
+		pr_notice("DSR.2: (1) Program suspended\n");
 	if (dsr & DSR_DPS)
-		printk(KERN_NOTICE"DSR.1: (1) Aborted Erase/Program attempt "
-					"on locked block\n");
+		pr_notice("DSR.1: (1) Aborted Erase/Program attempt on locked block\n");
 }
 #endif /* __LINUX_MTD_PFOW_H */



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
