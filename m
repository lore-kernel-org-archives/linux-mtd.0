Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667BFC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B5B0214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCUmpfRA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="suFuGCVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B5B0214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiwrIR/LBLNcxO/g0Id3xnTwYM+DFDGDcmvYUKVIG9E=; b=qCUmpfRAdpfYPi
	Oj37xDksWXrIWJ2gvN6bwHzRzuY1IYMh6NGiZ+VW54zPp034lf1g+As3cyTFRS1O2Ha/N6t4FlKzR
	S69DhT29+fSJbatqgd8p9NZchWwwAt97uSghrOjCSkuo1m4sVQHhYFUmy9Ufnd9JArYpjACw2cg1A
	FGrWBkbGBzSmc8fR23BRo7nIGaPL75RxYMxm7aa3kVnL6mWnFtc6jiXORG34zHnxX0kFLs3KiFYP/
	a99rqWMnoFV26QPlMIknv9Gvqsyq1xBEsdlPEJkFztgxvmHzZcAsisZ7aWSWiwW37ZJCjKvZUlAav
	mz5d/gTyJm5LbWdIYUlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8y4-0000qZ-0f; Mon, 27 Apr 2020 18:59:00 +0000
Received: from gateway32.websitewelcome.com ([192.185.145.171])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8y1-0000pG-3U
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:58:58 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id E07984FC90
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 13:58:54 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id T8xyjT9mW8vkBT8xyjD54b; Mon, 27 Apr 2020 13:58:54 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FOyZfRjZPBxCQvfUPqDeaCbaMtJlKN1+CtCYhi/tOSY=; b=suFuGCVs7RyNqaM33tnxUFAe1
 E9/FZswXv79NEBrCUMlg+x8b5aiKCsRMAPlskamQJ0gt8W1BVzPU0DpeCqpM4x+VczB5fFSj9GJID
 QfBIrvRhuF2NRXDviV22fgJ9PfwNC2GrMhTUzLdJbQa8EH0YepiP3AIGZ5NCF6TGv58uqFSq4zvGO
 Rp+53roCuI0kwbwx5db+RZqYJx65HNkdzyMu/PIvyhC8qMcxDstLThQ2huGoni0XNoY3/6gcGwsFn
 zQoogUs07/TtLRq893oytfDNK9/t4cSg2fG4dDzoqFZh0YhORdF6Oh7Qr+HBQGbhqwvFlvE2kW8Tv
 BR+OQ6FDw==;
Received: from [201.162.241.110] (port=5852 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jT8xy-000a5x-D5; Mon, 27 Apr 2020 13:58:54 -0500
Date: Mon, 27 Apr 2020 14:03:12 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mtd: lpddr: Replace printk with pr_notice
Message-ID: <c9684a22b661fdeff9efcd5b18be01653911fc89.1588013366.git.gustavo@embeddedor.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1588013366.git.gustavo@embeddedor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.241.110
X-Source-L: No
X-Exim-ID: 1jT8xy-000a5x-D5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.241.110]:5852
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 23
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115857_234803_AB55164C 
X-CRM114-Status: UNSURE (   6.85  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

pr_notice is preferred over printk.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 include/linux/mtd/pfow.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
index c65d7a3be3c6..b1fe2bbfdb04 100644
--- a/include/linux/mtd/pfow.h
+++ b/include/linux/mtd/pfow.h
@@ -127,31 +127,31 @@ static inline void print_drs_error(unsigned dsr)
 	int prog_status = (dsr & DSR_RPS) >> 8;
 
 	if (!(dsr & DSR_AVAILABLE))
-		printk(KERN_NOTICE"DSR.15: (0) Device not Available\n");
+		pr_notice("DSR.15: (0) Device not Available\n");
 	if ((prog_status & 0x03) == 0x03)
-		printk(KERN_NOTICE"DSR.9,8: (11) Attempt to program invalid "
+		pr_notice("DSR.9,8: (11) Attempt to program invalid "
 						"half with 41h command\n");
 	else if (prog_status & 0x02)
-		printk(KERN_NOTICE"DSR.9,8: (10) Object Mode Program attempt "
+		pr_notice("DSR.9,8: (10) Object Mode Program attempt "
 					"in region with Control Mode data\n");
 	else if (prog_status &  0x01)
-		printk(KERN_NOTICE"DSR.9,8: (01) Program attempt in region "
+		pr_notice("DSR.9,8: (01) Program attempt in region "
 						"with Object Mode data\n");
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
+		pr_notice("DSR.3: (1) Vpp low detect, operation "
 					"aborted\n");
 	if (dsr & DSR_PSS)
-		printk(KERN_NOTICE"DSR.2: (1) Program suspended\n");
+		pr_notice("DSR.2: (1) Program suspended\n");
 	if (dsr & DSR_DPS)
-		printk(KERN_NOTICE"DSR.1: (1) Aborted Erase/Program attempt "
+		pr_notice("DSR.1: (1) Aborted Erase/Program attempt "
 					"on locked block\n");
 }
 #endif /* __LINUX_MTD_PFOW_H */
-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
