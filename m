Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEy-0002nf-GT
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:31 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 17/39] ubifs: extend budget for blocks
Date: Tue, 15 Sep 2015 17:02:12 +0800
Message-ID: <1442307754-13233-18-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, budget subsystem in ubifs are working on budgeting
page-by-page. But sometimes we want to budget a space for one
block, e.g for quota file writing. So this commit extend budget
subsystem to support blocks budgeting and releasing.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/budget.c | 4 ++++
 fs/ubifs/debug.c  | 2 ++
 fs/ubifs/super.c  | 1 +
 fs/ubifs/ubifs.h  | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index 11a11b3..ec2ac8e 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -395,6 +395,8 @@ static int calc_data_growth(const struct ubifs_info *c,
 	data_growth = req->new_ino  ? c->bi.inode_budget : 0;
 	if (req->new_page)
 		data_growth += c->bi.page_budget;
+	if (req->new_block)
+		data_growth += c->bi.block_budget;
 	if (req->new_dent)
 		data_growth += c->bi.dent_budget;
 	data_growth += req->new_ino_d;
@@ -414,6 +416,8 @@ static int calc_dd_growth(const struct ubifs_info *c,
 
 	dd_growth = req->dirtied_page ? c->bi.page_budget : 0;
 
+	if (req->dirtied_block)
+		dd_growth += c->bi.block_budget;
 	if (req->dirtied_ino)
 		dd_growth += c->bi.inode_budget << (req->dirtied_ino - 1);
 	if (req->mod_dent)
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 4c46a98..f393df2 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -556,6 +556,8 @@ void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
 	       req->new_page, req->dirtied_page);
 	pr_err("\tnew_dent    %d, mod_dent     %d\n",
 	       req->new_dent, req->mod_dent);
+	pr_err("\tnew_block   %d, dirtied_block %d\n",
+	       req->new_block, req->dirtied_block);
 	pr_err("\tidx_growth  %d\n", req->idx_growth);
 	pr_err("\tdata_growth %d dd_growth     %d\n",
 	       req->data_growth, req->dd_growth);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 8ee3133..dcffcd6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -699,6 +699,7 @@ static int init_constants_sb(struct ubifs_info *c)
 	c->bi.page_budget = UBIFS_MAX_DATA_NODE_SZ * UBIFS_BLOCKS_PER_PAGE;
 	c->bi.inode_budget = UBIFS_INO_NODE_SZ;
 	c->bi.dent_budget = UBIFS_MAX_DENT_NODE_SZ;
+	c->bi.block_budget = UBIFS_MAX_DATA_NODE_SZ;
 
 	/*
 	 * When the amount of flash space used by buds becomes
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3b5e932..5e1a5fe 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -854,6 +854,8 @@ struct ubifs_compressor {
  *               have to be re-calculated
  * @new_page: non-zero if the operation adds a new page
  * @dirtied_page: non-zero if the operation makes a page dirty
+ * @new_block: non-zero if the operation adds a new block
+ * @dirtied_block: non-zero if the operation makes a block dirty
  * @new_dent: non-zero if the operation adds a new directory entry
  * @mod_dent: non-zero if the operation removes or modifies an existing
  *            directory entry
@@ -885,6 +887,8 @@ struct ubifs_budget_req {
 #ifndef UBIFS_DEBUG
 	unsigned int new_page:1;
 	unsigned int dirtied_page:1;
+	unsigned int new_block:1;
+	unsigned int dirtied_block:1;
 	unsigned int new_dent:1;
 	unsigned int mod_dent:1;
 	unsigned int new_ino:1;
@@ -895,6 +899,8 @@ struct ubifs_budget_req {
 	/* Not bit-fields to check for overflows */
 	unsigned int new_page;
 	unsigned int dirtied_page;
+	unsigned int new_block;
+	unsigned int dirtied_block;
 	unsigned int new_dent;
 	unsigned int mod_dent;
 	unsigned int new_ino;
@@ -983,6 +989,7 @@ struct ubifs_budg_info {
 	int page_budget;
 	int inode_budget;
 	int dent_budget;
+	int block_budget;
 };
 
 struct ubifs_debug_info;
-- 
1.8.4.2
