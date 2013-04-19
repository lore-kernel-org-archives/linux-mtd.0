Received: from mail-da0-x236.google.com ([2607:f8b0:400e:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTEMd-00028w-Ot
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 16:40:44 +0000
Received: by mail-da0-f54.google.com with SMTP id p1so2031790dad.13
 for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2013 09:40:42 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com,
 James.Bottomley@HansenPartnership.com, JBottomley@parallels.com
Subject: [PATCH v2 1/9] block: fix max discard sectors limit
Date: Sat, 20 Apr 2013 01:40:33 +0900
Message-Id: <1366389634-19348-1-git-send-email-linkinjeon@gmail.com>
Cc: nbd-general@lists.sourceforge.net, Namjae Jeon <linkinjeon@gmail.com>,
 Vivek Trivedi <t.vivek@samsung.com>, linux-scsi@vger.kernel.org,
 Namjae Jeon <namjae.jeon@samsung.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, jcmvbkbc@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Namjae Jeon <namjae.jeon@samsung.com>

https://lkml.org/lkml/2013/4/1/292

As per above discussion, it has been oberved that few drivers are
setting q->limits.max_discard_sectors to more than (UINT_MAX >> 9)

If multiple discard requests get merged, merged discard request's
size exceeds 4GB, there is possibility that merged discard request's
__data_len field may overflow.

This patch fixes this issue.

Also, adding BLK_DEF_MAX_DISCARD_SECTORS macro to use it instead
of UINT_MAX >> 9.

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>
Signed-off-by: Vivek Trivedi <t.vivek@samsung.com>
---
 block/blk-settings.c   |    3 ++-
 include/linux/blkdev.h |    1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index c50ecf0..34e6b61 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -283,7 +283,8 @@ EXPORT_SYMBOL(blk_queue_max_hw_sectors);
 void blk_queue_max_discard_sectors(struct request_queue *q,
 		unsigned int max_discard_sectors)
 {
-	q->limits.max_discard_sectors = max_discard_sectors;
+	q->limits.max_discard_sectors = min_t(unsigned int, max_discard_sectors,
+					BLK_DEF_MAX_DISCARD_SECTORS);
 }
 EXPORT_SYMBOL(blk_queue_max_discard_sectors);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 07aa5f6..efff505 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1105,6 +1105,7 @@ enum blk_default_limits {
 	BLK_DEF_MAX_SECTORS	= 1024,
 	BLK_MAX_SEGMENT_SIZE	= 65536,
 	BLK_SEG_BOUNDARY_MASK	= 0xFFFFFFFFUL,
+	BLK_DEF_MAX_DISCARD_SECTORS	= UINT_MAX >> 9,
 };
 
 #define blkdev_entry_to_request(entry) list_entry((entry), struct request, queuelist)
-- 
1.7.9.5
