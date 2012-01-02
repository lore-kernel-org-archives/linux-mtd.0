Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqz-0003W0-37
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:19:02 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: =?utf-8?q?=5BPATCH=2016/17=5D=20logfs=3A=20do=20not=20use=20=27mtd-=3Eblock=5Fisbad=27=20directly?=
Date: Mon,  2 Jan 2012 14:20:46 +0200
Message-Id: <1325506847-23470-17-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead, use the new 'mtd_can_have_bb()' helper.

Cc: Jörn Engel <joern@logfs.org>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/logfs/dev_mtd.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 3f465882..e97404d 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -152,7 +152,7 @@ static struct page *logfs_mtd_find_first_sb(struct super_block *sb, u64 *ofs)
 	filler_t *filler = logfs_mtd_readpage;
 	struct mtd_info *mtd = super->s_mtd;
 
-	if (!mtd->block_isbad)
+	if (!mtd_can_have_bb(mtd))
 		return NULL;
 
 	*ofs = 0;
@@ -172,7 +172,7 @@ static struct page *logfs_mtd_find_last_sb(struct super_block *sb, u64 *ofs)
 	filler_t *filler = logfs_mtd_readpage;
 	struct mtd_info *mtd = super->s_mtd;
 
-	if (!mtd->block_isbad)
+	if (!mtd_can_have_bb(mtd))
 		return NULL;
 
 	*ofs = mtd->size - mtd->erasesize;
-- 
1.7.7.3
