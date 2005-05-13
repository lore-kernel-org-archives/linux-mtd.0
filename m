Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWU2c-0007zY-MU
	for linux-mtd@lists.infradead.org; Fri, 13 May 2005 02:52:59 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ralph Walden <ralphw@everest-co.com>
In-Reply-To: <81772B4336DEC14EBB8C519C4EC21051F80DA7@pe2650.everest-co.com>
References: <81772B4336DEC14EBB8C519C4EC21051F80DA7@pe2650.everest-co.com>
Content-Type: text/plain
Date: Fri, 13 May 2005 10:52:27 +0400
Message-Id: <1115967147.20270.0.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: kernel BUG at fs/jffs2/gc.c:190!
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph,

please try the following patch for fs/jffs2/super.c:


--- super.c     2005-05-13 10:47:50.011432985 +0400
+++ fixed-super.c       2005-05-13 10:47:13.652273817 +0400
@@ -270,8 +270,6 @@

        D2(printk(KERN_DEBUG "jffs2: jffs2_put_super()\n"));

-       if (!(sb->s_flags & MS_RDONLY))
-               jffs2_stop_garbage_collect_thread(c);
        down(&c->alloc_sem);
        jffs2_flush_wbuf_pad(c);
        up(&c->alloc_sem);
@@ -292,6 +290,8 @@
 static void jffs2_kill_sb(struct super_block *sb)
 {
        struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+       if (!(sb->s_flags & MS_RDONLY))
+               jffs2_stop_garbage_collect_thread(c);
        generic_shutdown_super(sb);
        put_mtd_device(c->mtd);
        kfree(c);


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
