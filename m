Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAw-0001wk-2D
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:41 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 19/38] ubifs: ubifs_dump: dump log area
Date: Mon, 21 Dec 2015 16:41:42 +0800
Message-ID: <1450687321-12381-20-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
 ubifs-utils/ubifs_dump/ubifs_dump.c | 140 ++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 4f67621..d7a2951 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -581,6 +581,142 @@ static int dump_master(void)
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
@@ -598,6 +734,10 @@ static int dump()
 	err = dump_master();
 	if (err)
 		goto free;
+
+	err = dump_log();
+	if (err)
+		goto free;
 free:
 	free(leb_buf);
 out:
-- 
1.8.4.2
