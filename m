Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhyP3-0005Yl-VC
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 13:30:36 +0000
Subject: [PATCH 2/2] UBIFS: Improve 19 size determinations
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <bd8107ce-fc62-db39-8134-59dca314da7c@users.sourceforge.net>
Message-ID: <f4d6422e-96a5-e53f-76af-7997a4d528f8@users.sourceforge.net>
Date: Wed, 16 Aug 2017 15:30:06 +0200
MIME-Version: 1.0
In-Reply-To: <bd8107ce-fc62-db39-8134-59dca314da7c@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 14:14:28 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ubifs/log.c      |  2 +-
 fs/ubifs/lpt.c      | 12 ++++++------
 fs/ubifs/orphan.c   |  6 +++---
 fs/ubifs/recovery.c |  2 +-
 fs/ubifs/replay.c   |  8 ++++----
 fs/ubifs/scan.c     |  4 ++--
 fs/ubifs/super.c    |  2 +-
 fs/ubifs/tnc.c      |  2 +-
 8 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 8c795e6392b1..cd19f2c28b3d 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -179,7 +179,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
 	struct ubifs_bud *bud;
 	struct ubifs_ref_node *ref;
 
-	bud = kmalloc(sizeof(struct ubifs_bud), GFP_NOFS);
+	bud = kmalloc(sizeof(*bud), GFP_NOFS);
 	if (!bud)
 		return -ENOMEM;
 	ref = kzalloc(c->ref_node_alsz, GFP_NOFS);
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 9a517109da0f..014614a62522 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -629,8 +629,8 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	c->main_first = c->leb_cnt - *main_lebs;
 
 	lsave = kmalloc(sizeof(int) * c->lsave_cnt, GFP_KERNEL);
-	pnode = kzalloc(sizeof(struct ubifs_pnode), GFP_KERNEL);
-	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_KERNEL);
+	pnode = kzalloc(sizeof(*pnode), GFP_KERNEL);
+	nnode = kzalloc(sizeof(*nnode), GFP_KERNEL);
 	buf = vmalloc(c->leb_size);
 	ltab = vmalloc(sizeof(struct ubifs_lpt_lprops) * c->lpt_lebs);
 	if (!pnode || !nnode || !buf || !ltab || !lsave) {
@@ -1205,7 +1205,7 @@ int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 		lnum = c->lpt_lnum;
 		offs = c->lpt_offs;
 	}
-	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_NOFS);
+	nnode = kzalloc(sizeof(*nnode), GFP_NOFS);
 	if (!nnode) {
 		err = -ENOMEM;
 		goto out;
@@ -1268,7 +1268,7 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 	branch = &parent->nbranch[iip];
 	lnum = branch->lnum;
 	offs = branch->offs;
-	pnode = kzalloc(sizeof(struct ubifs_pnode), GFP_NOFS);
+	pnode = kzalloc(sizeof(*pnode), GFP_NOFS);
 	if (!pnode)
 		return -ENOMEM;
 
@@ -1498,7 +1498,7 @@ static struct ubifs_nnode *dirty_cow_nnode(struct ubifs_info *c,
 	}
 
 	/* nnode is being committed, so copy it */
-	n = kmemdup(nnode, sizeof(struct ubifs_nnode), GFP_NOFS);
+	n = kmemdup(nnode, sizeof(*n), GFP_NOFS);
 	if (unlikely(!n))
 		return ERR_PTR(-ENOMEM);
 
@@ -1548,7 +1548,7 @@ static struct ubifs_pnode *dirty_cow_pnode(struct ubifs_info *c,
 	}
 
 	/* pnode is being committed, so copy it */
-	p = kmemdup(pnode, sizeof(struct ubifs_pnode), GFP_NOFS);
+	p = kmemdup(pnode, sizeof(*p), GFP_NOFS);
 	if (unlikely(!p))
 		return ERR_PTR(-ENOMEM);
 
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index f5b01f9f9985..05e4136fa090 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -67,7 +67,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 	struct ubifs_orphan *orphan, *o;
 	struct rb_node **p, *parent = NULL;
 
-	orphan = kzalloc(sizeof(struct ubifs_orphan), GFP_NOFS);
+	orphan = kzalloc(sizeof(*orphan), GFP_NOFS);
 	if (!orphan)
 		return -ENOMEM;
 	orphan->inum = inum;
@@ -514,7 +514,7 @@ static int insert_dead_orphan(struct ubifs_info *c, ino_t inum)
 	struct ubifs_orphan *orphan, *o;
 	struct rb_node **p, *parent = NULL;
 
-	orphan = kzalloc(sizeof(struct ubifs_orphan), GFP_KERNEL);
+	orphan = kzalloc(sizeof(*orphan), GFP_KERNEL);
 	if (!orphan)
 		return -ENOMEM;
 	orphan->inum = inum;
@@ -771,7 +771,7 @@ static int dbg_ins_check_orphan(struct rb_root *root, ino_t inum)
 	struct check_orphan *orphan, *o;
 	struct rb_node **p, *parent = NULL;
 
-	orphan = kzalloc(sizeof(struct check_orphan), GFP_NOFS);
+	orphan = kzalloc(sizeof(*orphan), GFP_NOFS);
 	if (!orphan)
 		return -ENOMEM;
 	orphan->inum = inum;
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 3af4472061cc..e9821820b260 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1269,7 +1269,7 @@ static int add_ino(struct ubifs_info *c, ino_t inum, loff_t i_size,
 			p = &(*p)->rb_right;
 	}
 
-	e = kzalloc(sizeof(struct size_entry), GFP_KERNEL);
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
 		return -ENOMEM;
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index ae5c02f22f3e..479d871a8573 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -365,7 +365,7 @@ static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
 	if (key_inum(c, key) >= c->highest_inum)
 		c->highest_inum = key_inum(c, key);
 
-	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
+	r = kzalloc(sizeof(*r), GFP_KERNEL);
 	if (!r)
 		return -ENOMEM;
 
@@ -412,7 +412,7 @@ static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 	if (key_inum(c, key) >= c->highest_inum)
 		c->highest_inum = key_inum(c, key);
 
-	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
+	r = kzalloc(sizeof(*r), GFP_KERNEL);
 	if (!r)
 		return -ENOMEM;
 
@@ -750,11 +750,11 @@ static int add_replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 
 	dbg_mnt("add replay bud LEB %d:%d, head %d", lnum, offs, jhead);
 
-	bud = kmalloc(sizeof(struct ubifs_bud), GFP_KERNEL);
+	bud = kmalloc(sizeof(*bud), GFP_KERNEL);
 	if (!bud)
 		return -ENOMEM;
 
-	b = kmalloc(sizeof(struct bud_entry), GFP_KERNEL);
+	b = kmalloc(sizeof(*b), GFP_KERNEL);
 	if (!b) {
 		kfree(bud);
 		return -ENOMEM;
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index aab87340d3de..1a0c98ac410c 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -142,7 +142,7 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 
 	dbg_scan("scan LEB %d:%d", lnum, offs);
 
-	sleb = kzalloc(sizeof(struct ubifs_scan_leb), GFP_NOFS);
+	sleb = kzalloc(sizeof(*sleb), GFP_NOFS);
 	if (!sleb)
 		return ERR_PTR(-ENOMEM);
 
@@ -198,7 +198,7 @@ int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	struct ubifs_ino_node *ino = buf;
 	struct ubifs_scan_node *snod;
 
-	snod = kmalloc(sizeof(struct ubifs_scan_node), GFP_NOFS);
+	snod = kmalloc(sizeof(*snod), GFP_NOFS);
 	if (!snod)
 		return -ENOMEM;
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index bffadbb67e47..9723c08fcbd1 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1965,7 +1965,7 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 {
 	struct ubifs_info *c;
 
-	c = kzalloc(sizeof(struct ubifs_info), GFP_KERNEL);
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (c) {
 		spin_lock_init(&c->cnt_lock);
 		spin_lock_init(&c->cs_lock);
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 0a213dcba2a1..276233dff9bf 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -84,7 +84,7 @@ static int insert_old_idx(struct ubifs_info *c, int lnum, int offs)
 	struct ubifs_old_idx *old_idx, *o;
 	struct rb_node **p, *parent = NULL;
 
-	old_idx = kmalloc(sizeof(struct ubifs_old_idx), GFP_NOFS);
+	old_idx = kmalloc(sizeof(*old_idx), GFP_NOFS);
 	if (unlikely(!old_idx))
 		return -ENOMEM;
 	old_idx->lnum = lnum;
-- 
2.14.0
