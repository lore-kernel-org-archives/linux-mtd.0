Return-Path: <SRS0=Ia6G=Z2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A696AC2BBE2
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 10:10:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B88A2077B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 10:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="he4tYcLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B88A2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVsQYD5dCDoMT4y3xi8HLuf0uAkkttlFfkEZE6KIXYA=; b=he4tYcLikNGSsE
	3hJyTkOdK744+n4Qi0ATOvNLeV0GfDgh/MlTEpvfDQ0hSa83Bq/cXNLRGLzP9WL6AZOrne/EW3xGv
	iVeXgWY8/7/0IMGmTcXDH2/I8G0uwZ/R9tEUJ7S7+X4hNBBtNsnr9EVt8TVAi8mTHgmi/XATjtO8N
	IR32qo4aWaPzM/3Jzrtj0CTCJ2z15XVaFpMJIXb6jOdi+fOi5+xg3s43pw1q1zgxYTdQIawMlu63F
	EedHZ6RFSFCBXEdtOx4FP3PsrzayfeOc6lhLYatkZ48d7GW4p34/EpBxeRxVmV2dmmyF3CEw7ItEr
	ionD5/L3X82z4YHFqgmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icRbt-0005qf-57; Wed, 04 Dec 2019 10:10:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icRbq-0005qC-O7
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2019 10:10:16 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1icRbp-0006Wr-D3; Wed, 04 Dec 2019 11:10:13 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1icRbp-0006lF-00; Wed, 04 Dec 2019 11:10:13 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Fix wrong memory allocation
Date: Wed,  4 Dec 2019 11:09:58 +0100
Message-Id: <20191204100958.19938-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_021014_785875_989066DC 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, stable@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In create_default_filesystem() when we allocate the idx node we must use
the idx_node_size we calculated just one line before, not tmp, which
contains completely other data.

Fixes: c4de6d7e4319 ("ubifs: Refactor create_default_filesystem()")
Cc: stable@vger.kernel.org # v4.20+
Reported-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
Tested-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 2b7c04bf8983..17c90dff7266 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -161,7 +161,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	sup = kzalloc(ALIGN(UBIFS_SB_NODE_SZ, c->min_io_size), GFP_KERNEL);
 	mst = kzalloc(c->mst_node_alsz, GFP_KERNEL);
 	idx_node_size = ubifs_idx_node_sz(c, 1);
-	idx = kzalloc(ALIGN(tmp, c->min_io_size), GFP_KERNEL);
+	idx = kzalloc(ALIGN(idx_node_size, c->min_io_size), GFP_KERNEL);
 	ino = kzalloc(ALIGN(UBIFS_INO_NODE_SZ, c->min_io_size), GFP_KERNEL);
 	cs = kzalloc(ALIGN(UBIFS_CS_NODE_SZ, c->min_io_size), GFP_KERNEL);
 
-- 
2.24.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
