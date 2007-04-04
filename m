Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HZ33x-0005ff-9r
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 06:50:02 -0400
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l34AnrQH003618
	for <linux-mtd@lists.infradead.org>; Wed, 4 Apr 2007 13:49:55 +0300
Message-ID: <46138259.30305@nokia.com>
Date: Wed, 04 Apr 2007 13:47:53 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Disable summary after wbuf recovery
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After a write error, any data in the write buffer must
be relocated.  This is handled by the jffs2_wbuf_recover
function.  This function does not fix up the erase block
summary information that is collected for writing at the
end of the block, which results in an incorrect summary
(or BUG if the summary was found to be empty).

As the summary is not essential (it is an optimisation),
it may be disabled for the current erase block when this
situation arises.  This patch does that.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/jffs2/wbuf.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 4fac6dd..f9da0e7 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -345,6 +345,9 @@ static void jffs2_wbuf_recover(struct jf
 		return;
 	}
 
+	/* The summary is not recovered, so it must be disabled for this erase block */
+	jffs2_sum_disable_collecting(c->summary);
+
 	ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, nr_refile);
 	if (ret) {
 		printk(KERN_WARNING "Failed to allocate node refs for wbuf recovery. Data loss ensues.\n");
-- 
1.4.3
