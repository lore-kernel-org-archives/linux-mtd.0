Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZs1-0005KV-JP
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:10 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7g6ps010009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:42:07 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: correct comment for commit_on_unmount
Date: Tue, 30 Sep 2008 12:19:11 +0300
Message-Id: <1222766358-21886-16-git-send-email-dedekind@infradead.org>
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

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cf078b5..dae1c62 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1465,12 +1465,9 @@ out:
  * commit_on_unmount - commit the journal when un-mounting.
  * @c: UBIFS file-system description object
  *
- * This function is called during un-mounting and it commits the journal unless
- * the "fast unmount" mode is enabled. It also avoids committing the journal if
- * it contains too few data.
- *
- * Sometimes recovery requires the journal to be committed at least once, and
- * this function takes care about this.
+ * This function is called during un-mounting and re-mounting, and it commits
+ * the journal unless the "fast unmount" mode is enabled. It also avoids
+ * committing the journal if it contains too few data.
  */
 static void commit_on_unmount(struct ubifs_info *c)
 {
-- 
1.5.4.1
