Subject: Re: jffs2 lockdep warning
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200804292139.35426.david-b@pacbell.net>
References: <200804292139.35426.david-b@pacbell.net>
Content-Type: text/plain
Date: Thu, 01 May 2008 15:33:31 +0100
Message-Id: <1209652411.25560.570.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-04-29 at 21:39 -0700, David Brownell wrote:
> ash/378 is trying to acquire lock:
>  (&c->alloc_sem){--..}, at: [<900b9ea4>] jffs2_reserve_space+0x28/0x120
> 
> but task is already holding lock:
>  (&ei->sem){--..}, at: [<900c0584>] jffs2_new_inode+0x4c/0x180
> 
> which lock already depends on the new lock.

Thanks for the report. It's actually a false positive, since it's a
newly-created inode -- so nothing else can be trying to take its ->sem
after holding c->alloc_sem, and the AB-BA deadlock cannot happen even
though we shouldn't _normally_ try to take c->alloc_sem while we're
holding a per-inode mutex (as documented in README.Locking).

But it's relatively simple to fix, too:

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index c63e7a9..2bba3d3 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -208,6 +208,13 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 	f = JFFS2_INODE_INFO(inode);
 	dir_f = JFFS2_INODE_INFO(dir_i);
 
+	/* jffs2_do_create() will want to lock it, _after_ reserving
+	   space and taking c-alloc_sem. If we keep it locked here,
+	   lockdep gets unhappy (although it's a false positive;
+	   nothing else will be looking at this inode yet so there's
+	   no chance of AB-BA deadlock involving its f->sem). */
+	mutex_unlock(&f->sem);
+
 	ret = jffs2_do_create(c, dir_f, f, ri,
 			      dentry->d_name.name, dentry->d_name.len);
 	if (ret)
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 665fce9..87891bd 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -438,10 +438,10 @@ int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, str
 	ret = jffs2_reserve_space(c, sizeof(*ri), &alloclen, ALLOC_NORMAL,
 				JFFS2_SUMMARY_INODE_SIZE);
 	D1(printk(KERN_DEBUG "jffs2_do_create(): reserved 0x%x bytes\n", alloclen));
-	if (ret) {
-		mutex_unlock(&f->sem);
+	if (ret)
 		return ret;
-	}
+
+	mutex_lock(&f->sem);
 
 	ri->data_crc = cpu_to_je32(0);
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));

-- 
dwmw2
