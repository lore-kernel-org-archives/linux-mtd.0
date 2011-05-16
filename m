Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dE-2M
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:33 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7dxUf010464
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/20] UBIFS: store free and dirty space in the bud replay
	entry
Date: Mon, 16 May 2011 10:44:29 +0300
Message-Id: <1305531879-19311-11-git-send-email-dedekind1@gmail.com>
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

This is just a small preparation patch which adds 'free' and 'drity' fields to
'struct bud_entry'. They will be used to set bud lprops.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 5e81503..ee2f0b2 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -90,14 +90,16 @@ struct replay_entry {
  * struct bud_entry - entry in the list of buds to replay.
  * @list: next bud in the list
  * @bud: bud description object
- * @free: free bytes in the bud
  * @sqnum: reference node sequence number
+ * @free: free bytes in the bud
+ * @dirty: dirty bytes in the bud
  */
 struct bud_entry {
 	struct list_head list;
 	struct ubifs_bud *bud;
-	int free;
 	unsigned long long sqnum;
+	int free;
+	int dirty;
 };
 
 /**
@@ -720,6 +722,8 @@ static int replay_buds(struct ubifs_info *c)
 				 &free, &dirty);
 		if (err)
 			return err;
+		b->free = free;
+		b->dirty = dirty;
 		err = insert_ref_node(c, b->bud->lnum, b->bud->start, b->sqnum,
 				      free, dirty, b->bud->jhead);
 		if (err)
-- 
1.7.2.3
