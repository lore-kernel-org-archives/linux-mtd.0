Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TToMU-0005di-Gy
 for linux-mtd@lists.infradead.org; Thu, 01 Nov 2012 06:34:43 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: cmdlinepart: fix the overflow of big mtd partitions
Date: Thu, 1 Nov 2012 13:58:17 +0800
Message-ID: <1351749497-31692-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the kernel parses the following cmdline

	#mtdparts=gpmi-nand:16m(boot),16m(kernel),1g(home),4g(test),-(usr)

for a big nand chip Micron MT29F64G08AFAAAWP(8GB), we got the following wrong
result:

	.............................................
		"mtd: partition size too small (0)"
	.............................................

We can not get any partition.

The "4g(test)" partition triggers a overflow of the "size". The memparse()
returns 4g to the "size", but the size is "unsigned long" type, so a overflow
occurs, the "size" becomes zero in the end.

This patch changes the "size"/"offset" to "unsigned long long" type,
and replaces the UINT_MAX with ULLONG_MAX for macros SIZE_REMAINING and
OFFSET_CONTINUOUS.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/cmdlinepart.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 4baab3b..1cfd741 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -56,8 +56,8 @@
 
 
 /* special size referring to all the remaining space in a partition */
-#define SIZE_REMAINING UINT_MAX
-#define OFFSET_CONTINUOUS UINT_MAX
+#define SIZE_REMAINING ULLONG_MAX
+#define OFFSET_CONTINUOUS ULLONG_MAX
 
 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
@@ -89,7 +89,7 @@ static struct mtd_partition * newpart(char *s,
 				      int extra_mem_size)
 {
 	struct mtd_partition *parts;
-	unsigned long size, offset = OFFSET_CONTINUOUS;
+	unsigned long long size, offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -104,7 +104,7 @@ static struct mtd_partition * newpart(char *s,
 	} else {
 		size = memparse(s, &s);
 		if (size < PAGE_SIZE) {
-			printk(KERN_ERR ERRP "partition size too small (%lx)\n", size);
+			printk(KERN_ERR ERRP "partition size too small (%llx)\n", size);
 			return ERR_PTR(-EINVAL);
 		}
 	}
@@ -296,7 +296,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 				    struct mtd_partition **pparts,
 				    struct mtd_part_parser_data *data)
 {
-	unsigned long offset;
+	unsigned long long offset;
 	int i, err;
 	struct cmdline_mtd_partition *part;
 	const char *mtd_id = master->name;
-- 
1.7.0.4
