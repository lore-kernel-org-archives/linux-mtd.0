Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z62cb-0002EO-4n
 for linux-mtd@lists.infradead.org; Fri, 19 Jun 2015 20:10:42 +0000
Received: by pdjn11 with SMTP id n11so97333694pdj.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Jun 2015 13:10:16 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: cmdlinepart: convert printk() to pr_*()
Date: Fri, 19 Jun 2015 13:10:07 -0700
Message-Id: <1434744607-26621-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1434744607-26621-1-git-send-email-computersforpeace@gmail.com>
References: <1434744607-26621-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver uses some custom macros for printing. Let's use the standard
pr_fmt()/pr_{err,warn}().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/cmdlinepart.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 477923a8b86f..08f62987cc37 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -48,6 +48,8 @@
  * edb7312-nor:256k(ARMboot)ro,-(root);edb7312-nand:-(home)
  */
 
+#define pr_fmt(fmt)	"mtd: " fmt
+
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
@@ -55,9 +57,6 @@
 #include <linux/module.h>
 #include <linux/err.h>
 
-/* error message prefix */
-#define ERRP "mtd: "
-
 /* debug macro */
 #if 0
 #define dbg(x) do { printk("DEBUG-CMDLINE-PART: "); printk x; } while(0)
@@ -116,7 +115,7 @@ static struct mtd_partition * newpart(char *s,
 	} else {
 		size = memparse(s, &s);
 		if (!size) {
-			printk(KERN_ERR ERRP "partition has size 0\n");
+			pr_err("partition has size 0\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
@@ -141,7 +140,7 @@ static struct mtd_partition * newpart(char *s,
 		name = ++s;
 		p = strchr(name, delim);
 		if (!p) {
-			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
+			pr_err("no closing %c found in partition name\n", delim);
 			return ERR_PTR(-EINVAL);
 		}
 		name_len = p - name;
@@ -169,7 +168,7 @@ static struct mtd_partition * newpart(char *s,
 	/* test if more partitions are following */
 	if (*s == ',') {
 		if (size == SIZE_REMAINING) {
-			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
+			pr_err("no partitions allowed after a fill-up partition\n");
 			return ERR_PTR(-EINVAL);
 		}
 		/* more partitions follow, parse them */
@@ -236,7 +235,7 @@ static int mtdpart_setup_real(char *s)
 		/* fetch <mtd-id> */
 		p = strchr(s, ':');
 		if (!p) {
-			printk(KERN_ERR ERRP "no mtd-id\n");
+			pr_err("no mtd-id\n");
 			return -EINVAL;
 		}
 		mtd_id_len = p - mtd_id;
@@ -288,7 +287,7 @@ static int mtdpart_setup_real(char *s)
 
 		/* does another spec follow? */
 		if (*s != ';') {
-			printk(KERN_ERR ERRP "bad character after partition (%c)\n", *s);
+			pr_err("bad character after partition (%c)\n", *s);
 			return -EINVAL;
 		}
 		s++;
@@ -342,17 +341,15 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			part->parts[i].size = master->size - offset;
 
 		if (offset + part->parts[i].size > master->size) {
-			printk(KERN_WARNING ERRP
-			       "%s: partitioning exceeds flash size, truncating\n",
-			       part->mtd_id);
+			pr_warn("%s: partitioning exceeds flash size, truncating\n",
+				part->mtd_id);
 			part->parts[i].size = master->size - offset;
 		}
 		offset += part->parts[i].size;
 
 		if (part->parts[i].size == 0) {
-			printk(KERN_WARNING ERRP
-			       "%s: skipping zero sized partition\n",
-			       part->mtd_id);
+			pr_warn("%s: skipping zero sized partition\n",
+				part->mtd_id);
 			part->num_parts--;
 			memmove(&part->parts[i], &part->parts[i + 1],
 				sizeof(*part->parts) * (part->num_parts - i));
-- 
1.9.1
