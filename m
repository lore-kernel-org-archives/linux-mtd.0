Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1F5C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:50:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7E1206B8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLeN8QQ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="ZSmL+PjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7E1206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM8/U/cxADUOrOYfUNz3U6ORi4jjSPSNCVv/a5lszT8=; b=aLeN8QQ2hFVtOm
	NDxm95uOlYabu+s8/fIupvdxVmA0qEl4IJB9VRzLoEig0Bw/jNipmIXlHJDMx3R/4A8nH/ce0SWpm
	wQTnTIftImecbVHhz9aVFi/Hun55wd64au/zgvNICzkqGnB+PLsNqiWogatrMlXed/wRpDO7i35f9
	Z0BG9C4KJxxgPO5WH+Vc+V06t6HsQwizCi4Z4ZNvJ2ZtXcLLHLR/bKfJ+PAp3pYAwMe2t8NUAbfMU
	CojfUHizD4dNTFdWkcqpf/dW0K5enfrB/cuLCO01z7gfJEVVlJ/lzB3NUYuniKO9bDz24qNJwNrdP
	VHOtU9H9pocaXC901qxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9lR-0002ur-2z; Mon, 27 Apr 2020 19:50:01 +0000
Received: from gateway23.websitewelcome.com ([192.185.47.80])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9lN-0002sG-G5
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:49:59 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id D48648A9C
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 14:49:55 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id T9lLjU6IS8vkBT9lLjE186; Mon, 27 Apr 2020 14:49:55 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0MbhRJ5eD5Y7+MhsOSEX8wmNhxsr/DO77LwRTLGH3A=; b=ZSmL+PjA81Nrs3oA6zFvWX8UD
 szqbmabAC2zJN0+NbVZIJZS9fl4YVzBjZN9U9oeVNwK17BJwciwyrNoUS/WMLt9JVWAhPE/u9VV7N
 W9Tlz2agUZaTpuFHYuQzJnbMiIg7E36Uykv2YGBSH4BoMNERDWPKMXhL7ArqZmOP+c7o0hDOlYo3y
 U3nGorclYR1qwzuAzQ6EG6bubV3EN4J+b0Dwc4Ewxa2VrGSv9hEZv7LIseCy1l3ck/uuqgO/+8HWQ
 VCX8gak32LTN7skd94nuBR8xceCcvA6Td7/QEkWXrA8edxzXY42nfzmFchibgzOEgZa1F6eiVokCd
 OayKG4aIw==;
Received: from [201.162.241.110] (port=6103 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jT9lL-000zx6-BA; Mon, 27 Apr 2020 14:49:55 -0500
Date: Mon, 27 Apr 2020 14:54:13 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mtd: lpddr: Replace printk with pr_notice
Message-ID: <ff48ce07ef208ba65b858f09279a3b36031d64d2.1588016644.git.gustavo@embeddedor.com>
References: <cover.1588016644.git.gustavo@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1588016644.git.gustavo@embeddedor.com>
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
X-Exim-ID: 1jT9lL-000zx6-BA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.241.110]:6103
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 35
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_124957_648239_5C2BCA61 
X-CRM114-Status: UNSURE (   7.22  )
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

Also, coalesce formats as coalescing is part of coding-style:
"never break user-visible strings such as printk messages"

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Coalesce formats and update changelog text, accordingly.

 include/linux/mtd/pfow.h | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
index c65d7a3be3c6..cd21c6768065 100644
--- a/include/linux/mtd/pfow.h
+++ b/include/linux/mtd/pfow.h
@@ -127,31 +127,26 @@ static inline void print_drs_error(unsigned dsr)
 	int prog_status = (dsr & DSR_RPS) >> 8;
 
 	if (!(dsr & DSR_AVAILABLE))
-		printk(KERN_NOTICE"DSR.15: (0) Device not Available\n");
+		pr_notice("DSR.15: (0) Device not Available\n");
 	if ((prog_status & 0x03) == 0x03)
-		printk(KERN_NOTICE"DSR.9,8: (11) Attempt to program invalid "
-						"half with 41h command\n");
+		pr_notice("DSR.9,8: (11) Attempt to program invalid half with 41h command\n");
 	else if (prog_status & 0x02)
-		printk(KERN_NOTICE"DSR.9,8: (10) Object Mode Program attempt "
-					"in region with Control Mode data\n");
+		pr_notice("DSR.9,8: (10) Object Mode Program attempt in region with Control Mode data\n");
 	else if (prog_status &  0x01)
-		printk(KERN_NOTICE"DSR.9,8: (01) Program attempt in region "
-						"with Object Mode data\n");
+		pr_notice("DSR.9,8: (01) Program attempt in region with Object Mode data\n");
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
-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
