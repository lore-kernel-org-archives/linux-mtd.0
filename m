Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0Z-0005lY-75
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:46:09 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 23/27] ubifs: ubifs_dump: dump lpt area
Date: Wed, 19 Aug 2015 16:39:28 +0800
Message-ID: <1439973572-12489-24-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

At first dump the ltab and then scan the whole lpt,
dumping every lprops in it.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                            |   2 +-
 ubifs-utils/ubifs_dump/ubifs_dump.c | 170 ++++++++++++++++++++++++++++++++++++
 2 files changed, 171 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7abbef9..af17307 100644
--- a/Makefile
+++ b/Makefile
@@ -133,7 +133,7 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 $(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
 
 obj-ubifs_dump = $(UBIFS_LIBS)
-obj-ubifs_dump += ../lib/scan.o
+obj-ubifs_dump += ../lib/scan.o ../lib/lprops.o
 LDFLAGS_ubifs_dump = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_ubifs_dump = -lz -llzo2 -lm -luuid
 $(call mkdep,ubifs-utils/ubifs_dump/,ubifs_dump,,ubi-utils/libubi.a)
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 5fb96ef..0d375f0 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -720,6 +720,172 @@ out:
 	return err;
 }
 
+void ubifs_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
+{
+	int spc, dark = 0, dead = 0;
+
+	if ((lp->flags & LPROPS_CAT_MASK) == LPROPS_EMPTY)
+		return;
+
+	spc = lp->free + lp->dirty;
+	dead = spc;
+
+	if (lp->flags & LPROPS_INDEX)
+		printf("\tLEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d flags %#x (",
+		       lp->lnum, lp->free, lp->dirty, c->leb_size - spc, spc,
+		       lp->flags);
+	else
+		printf("\tLEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d flags %#-4x (",
+		       lp->lnum, lp->free, lp->dirty, c->leb_size - spc, spc,
+		       dark, dead, (int)(spc / UBIFS_MAX_NODE_SZ), lp->flags);
+
+	if (lp->flags & LPROPS_TAKEN) {
+		if (lp->flags & LPROPS_INDEX)
+			printf("index, taken");
+		else
+			printf("taken");
+	} else {
+		const char *s;
+
+		if (lp->flags & LPROPS_INDEX) {
+			switch (lp->flags & LPROPS_CAT_MASK) {
+			case LPROPS_DIRTY_IDX:
+				s = "dirty index";
+				break;
+			case LPROPS_FRDI_IDX:
+				s = "freeable index";
+				break;
+			default:
+				s = "index";
+			}
+		} else {
+			switch (lp->flags & LPROPS_CAT_MASK) {
+			case LPROPS_UNCAT:
+				s = "not categorized";
+				break;
+			case LPROPS_DIRTY:
+				s = "dirty";
+				break;
+			case LPROPS_FREE:
+				s = "free";
+				break;
+			case LPROPS_EMPTY:
+				s = "empty";
+				break;
+			case LPROPS_FREEABLE:
+				s = "freeable";
+				break;
+			default:
+				s = NULL;
+				break;
+			}
+		}
+		printf("%s", s);
+	}
+
+	if (lp->lnum == c->gc_lnum)
+		printf(", GC LEB");
+	printf(")\n");
+}
+
+void ubifs_dump_lstats(const struct ubifs_lp_stats *lst)
+{
+	printf("\tempty_lebs %d, idx_lebs  %d\n",
+	       lst->empty_lebs, lst->idx_lebs);
+	printf("\ttaken_empty_lebs %d, total_free %lld, total_dirty %lld\n",
+	       lst->taken_empty_lebs, lst->total_free, lst->total_dirty);
+	printf("\ttotal_used %lld, total_dark %lld, total_dead %lld\n",
+	       lst->total_used, lst->total_dark, lst->total_dead);
+	printf("\n");
+}
+
+static int scan_dump_cb(struct ubifs_info *c,
+			 const struct ubifs_lprops *lp, int in_tree __attribute__((unused)),
+			 struct ubifs_lp_stats *lst __attribute__((unused)))
+{
+	ubifs_dump_lprop(c, lp);
+	return 0;
+}
+
+static int ubifs_dump_lprops(struct ubifs_info *c)
+{
+	printf("\tLPROPS statistics: \n");
+	ubifs_dump_lstats(&c->lst);
+	printf("\tLPROPS TREE: \n");
+	c->lpt_nod_buf = malloc(min(c->nnode_sz, c->pnode_sz));
+	ubifs_lpt_scan_nolock(c, c->main_first, c->leb_cnt - 1,
+			  (ubifs_lpt_scan_callback)scan_dump_cb, NULL);
+	printf("\n");
+
+	return 0;
+}
+
+/**
+ * read_ltab - read LPT's own lprops table.
+ * @c: UBIFS file-system description object
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+static int read_ltab(struct ubifs_info *c)
+{
+	int err;
+	void *buf;
+
+	buf = vmalloc(c->ltab_sz);
+	if (!buf)
+		return -ENOMEM;
+	err = ubifs_read(c->ltab_lnum * c->leb_size + c->ltab_offs, c->ltab_sz, buf);
+	if (err)
+		goto out;
+	err = unpack_ltab(c, buf);
+out:
+	vfree(buf);
+	return err;
+}
+
+static int ubifs_dump_lpt_info(struct ubifs_info *c)
+{
+	int i;
+	int ret = 0;
+
+	c->ltab = malloc(c->lpt_lebs * sizeof(struct ubifs_lprops));
+	if (!c->ltab)
+		return err_msg("unable to allocate LPT ltab");
+
+	ret = read_ltab(c);
+	if (ret)
+		return ret;
+	printf("\tLPT INFO: \n");
+	printf("\tLPT root is at %d:%d\n", c->lpt_lnum, c->lpt_offs);
+	printf("\tLPT head is at %d:%d\n",
+	       c->nhead_lnum, c->nhead_offs);
+	printf("\tLPT ltab is at %d:%d\n", c->ltab_lnum, c->ltab_offs);
+	if (c->big_lpt)
+		printf("\tLPT lsave is at %d:%d\n",
+		       c->lsave_lnum, c->lsave_offs);
+	for (i = 0; i < c->lpt_lebs; i++)
+		printf("\tLPT LEB %d free %d dirty %d tgc %d cmt %d\n",
+		       i + c->lpt_first, c->ltab[i].free, c->ltab[i].dirty,
+		       c->ltab[i].tgc, c->ltab[i].cmt);
+	printf("\n");
+	return 0;
+}
+
+static int dump_lpt(void)
+{
+	int ret = 0;
+
+	printf("LPT AREA: \n");
+	ret = ubifs_dump_lpt_info(c);
+	if (ret)
+		return ret;
+
+	ret = ubifs_dump_lprops(c);
+	if (ret)
+		return ret;
+	return 0;
+}
+
 static int dump()
 {
 	int err = 0;
@@ -741,6 +907,10 @@ static int dump()
 	err = dump_log();
 	if (err)
 		goto free;
+
+	err = dump_lpt();
+	if (err)
+		goto free;
 free:
 	free(leb_buf);
 out:
-- 
1.8.4.2
