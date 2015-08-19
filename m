Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0W-0005ke-5p
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:46:07 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 20/27] ubifs: ubifs_dump: dump log area
Date: Wed, 19 Aug 2015 16:39:25 +0800
Message-ID: <1439973572-12489-21-git-send-email-yangds.fnst@cn.fujitsu.com>
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

scan the log lebs and dump the log nodes out.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/ubifs_dump/ubifs_dump.c | 158 ++++++++++++++++++++++++++++++++++--
 1 file changed, 151 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 73f68b7..5fb96ef 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -19,6 +19,8 @@ static const struct option longopts[] = {
 struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
 
+static void *leb_buf;
+
 /* Global nodes*/
 struct ubifs_mst_node mst;
 struct ubifs_sb_node sup;
@@ -491,15 +493,10 @@ static int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
 	int lnum, offs = 0, nodes_cnt;
-	static void *leb_buf;
 	int err = 0;
 	
 	lnum = UBIFS_MST_LNUM;
 
-	leb_buf = malloc(c->leb_size);
-	if (!leb_buf)
-		return -ENOMEM;
-
 	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
 	if (IS_ERR(sleb)) {
 		err = PTR_ERR(sleb);
@@ -544,7 +541,6 @@ static int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node
 	err = 0;
 
 out:
-	free(leb_buf);
 	ubifs_scan_destroy(sleb);
 	return err;
 }
@@ -588,6 +584,142 @@ static int dump_master(void)
 	return 0;
 }
 
+static int __dump_log_leb(int leb_num)
+{
+	int err = 0;
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	const struct ubifs_cs_node *node;
+	static int cs_sqnum = 0;
+	int lnum = leb_num;
+	loff_t offs = 0;
+	int node_num = 0;
+
+	sleb = ubifs_scan(c, lnum, offs, leb_buf, 0);
+	if (IS_ERR(sleb)) {
+		printf("Error in scaning log leb");
+		return PTR_ERR(sleb);
+	}
+
+	if (sleb->nodes_cnt == 0) {
+		err = 1;
+		goto out;
+	}
+
+	node = sleb->buf;
+	snod = list_entry(sleb->nodes.next, struct ubifs_scan_node, list);
+	if (cs_sqnum == 0) {
+		/*
+		 * This is the first log LEB we are looking at, make sure that
+		 * the first node is a commit start node. Also record its
+		 * sequence number so that UBIFS can determine where the log
+		 * ends, because all nodes which were have higher sequence
+		 * numbers.
+		 */
+		if (snod->type != UBIFS_CS_NODE) {
+			ubifs_err(c, "first log node at LEB %d:%lu is not CS node",
+				  lnum, offs);
+			goto out_dump;
+		}
+		if (le64_to_cpu(node->cmt_no) != mst.cmt_no) {
+			ubifs_err(c, "first CS node at LEB %d:%lu has wrong commit number %llu expected %llu",
+				  lnum, offs,
+				  (unsigned long long)le64_to_cpu(node->cmt_no),
+				  mst.cmt_no);
+			goto out_dump;
+		}
+
+		cs_sqnum = le64_to_cpu(node->ch.sqnum);
+	}
+
+	if (snod->sqnum < cs_sqnum) {
+		/*
+		 * This means that we reached end of log and now
+		 * look to the older log data, which was already
+		 * committed but the eraseblock was not erased (UBIFS
+		 * only un-maps it). So this basically means we have to
+		 * exit with "end of log" code.
+		 */
+		err = 1;
+		goto out;
+	}
+
+	/* Make sure the first node sits at offset zero of the LEB */
+	if (snod->offs != 0) {
+		ubifs_err(c, "first node is not at zero offset");
+		goto out_dump;
+	}
+
+	printf("\tLOG LEB %d\n", lnum);
+	list_for_each_entry(snod, &sleb->nodes, list) {
+		if (snod->sqnum < cs_sqnum) {
+			ubifs_err(c, "bad sqnum %llu, commit sqnum %d",
+				  snod->sqnum, cs_sqnum);
+			goto out_dump;
+		}
+
+		printf("\tNODE %d", node_num++);
+		switch (snod->type) {
+		case UBIFS_CS_NODE:
+			printf(" <START COMMIT>");
+		case UBIFS_REF_NODE: {
+			printf(":\n");
+			dump_node(c, snod->node);
+			break;
+		}
+		default:
+			ubifs_err(c, "unexpected node in log");
+			goto out_dump;
+		}
+	}
+	err = !sleb->endpt;
+out:
+	ubifs_scan_destroy(sleb);
+	return err;
+
+out_dump:
+	ubifs_err(c, "log error detected while replaying the log at LEB %d:%lu",
+		  lnum, offs + snod->offs);
+	ubifs_scan_destroy(sleb);
+	return -EINVAL;
+
+}
+
+static int dump_log(void)
+{
+	int err, lnum, ltail_lnum, log_last;
+
+	lnum = ltail_lnum = mst.log_lnum;
+	log_last = UBIFS_LOG_LNUM + sup.log_lebs - 1;
+	printf("LOG AREA:\n");
+	while (lnum <= log_last) {
+		err = __dump_log_leb(lnum);
+		if (err == 1) {
+			if (lnum != mst.log_lnum)
+				/* We hit the end of the log */
+				break;
+
+			/*
+			 * The head of the log must always start with the
+			 * "commit start" node on a properly formatted UBIFS.
+			 * But we found no nodes at all, which means that
+			 * someting went wrong and we cannot proceed mounting
+			 * the file-system.
+			 */
+			ubifs_err(c, "no UBIFS nodes found at the log head LEB %d:%d, possibly corrupted",
+				  lnum, 0);
+			err = -EINVAL;
+		}
+		if (err)
+			goto out;
+		lnum++;
+	}
+
+	err = 0;
+out:
+	return err;
+}
+
 static int dump()
 {
 	int err = 0;
@@ -596,9 +728,21 @@ static int dump()
 	if (err)
 		goto out;
 
+	leb_buf = malloc(c->leb_size);
+	if (!leb_buf) {
+		err = -ENOMEM;
+		goto out;
+	}
+
 	err = dump_master();
 	if (err)
-		goto out;
+		goto free;
+
+	err = dump_log();
+	if (err)
+		goto free;
+free:
+	free(leb_buf);
 out:
 	return err;
 }
-- 
1.8.4.2
