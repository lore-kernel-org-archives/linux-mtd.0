Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D688AC27C44
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpn2n8z3BmOB3S11oXyb+5BzQQBGPmAW9PFE2TuhFtY=; b=ZDKvFGbFRLncBw
	q/0RBt3wj3BwDJC8ivN0gzTC2/+EwrKADJI41blo2smT/bb92j4CrzUT7MwmtnJ1Ai8nI5c8EGAt/
	/+el2i7h52RO4TI5Jb/9Cui4KsS64K/7lZkewciY+H3vjMVYXtyD0q1D+/zXr/tan1zDokS47nspP
	sl5PmDB8Uuzg0GUTrB3juORo1gb8U+432ofp2HY0AhNeAnFjpcNPc8dQ8WDmo0CHE7Qiq9gvif8Jt
	IlGazUZtlLFT8bRuEWLwKAIrKP7le0Hz4mhPec9WEu/4s6U7B5BByJD7OHFE6ZvqJIfODhHeeWn8d
	yU1EgKBsjeBljTTIXMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHED-00000003uTe-1dYi;
	Wed, 29 May 2024 11:12:21 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHE6-00000003uQa-26aa
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 11:12:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Vq67K2FPxz1JCft;
	Wed, 29 May 2024 19:08:13 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 960371404F6;
	Wed, 29 May 2024 19:12:00 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 29 May
 2024 19:12:00 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] ubifs: dbg_check_ltab: Fix wrong lprops table information caused by missing nnode loading
Date: Wed, 29 May 2024 19:12:18 +0800
Message-ID: <20240529111219.3964764-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529111219.3964764-1-chengzhihao1@huawei.com>
References: <20240529111219.3964764-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_041214_928695_F7889DCE 
X-CRM114-Status: GOOD (  17.61  )
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
of each node. If nnode cannot be found in the LPT tree, the nnode is judged
as dirty(See dbg_is_nnode_dirty). So the dirty space could be more than
the actual value when there exists nnode not loaded from disk, for example:
The max_leb_cnt of the UBIFS image is 1024 and the leb_cnt is 300, it could
have 1014 main LEBs at most and DIV_ROUND_UP(main_lebs, UBIFS_LPT_FANOUT) =
254 pnodes at most. Now, the image has 300 LEBs and it is loaded into a
volume with 1018 LEBs, it has 1008 main LEBs after auto-resizing, the
loaded LPT tree is shown as:
                           n1 (lv4, root)
		n4    n5     n6     n7 (lv3)
          n16 n20 n24 n28 ....    n19 n23 n27 n31 (lv2)
   n64 n80 ...                          n79 n95 n111 | n127 (lv1)
p0 p1 ...                                p251 | p252 p253 p254 p255 (lv0)
0,1,2 ...                        1004 1005 1006 1007 | NA

According to the implementations in dbg_check_ltab(), the nnode n127 is not
loaded, because the max main LEB number is 1007, so the biggest pnodes
(p252,p253,p254,p255) and their parent nnode n127 are not read from didk.
Then we get the following error messages from dbg_check_ltab():
 dbg_check_ltab: invalid dirty space in LEB 7 (dirty 384, expected 372)

Fix it by traversing LPT nodes without limiting LEB number under main_lebs.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/lpt_commit.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 07351fdce722..9a477924c978 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -541,16 +541,15 @@ static int write_cnodes(struct ubifs_info *c)
 }
 
 /**
- * next_pnode_to_dirty - find next pnode to dirty.
+ * find_next_pnode - find next pnode.
  * @c: UBIFS file-system description object
  * @pnode: pnode
  *
- * This function returns the next pnode to dirty or %NULL if there are no more
- * pnodes.  Note that pnodes that have never been written (lnum == 0) are
- * skipped.
+ * This function returns the next pnode or %NULL if there are no more pnodes.
+ * Note that pnodes that have never been written (lnum == 0) are skipped.
  */
-static struct ubifs_pnode *next_pnode_to_dirty(struct ubifs_info *c,
-					       struct ubifs_pnode *pnode)
+static struct ubifs_pnode *find_next_pnode(struct ubifs_info *c,
+					   struct ubifs_pnode *pnode)
 {
 	struct ubifs_nnode *nnode;
 	int iip;
@@ -664,7 +663,7 @@ static int make_tree_dirty(struct ubifs_info *c)
 
 	while (pnode) {
 		do_make_pnode_dirty(c, pnode);
-		pnode = next_pnode_to_dirty(c, pnode);
+		pnode = find_next_pnode(c, pnode);
 		if (IS_ERR(pnode))
 			return PTR_ERR(pnode);
 	}
@@ -1659,17 +1658,18 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
  */
 int dbg_check_ltab(struct ubifs_info *c)
 {
-	int lnum, err, i, cnt;
+	int lnum, err;
+	struct ubifs_pnode *pnode;
 
 	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	/* Bring the entire tree into memory */
-	cnt = DIV_ROUND_UP(c->main_lebs, UBIFS_LPT_FANOUT);
-	for (i = 0; i < cnt; i++) {
-		struct ubifs_pnode *pnode;
-
-		pnode = ubifs_pnode_lookup(c, i);
+	pnode = ubifs_pnode_lookup(c, 0);
+	if (IS_ERR(pnode))
+		return PTR_ERR(pnode);
+	while (pnode) {
+		pnode = find_next_pnode(c, pnode);
 		if (IS_ERR(pnode))
 			return PTR_ERR(pnode);
 		cond_resched();
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
