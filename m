Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NgICY-0002jg-Ll
	for linux-mtd@lists.infradead.org; Sat, 13 Feb 2010 13:38:31 +0000
In-Reply-To: <1265979582.29027.5.camel@localhost>
References: <DIIE.00001DD8002443BF@mail.auerswald.de>	
	<OF36A0B5DE.926C06F6-ONC12576C8.004392D1-C12576C8.0044B7AA@transmode.se>
	<1265979582.29027.5.camel@localhost>
Subject: Re: Why erase_pending_blocks in write_super? (was: [PATCH] JFFS2:
	Erase max 3 EB's in ...)
To: dedekind1@gmail.com
Message-ID: <OFB070621F.38B903A2-ONC12576C9.004A7C7A-C12576C9.004A9FC9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sat, 13 Feb 2010 14:35:05 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Kai-Uwe Bloem <kai-uwe.bloem@auerswald.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/12 13:59:42:
>
> On Fri, 2010-02-12 at 13:30 +0100, Joakim Tjernlund wrote:
> > > So, can you please enlighten me? What's the advantage of having the pending
> > > list erased in write_super? Can I possibly remove it without experiencing
> > > other problems?
> >
> > Me too wants to know :)
>
> I believe there is no reason. This is why I suggested to move it to the
> BGT.

This is a fist pass. Seems to work but probably need more work.
What do you think?

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 3ff50da..a8e0140 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -146,6 +146,7 @@ static int jffs2_garbage_collect_thread(void *_c)
 		disallow_signal(SIGHUP);

 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
+		jffs2_erase_pending_blocks(c, 0);
 		if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
 			printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread\n");
 			goto die;
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index b47679b..1ca2559 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -114,6 +114,11 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 	while (!list_empty(&c->erase_complete_list) ||
 	       !list_empty(&c->erase_pending_list)) {

+		if (signal_pending(current)) {
+			spin_unlock(&c->erase_completion_lock);
+			mutex_unlock(&c->erase_free_sem);
+			goto done;
+		}
 		if (!list_empty(&c->erase_complete_list)) {
 			jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
 			list_move(&jeb->list, &c->erase_checking_list);
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 21a0529..155fd63 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -733,6 +733,10 @@ int jffs2_thread_should_wake(struct jffs2_sb_info *c)
 	int nr_very_dirty = 0;
 	struct jffs2_eraseblock *jeb;

+	if (!list_empty(&c->erase_complete_list) ||
+	    !list_empty(&c->erase_pending_list))
+		return 1;
+
 	if (c->unchecked_size) {
 		D1(printk(KERN_DEBUG "jffs2_thread_should_wake(): unchecked_size %d, checked_ino #%d\n",
 			  c->unchecked_size, c->checked_ino));
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 9a80e8e..5162329 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -64,7 +64,6 @@ static void jffs2_write_super(struct super_block *sb)
 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
 		jffs2_garbage_collect_trigger(c);
-		jffs2_erase_pending_blocks(c, 0);
 		jffs2_flush_wbuf_gc(c, 0);
 	}
