Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0Z-0005ke-Jy
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:46:13 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 24/27] ubifs: ubifs_dump: dump index area
Date: Wed, 19 Aug 2015 16:39:29 +0800
Message-ID: <1439973572-12489-25-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Scan the whole index tree and dump each index node.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/ubifs_dump/ubifs_dump.c | 95 +++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 0d375f0..90ac322 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -886,6 +886,97 @@ static int dump_lpt(void)
 	return 0;
 }
 
+/**
+ * ubifs_read_node - read node.
+ * @c: UBIFS file-system description object
+ * @buf: buffer to read to
+ * @type: node type
+ * @len: node length (not aligned)
+ * @lnum: logical eraseblock number
+ * @offs: offset within the logical eraseblock
+ *
+ * This function reads a node of known type and and length, checks it and
+ * stores in @buf. Returns zero in case of success, %-EUCLEAN if CRC mismatched
+ * and a negative error code in case of failure.
+ */
+int ubifs_read_node(const struct ubifs_info *c, void *buf, int len,
+		    int lnum, loff_t offs)
+{
+	int err;
+
+	ubifs_assert(lnum >= 0 && lnum < c->leb_cnt && offs >= 0);
+	ubifs_assert(len >= UBIFS_CH_SZ && offs + len <= c->leb_size);
+	ubifs_assert(!(offs & 7) && offs < c->leb_size);
+	ubifs_assert(type >= 0 && type < UBIFS_NODE_TYPES_CNT);
+
+	err = ubifs_read((loff_t)lnum * c->leb_size + offs, len, buf);
+	if (err && err != -EBADMSG)
+		return err;
+
+	return 0;
+}
+
+static int dump_zbr(struct ubifs_info *c, struct ubifs_zbranch *zbr)
+{
+	int i = 0;
+	int err = 0;
+	struct ubifs_idx_node *idx;
+	void *buf;
+
+	buf = malloc(zbr->len);
+	if (!buf)
+		return -ENOMEM;
+
+	err = ubifs_read_node(c, buf, zbr->len, zbr->lnum, zbr->offs);
+	if (err)
+		goto out;
+
+	dump_node(c, buf);
+
+	if (le32_to_cpu(((struct ubifs_ch *)buf)->node_type) != UBIFS_IDX_NODE)
+		goto out;
+
+	idx = ((struct ubifs_idx_node *)buf);
+	for (i = 0; i < le32_to_cpu(idx->child_cnt); i++) {
+		struct ubifs_branch *br;
+		struct ubifs_zbranch child;
+
+		br = ubifs_idx_branch(c, idx, i);
+		child.lnum = le32_to_cpu(br->lnum);
+		child.offs = le32_to_cpu(br->offs);
+		child.len = le32_to_cpu(br->len);
+		err = dump_zbr(c, &child);
+		if (err)
+			goto out;
+	}
+
+out:
+	free(buf);
+	return err;
+}
+
+static int dump_index()
+{
+	int err = 0;
+
+	printf("\tINDEX AREA: \n");
+	err = dump_zbr(c, &c->zroot);
+	if (err)
+		return err;
+	return 0;
+}
+
+static int dump_main()
+{
+	int err = 0;
+	printf("MAIN AREA: \n");
+	err = dump_index();
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static int dump()
 {
 	int err = 0;
@@ -911,6 +1002,10 @@ static int dump()
 	err = dump_lpt();
 	if (err)
 		goto free;
+
+	err = dump_main();
+	if (err)
+		goto out;
 free:
 	free(leb_buf);
 out:
-- 
1.8.4.2
