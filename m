Received: from mx7.zte.com.cn ([202.103.147.169] helo=zte.com.cn)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9vDE-0004ll-JQ
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 10:55:30 +0000
Subject: [PATCH] UBIFS: remove unnecessary code in ubifs_garbage_collect
To: linux-mtd@lists.infradead.org
Message-ID: <OF5D2B97A5.BBB53CFB-ON48257BC8.00312DE8-48257BC8.003BEE50@zte.com.cn>
From: wang.bo116@zte.com.cn
Date: Thu, 15 Aug 2013 18:54:26 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
	In ubifs_garbage_collect, "space_before" calculate twice, i think the
first one is unnecessary.


Signed-off-by: wang bo <wang.bo116@zte.com.cn>
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 76ca53c..38dc67d 100755
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -668,7 +668,7 @@ int ubifs_garbage_collect(struct ubifs_info *c, int
anyway)
 	ubifs_assert(!wbuf->used);

 	for (i = 0; ; i++) {
-		int space_before = c->leb_size - wbuf->offs - wbuf->used;
+		int space_before;
 		int space_after;

 		cond_resched();
