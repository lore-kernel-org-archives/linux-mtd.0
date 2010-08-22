Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1On5Ea-0004Mp-U3
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 07:44:53 +0000
Received: by fxm12 with SMTP id 12so2981537fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Aug 2010 00:44:50 -0700 (PDT)
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C4FDEF5.2040405@parrot.com>
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>
	<4C3C2740.2040105@parrot.com> <4C3C30D1.9030005@parrot.com>
	<1279031064.31639.90.camel@localhost> <4C3C81E3.3030407@parrot.com>
	<4C4FDEF5.2040405@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Aug 2010 10:44:46 +0300
Message-ID: <1282463086.16502.38.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-28 at 09:40 +0200, Matthieu CASTET wrote:
> I manage to reproduce it with the backtrace [1].

Matthieu, your work-around patch or something very close should
certainly be applied to the UBIFS tree, but I still would like to find
out what exactly happened in your setup.

I see 2 possibilities:

1. An error happened and 'ubifs_garbage_collect()' returned while
c->gc_lnum was -1. But in this case we should have switched to R/O mode,
and the master node would not be written. But may be for some reasons we
did not switch to R/O mode, dunno.

2. More likely scenario: in 'ubifs_rcvry_gc_commit()' we call
'ubifs_garbage_collect_leb()' directly, which can return while
c->gc_lnum is -1. And we do not handle this.

Would you please be patient enough to reproduce the issue once again with
the following patch, which was created against the latest ubifs-2.6.git, but
you should be easily able to apply it to your tree.

Artem.

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index c8ff0d1..aa433cd 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -83,6 +83,10 @@ static int run_gc(struct ubifs_info *c)
 	down_read(&c->commit_sem);
 	lnum = ubifs_garbage_collect(c, 1);
 	up_read(&c->commit_sem);
+	if (c->gc_lnum == -1) {
+		ubifs_err("gc_lnum is -1! ubifs_garbage_collect() returned %d", lnum);
+		dump_stack();
+	}
 	if (lnum < 0)
 		return lnum;
 
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 396f24a..0e78832 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -807,12 +807,20 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 		goto out;
 	}
 out_unlock:
+	if (c->gc_lnum == -1) {
+		ubifs_err("gc_lnum is -1! ubifs_garbage_collect() is returning %d", ret);
+		dump_stack();
+	}
 	mutex_unlock(&wbuf->io_mutex);
 	return ret;
 
 out:
 	ubifs_assert(ret < 0);
 	ubifs_assert(ret != -ENOSPC && ret != -EAGAIN);
+	if (c->gc_lnum == -1) {
+		ubifs_err("gc_lnum is -1! ubifs_garbage_collect() is returning %d", ret);
+		dump_stack();
+	}
 	ubifs_wbuf_sync_nolock(wbuf);
 	ubifs_ro_mode(c, ret);
 	mutex_unlock(&wbuf->io_mutex);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index d321bae..44df514 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -162,6 +162,10 @@ again:
 	mutex_unlock(&wbuf->io_mutex);
 
 	lnum = ubifs_garbage_collect(c, 0);
+	if (c->gc_lnum == -1) {
+		ubifs_err("gc_lnum is -1! ubifs_garbage_collect() returned %d", lnum);
+		dump_stack();
+	}
 	if (lnum < 0) {
 		err = lnum;
 		if (err != -ENOSPC)
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index daae9e1..3058256 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1126,6 +1126,10 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	dbg_rcvry("GC'ing LEB %d", lnum);
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
 	err = ubifs_garbage_collect_leb(c, &lp);
+	if (c->gc_lnum == -1) {
+		ubifs_err("gc_lnum is -1! ubifs_garbage_collect_leb() returned %d", err);
+		dump_stack();
+	}
 	if (err >= 0) {
 		int err2 = ubifs_wbuf_sync_nolock(wbuf);
 
