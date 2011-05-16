Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dG-Dd
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:39 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTkM011097
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/20] UBIFS: expect corruption only in last journal head LEBs
Date: Mon, 16 May 2011 10:44:35 +0300
Message-Id: <1305531879-19311-17-git-send-email-dedekind1@gmail.com>
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

This patch improves UBIFS recovery and teaches it to expect corruption only
in the last buds. Indeed, currently we just recover all buds, which is
incorrect because only the last buds can have corruptions in case of a power
cut. So it is inconsistent with the rest of the recovery strategy which tries
hard to distinguish between corruptions cause by power cuts and other types of
corruptions.

This patch also adds one quirk - a bit older UBIFS was could have corruption in
the next to last bud because of the way it switched buds: when bud A is full,
it first searched for the next bud B, the wrote a reference node to the log
about B, and then synchronized the write-buffer of A. So we could end up with
buds A and B, where B is the last, but A had corruption. The UBIFS behavior
was fixed, though, so currently it always first synchronizes A's write-buffer
and only after this adds B to the log. However, to be make sure that we handle
unclean (after a power cut) UBIFS images belonging to older UBIFS - we need to
add a quirk and keep it for some time: we need to check for the situation
described above.

Thankfully, it is easy to check for that situation. When UBIFS adds B to the
log, it always first unmaps B, then maps it, and then syncs A's write-buffer.
Thus, in that situation we can check that B is empty, in which case it is OK to
have corruption in A. To check that B is empty it is enough to just read the
first few bytes of the bud and compare them with 0xFFs. This quirk may be
removed in a couple of years.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |   66 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 0f50fbf..bc2b64a 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -472,6 +472,56 @@ int ubifs_validate_entry(struct ubifs_info *c,
 	return 0;
 }
 
+/* TODO: comment */
+static int is_last_bud(struct ubifs_info *c, struct bud_entry *b)
+{
+	struct ubifs_jhead *jh = &c->jheads[b->bud->jhead];
+	struct ubifs_bud *next;
+	uint32_t data;
+	int err;
+
+	if (list_is_last(&b->bud->list, &jh->buds_list))
+		return 1;
+
+	/*
+	 * The following is a quirk to make sure we work correctly with UBIFS
+	 * images used with older UBIFS.
+	 *
+	 * Normally, the last bud will be the last in the journal head's list
+	 * of bud. However, there is one exception if the UBIFS image belongs
+	 * to older UBIFS. This is fairly unlikely: one would need to use old
+	 * UBIFS, then have a power cut exactly at the right point, and then
+	 * try to mount this image with new UBIFS.
+	 *
+	 * The exception is: it is possible to have 2 buds A and B, A goes
+	 * before B, and B is the last, bud B is contains no data, and bud A is
+	 * corrupted at the end. The reason is that in older versions when the
+	 * journal code switched the next bud (from A to B), it first added a
+	 * log reference node for the new bud (B), and only after this it
+	 * synchronized the write-buffer of current bud (A). But later this was
+	 * changed and UBIFS started to always synchronize the write-buffer of
+	 * the bud (A) before writing the log reference for the new bud (B).
+	 *
+	 * But because older UBIFS always synchronized A's write-buffer before
+	 * writing to B, we can recognize this exceptional situation but
+	 * checking the contents of bud B - if it is empty, then A can be
+	 * treated as the last and we can recover it.
+	 *
+	 * TODO: remove this piece of code in a couple of years (today it is
+	 * 16.05.2011).
+	 */
+	next = list_entry(b->bud->list.next, struct ubifs_bud, list);
+	if (!list_is_last(&next->list, &jh->buds_list))
+		return 0;
+
+	err = ubi_read(c->ubi, next->lnum, (char *)&data,
+		       next->start, 4);
+	if (err)
+		return 0;
+
+	return data == 0xFFFFFFFF;
+}
+
 /**
  * replay_bud - replay a bud logical eraseblock.
  * @c: UBIFS file-system description object
@@ -483,15 +533,23 @@ int ubifs_validate_entry(struct ubifs_info *c,
  */
 static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 {
+	int is_last = is_last_bud(c, b);
 	int err = 0, used = 0, lnum = b->bud->lnum, offs = b->bud->start;
-	int jhead = b->bud->jhead;
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
 
-	dbg_mnt("replay bud LEB %d, head %d, offs %d", lnum, jhead, offs);
+	dbg_mnt("replay bud LEB %d, head %d, offs %d, is_last %d",
+		lnum, b->bud->jhead, offs, is_last);
 
-	if (c->need_recovery)
-		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, jhead != GCHD);
+	if (c->need_recovery && is_last)
+		/*
+		 * Recover only last LEBs in the journal heads, because power
+		 * cuts may cause corruptions only in these LEBs, because only
+		 * these LEBs could possibly be written to at the power cut
+		 * time.
+		 */
+		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf,
+					 b->bud->jhead != GCHD);
 	else
 		sleb = ubifs_scan(c, lnum, offs, c->sbuf, 0);
 	if (IS_ERR(sleb))
-- 
1.7.2.3
