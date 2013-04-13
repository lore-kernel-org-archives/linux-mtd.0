Received: from mail-pa0-f43.google.com ([209.85.220.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UR0fk-0004WL-Gb
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 13:39:17 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz11so1900709pad.30
 for <linux-mtd@lists.infradead.org>; Sat, 13 Apr 2013 06:39:11 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com
Subject: [PATCH 4/8] loop: use generic helper to set max_discard_sectors
Date: Sat, 13 Apr 2013 22:39:00 +0900
Message-Id: <1365860340-21329-1-git-send-email-linkinjeon@gmail.com>
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
 drivers/block/loop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index b2955b3..21f3233 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -806,7 +806,7 @@ static void loop_config_discard(struct loop_device *lo)
 	    lo->lo_encrypt_key_size) {
 		q->limits.discard_granularity = 0;
 		q->limits.discard_alignment = 0;
-		q->limits.max_discard_sectors = 0;
+		blk_queue_max_discard_sectors(q, 0);
 		q->limits.discard_zeroes_data = 0;
 		queue_flag_clear_unlocked(QUEUE_FLAG_DISCARD, q);
 		return;
@@ -814,7 +814,7 @@ static void loop_config_discard(struct loop_device *lo)
 
 	q->limits.discard_granularity = inode->i_sb->s_blocksize;
 	q->limits.discard_alignment = 0;
-	q->limits.max_discard_sectors = UINT_MAX >> 9;
+	blk_queue_max_discard_sectors(q, UINT_MAX >> 9);
 	q->limits.discard_zeroes_data = 1;
 	queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, q);
 }
-- 
1.7.9.5
