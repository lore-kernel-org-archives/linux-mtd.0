Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8o9A-0006cG-5k
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:06:09 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v2 3/3] mtd: cmdlinepart: check the partitions
Date: Tue, 4 Sep 2012 15:43:48 +0800
Message-ID: <1346744628-13840-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1346744628-13840-1-git-send-email-b32955@freescale.com>
References: <1346744628-13840-1-git-send-email-b32955@freescale.com>
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

The partitions are all sorted well by the @offset.
But we should check if there are errors in the partitions.

The following cases are regarded as errors:
  [1] There is a hole in the partitions, such as
      #gpmi-nand:100m(boot),100m@100m(kernel),1g@200m(rootfs)

  [2] There is a overlap in the partitions, such as
      #gpmi-nand:100m@0(boot),100m@50m(kernel),1g@150m(rootfs)

  [3] Not all the partitions are set with @offset, and there are
      more then one partion whose offset is OFFSET_CONTINUOUS.
      #gpmi-nand:100m@0(boot),100m(kernel),-(usr)

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/cmdlinepart.c |   82 ++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index edd17e0..3473af5 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -225,6 +225,53 @@ static inline void sort_partitons(struct mtd_partition *parts, int num_parts)
 	return;
 }
 
+enum partition_check_result {
+	PARTITION_GOOD,
+	PARTITION_OVERLAPPED,
+	PARTITION_HOLE,
+	PARTITION_TOO_MUCH_CONT,
+};
+
+/* The partitions have been sorted well by the @offset. */
+static inline int check_partitions(struct mtd_partition *parts, int num_parts)
+{
+	int i;
+	uint64_t offset = 0;
+	int offset_continuous_cnt = 0;
+
+	for (i = 0; i < num_parts; i++) {
+		if (parts[i].offset == OFFSET_CONTINUOUS) {
+			offset_continuous_cnt++;
+			continue;
+		}
+
+		/* find a hole. */
+		if (parts[i].offset > offset)
+			return PARTITION_HOLE;
+
+		/* find an overlapped partition. */
+		if (parts[i].offset < offset)
+			return PARTITION_OVERLAPPED;
+
+		offset += parts[i].size;
+	}
+
+	if (offset_continuous_cnt) {
+		/* We do not set partitions with the @offset in the cmdline. */
+		if (offset_continuous_cnt == num_parts)
+			return PARTITION_GOOD;
+
+		/* It's ok if there is only one OFFSET_CONTINUOUS partition. */
+		if (offset_continuous_cnt == 1)
+			return PARTITION_GOOD;
+
+		return PARTITION_TOO_MUCH_CONT;
+	}
+
+	/* We set with @offset for all the partitions in the cmdline. */
+	return PARTITION_GOOD;
+}
+
 /*
  * Parse the command line.
  */
@@ -238,6 +285,7 @@ static int mtdpart_setup_real(char *s)
 		struct mtd_partition *parts;
 		int mtd_id_len, num_parts;
 		char *p, *mtd_id;
+		enum partition_check_result ret;
 
 		mtd_id = s;
 
@@ -285,13 +333,37 @@ static int mtdpart_setup_real(char *s)
 		/* sort the partitions */
 		sort_partitons(parts, num_parts);
 
-		/* link into chain */
-		this_mtd->next = partitions;
-		partitions = this_mtd;
+		/* check the partitions */
+		ret = check_partitions(parts, num_parts);
+		switch (ret) {
+		case PARTITION_GOOD:
+			/* link into chain */
+			this_mtd->next = partitions;
+			partitions = this_mtd;
 
-		dbg(("mtdid=<%s> num_parts=<%d>\n",
-		     this_mtd->mtd_id, this_mtd->num_parts));
+			dbg(("mtdid=<%s> num_parts=<%d>\n",
+			     this_mtd->mtd_id, this_mtd->num_parts));
+			break;
 
+		case PARTITION_OVERLAPPED:
+			printk(KERN_ERR ERRP "%s:The partitions overlap,"
+				"please check the cmdline, and fix it.\n",
+				this_mtd->mtd_id);
+			break;
+
+		case PARTITION_HOLE:
+			printk(KERN_ERR ERRP "%s:There is a hole in the "
+				"partitions, please check the cmdline, "
+				"and fix it.\n",
+				this_mtd->mtd_id);
+			break;
+
+		case PARTITION_TOO_MUCH_CONT:
+			printk(KERN_ERR ERRP "%s:The offset is not right,"
+				"please check the cmdline, and fix it.\n",
+				this_mtd->mtd_id);
+			break;
+		}
 
 		/* EOS - we're done */
 		if (*s == 0)
-- 
1.7.0.4
