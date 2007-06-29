Received: from an-out-0708.google.com ([209.85.132.250])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I49uy-0002jY-RR
	for linux-mtd@lists.infradead.org; Fri, 29 Jun 2007 02:25:23 -0400
Received: by an-out-0708.google.com with SMTP id c3so162704ana
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Jun 2007 23:25:19 -0700 (PDT)
Message-ID: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
Date: Fri, 29 Jun 2007 10:25:19 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've met an error when JFFS2 is unable to write data unreasonably
returning -EIO. The scenario might be as follow:

1. fill jffs2 partition with data (full flash condition).
2. unlink single file.
3. try to write new file.

The last step sometimes fails. It is highly reproducible especially on
small volumes.

jffs2_do_reserve_space() sees that nr_free_blocks plus
nr_erasing_blocks is not enough and tries to call
jffs2_garbage_collect_pass() which calls jffs2_find_gc_block().
jffs2_find_gc_block() falls into not empty erasable_pending_wbuf_list
case and calls jffs2_flush_wbuf_pad(). jffs2_flush_wbuf_pad() calls
jffs2_refile_wbuf_blocks() which tries to move blocks from
erasable_pending_wbuf_list to erase_pending_list and (with a small
chance) to erasable_list.

So there is a chance that eraseble_list is still empty upon
jffs2_flush_wbuf_pad() exit. Thus jffs2_find_gc_block() fails with
"jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are
they all?" message.

They are at erase_pending_list at that point (and write can succeed),
but jffs2_garbage_collect_pass() fails failing
jffs2_do_reserve_space() and consequently write attempt.

There are several places where this bug can be fixed.

The patch below checks if erasable_list is empty. If so
jffs2_refile_wbuf_blocks() moves at least one block to that list.
jffs2_find_gc_block() will not fail in that case and write will
succeed.

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
---
diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c	2007-05-25 01:22:47.000000000 +0400
+++ b/fs/jffs2/wbuf.c	2007-06-20 18:45:09.000000000 +0400
@@ -117,7 +117,7 @@

 		D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from
erasable_pending_wbuf_list...\n", jeb->offset));
 		list_del(this);
-		if ((jiffies + (n++)) & 127) {
+		if (((jiffies + (n++)) & 127) && !list_empty(&c->erasable_list)) {
 			/* Most of the time, we just erase it immediately. Otherwise we
 			   spend ages scanning it on mount, etc. */
 			D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
