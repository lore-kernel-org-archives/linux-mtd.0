Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz8ze-0000nK-8v
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:43:37 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEfwKc002812
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:43:30 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 4/6] UBIFS: allocate lpt dump buffer on demand
Date: Mon, 14 Mar 2011 16:46:10 +0200
Message-Id: <1300113972-4507-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
References: <1300113972-4507-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using pre-allocated 'c->dbg->buf' buffer in
'dump_lpt_leb()', dynamically allocate it when needed. The intend
is to get rid of the pre-allocated 'c->dbg->buf' buffer and save
128KiB of RAM (or more if PEB size is larger). Indeed, currently we
allocate this memory even if the user never enables any self-check,
which is wasteful.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lpt_commit.c |   27 ++++++++++++++++++---------
 1 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 62a38d9..0a3c2c3 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1881,25 +1881,31 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 {
 	int err, len = c->leb_size, node_type, node_num, node_len, offs;
-	void *buf = c->dbg->buf;
+	void *buf, *p;
 
 	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
 	       current->pid, lnum);
+	buf = p = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf) {
+		ubifs_err("cannot allocate memory to dump LPT");
+		return;
+	}
+
 	err = ubi_read(c->ubi, lnum, buf, 0, c->leb_size);
 	if (err) {
 		ubifs_err("cannot read LEB %d, error %d", lnum, err);
-		return;
+		goto out;
 	}
 	while (1) {
 		offs = c->leb_size - len;
-		if (!is_a_node(c, buf, len)) {
+		if (!is_a_node(c, p, len)) {
 			int pad_len;
 
-			pad_len = get_pad_len(c, buf, len);
+			pad_len = get_pad_len(c, p, len);
 			if (pad_len) {
 				printk(KERN_DEBUG "LEB %d:%d, pad %d bytes\n",
 				       lnum, offs, pad_len);
-				buf += pad_len;
+				p += pad_len;
 				len -= pad_len;
 				continue;
 			}
@@ -1909,7 +1915,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 			break;
 		}
 
-		node_type = get_lpt_node_type(c, buf, &node_num);
+		node_type = get_lpt_node_type(c, p, &node_num);
 		switch (node_type) {
 		case UBIFS_LPT_PNODE:
 		{
@@ -1934,7 +1940,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 			else
 				printk(KERN_DEBUG "LEB %d:%d, nnode, ",
 				       lnum, offs);
-			err = ubifs_unpack_nnode(c, buf, &nnode);
+			err = ubifs_unpack_nnode(c, p, &nnode);
 			for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
 				printk(KERN_CONT "%d:%d", nnode.nbranch[i].lnum,
 				       nnode.nbranch[i].offs);
@@ -1955,15 +1961,18 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 			break;
 		default:
 			ubifs_err("LPT node type %d not recognized", node_type);
-			return;
+			goto out;
 		}
 
-		buf += node_len;
+		p += node_len;
 		len -= node_len;
 	}
 
 	printk(KERN_DEBUG "(pid %d) finish dumping LEB %d\n",
 	       current->pid, lnum);
+out:
+	vfree(buf);
+	return;
 }
 
 /**
-- 
1.7.2.3
