Received: from mail-pd0-f178.google.com ([209.85.192.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTEMr-0002Ad-2m
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 16:40:59 +0000
Received: by mail-pd0-f178.google.com with SMTP id w11so2291196pde.23
 for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2013 09:40:55 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com,
 James.Bottomley@HansenPartnership.com, JBottomley@parallels.com
Subject: [PATCH v2 2/9] mmc: fix max_discard_sectors
Date: Sat, 20 Apr 2013 01:40:47 +0900
Message-Id: <1366389647-19382-1-git-send-email-linkinjeon@gmail.com>
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
As per above discussion, there is possibility that request's __data_len
field may overflow when max_discard_sectors greater than UINT_MAX >> 9

If multiple discard requests get merged, merged discard request's
size exceeds 4GB, there is possibility that merged discard request's
__data_len field may overflow.

This patch fixes this issue.

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>
Signed-off-by: Vivek Trivedi <t.vivek@samsung.com>
---
 drivers/mmc/card/queue.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
