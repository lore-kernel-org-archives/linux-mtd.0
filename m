Received: from mail-pd0-f173.google.com ([209.85.192.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UR0gM-0004Yz-4c
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 13:39:54 +0000
Received: by mail-pd0-f173.google.com with SMTP id v14so1837065pde.18
 for <linux-mtd@lists.infradead.org>; Sat, 13 Apr 2013 06:39:52 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com
Subject: [PATCH 6/8] brd: use generic helper to set max_discard_sectors
Date: Sat, 13 Apr 2013 22:39:42 +0900
Message-Id: <1365860382-21430-1-git-send-email-linkinjeon@gmail.com>
Cc: nbd-general@lists.sourceforge.net, Namjae Jeon <linkinjeon@gmail.com>,
 Vivek Trivedi <t.vivek@samsung.com>, Namjae Jeon <namjae.jeon@samsung.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org
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
 drivers/block/brd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index f1a29f8..108646d 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -479,7 +479,7 @@ static struct brd_device *brd_alloc(int i)
 	blk_queue_bounce_limit(brd->brd_queue, BLK_BOUNCE_ANY);
 
 	brd->brd_queue->limits.discard_granularity = PAGE_SIZE;
-	brd->brd_queue->limits.max_discard_sectors = UINT_MAX;
+	blk_queue_max_discard_sectors(brd->brd_queue, UINT_MAX >> 9);
 	brd->brd_queue->limits.discard_zeroes_data = 1;
 	queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, brd->brd_queue);
 
-- 
1.7.9.5
