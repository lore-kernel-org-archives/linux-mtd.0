Received: from f65.mail.ru ([194.67.57.99])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2Try-0004Ce-PK
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 15:51:41 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: David Woodhouse <dwmw2@infradead.org>,
	=?windows-1251?Q?linux-mtd=40lists.infradead.org?=
	<linux-mtd@lists.infradead.org>, Alexander Belyakov <abelyako@gmail.com>
Subject: [PATCH][JFFS2] Fix garbage collector block search
Mime-Version: 1.0
Date: Wed, 12 Dec 2007 18:51:28 +0300
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The patch checks if erasable_list is empty in jffs2_refile_wbuf_blocks() moving at least one block to that list. So jffs2_find_gc_block() will not fail sometimes with "jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?" message.

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c	2007-12-03 17:00:16.000000000 +0300
+++ b/fs/jffs2/wbuf.c	2007-12-11 19:03:03.000000000 +0300
@@ -115,7 +115,7 @@
 
 		D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from erasable_pending_wbuf_list...\n", jeb->offset));
 		list_del(this);
-		if ((jiffies + (n++)) & 127) {
+		if (((jiffies + (n++)) & 127) && !list_empty(&c->erasable_list)) {
 			/* Most of the time, we just erase it immediately. Otherwise we
 			   spend ages scanning it on mount, etc. */
 			D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
