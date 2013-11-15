Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhB6v-00053t-Q0
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 04:34:26 +0000
Message-ID: <5285A434.2080608@oracle.com>
Date: Fri, 15 Nov 2013 12:33:56 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] ubifs: simplify drop_last_node() via
 list_last_entry_or_null()
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

Simplify the code in drop_last_node() via list_last_entry_or_null().

Signed-off-by: Jie Liu <jeff.liu@oracle.com>
---
 fs/ubifs/recovery.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 065096e..e46c394 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -603,12 +603,10 @@ static void drop_last_group(struct ubifs_scan_leb *sleb, int *offs)
  */
 static void drop_last_node(struct ubifs_scan_leb *sleb, int *offs)
 {
-	struct ubifs_scan_node *snod;
-
-	if (!list_empty(&sleb->nodes)) {
-		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
-				  list);
+	struct ubifs_scan_node *snod = list_last_entry_or_null(&sleb->nodes,
+				       struct ubifs_scan_node, list);
 
+	if (snod) {
 		dbg_rcvry("dropping last node at %d:%d",
 			  sleb->lnum, snod->offs);
 		*offs = snod->offs;
-- 
1.8.3.2
