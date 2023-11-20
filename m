Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B56C5AD4C
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xsmhnn5iwJqvOgnsAfhkeytq5nLy112e5BJbRpwpx6E=; b=VJJdyaBiaDPp8U
	/z1IvYSP+WoHmpIXCOWHW+P0NTeDE9PixvrsRjAWW+SPNEcBK2XirjA9yOmUCHfwTbJmDmqbYqTbw
	6Uq2KJKtE4ay70OvUtlzWM8xjK/sgZhZjz/2oRdyZw7mA7x6YIXlg7me7q4ItDultbE3dVO3/diyn
	c1dwX76BZsaH926gj2kf5D640hDU3zbf+2ePT8dmN4tJnppphP9THA/5GCFeMuoAdXlcjKdolFeOY
	TN8y4btYhLa9ErMSvH0e+OG7WKjMYCSuLfjK7dpzrqV6T9x+73ogNUedzn0Shl9DTykcfpNP7T9nh
	/TwHWEeYTnD+EeI9Wsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4upT-00B0sI-0s;
	Mon, 20 Nov 2023 03:20:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4upO-00B0os-2S
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 03:20:04 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SYXmQ11N8zWhYP;
	Mon, 20 Nov 2023 11:19:18 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 Nov
 2023 11:19:47 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <Carson.Li1@unisoc.com>, <s.hauer@pengutronix.de>,
	<houtao1@huawei.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ubifs: Check @c->dirty_[n|p]n_cnt and @c->nroot state under @c->lp_mutex
Date: Mon, 20 Nov 2023 19:13:45 +0800
Message-ID: <20231120111347.2254153-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111347.2254153-1-chengzhihao1@huawei.com>
References: <20231120111347.2254153-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_192002_984182_D5D41BF4 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The checking of @c->nroot->flags and @c->dirty_[n|p]n_cnt in function
nothing_to_commit() is not atomic, which could be raced with modifying
of lpt, for example:
       P1        P2        P3
run_gc
 ubifs_garbage_collect
              do_commit
 ubifs_return_leb
  ubifs_lpt_lookup_dirty
   dirty_cow_nnode
                       do_commit
			nothing_to_commit
			 if (test_bit(DIRTY_CNODE, &c->nroot->flags)
			 // false
   test_and_set_bit(DIRTY_CNODE, &nnode->flags)
   c->dirty_nn_cnt += 1
                         ubifs_assert(c, c->dirty_nn_cnt == 0)
			 // false !

Fetch a reproducer in Link:
 UBIFS error (ubi0:0 pid 2747): ubifs_assert_failed
 UBIFS assert failed: c->dirty_pn_cnt == 0, in fs/ubifs/commit.c
 Call Trace:
  ubifs_ro_mode+0x58/0x70 [ubifs]
  ubifs_assert_failed+0x6a/0x90 [ubifs]
  do_commit+0x5b7/0x930 [ubifs]
  ubifs_run_commit+0xc6/0x1a0 [ubifs]
  ubifs_sync_fs+0xd8/0x110 [ubifs]
  sync_filesystem+0xb4/0x120
  do_syscall_64+0x6f/0x140

Fix it by checking @c->dirty_[n|p]n_cnt and @c->nroot state with
@c->lp_mutex locked.

Fixes: 944fdef52ca9 ("UBIFS: do not start the commit if there is nothing to commit")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218162
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/commit.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index c4fc1047fc07..5b3a840098b0 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -69,6 +69,14 @@ static int nothing_to_commit(struct ubifs_info *c)
 	if (c->zroot.znode && ubifs_zn_dirty(c->zroot.znode))
 		return 0;
 
+	/*
+	 * Increasing @c->dirty_pn_cnt/@c->dirty_nn_cnt and marking
+	 * nnodes/pnodes as dirty in run_gc() could race with following
+	 * checking, which leads inconsistent states between @c->nroot
+	 * and @c->dirty_pn_cnt/@c->dirty_nn_cnt, holding @c->lp_mutex
+	 * to avoid that.
+	 */
+	mutex_lock(&c->lp_mutex);
 	/*
 	 * Even though the TNC is clean, the LPT tree may have dirty nodes. For
 	 * example, this may happen if the budgeting subsystem invoked GC to
@@ -76,12 +84,15 @@ static int nothing_to_commit(struct ubifs_info *c)
 	 * free space. In this case GC would just change the lprops of this
 	 * LEB (by turning all space into free space) and unmap it.
 	 */
-	if (c->nroot && test_bit(DIRTY_CNODE, &c->nroot->flags))
+	if (c->nroot && test_bit(DIRTY_CNODE, &c->nroot->flags)) {
+		mutex_unlock(&c->lp_mutex);
 		return 0;
+	}
 
 	ubifs_assert(c, atomic_long_read(&c->dirty_zn_cnt) == 0);
 	ubifs_assert(c, c->dirty_pn_cnt == 0);
 	ubifs_assert(c, c->dirty_nn_cnt == 0);
+	mutex_unlock(&c->lp_mutex);
 
 	return 1;
 }
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
