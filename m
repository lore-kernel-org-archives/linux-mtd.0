Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZrz-0005K6-OR
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:08 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: commit on sync_fs
Date: Tue, 30 Sep 2008 12:19:12 +0300
Message-Id: <1222766358-21886-17-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Commit the journal when the FS is sync'ed. This will make
statfs provide better free space report. And we anyway
advice our users to sync the FS if they want better statfs
report.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index dae1c62..7e1f3ef 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -418,6 +418,7 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
 {
 	struct ubifs_info *c = sb->s_fs_info;
 	int i, ret = 0, err;
+	long long bud_bytes;
 
 	if (c->jheads)
 		for (i = 0; i < c->jhead_cnt; i++) {
@@ -425,6 +426,17 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
 			if (err && !ret)
 				ret = err;
 		}
+
+	/* Commit the journal unless it has too few data */
+	spin_lock(&c->buds_lock);
+	bud_bytes = c->bud_bytes;
+	spin_unlock(&c->buds_lock);
+	if (bud_bytes > c->leb_size) {
+		err = ubifs_run_commit(c);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * We ought to call sync for c->ubi but it does not have one. If it had
 	 * it would in turn call mtd->sync, however mtd operations are
-- 
1.5.4.1
