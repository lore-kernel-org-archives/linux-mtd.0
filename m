Return-Path: <SRS0=/ENy=75=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489C3C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCF22074D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2020 07:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bOsCcLEk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCF22074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLUKDbPun2DimN+EcDPg/iyhXtgNhZGklhqh0Oz8ZaY=; b=bOsCcLEkojdKHk
	TPsPc7TKFCo86yJf6nIcMNR6e9zwydaiERitDx58KSM93yeS5eqe9n8anme5gpUkyZOO3TtZANduY
	aydSV07k6jymuh4lh6PGpECfjfZHV03ymHySt1WT7BKX14r3R8yCpu2XTlKZFKCe7ZO7h4UMbuMqZ
	P517zxalc8ED5ViVVPGlAn0JMBy2R/nhGpSudwjglEuwFdo+SSN+pwdqmCe8cPntdYNAciKeOZUXM
	xHcwA9b1pxlxns0DmLz9caHYTXgSSd12stPXdSmrDl8LO3b+s0B6ICJEKGEJWg812a46A5U1fhL2L
	V1thE+fz8aRWqgMPgTww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl5lB-0007ZM-Go; Tue, 16 Jun 2020 07:11:53 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl5kF-0006bb-VD
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2020 07:10:57 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C89E5D6E242227FF4D68;
 Tue, 16 Jun 2020 15:10:43 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 15:10:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC 4/5] ubifs: ubifs_dump_sleb: Remove unused function
Date: Tue, 16 Jun 2020 15:11:45 +0800
Message-ID: <20200616071146.2607061-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200616071146.2607061-1-chengzhihao1@huawei.com>
References: <20200616071146.2607061-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_001056_203179_D55D76D3 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: richard@nod.at, liu.song11@zte.com.cn, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Function ubifs_dump_sleb() is defined but unused, it can be removed.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/debug.c | 16 ----------------
 fs/ubifs/debug.h |  2 --
 2 files changed, 18 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 24a6e6fb5e9a..2d07615369f9 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -828,22 +828,6 @@ void ubifs_dump_lpt_info(struct ubifs_info *c)
 	spin_unlock(&dbg_lock);
 }
 
-void ubifs_dump_sleb(const struct ubifs_info *c,
-		     const struct ubifs_scan_leb *sleb, int offs)
-{
-	struct ubifs_scan_node *snod;
-
-	pr_err("(pid %d) start dumping scanned data from LEB %d:%d\n",
-	       current->pid, sleb->lnum, offs);
-
-	list_for_each_entry(snod, &sleb->nodes, list) {
-		cond_resched();
-		pr_err("Dumping node at LEB %d:%d len %d\n",
-		       sleb->lnum, snod->offs, snod->len);
-		ubifs_dump_node(c, snod->node);
-	}
-}
-
 void ubifs_dump_leb(const struct ubifs_info *c, int lnum)
 {
 	struct ubifs_scan_leb *sleb;
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 42610fa5f3a7..ed966108da80 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -252,8 +252,6 @@ void ubifs_dump_lprop(const struct ubifs_info *c,
 void ubifs_dump_lprops(struct ubifs_info *c);
 void ubifs_dump_lpt_info(struct ubifs_info *c);
 void ubifs_dump_leb(const struct ubifs_info *c, int lnum);
-void ubifs_dump_sleb(const struct ubifs_info *c,
-		     const struct ubifs_scan_leb *sleb, int offs);
 void ubifs_dump_znode(const struct ubifs_info *c,
 		      const struct ubifs_znode *znode);
 void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap,
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
