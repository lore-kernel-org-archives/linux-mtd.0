Received: from mx7.zte.com.cn ([202.103.147.169] helo=zte.com.cn)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAEi5-0002iE-S1
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 07:44:39 +0000
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
 by Websense Email Security Gateway with ESMTPS id 4D377747BA8
 for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2013 15:43:46 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse02.zte.com.cn with ESMTP id r7G7hgo8056785
 for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2013 15:43:42 +0800 (GMT-8)
 (envelope-from wang.bo116@zte.com.cn)
Subject: [PATCH] UBIFS: remove unnecessary code in ubifs_garbage_collect
To: linux-mtd@lists.infradead.org
Message-ID: <OF476A1E1E.10D82F3D-ON48257BC9.002911AE-48257BC9.002A75A8@zte.com.cn>
From: wang.bo116@zte.com.cn
Date: Fri, 16 Aug 2013 15:43:36 +0800
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



Hi,
	In ubifs_garbage_collect,local variable "space_before" calculate twice. In fact, at the
beginning of the loop, there is no need to calculate this variable. Calculate it before call
"ubifs_garbage_collect_leb" is enough. This patch just remove the unnecessary calculate code.



Signed-off-by: wang bo <wang.bo116@zte.com.cn>
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 76ca53c..38dc67d 100755
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -668,7 +668,7 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 	ubifs_assert(!wbuf->used);

 	for (i = 0; ; i++) {
-		int space_before = c->leb_size - wbuf->offs - wbuf->used;
+		int space_before;
 		int space_after;

 		cond_resched();
