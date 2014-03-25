Received: from mail-qc0-f201.google.com ([209.85.216.201])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSb68-0006iI-V3
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 23:49:38 +0000
Received: by mail-qc0-f201.google.com with SMTP id c9so170366qcz.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 16:49:12 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: axboe@kernel.dk,
	ulf.hansson@linaro.org
Subject: [PATCH 1/4] Limit max_discard_sectors to UINT_MAX>>9
Date: Tue, 25 Mar 2014 16:48:23 -0700
Message-Id: <1395791307-23727-2-git-send-email-gwendal@chromium.org>
In-Reply-To: <1395791307-23727-1-git-send-email-gwendal@chromium.org>
References: <1395791307-23727-1-git-send-email-gwendal@chromium.org>
Cc: linux-mmc@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

max_discard_sectors can not be larger than UINT_MAX>>9,
otherwise, there is a risk that discard requests would be merged
into a request larger than 4GB.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2dc3b51..f30128b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -859,7 +859,7 @@ static int __init nbd_init(void)
 		 */
 		queue_flag_set_unlocked(QUEUE_FLAG_NONROT, disk->queue);
 		disk->queue->limits.discard_granularity = 512;
-		disk->queue->limits.max_discard_sectors = UINT_MAX;
+		disk->queue->limits.max_discard_sectors = UINT_MAX >> 9;
 		disk->queue->limits.discard_zeroes_data = 0;
 		blk_queue_max_hw_sectors(disk->queue, 65536);
 		disk->queue->limits.max_sectors = 256;
-- 
1.9.1.423.g4596e3a
