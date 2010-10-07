Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3lEZ-0004iK-BC
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 07:49:48 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id E40752597D9
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Oct 2010 09:49:44 +0200 (CEST)
In-Reply-To: <OF23585AD5.AC5BB50F-ONC12577B5.0025413E-C12577B5.00263D39@transmode.se>
References: <OF23585AD5.AC5BB50F-ONC12577B5.0025413E-C12577B5.00263D39@transmode.se>
Subject: Re: JFFS2 very slow when erasing
Cc: linux-mtd@lists.infradead.org
Message-ID: <OF2426448C.2DD5559B-ONC12577B5.002AC992-C12577B5.002B0177@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 7 Oct 2010 09:49:44 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> With 2.6.35 JFFS2 takes a very long time cp files while it erases:
>  cp big_file test
>  rm test
>  cp big_file test
> The last cp op. takes several times longer because JFFS2 is erasing.
> Revering the patches I helped out with make JFFS2 go fast again:
>   jffs2: Stop triggering block erases from jffs2_write_super()
>   jffs2: Rename jffs2_erase_pending_trigger() to jffs2_dirty_trigger()
>   jffs2: Use jffs2_garbage_collect_trigger() to trigger pending erases
>   jffs2: Require jffs2_garbage_collect_trigger() to be called with lock held
>   jffs2: Wake GC thread when there are blocks to be erased
>   jffs2: Erase pending blocks in GC pass, avoid invalid -EIO return
>
> The final patches were somewhat different than the ones I originally wrote
> and I THINK those didn't make JFFS2 go this slow.
>
> I suspect there is a locking problem somewhere.

Commenting out this makes JFFS2 fast again:
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index f5e96bd..bce3a30 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -213,7 +213,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		mutex_unlock(&c->alloc_sem);
 		return ret;
 	}
-
+#if 0
 	/* If there are any blocks which need erasing, erase them now */
 	if (!list_empty(&c->erase_complete_list) ||
 	    !list_empty(&c->erase_pending_list)) {
@@ -226,7 +226,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		D1(printk(KERN_DEBUG "No progress from erasing blocks; doing GC anyway\n"));
 		spin_lock(&c->erase_completion_lock);
 	}
-
+#endif
 	/* First, work out which block we're garbage-collecting */
 	jeb = c->gcblock;

Seems to me that jffs2_garbage_collect_pass() is trying too much.
David?

      Jocke
