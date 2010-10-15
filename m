Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6m6Q-0000we-8Z
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 15:21:55 +0000
Received: by mail-bw0-f49.google.com with SMTP id 7so1638853bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 08:21:49 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 5/5] mtd: sm_ftl: cosmetic, use bool when possible
Date: Fri, 15 Oct 2010 17:20:47 +0200
Message-Id: <1287156047-17439-6-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I didn't know that kernel allows use of that typedef.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/sm_ftl.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/sm_ftl.h b/drivers/mtd/sm_ftl.h
index e30e48e..43bb730 100644
--- a/drivers/mtd/sm_ftl.h
+++ b/drivers/mtd/sm_ftl.h
@@ -20,7 +20,7 @@
 
 
 struct ftl_zone {
-	int initialized;
+	bool initialized;
 	int16_t *lba_to_phys_table;		/* LBA to physical table */
 	struct kfifo free_sectors;	/* queue of free sectors */
 };
@@ -37,8 +37,8 @@ struct sm_ftl {
 	int zone_count;			/* number of zones */
 	int max_lba;			/* maximum lba in a zone */
 	int smallpagenand;		/* 256 bytes/page nand */
-	int readonly;			/* is FS readonly */
-	int unstable;
+	bool readonly;			/* is FS readonly */
+	bool unstable;
 	int cis_block;			/* CIS block location */
 	int cis_boffset;		/* CIS offset in the block */
 	int cis_page_offset;		/* CIS offset in the page */
@@ -49,7 +49,7 @@ struct sm_ftl {
 	int cache_zone;			/* zone of cached block */
 	unsigned char *cache_data;	/* cached block data */
 	long unsigned int cache_data_invalid_bitmap;
-	int cache_clean;
+	bool cache_clean;
 	struct work_struct flush_work;
 	struct timer_list timer;
 
-- 
1.7.1
