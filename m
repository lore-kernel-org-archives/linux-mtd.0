Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxXst-0006ag-LH
 for linux-mtd@lists.infradead.org; Thu, 19 Jun 2014 08:39:53 +0000
Message-ID: <53A2A170.80006@huawei.com>
Date: Thu, 19 Jun 2014 16:38:08 +0800
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

Now I have reproduced this failure many times. Once the partition
mounted, there are lots of IOs. Power off the system several times
may case this failure.

I dump the first node in each LOG leb and found none cs node exist.

[  808.022004] UBIFS error (pid 1643): replay_log_leb: first log node at LEB 6:0
 is not CS node
[  808.121044] UBIFS error (pid 1643): replay_log_leb: log error detected while
replaying the log at LEB 6:0
[  808.235548]  magic          0x6101831
[  808.279264]  crc            0x70b8d9be
[  808.324030]  node_type      8 (reference node)
[  808.377137]  group_type     0 (no node group)
[  808.429181]  sqnum          536414
[  808.469779]  len            64
[  808.506224]  lnum           5609
[  808.544735]  offs           124928
[  808.585336]  jhead          1
[  808.620762] UBIFS error (pid 1643): ubifs_show_log: HUJY: start to dump log L
EB
[  808.708185] UBIFS error (pid 1643): ubifs_show_log: HUJY: fs(cmt_no) = 308
[  808.790439] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 3
[  808.884122] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
35991
[  808.972764] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 4
[  809.066455] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
36115
[  809.155097] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 5
[  809.248787] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
36239
[  809.337410] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 6
[  809.431098] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
36414
[  809.519734] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 7
[  809.613376] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
36671
[  809.702002] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 8
[  809.795697] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
36795
[  809.884332] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 9
[  809.978025] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
37164
[  810.066650] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 10
[  810.161384] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
37533
[  810.250025] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 11
[  810.344749] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
37657
[  810.433385] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 12
[  810.528145] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
37813
[  810.616790] UBIFS error (pid 1643): ubifs_show_log: HUJY: replay log LEB 13
[  810.711451] UBIFS error (pid 1643): ubifs_show_log: HUJY: ref_node, sqnum = 5
38211
[  810.800068] UBIFS error (pid 1643): ubifs_show_log: HUJY: dump log LEB finish


-----------------------------------------------------------------------------------

by this function

@@ -812,6 +812,40 @@ static int validate_ref(struct ubifs_info *c, const struct ubifs_ref_node *ref)
 	return 0;
 }

+static void ubifs_show_log(struct ubifs_info *c, void *sbuf)
+{
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	int lnum = UBIFS_LOG_LNUM;
+
+	ubifs_err("HUJY: start to dump log LEB");
+	ubifs_err("HUJY: fs(cmt_no) = %llu", c->cmt_no);
+	do {
+		ubifs_err("HUJY: replay log LEB %d", lnum);
+		sleb = ubifs_scan(c, lnum, 0, sbuf, 0);
+		if (!sleb->nodes_cnt) {
+			ubifs_err("HUJY: empty leb");
+			goto free;
+		}
+		snod = list_entry(sleb->nodes.next, struct ubifs_scan_node, list);
+		if (snod->type == UBIFS_CS_NODE) {
+			const struct ubifs_cs_node *node;
+
+			node = sleb->buf;
+			ubifs_err("HUJY: cs_node, cmt_no = %llu", node->cmt_no);
+			ubifs_err("HUJY: cs_sqnum = %llu", node->ch.sqnum);
+		} else if (snod->type == UBIFS_REF_NODE) {
+			ubifs_err("HUJY: ref_node, sqnum = %llu", snod->sqnum);
+		} else {
+			ubifs_err("HUJY: wrong type node");
+		}
+free:
+		ubifs_scan_destroy(sleb);
+		lnum = ubifs_next_log_lnum(c, lnum);
+	} while (lnum != UBIFS_LOG_LNUM);
+	ubifs_err("HUJY: dump log LEB finish");
+}
+
 /**
  * replay_log_leb - replay a log logical eraseblock.
  * @c: UBIFS file-system description object
@@ -959,6 +993,7 @@ out_dump:
 		  lnum, offs + snod->offs);
 	ubifs_dump_node(c, snod->node);
 	ubifs_scan_destroy(sleb);
+	ubifs_show_log(c, sbuf);
 	return -EINVAL;
 }
