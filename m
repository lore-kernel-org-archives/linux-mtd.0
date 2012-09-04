Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8o96-0006bl-PE
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:06:05 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v2 1/3] mtd: cmdlinepart: sort the unsorted partitions
Date: Tue, 4 Sep 2012 15:43:46 +0800
Message-ID: <1346744628-13840-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 shmulik.ladkani@gmail.com, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Assume we have a 1GB(8Gb) nand chip.
It is legit if we set the partitions as the following:
    gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)

Unfortunately, the current code can not parse out any partition with this
cmdline. The parse_cmdline_partitions() will meet the
truncated partition `rootfs` firstly. But the parse_cmdline_partitions()
will break its `for` loop with the following line when the truncating occurs.

       ...........................
	part->num_parts = i;
       ...........................

What's worse is that this line has a bug in it. It accidently misses
the truncated partitions. So we can not parse out any partition.

In this case, we should parse out the `boot` and `kernel` partitions at least.
So we need to sort the unsorted partitions. With the sorted partitions, the
parse_cmdline_partitions() can parse out the `boot` and `kernel` successfully.

This patch sorts the unsorted partitions by the @offset.
For there are maybe only several partitions, so the Bubble sort algorithm
is enough.

We also need another patch to fix the missed truncated partition issue.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/cmdlinepart.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 17b0bd4..dde8e84 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -205,6 +205,26 @@ static struct mtd_partition * newpart(char *s,
 	return parts;
 }
 
+/* There are only several partitions, so the Bubble sort is enough. */
+static inline void sort_partitons(struct mtd_partition *parts, int num_parts)
+{
+	int i, j;
+
+	/* sort by the offset */
+	for (i = 0; i < num_parts - 1; i++) {
+		for (j = 1; j < num_parts - i; j++) {
+			if (parts[j - 1].offset > parts[j].offset) {
+				struct mtd_partition tmp;
+
+				tmp = parts[j - 1];
+				parts[j - 1] = parts[j];
+				parts[j] = tmp;
+			}
+		}
+	}
+	return;
+}
+
 /*
  * Parse the command line.
  */
@@ -262,6 +282,9 @@ static int mtdpart_setup_real(char *s)
 		this_mtd->mtd_id = (char*)(this_mtd + 1);
 		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
 
+		/* sort the partitions */
+		sort_partitons(parts, num_parts);
+
 		/* link into chain */
 		this_mtd->next = partitions;
 		partitions = this_mtd;
-- 
1.7.0.4
