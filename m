Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxYBc-0007Y9-JH
 for linux-mtd@lists.infradead.org; Thu, 19 Jun 2014 08:59:13 +0000
Message-ID: <53A2A615.7070607@huawei.com>
Date: Thu, 19 Jun 2014 16:57:57 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: ubifs: replay log error
References: <5396CCA8.7060303@huawei.com>
In-Reply-To: <5396CCA8.7060303@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found there might be a race in do_commit(). If we perform
ubifs_log_end_commit() before write master node, another
process which run ubifs_add_bud_to_log() may destroy the
old cs_node in the next or latter leb. Because log_end_commit()
will change @c->ltail_lnum by new @ltail_lnum. If power off
happens before we write either master node, we will read the
old master nodes and find no cs node exist in the leb which
master node indicate in the next mount.

Am I right?

So I want to remove the operations in ubifs_log_end_commit()
after write master nodes to avoid the old cs node being
covered by new ref node.

Now I would like to show the undone patch.



--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -108,7 +108,7 @@ static int nothing_to_commit(struct ubifs_info *c)
  */
 static int do_commit(struct ubifs_info *c)
 {
-	int err, new_ltail_lnum, old_ltail_lnum, i;
+	int err, new_ltail_lnum, i;
 	struct ubifs_zbranch zroot;
 	struct ubifs_lp_stats lst;

@@ -166,10 +166,10 @@ static int do_commit(struct ubifs_info *c)
 	err = ubifs_orphan_end_commit(c);
 	if (err)
 		goto out;
-	old_ltail_lnum = c->ltail_lnum;
-	err = ubifs_log_end_commit(c, new_ltail_lnum);
-	if (err)
-		goto out;
+//	old_ltail_lnum = c->ltail_lnum;
+//	err = ubifs_log_end_commit(c, new_ltail_lnum);
+//	if (err)
+//		goto out;
 	err = dbg_check_old_index(c, &zroot);
 	if (err)
 		goto out;
@@ -208,7 +208,7 @@ static int do_commit(struct ubifs_info *c)
 	if (err)
 		goto out;

-	err = ubifs_log_post_commit(c, old_ltail_lnum);
+	err = ubifs_log_post_commit(c, new_ltail_lnum);
 	if (err)
 		goto out;
 	err = ubifs_gc_end_commit(c);
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 36bd4ef..d263642 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -495,9 +495,10 @@ int ubifs_log_end_commit(struct ubifs_info *c, int ltail_lnum)
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum)
+int ubifs_log_post_commit(struct ubifs_info *c, int new_ltail_lnum)
 {
 	int lnum, err = 0;
+	int old_ltail_lnum;

 	while (!list_empty(&c->old_buds)) {
 		struct ubifs_bud *bud;
@@ -510,6 +511,14 @@ int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum)
 		kfree(bud);
 	}
 	mutex_lock(&c->log_mutex);
+
+	dbg_log("old tail was LEB %d:0, new tail is LEB %d:0",
+		c->ltail_lnum, new_ltail_lnum);
+
+	old_ltail_lnum = c->ltail_lnum;
+	c->ltail_lnum = new_ltail_lnum;
+	c->min_log_bytes = c->leb_size;	
+
 	for (lnum = old_ltail_lnum; lnum != c->ltail_lnum;
 	     lnum = ubifs_next_log_lnum(c, lnum)) {
 		dbg_log("unmap log LEB %d", lnum);
@@ -517,6 +526,13 @@ int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum)
 		if (err)
 			goto out;
 	}
+
+	spin_lock(&c->buds_lock);
+	c->bud_bytes -= c->cmt_bud_bytes;
+	spin_unlock(&c->buds_lock);
+
+	err = dbg_check_bud_bytes(c);
+
 out:
 	mutex_unlock(&c->log_mutex);
 	return err;
