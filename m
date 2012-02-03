Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFgc-0006Kl-VT
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:44:07 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] mtd: redboot: remove useless code
Date: Fri,  3 Feb 2012 11:44:07 +0200
Message-Id: <1328262247-11391-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
References: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We do not need to invoke 'mtd_can_have_bb()' before invoking
'mtd_block_isbad()' because the latter already handles the case when the MTD
device does not support bad blocks.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/redboot.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 48970c1..580035c 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -78,8 +78,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 	if ( directory < 0 ) {
 		offset = master->size + directory * master->erasesize;
-		while (mtd_can_have_bb(master) &&
-		       mtd_block_isbad(master, offset)) {
+		while (mtd_block_isbad(master, offset)) {
 			if (!offset) {
 			nogood:
 				printk(KERN_NOTICE "Failed to find a non-bad block to check for RedBoot partition table\n");
@@ -89,8 +88,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 		}
 	} else {
 		offset = directory * master->erasesize;
-		while (mtd_can_have_bb(master) &&
-		       mtd_block_isbad(master, offset)) {
+		while (mtd_block_isbad(master, offset)) {
 			offset += master->erasesize;
 			if (offset == master->size)
 				goto nogood;
-- 
1.7.9
