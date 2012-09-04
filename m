Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8pSn-0001CS-Nq
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 09:30:31 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v3] mtd: cmdlinepart: check the partitions
Date: Tue, 4 Sep 2012 17:07:50 +0800
Message-ID: <1346749670-23944-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1346746785.12610.12.camel@sauron.fi.intel.com>
References: <1346746785.12610.12.camel@sauron.fi.intel.com>
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
 drivers/mtd/cmdlinepart.c |   55 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index edd17e0..5a603d1 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -225,6 +225,55 @@ static inline void sort_partitons(struct mtd_partition *parts, int num_parts)
 	return;
 }
 
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
+		if (parts[i].offset > offset) {
+			printk(KERN_ERR ERRP "There is a hole in the "
+				"partitions, please check the cmdline, "
+				"and fix it.\n");
+			return -EINVAL;
+		}
+
+		/* find an overlapped partition. */
+		if (parts[i].offset < offset) {
+			printk(KERN_ERR ERRP "The partitions overlap,"
+				"please check the cmdline, and fix it.\n");
+			return -EINVAL;
+		}
+
+		offset += parts[i].size;
+	}
+
+	if (offset_continuous_cnt) {
+		/* We do not set partitions with the @offset in the cmdline. */
+		if (offset_continuous_cnt == num_parts)
+			return 0;
+
+		/* It's ok if there is only one OFFSET_CONTINUOUS partition. */
+		if (offset_continuous_cnt == 1)
+			return 0;
+
+		printk(KERN_ERR ERRP "The offset is not right,"
+			"please check the cmdline, and fix it.\n");
+		return -EINVAL;
+	}
+
+	/* We set with @offset for all the partitions in the cmdline. */
+	return 0;
+}
+
 /*
  * Parse the command line.
  */
@@ -238,6 +287,7 @@ static int mtdpart_setup_real(char *s)
 		struct mtd_partition *parts;
 		int mtd_id_len, num_parts;
 		char *p, *mtd_id;
+		int ret;
 
 		mtd_id = s;
 
@@ -285,6 +335,11 @@ static int mtdpart_setup_real(char *s)
 		/* sort the partitions */
 		sort_partitons(parts, num_parts);
 
+		/* check the partitions */
+		ret = check_partitions(parts, num_parts);
+		if (ret)
+			return ret;
+
 		/* link into chain */
 		this_mtd->next = partitions;
 		partitions = this_mtd;
-- 
1.7.0.4
