Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhB4W-0004xy-Bo
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 04:31:56 +0000
Message-ID: <5285A39C.4030507@oracle.com>
Date: Fri, 15 Nov 2013 12:31:24 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] xfs: simplify xfs_ail_max() via list_last_entry_or_null()
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

Simplify xfs_ail_max() with list_last_entry_or_null(), and move it to
xfs_trans_priv.h as an inline function as now it is one line.

Signed-off-by: Jie Liu <jeff.liu@oracle.com>
---
 fs/xfs/xfs_trans_ail.c  | 14 --------------
 fs/xfs/xfs_trans_priv.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/xfs_trans_ail.c b/fs/xfs/xfs_trans_ail.c
index a728735..af605d0 100644
--- a/fs/xfs/xfs_trans_ail.c
+++ b/fs/xfs/xfs_trans_ail.c
@@ -62,20 +62,6 @@ xfs_ail_check(
 #endif /* DEBUG */
 
 /*
- * Return a pointer to the last item in the AIL.  If the AIL is empty, then
- * return NULL.
- */
-static xfs_log_item_t *
-xfs_ail_max(
-	struct xfs_ail  *ailp)
-{
-	if (list_empty(&ailp->xa_ail))
-		return NULL;
-
-	return list_entry(ailp->xa_ail.prev, xfs_log_item_t, li_ail);
-}
-
-/*
  * Return a pointer to the item which follows the given item in the AIL.  If
  * the given item is the last item in the list, then return NULL.
  */
diff --git a/fs/xfs/xfs_trans_priv.h b/fs/xfs/xfs_trans_priv.h
index 12e86af..b1d93ae 100644
--- a/fs/xfs/xfs_trans_priv.h
+++ b/fs/xfs/xfs_trans_priv.h
@@ -97,6 +97,18 @@ xfs_ail_min(
 					li_ail);
 }
 
+/*
+ * Return a pointer to the last item in the AIL.  If the AIL is empty, then
+ * return NULL.
+ */
+static inline struct xfs_log_item *
+xfs_ail_max(
+	struct xfs_ail  *ailp)
+{
+	return list_last_entry_or_null(&ailp->xa_ail, struct xfs_log_item,
+				       li_ail);
+}
+
 static inline void
 xfs_trans_ail_update(
 	struct xfs_ail		*ailp,
-- 
1.8.3.2
