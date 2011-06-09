Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002S1-HT
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:08 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE1028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:00:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/30] UBIFS: return EROFS in case of broken commit
Date: Thu,  9 Jun 2011 12:04:41 +0300
Message-Id: <1307610310-28691-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

If commit failed and it is in broken state, UBIFS switches to R/O mode. Most
operations return -EROFS in this case, except of commit which returns -EINVAL.
Make it return -EROFS too for consistency. This is also important for our power
cut emulation testing.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 87cd0ea..8ab03d1 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -418,7 +418,7 @@ int ubifs_run_commit(struct ubifs_info *c)
 
 	spin_lock(&c->cs_lock);
 	if (c->cmt_state == COMMIT_BROKEN) {
-		err = -EINVAL;
+		err = -EROFS;
 		goto out;
 	}
 
@@ -444,7 +444,7 @@ int ubifs_run_commit(struct ubifs_info *c)
 	 * re-check it.
 	 */
 	if (c->cmt_state == COMMIT_BROKEN) {
-		err = -EINVAL;
+		err = -EROFS;
 		goto out_cmt_unlock;
 	}
 
-- 
1.7.2.3
