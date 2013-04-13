Received: from mail-da0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UR0fB-0004UG-03
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 13:38:41 +0000
Received: by mail-da0-f44.google.com with SMTP id z20so1494684dae.31
 for <linux-mtd@lists.infradead.org>; Sat, 13 Apr 2013 06:38:39 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com
Subject: [PATCH 2/8] mmc: fix max_discard_sectors
Date: Sat, 13 Apr 2013 22:38:29 +0900
Message-Id: <1365860309-21261-1-git-send-email-linkinjeon@gmail.com>
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

https://lkml.org/lkml/2013/4/1/292
As per above discussion, there is possibility that request's __data_len
field may overflow when max_discard_sectors greater than UINT_MAX >> 9

If multiple discard requests get merged, merged discard request's
size exceeds 4GB, there is possibility that merged discard request's
__data_len field may overflow.

This patch fixes this issue.

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>
Signed-off-by: Vivek Trivedi <t.vivek@samsung.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
---
 drivers/mmc/card/queue.c |    2 +-
 drivers/mmc/core/core.c  |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/card/queue.c b/drivers/mmc/card/queue.c
index 9447a0e..54726b7 100644
--- a/drivers/mmc/card/queue.c
+++ b/drivers/mmc/card/queue.c
@@ -166,7 +166,7 @@ static void mmc_queue_setup_discard(struct request_queue *q,
 		return;
 
 	queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, q);
-	q->limits.max_discard_sectors = max_discard;
+	blk_queue_max_discard_sectors(q, max_discard);
 	if (card->erased_byte == 0 && !mmc_can_discard(card))
 		q->limits.discard_zeroes_data = 1;
 	q->limits.discard_granularity = card->pref_erase << 9;
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 7b435a3..6ee530c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2058,7 +2058,7 @@ static unsigned int mmc_do_calc_max_discard(struct mmc_card *card,
 	if (card->erase_shift)
 		max_qty = UINT_MAX >> card->erase_shift;
 	else if (mmc_card_sd(card))
-		max_qty = UINT_MAX;
+		max_qty = UINT_MAX >> 9;
 	else
 		max_qty = UINT_MAX / card->erase_size;
 
@@ -2100,7 +2100,7 @@ unsigned int mmc_calc_max_discard(struct mmc_card *card)
 	unsigned int max_discard, max_trim;
 
 	if (!host->max_discard_to)
-		return UINT_MAX;
+		return UINT_MAX >> 9;
 
 	/*
 	 * Without erase_group_def set, MMC erase timeout depends on clock
-- 
1.7.9.5
