Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14BC41513
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8/F6rQLPBTnENOFTAN4cEVzk+246Untj/nNrLEryxM=; b=UqWUfMeSgEG+oh
	Zoc7aaq2ZL2TyxYBRyJ+U+Dg/2LUQotS4/NxHzNc8MKC53M6s1bw7WE6XAMiT6z1mZQMql5JAaCci
	i1E4BrCO1MPZk2nMSeWwgN/yPP3EjLaK0gqC5VpV3EQilbI7CjOBUXhq33QbH3jpx4YabmjgzjoYI
	0VdQ9pkWddx3G3xSuAN6ZD1KEXx/uJkOgEGwAPV46KCbPAu6gxq9+GlO+zjXcc2dq2BPRL6QDsFQr
	CK30t3/6czmmNLFMD/Dg1qIWJnbHGPPhgeqgSB1sj0nimViQmeM+7gxbPRhPAIMFMpzBbTo8+iX7+
	QuGVRJ8yUrpfJ1Linc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHEA-00000003uSC-1H4L;
	Wed, 29 May 2024 11:12:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHE4-00000003uQZ-3VZK
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 11:12:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Vq67K4Dr4zwQPT;
	Wed, 29 May 2024 19:08:13 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E7BF180A9C;
	Wed, 29 May 2024 19:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 29 May
 2024 19:12:00 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] ubifs: dbg_check_ltab: Fix wrong lprops table information caused by missing pnode checking
Date: Wed, 29 May 2024 19:12:19 +0800
Message-ID: <20240529111219.3964764-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529111219.3964764-1-chengzhihao1@huawei.com>
References: <20240529111219.3964764-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_041213_065544_F804D248 
X-CRM114-Status: GOOD (  15.75  )
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

The lprops table information calculation depends on the scanning results
in LPT area, and the dirty space calculation depends on the dirty state
of each node. If pnode cannot be found in the LPT tree, the pnode is judged
as dirty(See dbg_is_pnode_dirty). So the dirty space could be more than
the actual value when there exists pnode not traversed, for example:
The max_leb_cnt of the UBIFS image is 1024 and the leb_cnt is 300, it could
have 1014 main LEBs at most and DIV_ROUND_UP(main_lebs, UBIFS_LPT_FANOUT) =
254 pnodes at most. Now, the image has 300 LEBs and it is loaded into a
volume with 1022 LEBs, it has 1012 main LEBs after auto-resizing, the
traversing results in dbg_is_pnode_dirty() are shown as:
                           n1 (lv4, root)
		n4    n5     n6     n7 (lv3)
          n16 n20 n24 n28 ....    n19 n23 n27 n31 (lv2)
   n64 n80 ...                          n79 n95 n111 | n127 (lv1)
p0 p1 ...                                p251 | p252 | p253 p254 p255 (lv0)
0,1,2 ...              1004 1005 1006 1007 | 1008 1009 1010 1011 | NA

According to implementations in dbg_is_pnode_dirty, the pnodes p253, p254,
p255 are not traversed and they are wrongly judged as dirty, because the
max main LEB number is 1011.

Fix it by traversing pnodes without limiting LEB number under main_lebs.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/lpt_commit.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 9a477924c978..52f091593615 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1509,24 +1509,27 @@ static int dbg_is_nnode_dirty(struct ubifs_info *c, int lnum, int offs)
  */
 static int dbg_is_pnode_dirty(struct ubifs_info *c, int lnum, int offs)
 {
-	int i, cnt;
+	struct ubifs_pnode *pnode;
 
-	cnt = DIV_ROUND_UP(c->main_lebs, UBIFS_LPT_FANOUT);
-	for (i = 0; i < cnt; i++) {
-		struct ubifs_pnode *pnode;
+	pnode = ubifs_pnode_lookup(c, 0);
+	if (IS_ERR(pnode))
+		return PTR_ERR(pnode);
+	while (pnode) {
 		struct ubifs_nbranch *branch;
 
-		cond_resched();
-		pnode = ubifs_pnode_lookup(c, i);
-		if (IS_ERR(pnode))
-			return PTR_ERR(pnode);
 		branch = &pnode->parent->nbranch[pnode->iip];
 		if (branch->lnum != lnum || branch->offs != offs)
-			continue;
+			goto next_pnode;
 		if (test_bit(DIRTY_CNODE, &pnode->flags))
 			return 1;
 		return 0;
+next_pnode:
+		pnode = find_next_pnode(c, pnode);
+		if (IS_ERR(pnode))
+			return PTR_ERR(pnode);
+		cond_resched();
 	}
+
 	return 1;
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
