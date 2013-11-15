Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhB5u-00051p-O7
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 04:33:23 +0000
Message-ID: <5285A3F4.4040000@oracle.com>
Date: Fri, 15 Nov 2013 12:32:52 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] gfs2: simplify current_tail() via
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

Simplify the code in current_tail() via list_last_entry_or_null().

Signed-off-by: Jie Liu <jeff.liu@oracle.com>
---
 fs/gfs2/log.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 610613f..555f767 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -441,13 +441,9 @@ static unsigned int current_tail(struct gfs2_sbd *sdp)
 
 	spin_lock(&sdp->sd_ail_lock);
 
-	if (list_empty(&sdp->sd_ail1_list)) {
-		tail = sdp->sd_log_head;
-	} else {
-		tr = list_entry(sdp->sd_ail1_list.prev, struct gfs2_trans,
-				tr_list);
-		tail = tr->tr_first;
-	}
+	tr = list_last_entry_or_null(&sdp->sd_ail1_list, struct gfs2_trans,
+				     tr_list);
+	tail = tr ? tr->tr_first : sdp->sd_log_head;
 
 	spin_unlock(&sdp->sd_ail_lock);
 
-- 
1.8.3.2
