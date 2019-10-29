Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BFCCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 08:54:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D63A20663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 08:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jW+o6nZx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D63A20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/sjncFq2K4m1sGOiHOFf5aDfeH9oBsxjFDMDen7YDpk=; b=jW+o6nZxpbnYgW
	hDdTJr3FHPo038qJhFBqX6qQbDunFYY/56bYu/GQjB/rARAs6Qf02puBEQifz7ks9FjoTb6JQ4UWJ
	O4FLNLSyS137xpa6HQ88hokMXbOeuQbhjthlUjAiLCq75W5Clfyzq5xKFyp6DWGAut/tvAxUbqbuM
	t8py7HL3sDZGzBhxlXPcHxBHvSqNsK7S6c9OP9mDoKNxGo2JIR2p4tozUS5fUqTIzY8Cj6dlrJkya
	4nisHKjF3rx2aq3AZNkBxE88IwXVU1TKf/suR/eTCTC9QybtErvWj0TsLgFzPK/86p4Tp4fsUS9Xk
	XmOnV/mRSeKWxC65MDLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPNGX-0006xN-To; Tue, 29 Oct 2019 08:54:13 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNGP-0006vD-BQ
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 08:54:06 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D8AEA5E32F7D3CF7C640;
 Tue, 29 Oct 2019 16:53:55 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 29 Oct 2019
 16:53:48 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <dedekind1@gmail.com>,
 <yi.zhang@huawei.com>
Subject: [PATCH] ubifs: do_kill_orphans: Fix a memory leak bug
Date: Tue, 29 Oct 2019 17:01:10 +0800
Message-ID: <1572339670-68694-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_015405_577653_BC05D41C 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If there are more than one valid snod on the sleb->nodes list,
do_kill_orphans will malloc ino more than once without releasing
previous ino's memory. Finally, it will trigger memory leak.

Fixes: ee1438ce5dc4 ("ubifs: Check link count of inodes when...")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
---
 fs/ubifs/orphan.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 3b4b411..f211ed3 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -673,9 +673,11 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		if (first)
 			first = 0;
 
-		ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
-		if (!ino)
-			return -ENOMEM;
+		if (!ino) {
+			ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
+			if (!ino)
+				return -ENOMEM;
+		}
 
 		n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
 		for (i = 0; i < n; i++) {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
