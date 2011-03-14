Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz8ze-0000nJ-8z
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 14:43:38 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EEfwM9002819
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 16:43:30 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 3/6] UBIFS: allocate ltab checking buffer on demand
Date: Mon, 14 Mar 2011 16:46:09 +0200
Message-Id: <1300113972-4507-4-git-send-email-dedekind1@gmail.com>
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
'dbg_check_ltab_lnum()', dynamically allocate it when needed. The
intend is to get rid of the pre-allocated 'c->dbg->buf' buffer and
save 128KiB of RAM (or more if PEB size is larger). Indeed,
currently we allocate this memory even if the user never enables
any self-check, which is wasteful.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lpt_commit.c |   29 ++++++++++++++++++++---------
 1 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 5c90dec..62a38d9 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1628,29 +1628,35 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 {
 	int err, len = c->leb_size, dirty = 0, node_type, node_num, node_len;
 	int ret;
-	void *buf = c->dbg->buf;
+	void *buf, *p;
 
 	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
 		return 0;
 
+	buf = p = __vmalloc(c->leb_size, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf) {
+		ubifs_err("cannot allocate memory for ltab checking");
+		return 0;
+	}
+
 	dbg_lp("LEB %d", lnum);
 	err = ubi_read(c->ubi, lnum, buf, 0, c->leb_size);
 	if (err) {
 		dbg_msg("ubi_read failed, LEB %d, error %d", lnum, err);
-		return err;
+		goto out;
 	}
 	while (1) {
-		if (!is_a_node(c, buf, len)) {
+		if (!is_a_node(c, p, len)) {
 			int i, pad_len;
 
-			pad_len = get_pad_len(c, buf, len);
+			pad_len = get_pad_len(c, p, len);
 			if (pad_len) {
-				buf += pad_len;
+				p += pad_len;
 				len -= pad_len;
 				dirty += pad_len;
 				continue;
 			}
-			if (!dbg_is_all_ff(buf, len)) {
+			if (!dbg_is_all_ff(p, len)) {
 				dbg_msg("invalid empty space in LEB %d at %d",
 					lnum, c->leb_size - len);
 				err = -EINVAL;
@@ -1668,16 +1674,21 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 					lnum, dirty, c->ltab[i].dirty);
 				err = -EINVAL;
 			}
-			return err;
+			goto out;
 		}
-		node_type = get_lpt_node_type(c, buf, &node_num);
+		node_type = get_lpt_node_type(c, p, &node_num);
 		node_len = get_lpt_node_len(c, node_type);
 		ret = dbg_is_node_dirty(c, node_type, lnum, c->leb_size - len);
 		if (ret == 1)
 			dirty += node_len;
-		buf += node_len;
+		p += node_len;
 		len -= node_len;
 	}
+
+	err = 0;
+out:
+	vfree(buf);
+	return err;
 }
 
 /**
-- 
1.7.2.3
