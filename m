Received: from [86.54.240.115] (helo=drevil.shawell.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KsGZx-0002ZT-Tg
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 12:43:18 +0000
From: Steve Glendinning <steve.glendinning@smsc.com>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: [PATCH] [JFFS2] Fix build failure with !CONFIG_JFFS2_FS_WRITEBUFFER
Date: Tue, 21 Oct 2008 13:25:51 +0100
Message-Id: <1224591951-30369-1-git-send-email-steve.glendinning@smsc.com>
Cc: Steve Glendinning <steve.glendinning@smsc.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	Ian Saturley <ian.saturley@smsc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Build failure introduced by 5bf1723723487ddb0b9c9641b6559da96b27cc93
[JFFS2] Write buffer offset adjustment for NOR-ECC (Sibley) flash

Signed-off-by: Steve Glendinning <steve.glendinning@smsc.com>
---
 fs/jffs2/nodemgmt.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 0875b60..21a0529 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -261,9 +261,11 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
 
 	jffs2_sum_reset_collected(c->summary); /* reset collected summary */
 
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	/* adjust write buffer offset, else we get a non contiguous write bug */
 	if (!(c->wbuf_ofs % c->sector_size) && !c->wbuf_len)
 		c->wbuf_ofs = 0xffffffff;
+#endif
 
 	D1(printk(KERN_DEBUG "jffs2_find_nextblock(): new nextblock = 0x%08x\n", c->nextblock->offset));
 
-- 
1.5.5.1
