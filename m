Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dD-2V
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:34 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTrG011091
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/20] UBIFS: change bud replay function conventions
Date: Mon, 16 May 2011 10:44:32 +0300
Message-Id: <1305531879-19311-14-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a minor preparation patch which changes 'replay_bud()' interface -
instead of passing bud lnum, offs, jhead, etc directly, pass a pointer to the
bud entry which contains all the information. The bud entry will be also needed
in one of the following patches.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |   28 ++++++++++++----------------
 1 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 47915a7..4378baa 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -475,25 +475,22 @@ int ubifs_validate_entry(struct ubifs_info *c,
 /**
  * replay_bud - replay a bud logical eraseblock.
  * @c: UBIFS file-system description object
- * @lnum: bud logical eraseblock number to replay
- * @offs: bud start offset
- * @jhead: journal head to which this bud belongs
- * @free: amount of free space in the bud is returned here
- * @dirty: amount of dirty space from padding and deletion nodes is returned
- * here
+ * @b: bud entry which describes the bud
  *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
+ * This function replays bud @bud, recovers it if needed, and adds all nodes
+ * from this bud to the replay list. Returns zero in case of success and a
+ * negative error code in case of failure.
  */
-static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
-		      int *free, int *dirty)
+static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 {
-	int err = 0, used = 0;
+	int err = 0, used = 0, lnum = b->bud->lnum, offs = b->bud->start;
+	int jhead = b->bud->jhead;
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
 	struct ubifs_bud *bud;
 
 	dbg_mnt("replay bud LEB %d, head %d, offs %d", lnum, jhead, offs);
+
 	if (c->need_recovery)
 		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, jhead != GCHD);
 	else
@@ -618,9 +615,9 @@ static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 	ubifs_assert(sleb->endpt - offs >= used);
 	ubifs_assert(sleb->endpt % c->min_io_size == 0);
 
-	*dirty = sleb->endpt - offs - used;
-	*free = c->leb_size - sleb->endpt;
-	dbg_mnt("bud LEB %d replied: dirty %d, free %d", lnum, *dirty, *free);
+	b->dirty = sleb->endpt - offs - used;
+	b->free = c->leb_size - sleb->endpt;
+	dbg_mnt("bud LEB %d replied: dirty %d, free %d", lnum, b->dirty, b->free);
 
 out:
 	ubifs_scan_destroy(sleb);
@@ -647,8 +644,7 @@ static int replay_buds(struct ubifs_info *c)
 	unsigned long long prev_sqnum = 0;
 
 	list_for_each_entry(b, &c->replay_buds, list) {
-		err = replay_bud(c, b->bud->lnum, b->bud->start, b->bud->jhead,
-				 &b->free, &b->dirty);
+		err = replay_bud(c, b);
 		if (err)
 			return err;
 
-- 
1.7.2.3
