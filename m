Return-Path: <SRS0=17bk=XI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACF9C4CEC5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2019 09:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE7820CC7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2019 09:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0igRlXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE7820CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fbdeq3G6KKBAZCzcHKscIDvIch7j9ka9+/DY+37qRD0=; b=f0igRlXMRn+FbC
	QpJt8xBzkEuA7nNfGCxk2nRRItZ8k3WCKv5cA9/WJvGfbLpMqFS/190SnCl3um7xlP+A5JfYOV8Hw
	BKR0HnnJZW0Kpku/zuW7u2KzhoUWkfA+SfV6bKAZ000YFEQkyjkYRXMEWvvokphLMZeLVsIe3Aj2o
	KJWCGnBS1BJFO4pWBDjDg3/xO/iGxeRx6Vm9p5mvpqEtxawq7oHGZB9Mwnbmusv5aGKyzSeiz41Vu
	7L7iRyi9MM+6Cdvm/gETAplxXq3kToCRPZU1P6kY2Y2ZgTzC/uUSclOkKDaGiiRqfJQsbP9iQvFSU
	eCMP7h5WC5xhihiKayCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8hn5-0006qu-02; Fri, 13 Sep 2019 09:22:55 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8hn0-0006qN-Ks
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2019 09:22:52 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1i8hmt-00030n-IA; Fri, 13 Sep 2019 09:22:43 +0000
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: fix spelling mistake "gravepagess" ->
 "gravepages"
Date: Fri, 13 Sep 2019 10:22:43 +0100
Message-Id: <20190913092243.7399-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_022250_818173_2FAA6449 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a NS_ERR error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/nandsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 9a70754a61ef..76c31d1dea31 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -910,7 +910,7 @@ static int parse_gravepages(void)
 		zero_ok = (*g == '0' ? 1 : 0);
 		page_no = simple_strtoul(g, &g, 0);
 		if (!zero_ok && !page_no) {
-			NS_ERR("invalid gravepagess.\n");
+			NS_ERR("invalid gravepages.\n");
 			return -EINVAL;
 		}
 		max_reads = 3;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
