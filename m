Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsjDU-0005ni-4U
 for linux-mtd@lists.infradead.org; Fri, 06 Jun 2014 01:45:14 +0000
Message-ID: <53911CE9.8020401@huawei.com>
Date: Fri, 6 Jun 2014 09:44:09 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: Fix code issues detected by Fortify
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

Hi Artem,

With the help of Fortify, I found some problems in source
code. I would like to fix them in this patch.

Please help me review them!

There is no need to add a return value checking in journal.c,
just in order to avoid a "value never read" warning. Remove
statements in other files for the same reason.

Thanks!
----------------------------------------------------------

I would like to add these changes to UBIFS.

They are detected by Fortify.

  journal.c
     * Add return value checking

  lpt.c
     * Remove useless statements
     * Add missing break

  lpt_commit.c
     * Remove useless statements
     * Add error handling

  orphan.c
     * Remove duplicate code

  sb.c
     * Add error handling
     * @default_compr should never less than zero

  super.c
     * @compr_type should never less than zero

  tnc.c & tnc_commit.c
     * Remove useless statments


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/journal.c    | 3 +++
 fs/ubifs/lpt.c        | 5 ++---
 fs/ubifs/lpt_commit.c | 7 +++++--
 fs/ubifs/orphan.c     | 1 -
 fs/ubifs/sb.c         | 4 +++-
 fs/ubifs/super.c      | 2 +-
 fs/ubifs/tnc.c        | 1 -
 fs/ubifs/tnc_commit.c | 1 -
 8 files changed, 14 insertions(+), 10 deletions(-)

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
index d46b19e..421bd0a 100644
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
@@ -2198,6 +2195,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 					  lprops->dirty);
 				return -EINVAL;
 			}
+			break;
 		case LPROPS_FREEABLE:
 		case LPROPS_FRDI_IDX:
 			if (lprops->free + lprops->dirty != c->leb_size) {
@@ -2206,6 +2204,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 					  lprops->dirty);
 				return -EINVAL;
 			}
+			break;
 		}
 	}
 	return 0;
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 4b826ab..6c0659f 100644
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
@@ -1941,6 +1939,11 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 				pr_err("LEB %d:%d, nnode, ",
 				       lnum, offs);
 			err = ubifs_unpack_nnode(c, p, &nnode);
+			if (err) {
+				pr_err("fail to unpack_nnode, error %d\n",
+				       err);
+				break;
+			}
 			for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
 				pr_cont("%d:%d", nnode.nbranch[i].lnum,
 				       nnode.nbranch[i].offs);
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
index 4c37607..79c6dbb 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -332,6 +332,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	cs->ch.node_type = UBIFS_CS_NODE;
 	err = ubifs_write_node(c, cs, UBIFS_CS_NODE_SZ, UBIFS_LOG_LNUM, 0);
 	kfree(cs);
+	if (err)
+		return err;

 	ubifs_msg("default file-system created");
 	return 0;
@@ -447,7 +449,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}

-	if (c->default_compr < 0 || c->default_compr >= UBIFS_COMPR_TYPES_CNT) {
+	if (c->default_compr >= UBIFS_COMPR_TYPES_CNT) {
 		err = 13;
 		goto failed;
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a81c7b5..d005be9 100644
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
index 9083bc7..1dce7fa 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -3293,7 +3293,6 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
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
