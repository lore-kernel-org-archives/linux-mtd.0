Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Yw-Qw
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTFP011093
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/20] UBIFS: improve commentary
Date: Mon, 16 May 2011 10:44:25 +0300
Message-Id: <1305531879-19311-7-git-send-email-dedekind1@gmail.com>
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

This is a tiny clean-up patch which improves replay commentaries.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 0052663..e27346f 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -125,10 +125,11 @@ static int set_bud_lprops(struct ubifs_info *c, struct replay_entry *r)
 		 * zero which means the LEB must have been empty. The LEB
 		 * property values should be lp->free == c->leb_size and
 		 * lp->dirty == 0, but that is not the case. The reason is that
-		 * the LEB was garbage collected. The garbage collector resets
-		 * the free and dirty space without recording it anywhere except
-		 * lprops, so if there is not a commit then lprops does not have
-		 * that information next time the file system is mounted.
+		 * the LEB had been garbage collected before it became the bud,
+		 * and there was not commit inbetween. The garbage collector
+		 * resets the free and dirty space without recording it
+		 * anywhere except lprops, so if there was no commit then
+		 * lprops does not have that information.
 		 *
 		 * We do not need to adjust free space because the scan has told
 		 * us the exact value which is recorded in the replay entry as
-- 
1.7.2.3
