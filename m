Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhB7h-00055z-Jw
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 04:35:13 +0000
Message-ID: <5285A464.1070904@oracle.com>
Date: Fri, 15 Nov 2013 12:34:44 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] jfs: simplify lmNextPage() via list_last_entry_or_null()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, oleg@redhat.com,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jie Liu <jeff.liu@oracle.com>

Simplify the code in lmNextPage via list_last_entry_or_null().

Signed-off-by: Jie Liu <jeff.liu@oracle.com>
---
 fs/jfs/jfs_logmgr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 360d27c..7b565d0 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -591,10 +591,7 @@ static int lmNextPage(struct jfs_log * log)
 	 *	write or queue the full page at the tail of write queue
 	 */
 	/* get the tail tblk on commit queue */
-	if (list_empty(&log->cqueue))
-		tblk = NULL;
-	else
-		tblk = list_entry(log->cqueue.prev, struct tblock, cqueue);
+	tblk = list_last_entry_or_null(&log->cqueue, struct tblock, cqueue);
 
 	/* every tblk who has COMMIT record on the current page,
 	 * and has not been committed, must be on commit queue
-- 
1.8.3.2
