Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Yz-Qr
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTAn011099
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/20] UBIFS: double check that buds are replied in order
Date: Mon, 16 May 2011 10:44:27 +0300
Message-Id: <1305531879-19311-9-git-send-email-dedekind1@gmail.com>
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

Commit 52c6e6f990669deac3f370f1603815adb55a1dbd provides misleading infomation
in the commit messages - buds are replied in order. And the real reason why
that fix helped is probably because it made sure we seek head even in read-only
mode (so deferred recovery will have seeked heads).

This patch adds an assertion which will fire if we reply buds out of order.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index e27346f..5e81503 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -713,6 +713,7 @@ static int replay_buds(struct ubifs_info *c)
 {
 	struct bud_entry *b;
 	int err, uninitialized_var(free), uninitialized_var(dirty);
+	unsigned long long prev_sqnum = 0;
 
 	list_for_each_entry(b, &c->replay_buds, list) {
 		err = replay_bud(c, b->bud->lnum, b->bud->start, b->bud->jhead,
@@ -723,6 +724,9 @@ static int replay_buds(struct ubifs_info *c)
 				      free, dirty, b->bud->jhead);
 		if (err)
 			return err;
+
+		ubifs_assert(b->sqnum > prev_sqnum);
+		prev_sqnum = b->sqnum;
 	}
 
 	return 0;
-- 
1.7.2.3
