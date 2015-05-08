Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqYUU-00036L-A5
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 02:58:19 +0000
From: Ben Shelton <ben.shelton@ni.com>
To: dmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cmdlinepart: allow fill-up partition at any point
Date: Thu, 7 May 2015 21:57:41 -0500
Message-Id: <1431053861-32284-1-git-send-email-ben.shelton@ni.com>
Cc: Ben Shelton <ben.shelton@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, a fill-up partition (indicated by '-') must be the last
partition, and no other partitions can go after it.  Change the
cmdlinepart parsing code to allow a fill-up partition at any point.
This is useful, for example, if you want to reserve a partition at the
end of the flash where the bad block table will go.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 drivers/mtd/cmdlinepart.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index c850300..2d0eda2 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -97,6 +97,7 @@ static struct mtd_partition * newpart(char *s,
 				      char **retptr,
 				      int *num_parts,
 				      int this_part,
+				      int size_remaining_found,
 				      unsigned char **extra_mem_ptr,
 				      int extra_mem_size)
 {
@@ -110,9 +111,16 @@ static struct mtd_partition * newpart(char *s,
 
 	/* fetch the partition size */
 	if (*s == '-') {
+		if (size_remaining_found) {
+			printk(KERN_ERR ERRP
+			       "more than one '-' partition specified\n");
+			return ERR_PTR(-EINVAL);
+		}
+
 		/* assign all remaining space to this partition */
 		size = SIZE_REMAINING;
 		s++;
+		size_remaining_found = 1;
 	} else {
 		size = memparse(s, &s);
 		if (size < PAGE_SIZE) {
@@ -169,13 +177,10 @@ static struct mtd_partition * newpart(char *s,
 
 	/* test if more partitions are following */
 	if (*s == ',') {
-		if (size == SIZE_REMAINING) {
-			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
-			return ERR_PTR(-EINVAL);
-		}
 		/* more partitions follow, parse them */
 		parts = newpart(s + 1, &s, num_parts, this_part + 1,
-				&extra_mem, extra_mem_size);
+				size_remaining_found, &extra_mem,
+				extra_mem_size);
 		if (IS_ERR(parts))
 			return parts;
 	} else {
@@ -252,6 +257,7 @@ static int mtdpart_setup_real(char *s)
 				&s,		/* out: updated cmdline ptr */
 				&num_parts,	/* out: number of parts */
 				0,		/* first partition */
+				0,		/* size_remaining not found */
 				(unsigned char**)&this_mtd, /* out: extra mem */
 				mtd_id_len + 1 + sizeof(*this_mtd) +
 				sizeof(void*)-1 /*alignment*/);
@@ -313,6 +319,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	int i, err;
 	struct cmdline_mtd_partition *part;
 	const char *mtd_id = master->name;
+	int sr_part_num = -1;
 
 	/* parse command line */
 	if (!cmdline_parsed) {
@@ -339,8 +346,10 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 		else
 			offset = part->parts[i].offset;
 
-		if (part->parts[i].size == SIZE_REMAINING)
-			part->parts[i].size = master->size - offset;
+		if (part->parts[i].size == SIZE_REMAINING) {
+			sr_part_num = i;
+			continue;
+		}
 
 		if (offset + part->parts[i].size > master->size) {
 			printk(KERN_WARNING ERRP
@@ -361,6 +370,16 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 		}
 	}
 
+	/* if a partition was marked as SIZE_REMAINING */
+	if (sr_part_num != -1) {
+		/* fix up the size of the SIZE_REMAINING partition */
+		part->parts[sr_part_num].size = master->size - offset;
+
+		/* fix up the offsets of the subsequent partitions */
+		for (i = (sr_part_num + 1); i < part->num_parts; i++)
+			part->parts[i].offset += part->parts[sr_part_num].size;
+	}
+
 	*pparts = kmemdup(part->parts, sizeof(*part->parts) * part->num_parts,
 			  GFP_KERNEL);
 	if (!*pparts)
-- 
2.4.0
