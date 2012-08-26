Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5VGy-0008Hc-4O
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 05:20:32 +0000
Received: by pbbrq8 with SMTP id rq8so5883036pbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 22:20:31 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 2/3] mtd: cmdlinepart: sort the unsorted partitions
Date: Sun, 26 Aug 2012 13:21:39 -0400
Message-Id: <1346001700-26895-2-git-send-email-shijie8@gmail.com>
In-Reply-To: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, shmulik.ladkani@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
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

But the current code can not parse out any partition with this
cmdline.

This patch sorts the unsorted partitions by the @offset.
For there are maybe only several partitions, i use the simple
Bubble sort algorithm.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/cmdlinepart.c |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 0b7b2ad..f40d390 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -234,6 +234,32 @@ static struct mtd_partition * newpart(char *s,
 	return parts;
 }
 
+/* There are only several partitions, so the Bubble sort is enough. */
+static inline void sort_partitons(struct mtd_partition *parts, int num_parts)
+{
+	int i, j;
+
+	if (num_parts < 2)
+		return;
+
+	if (parts[0].offset == OFFSET_CONTINUOUS)
+		return;
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
@@ -292,6 +318,9 @@ static int mtdpart_setup_real(char *s)
 		this_mtd->mtd_id = (char*)(this_mtd + 1);
 		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
 
+		/* sort the partitions */
+		sort_partitons(parts, num_parts);
+
 		/* link into chain */
 		this_mtd->next = partitions;
 		partitions = this_mtd;
-- 
1.7.4.4
