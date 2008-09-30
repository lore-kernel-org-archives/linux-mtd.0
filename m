Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZrr-0005HS-3x
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:41:59 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7fu0K009926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:41:56 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: allow for sync_fs when read-only
Date: Tue, 30 Sep 2008 12:19:13 +0300
Message-Id: <1222766358-21886-18-git-send-email-dedekind@infradead.org>
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

From: Adrian Hunter <ext-adrian.hunter@nokia.com>

sync_fs can be called even if the file system is mounted
read-only.  Ensure the commit is not run in that case.

Reported-by: Zoltan Sogor <weth@inf.u-szeged.hu>
Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/ubifs/super.c |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7e1f3ef..7fd759d 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -420,21 +420,22 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
 	int i, ret = 0, err;
 	long long bud_bytes;
 
-	if (c->jheads)
+	if (c->jheads) {
 		for (i = 0; i < c->jhead_cnt; i++) {
 			err = ubifs_wbuf_sync(&c->jheads[i].wbuf);
 			if (err && !ret)
 				ret = err;
 		}
 
-	/* Commit the journal unless it has too few data */
-	spin_lock(&c->buds_lock);
-	bud_bytes = c->bud_bytes;
-	spin_unlock(&c->buds_lock);
-	if (bud_bytes > c->leb_size) {
-		err = ubifs_run_commit(c);
-		if (err)
-			return err;
+		/* Commit the journal unless it has too little data */
+		spin_lock(&c->buds_lock);
+		bud_bytes = c->bud_bytes;
+		spin_unlock(&c->buds_lock);
+		if (bud_bytes > c->leb_size) {
+			err = ubifs_run_commit(c);
+			if (err)
+				return err;
+		}
 	}
 
 	/*
-- 
1.5.4.1
