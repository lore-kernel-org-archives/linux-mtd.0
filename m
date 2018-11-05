Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJf4z-0005FU-V0
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 13:38:12 +0000
From: Daniel Danzberger <daniel@dd-wrt.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Danzberger <daniel@dd-wrt.com>
Date: Mon,  5 Nov 2018 14:37:52 +0100
Message-Id: <20181105133752.27480-1-daniel@dd-wrt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH] mtd: allow multiple -(name) parts on cmdline.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows to specify multiple -(name) SIZE_REMAINING partitions on the
commandline parser.

Example:
mtdparts=physmap-flash.0:256k(uboot),128k(params),-(firmware),1966080(kernel),-(rootfs)

Having a "firmaware" partition makes it easier to flash/erase firmware on embedded decvices.
Many platforms have such a partition already defined in their platform or device tree code.

This patch makes it possible to define such partitions
on the cmdline as well.

Signed-off-by: Daniel Danzberger <daniel@dd-wrt.com>
---
 drivers/mtd/cmdlinepart.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 3ea44cff9b75..b011e661f8a8 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -167,10 +167,6 @@ static struct mtd_partition * newpart(char *s,
 
 	/* test if more partitions are following */
 	if (*s == ',') {
-		if (size == SIZE_REMAINING) {
-			pr_err("no partitions allowed after a fill-up partition\n");
-			return ERR_PTR(-EINVAL);
-		}
 		/* more partitions follow, parse them */
 		parts = newpart(s + 1, &s, num_parts, this_part + 1,
 				&extra_mem, extra_mem_size);
@@ -335,20 +331,28 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 		return 0;
 
 	for (i = 0, offset = 0; i < part->num_parts; i++) {
+		int move_offset;
+
 		if (part->parts[i].offset == OFFSET_CONTINUOUS)
 			part->parts[i].offset = offset;
 		else
 			offset = part->parts[i].offset;
 
-		if (part->parts[i].size == SIZE_REMAINING)
+		if (part->parts[i].size == SIZE_REMAINING) {
 			part->parts[i].size = master->size - offset;
+			move_offset = 0;
+		} else {
+			move_offset = 1;
+		}
 
 		if (offset + part->parts[i].size > master->size) {
 			pr_warn("%s: partitioning exceeds flash size, truncating\n",
 				part->mtd_id);
 			part->parts[i].size = master->size - offset;
 		}
-		offset += part->parts[i].size;
+
+		if (move_offset)
+			offset += part->parts[i].size;
 
 		if (part->parts[i].size == 0) {
 			pr_warn("%s: skipping zero sized partition\n",
-- 
2.19.1
