Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8PLH-0008As-5R
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 16:00:44 -0500
Date: Mon, 7 Mar 2005 22:00:39 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050307210039.GC26318@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] code simplification of blkdevs.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This could be a matter of taste, but it shrinks the binary by a few
bytes.

Before:
  [ 1] .text             PROGBITS        00000000 000040 000c18 00  AX  0   0 16
After:
  [ 1] .text             PROGBITS        00000000 000040 000bd8 00  AX  0   0 16

Commit?

Jörn

-- 
Geld macht nicht glücklich.
Glück macht nicht satt.


Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 drivers/mtd/mtd_blkdevs.c |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

--- linux-2.6.10cow/drivers/mtd/mtd_blkdevs.c~blktrans	2005-02-27 23:26:46.652890848 +0100
+++ linux-2.6.10cow/drivers/mtd/mtd_blkdevs.c	2005-02-27 23:34:26.855929352 +0100
@@ -382,34 +382,25 @@ int register_mtd_blktrans(struct mtd_blk
 
 	ret = register_blkdev(tr->major, tr->name);
 	if (ret) {
-		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
-		       tr->name, tr->major, ret);
-		kfree(tr->blkcore_priv);
-		up(&mtd_table_mutex);
-		return ret;
+		printk(KERN_WARNING "Unable to register %s block device on "
+				"major %d: %d\n", tr->name, tr->major, ret);
+		goto err0;
 	}
 	spin_lock_init(&tr->blkcore_priv->queue_lock);
 	init_completion(&tr->blkcore_priv->thread_dead);
 	init_waitqueue_head(&tr->blkcore_priv->thread_wq);
 
-	tr->blkcore_priv->rq = blk_init_queue(mtd_blktrans_request, &tr->blkcore_priv->queue_lock);
-	if (!tr->blkcore_priv->rq) {
-		unregister_blkdev(tr->major, tr->name);
-		kfree(tr->blkcore_priv);
-		up(&mtd_table_mutex);
-		return -ENOMEM;
-	}
+	tr->blkcore_priv->rq = blk_init_queue(mtd_blktrans_request,
+			&tr->blkcore_priv->queue_lock);
+	ret = -ENOMEM;
+	if (!tr->blkcore_priv->rq)
+		goto err1;
 
 	tr->blkcore_priv->rq->queuedata = tr;
 
 	ret = kernel_thread(mtd_blktrans_thread, tr, CLONE_KERNEL);
-	if (ret < 0) {
-		blk_cleanup_queue(tr->blkcore_priv->rq);
-		unregister_blkdev(tr->major, tr->name);
-		kfree(tr->blkcore_priv);
-		up(&mtd_table_mutex);
-		return ret;
-	} 
+	if (ret < 0)
+		goto err2;
 
 	devfs_mk_dir(tr->name);
 
@@ -424,6 +415,15 @@ int register_mtd_blktrans(struct mtd_blk
 	up(&mtd_table_mutex);
 
 	return 0;
+
+err2:
+	blk_cleanup_queue(tr->blkcore_priv->rq);
+err1:
+	unregister_blkdev(tr->major, tr->name);
+err0:
+	kfree(tr->blkcore_priv);
+	up(&mtd_table_mutex);
+	return ret;
 }
 
 int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
