Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuYWD-0002g7-53
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 02:44:06 +0000
Message-ID: <5397C22C.70305@huawei.com>
Date: Wed, 11 Jun 2014 10:42:52 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 4/4] UBIFS: Remove useless statements
References: <5397C0E7.9070602@huawei.com>
In-Reply-To: <5397C0E7.9070602@huawei.com>
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

This patch removes useless and duplicate statements.
Also add a simple err mesg in journal.c to avoid a
value-never-read error.

 *journal.c
  Add return value check.

 *lpt.c & lpt_commit
  No need to set @shft and @done_ltab, value never
  read after these statements.

 *orphan.c
  Remove duplicate code.

 *sb.c & super.c
  The types of @default_compr and @compr_type are
  unsigned int, should never less than zero.

 *tnc.c & tnc_commit.c
  No need to set @err.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/journal.c    | 3 +++
 fs/ubifs/lpt.c        | 3 ---
 fs/ubifs/lpt_commit.c | 2 --
 fs/ubifs/orphan.c     | 1 -
 fs/ubifs/sb.c         | 2 +-
 fs/ubifs/super.c      | 2 +-
 fs/ubifs/tnc.c        | 1 -
 fs/ubifs/tnc_commit.c | 1 -
 8 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 0e045e7..f68e088 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -389,6 +389,9 @@ out:
 		ubifs_dump_budg(c, &c->bi);
 		ubifs_dump_lprops(c);
 		cmt_retries = dbg_check_lprops(c);
+		if (cmt_retries)
+			ubifs_err("fail to check lprops, error %d",
+				  cmt_retries);
 		up_write(&c->commit_sem);
 	}
 	return err;
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index b4fb422..421bd0a 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1464,7 +1464,6 @@ struct ubifs_lprops *ubifs_lpt_lookup(struct ubifs_info *c, int lnum)
 			return ERR_CAST(nnode);
 	}
 	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-	shft -= UBIFS_LPT_FANOUT_SHIFT;
 	pnode = ubifs_get_pnode(c, nnode, iip);
 	if (IS_ERR(pnode))
 		return ERR_CAST(pnode);
@@ -1604,7 +1603,6 @@ struct ubifs_lprops *ubifs_lpt_lookup_dirty(struct ubifs_info *c, int lnum)
 			return ERR_CAST(nnode);
 	}
 	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-	shft -= UBIFS_LPT_FANOUT_SHIFT;
 	pnode = ubifs_get_pnode(c, nnode, iip);
 	if (IS_ERR(pnode))
 		return ERR_CAST(pnode);
@@ -1964,7 +1962,6 @@ again:
 		}
 	}
 	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-	shft -= UBIFS_LPT_FANOUT_SHIFT;
 	pnode = scan_get_pnode(c, path + h, nnode, iip);
 	if (IS_ERR(pnode)) {
 		err = PTR_ERR(pnode);
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 7e957b6..db08de4 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -304,7 +304,6 @@ static int layout_cnodes(struct ubifs_info *c)
 			ubifs_assert(lnum >= c->lpt_first &&
 				     lnum <= c->lpt_last);
 		}
-		done_ltab = 1;
 		c->ltab_lnum = lnum;
 		c->ltab_offs = offs;
 		offs += c->ltab_sz;
@@ -514,7 +513,6 @@ static int write_cnodes(struct ubifs_info *c)
 			if (err)
 				return err;
 		}
-		done_ltab = 1;
 		ubifs_pack_ltab(c, buf + offs, c->ltab_cmt);
 		offs += c->ltab_sz;
 		dbg_chk_lpt_sz(c, 1, c->ltab_sz);
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index f1c3e5a1..4409f48 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -346,7 +346,6 @@ static int write_orph_nodes(struct ubifs_info *c, int atomic)
 		int lnum;

 		/* Unmap any unused LEBs after consolidation */
-		lnum = c->ohead_lnum + 1;
 		for (lnum = c->ohead_lnum + 1; lnum <= c->orph_last; lnum++) {
 			err = ubifs_leb_unmap(c, lnum);
 			if (err)
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 7ba1378..79c6dbb 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -449,7 +449,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}

-	if (c->default_compr < 0 || c->default_compr >= UBIFS_COMPR_TYPES_CNT) {
+	if (c->default_compr >= UBIFS_COMPR_TYPES_CNT) {
 		err = 13;
 		goto failed;
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 3904c85..3b0c2c0 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -75,7 +75,7 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 		return 1;
 	}

-	if (ui->compr_type < 0 || ui->compr_type >= UBIFS_COMPR_TYPES_CNT) {
+	if (ui->compr_type >= UBIFS_COMPR_TYPES_CNT) {
 		ubifs_err("unknown compression type %d", ui->compr_type);
 		return 2;
 	}
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 8a40cf9..6793db0 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -3294,7 +3294,6 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 		goto out_unlock;

 	if (err) {
-		err = -EINVAL;
 		key = &from_key;
 		goto out_dump;
 	}
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 52a6559..e570734 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -389,7 +389,6 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				ubifs_dump_lprops(c);
 			}
 			/* Try to commit anyway */
-			err = 0;
 			break;
 		}
 		p++;
-- 
1.8.1.4
