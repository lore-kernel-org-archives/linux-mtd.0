Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C64C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F24C20848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHSZb5aG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yy2ZH6iE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F24C20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=112F8qR2exbF1SM1M73Q/i2Xo99TO/KQvPu0GS1h95M=; b=LHSZb5aGS5sGifIMA64ay7rbx
	3lMU/extSqY99llY2AHdDRXPnTZx/W2p+4uAq4bw4/LtHO69C7cBiuUbl8nXvqmHJuMvEpBYwbG5y
	9y95dMPjrYl4uH36ic1y/GKZ1DMyRAGWmAqCI3SZCk2KPaV58sx+dzKoL2mwz1s4wvLxeL4vvXXnh
	RZIxfz+QXFIOKl1NjGfHIChaKBXlKdT/C6ytd34e9rQPNa4hPamfuo/brX1b+2CR65pYas5iOjFSD
	zCcHhDX8nzy0yLFvhq2x7Li95MyY5Oa4hQN+Cdu0WmsB055JPu9ezWVQ1ETBUd1C6SGNoz6Y1Gu45
	kCWLlsMaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTPjP-0006ga-9p; Fri, 16 Oct 2020 13:25:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPjN-0006gF-BH
 for linux-mtd@merlin.infradead.org; Fri, 16 Oct 2020 13:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Yoy4Bitu4N8nQBFX3fGLt0YTSjtnYSQ3PQcHpLFTfPM=; b=Yy2ZH6iET6bUUx5WoXn/WWSExN
 sEa+P6VWLCSSWiAVgXaAdn/oxlgL7j92FEJZjSABfOXjMeZaamQv78UXL1bqzMo+reae0hFXtJa+L
 +j3XLWYVaSn2hgy4Bk8mKH3wpca/whjEdDeP5JBZOFFUV3hg2I6F8kncDR193s+Wy/uyO2ndMpe0m
 OgoU2WPXTFVMOJts4uVlAG3eRPjVm3BNzihDXN+UU3tivHoR31eDzTeFDOBh+tdWA8WC4pHD4Prye
 NYWqNf7BHmnWyPKdZruBeIxiDwumEhmXvwywsBbJqi/U7GxGovSPUYk+b/AF0VOi2QFvlJiNG9eJe
 y/e9Ajow==;
Received: from 213-225-9-134.nat.highway.a1.net ([213.225.9.134]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPjL-00032E-SV; Fri, 16 Oct 2020 13:25:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH 1/9] pstore/zone: cap the maximum device size
Date: Fri, 16 Oct 2020 15:20:39 +0200
Message-Id: <20201016132047.3068029-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016132047.3068029-1-hch@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Introduce an abritrary 128MiB cap to avoid malloc failures when using
a larger block device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/pstore/zone.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 3ce89216670c9b..5266ccbec007f3 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -1299,6 +1299,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
 		pr_warn("total_size must be >= 4096\n");
 		return -EINVAL;
 	}
+	if (info->total_size > SZ_128M) {
+		pr_warn("capping size to 128MiB\n");
+		info->total_size = SZ_128M;
+	}
 
 	if (!info->kmsg_size && !info->pmsg_size && !info->console_size &&
 	    !info->ftrace_size) {
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
