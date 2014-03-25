Received: from mail-ob0-f201.google.com ([209.85.214.201])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSb66-0006i8-Fn
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 23:49:35 +0000
Received: by mail-ob0-f201.google.com with SMTP id gq1so268398obb.4
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 16:49:11 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: axboe@kernel.dk,
	ulf.hansson@linaro.org
Subject: [PATCH 2/4] Limit max_discard_sectors to UINT_MAX>>9
Date: Tue, 25 Mar 2014 16:48:24 -0700
Message-Id: <1395791307-23727-3-git-send-email-gwendal@chromium.org>
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
 block/blk-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 9b5b561..67bb0e7 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -64,7 +64,7 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 	 * Ensure that max_discard_sectors is of the proper
 	 * granularity, so that requests stay aligned after a split.
 	 */
-	max_discard_sectors = min(q->limits.max_discard_sectors, UINT_MAX >> 9);
+	max_discard_sectors = q->limits.max_discard_sectors;
 	max_discard_sectors -= max_discard_sectors % granularity;
 	if (unlikely(!max_discard_sectors)) {
 		/* Avoid infinite loop below. Being cautious never hurts. */
-- 
1.9.1.423.g4596e3a
