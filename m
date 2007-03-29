Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWpaM-0000KA-8S
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 04:02:21 -0400
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2T81wfM018528
	for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2007 11:02:10 +0300
Message-ID: <460B722F.9020604@nokia.com>
Date: Thu, 29 Mar 2007 11:00:47 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Prevent list corruption when handling write errors
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

If a write error occurs, the affected block is placed on the
bad_used_list.  In the case that the write error occured
when writing summary data the block was also being placed on
the dirty_list, which caused list corruption and ultimately
a soft lockup in jffs2_mark_node_obsolete. This fixes that.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/jffs2/nodemgmt.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index d883769..c8b50de 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -172,6 +172,11 @@ int jffs2_reserve_space_gc(struct jffs2_
 static void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
 
+	if (c->nextblock == NULL) {
+		D1(printk(KERN_DEBUG "jffs2_close_nextblock: Erase block at 0x%08x has already been placed in a list\n",
+		  jeb->offset));
+		return;
+	}
 	/* Check, if we have a dirty block now, or if it was dirty already */
 	if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
 		c->dirty_size += jeb->wasted_size;
-- 
1.4.3
