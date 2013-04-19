Received: from mail-pa0-f41.google.com ([209.85.220.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTEON-0002Jx-4V
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 16:42:32 +0000
Received: by mail-pa0-f41.google.com with SMTP id kx10so520255pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2013 09:42:28 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com,
 James.Bottomley@HansenPartnership.com, JBottomley@parallels.com
Subject: [PATCH v2 8/9] dm thin: use generic helper to set max_discard_sectors
Date: Sat, 20 Apr 2013 01:42:20 +0900
Message-Id: <1366389740-19587-1-git-send-email-linkinjeon@gmail.com>
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

It is better to use blk_queue_max_discard_sectors helper
function to set max_discard_sectors as it checks
max_discard_sectors upper limit UINT_MAX >> 9

similar issue was reported for mmc in below link
https://lkml.org/lkml/2013/4/1/292

If multiple discard requests get merged, merged discard request's
size exceeds 4GB, there is possibility that merged discard request's
__data_len field may overflow.

This patch fixes this issue.

Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>
Signed-off-by: Vivek Trivedi <t.vivek@samsung.com>
---
 drivers/md/dm-thin.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 905b75f..237295a 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -2513,7 +2513,8 @@ static void set_discard_limits(struct pool_c *pt, struct queue_limits *limits)
 	struct pool *pool = pt->pool;
 	struct queue_limits *data_limits;
 
-	limits->max_discard_sectors = pool->sectors_per_block;
+	blk_queue_max_discard_sectors(bdev_get_queue(pt->data_dev->bdev),
+					pool->sectors_per_block);
 
 	/*
 	 * discard_granularity is just a hint, and not enforced.
-- 
1.7.9.5
