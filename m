Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQy5q-0002Ip-Nu
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:58:37 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 4/4] mtd: Account for BBT blocks when a partition is being
 allocated
Date: Fri, 21 Mar 2014 08:57:44 -0300
Message-Id: <1395403064-28113-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the introduction of mtd_block_isreserved(), it's now possible
to fix the bad and reserved block distribution exposed by ecc_stats,
instead of accounting all the bad or reserved blocks as 'bad'.

For instance, a device with eight blocks used for the BBT in the last
partition would now show (getting ECC stats from sysfs):

$ cat /sys/class/mtd/mtd2/ecc_stats
       0        0       10        0
       0        0        4        0
       0        0        0        8

instead of the currently wrong stats:

$ cat /sys/class/mtd/mtd2/ecc_stats
       0        0       10        0
       0        0        4        0
       0        0        8        0

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/mtdpart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 921e8c6..a3e3a7d 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -535,7 +535,9 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		uint64_t offs = 0;
 
 		while (offs < slave->mtd.size) {
-			if (mtd_block_isbad(master, offs + slave->offset))
+			if (mtd_block_isreserved(master, offs + slave->offset))
+				slave->mtd.ecc_stats.bbtblocks++;
+			else if (mtd_block_isbad(master, offs + slave->offset))
 				slave->mtd.ecc_stats.badblocks++;
 			offs += slave->mtd.erasesize;
 		}
-- 
1.9.0
