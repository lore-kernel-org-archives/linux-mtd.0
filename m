Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHvCp-0008V7-PE
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2003 01:14:31 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AHvBa-0002Jd-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2003 02:13:14 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Fri, 7 Nov 2003 01:49:45 +0100
Message-ID: <20031107004945.GA25590@ctnet.pl>
References: <1068028888.6065.20.camel@hades.cambridge.redhat.com>
	<slrnbqgacq.1t2.miernik@tarnica.ctnet.pl>
	<slrnbqhkno.2rl.miernik@tarnica.ctnet.pl>
Mime-Version: 1.0
Content-Disposition: inline
Sender: news <news@sea.gmane.org>
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Subject: [PATCH] gets the current CVS MTD code to compile with 2.6.0-test9
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

David Woodhouse wrote:

> I haven't been tracking changes in Linus' 2.6 tree recently. Some stuff
> changed in Linus' tree since I last looked. Take a diff between what's
> actually in 2.6, and the corresponding $Id$ tag from CVS... those are
> the changes which need to be merged into the CVS tree.

Here is a patch which makes the smallest set of changes needed to get 
current CVS code to compile with kernel 2.6.0-test9

I also place it on the web: 
http://www.miernik.ctnet.pl/mtd/mtd-miernik-20031107.diff

Authors of the three changed files: please take a look what I did with 
this, in case I'm destroying something you've meant to do.
If it's OK, please merge it into CVS. 

-- 
    Miernik         ________________________ jabber:miernik@amessage.info
___________________/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Bush "won" 2000 elections with 537 Florida votes. More people where illegaly 
prevented to vote:  http://www.observer.co.uk/Print/0,3858,4103063,00.html 

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mtd-miernik-20031107.diff"

diff -Nur mtd.orig/drivers/mtd/maps/pcmciamtd.c mtd/drivers/mtd/maps/pcmciamtd.c
--- mtd.orig/drivers/mtd/maps/pcmciamtd.c	2003-06-24 09:14:38.000000000 +0200
+++ mtd/drivers/mtd/maps/pcmciamtd.c	2003-11-07 00:07:47.000000000 +0100
@@ -721,7 +721,7 @@
 				del_mtd_device(dev->mtd_info);
 				info("mtd%d: Removed", dev->mtd_info->index);
 			}
-			mod_timer(&link->release, jiffies + HZ/20);
+			pcmciamtd_release((u_long)link);
 		}
 		break;
 	case CS_EVENT_CARD_INSERTION:
@@ -762,8 +762,6 @@
 {
 	DEBUG(3, "link=0x%p", link);
 
-	del_timer(&link->release);
-
 	if(link->state & DEV_CONFIG) {
 		pcmciamtd_release((u_long)link);
 	}
@@ -801,10 +799,6 @@
 	link = &dev->link;
 	link->priv = dev;
 
-	init_timer(&link->release);
-	link->release.function = &pcmciamtd_release;
-	link->release.data = (u_long)link;
-
 	link->conf.Attributes = 0;
 	link->conf.IntType = INT_MEMORY;
 
diff -Nur mtd.orig/drivers/mtd/mtd_blkdevs.c mtd/drivers/mtd/mtd_blkdevs.c
--- mtd.orig/drivers/mtd/mtd_blkdevs.c	2003-09-08 13:37:23.000000000 +0200
+++ mtd/drivers/mtd/mtd_blkdevs.c	2003-11-07 00:16:43.000000000 +0100
@@ -33,7 +33,7 @@
 	struct completion thread_dead;
 	int exiting;
 	wait_queue_head_t thread_wq;
-	struct request_queue rq;
+	struct request_queue *rq;
 	spinlock_t queue_lock;
 };
 
@@ -79,7 +79,7 @@
 static int mtd_blktrans_thread(void *arg)
 {
 	struct mtd_blktrans_ops *tr = arg;
-	struct request_queue *rq = &tr->blkcore_priv->rq;
+	struct request_queue *rq = tr->blkcore_priv->rq;
 
 	/* we might get involved when memory gets low, so use PF_MEMALLOC */
 	current->flags |= PF_MEMALLOC;
@@ -301,7 +301,7 @@
 
 	gd->private_data = new;
 	new->blkcore_priv = gd;
-	gd->queue = &tr->blkcore_priv->rq;
+	gd->queue = tr->blkcore_priv->rq;
 
 	if (new->readonly)
 		set_disk_ro(gd, 1);
@@ -392,14 +392,20 @@
 	init_completion(&tr->blkcore_priv->thread_dead);
 	init_waitqueue_head(&tr->blkcore_priv->thread_wq);
 
-	blk_init_queue(&tr->blkcore_priv->rq, mtd_blktrans_request, 
-		       &tr->blkcore_priv->queue_lock);
-	tr->blkcore_priv->rq.queuedata = tr;
+	tr->blkcore_priv->rq = blk_init_queue(mtd_blktrans_request, &tr->blkcore_priv->queue_lock);
+	if (!tr->blkcore_priv->rq) {
+		unregister_blkdev(tr->major, tr->name);
+		kfree(tr->blkcore_priv);
+		up(&mtd_table_mutex);
+		return -ENOMEM;
+	}
+
+	tr->blkcore_priv->rq->queuedata = tr;
 
 	ret = kernel_thread(mtd_blktrans_thread, tr, 
 			    CLONE_FS|CLONE_FILES|CLONE_SIGHAND);
 	if (ret < 0) {
-		blk_cleanup_queue(&tr->blkcore_priv->rq);
+		blk_cleanup_queue(tr->blkcore_priv->rq);
 		unregister_blkdev(tr->major, tr->name);
 		kfree(tr->blkcore_priv);
 		up(&mtd_table_mutex);
@@ -441,7 +447,7 @@
 	}
 
 	devfs_remove(tr->name);
-	blk_cleanup_queue(&tr->blkcore_priv->rq);
+	blk_cleanup_queue(tr->blkcore_priv->rq);
 	unregister_blkdev(tr->major, tr->name);
 
 	up(&mtd_table_mutex);
diff -Nur mtd.orig/drivers/mtd/mtdchar.c mtd/drivers/mtd/mtdchar.c
--- mtd.orig/drivers/mtd/mtdchar.c	2003-05-21 12:50:43.000000000 +0200
+++ mtd/drivers/mtd/mtdchar.c	2003-11-07 00:07:47.000000000 +0100
@@ -62,7 +62,7 @@
 
 static int mtd_open(struct inode *inode, struct file *file)
 {
-	int minor = minor(inode->i_rdev);
+	int minor = iminor(inode);
 	int devnum = minor >> 1;
 	struct mtd_info *mtd;
 

--opJtzjQTFsWo+cga--
