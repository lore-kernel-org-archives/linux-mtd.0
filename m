Return-Path: <SRS0=9k8X=RF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF034C43381
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Mar 2019 19:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D87B20838
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Mar 2019 19:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+xsyc0L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D87B20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RDngJmgLvKKABEPCCqIQcgieeJUat/7NoHF7hJqM380=; b=m+xsyc0Lnwxcye
	eKcZ9spx8ns44EWu5oZQe+YpEnXpMiuzs5h/IFyVbk2aWRomIu83rbGqkXMjXGccs0OjaJe5nYIMq
	1vT3PIcskTVxGWrMErZrZqeJn/byCPn1H4nIIhTGD06qrg6ngcq9r9seZr9y5x6EyrOfO03n63VRN
	79wHlos5WziNfILzJYbeX4vzEDMPXIW0EE1KJb2ZVqNOTE+rSV8X1FTc7mIxnvlZ5ls6w801TCRaa
	gM2fbNgvI/mxnQ6OresyfV/K3yA1Xxr/ZaXwC9qg4WqyRzL4mb2v3F0jaAruQTtdX6CjOqKn7zRsq
	P3luYkMvY7z0yr0hdHxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0Amy-0005xL-DZ; Sat, 02 Mar 2019 19:59:16 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.179])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0Amv-0005wc-Az
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2019 19:59:14 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 887585398
 for <linux-mtd@lists.infradead.org>; Sat,  2 Mar 2019 13:59:10 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 0AmshXAx290on0Amshr7Ft; Sat, 02 Mar 2019 13:59:10 -0600
X-Authority-Reason: nr=8
Received: from [189.250.88.58] (port=49572 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1h0Amr-003h9r-2T; Sat, 02 Mar 2019 13:59:09 -0600
Date: Sat, 2 Mar 2019 13:59:07 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: ubi: wl: Fix uninitialized variable
Message-ID: <20190302195907.GA16022@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.88.58
X-Source-L: No
X-Exim-ID: 1h0Amr-003h9r-2T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.88.58]:49572
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 14
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190302_115913_424583_824255BF 
X-CRM114-Status: GOOD (  11.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is a potential execution path in which variable *err*
is compared against UBI_IO_BITFLIPS without being properly
initialized previously.

Fix this by initializing variable *err* to 0.

Addresses-Coverity-ID: 1477298 "(Uninitialized scalar variable")
Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 40f838d54b0f..cf07d869724f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1475,7 +1475,7 @@ static bool scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *e)
  */
 int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
 {
-	int err;
+	int err = 0;
 	struct ubi_wl_entry *e;
 
 	if (pnum < 0 || pnum >= ubi->peb_count) {
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
