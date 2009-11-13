Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8z5s-000138-OY
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 16:33:57 +0000
In-Reply-To: <1258127530.21596.1260.camel@localhost>
References: <4ACF3478.1060503@aimvalley.nl>	<1255269148.16942.95.camel@localhost>
	<4AD30069.8060101@aimvalley.nl>
	<1255510600.32489.130.camel@localhost>
	<4AFADE3B.3050406@aimvalley.nl>	<1258100455.21596.1187.camel@localhost>
	<4AFD76AB.20301@aimvalley.nl>
	<1258127530.21596.1260.camel@localhost>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
To: dedekind1@gmail.com
Message-ID: <OF757E3BCE.63A1CFD1-ONC125766D.005948DC-C125766D.005A877F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 13 Nov 2009 17:28:49 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> On Fri, 2009-11-13 at 16:09 +0100, Norbert van Bolhuis wrote:
> > OK, so now I understand commit_sem is a RW semaphore which can be acquired multiple
> > times by readers but only once for writers. I failed to see that initially.
> > I think this problem is not related to the commit_sem though.
>
> OK.
>
> > I changed the logging a bit and added the PID info.
> > The problem is indeed caused by a third task holding the "MTD chip lock". This
> > blocks the application which is blocking pdflush.
>
> OK.
>
> > This 3rd task is the UBI background thread. It starts to erase many NOR PEBsvery soon.
>
> The only reason I see why it would do this is because you attach an
> empty flash to UBI. In this case, UBI has to format it. And it is doing
> the formatting asynchronously, in the background thread.
>
> The idea was that we can allow using the UBI volume even if it is not
> fully formatted, and format in parallel. For NAND with its fast erase it
> works fine. With NOR it appears to be not so goot.
>
> Please, attach UBI, then wait until the UBI background thread is done,
> and then mount and start using UBIFS.
>
> The other option is to format the flash _properly_ before attaching it
> to UBI. In this case the background thread will not have to do that job.

Erasing blocks should never block other stuff as long as there is free
space available.
I had a similar problem with JFFS2 and rebooting during erase.
Turns out that if you remove some big files
and then reboot, it will hang during remount RO/umount until all
flash sectors has been erased. I fixed the problem with the following
patch, but it was never accepted as it is racy w.r.t module unload.
Fortunately I don't use modules so I got no issues with it.

 Jocke

>From 3184883eab1f0703dedc0ed3aa23e1bd94693601 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Fri, 9 Nov 2007 13:48:08 +0100
Subject: [PATCH] [JFFS2] Stop erasing blocks when rebooting.

Rebooting shortly after deleting lots of big files
makes the reboot hang until all blocks has been erased,
which can take minutes if there are lots of blocks to erase.
This addresses the issue by moving the erasing to
pdflush_operation context and testing for the superblock
flags MS_RDONLY and MS_ACTIVE while erasing.
---
 fs/jffs2/erase.c |    8 ++++++++
 fs/jffs2/fs.c    |   11 ++++++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..ec95a28 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -106,6 +106,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 {
 	struct jffs2_eraseblock *jeb;
+	struct super_block *sb = OFNI_BS_2SFFJ(c);

 	down(&c->erase_free_sem);

@@ -114,6 +115,13 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 	while (!list_empty(&c->erase_complete_list) ||
 	       !list_empty(&c->erase_pending_list)) {

+		if ((sb->s_flags & MS_RDONLY) || !(sb->s_flags & MS_ACTIVE)) {
+			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
+			D1(printk(KERN_DEBUG "FS readonly/inactive. "
+				  "jffs2_erase_pending_blocks leaving\n"));
+			goto done;
+		}
 		if (!list_empty(&c->erase_complete_list)) {
 			jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
 			list_del(&jeb->list);
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index ed85f9a..f102607 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
+#include <linux/writeback.h>	/* for erasing blocks */
 #include <linux/list.h>
 #include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
@@ -385,6 +386,14 @@ int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
 	return 0;
 }

+void do_start_erase(unsigned long sb_arg)
+{
+	struct super_block *sb = (struct super_block *) sb_arg;
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+
+	jffs2_erase_pending_blocks(c, 0);
+}
+
 void jffs2_write_super (struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
@@ -395,7 +404,7 @@ void jffs2_write_super (struct super_block *sb)

 	D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
 	jffs2_garbage_collect_trigger(c);
-	jffs2_erase_pending_blocks(c, 0);
+	pdflush_operation(do_start_erase, (unsigned long)sb);
 	jffs2_flush_wbuf_gc(c, 0);
 }

--
1.6.4.4
