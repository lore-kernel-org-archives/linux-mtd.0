Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFgzV-0003sK-7V
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 07:52:38 +0000
Received: by weyr3 with SMTP id r3so2857646wey.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 00:52:33 -0700 (PDT)
Date: Sun, 23 Sep 2012 09:52:29 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: cmdlinepart: Simplify parse_cmdline_partitions
Message-ID: <20120923095229.5d0c6806@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Simply 'parse_cmdline_partitions': the outer loop iterating over
'partitions' is actually a search loop, it does not execute the inner
loop for each partition, only for the matched partition.

Let's break when search is successful, and move all inner code (relevant
only for the matched partition) outside of the outer loop.

Resulting code is much more readable, and makes the indent level sane.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
- coding fix only, semantics shouldn't change
- changes since v1:
  - applies to l2-mtd head
  - whitespace fixups

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index aed1b8a..4baab3b 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -308,48 +308,52 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			return err;
 	}
 
+	/*
+	 * Search for the partition definition matching master->name.
+	 * If master->name is not set, stop at first partition definition.
+	 */
 	for (part = partitions; part; part = part->next) {
-		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id))) {
-			for (i = 0, offset = 0; i < part->num_parts; i++) {
-				if (part->parts[i].offset == OFFSET_CONTINUOUS)
-					part->parts[i].offset = offset;
-				else
-					offset = part->parts[i].offset;
-
-				if (part->parts[i].size == SIZE_REMAINING)
-					part->parts[i].size = master->size - offset;
-
-				if (part->parts[i].size == 0) {
-					printk(KERN_WARNING ERRP
-					       "%s: skipping zero sized partition\n",
-					       part->mtd_id);
-					part->num_parts--;
-					memmove(&part->parts[i],
-						&part->parts[i + 1],
-						sizeof(*part->parts) * (part->num_parts - i));
-					continue;
-				}
-
-				if (offset + part->parts[i].size > master->size) {
-					printk(KERN_WARNING ERRP
-					       "%s: partitioning exceeds flash size, truncating\n",
-					       part->mtd_id);
-					part->parts[i].size = master->size - offset;
-				}
-				offset += part->parts[i].size;
-			}
-
-			*pparts = kmemdup(part->parts,
-					sizeof(*part->parts) * part->num_parts,
-					GFP_KERNEL);
-			if (!*pparts)
-				return -ENOMEM;
-
-			return part->num_parts;
+		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
+			break;
+	}
+
+	if (!part)
+		return 0;
+
+	for (i = 0, offset = 0; i < part->num_parts; i++) {
+		if (part->parts[i].offset == OFFSET_CONTINUOUS)
+			part->parts[i].offset = offset;
+		else
+			offset = part->parts[i].offset;
+
+		if (part->parts[i].size == SIZE_REMAINING)
+			part->parts[i].size = master->size - offset;
+
+		if (part->parts[i].size == 0) {
+			printk(KERN_WARNING ERRP
+			       "%s: skipping zero sized partition\n",
+			       part->mtd_id);
+			part->num_parts--;
+			memmove(&part->parts[i], &part->parts[i + 1],
+				sizeof(*part->parts) * (part->num_parts - i));
+			continue;
 		}
+
+		if (offset + part->parts[i].size > master->size) {
+			printk(KERN_WARNING ERRP
+			       "%s: partitioning exceeds flash size, truncating\n",
+			       part->mtd_id);
+			part->parts[i].size = master->size - offset;
+		}
+		offset += part->parts[i].size;
 	}
 
-	return 0;
+	*pparts = kmemdup(part->parts, sizeof(*part->parts) * part->num_parts,
+			  GFP_KERNEL);
+	if (!*pparts)
+		return -ENOMEM;
+
+	return part->num_parts;
 }
 
 
