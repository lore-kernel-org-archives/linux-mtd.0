Received: from mail-pa0-f45.google.com ([209.85.220.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTEN4-0002CE-5Z
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 16:41:11 +0000
Received: by mail-pa0-f45.google.com with SMTP id kl13so2394926pab.4
 for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2013 09:41:07 -0700 (PDT)
From: Namjae Jeon <linkinjeon@gmail.com>
To: dwmw2@infradead.org, axboe@kernel.dk, shli@kernel.org,
 Paul.Clements@steeleye.com, npiggin@kernel.dk, neilb@suse.de,
 cjb@laptop.org, adrian.hunter@intel.com,
 James.Bottomley@HansenPartnership.com, JBottomley@parallels.com
Subject: [PATCH v2 3/9] sd: use generic helper to set max_discard_sectors
Date: Sat, 20 Apr 2013 01:41:00 +0900
Message-Id: <1366389660-19417-1-git-send-email-linkinjeon@gmail.com>
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
 drivers/scsi/sd.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 7992635..93c26b3 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -632,7 +632,8 @@ static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 		break;
 	}
 
-	q->limits.max_discard_sectors = max_blocks * (logical_block_size >> 9);
+	blk_queue_max_discard_sectors(q,
+				max_blocks * (logical_block_size >> 9));
 	queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, q);
 }
 
-- 
1.7.9.5
