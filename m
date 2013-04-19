Received: from mail-da0-x235.google.com ([2607:f8b0:400e:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTENt-0002Gt-TX
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 16:42:02 +0000
Received: by mail-da0-f53.google.com with SMTP id n34so2016882dal.40
 for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2013 09:42:01 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com,
 James.Bottomley@HansenPartnership.com, JBottomley@parallels.com
Subject: [PATCH v2 6/9] nbd: use generic helper to set max_discard_sectors
Date: Sat, 20 Apr 2013 01:41:53 +0900
Message-Id: <1366389713-19519-1-git-send-email-linkinjeon@gmail.com>
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
 drivers/block/nbd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 037288e..b9d3d2e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -854,7 +854,7 @@ static int __init nbd_init(void)
 		 */
 		queue_flag_set_unlocked(QUEUE_FLAG_NONROT, disk->queue);
 		disk->queue->limits.discard_granularity = 512;
-		disk->queue->limits.max_discard_sectors = UINT_MAX;
+		blk_queue_max_discard_sectors(disk->queue, UINT_MAX >> 9);
 		disk->queue->limits.discard_zeroes_data = 0;
 		blk_queue_max_hw_sectors(disk->queue, 65536);
 		disk->queue->limits.max_sectors = 256;
-- 
1.7.9.5
