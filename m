Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T98cv-0000Md-Kf
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 05:58:15 +0000
Received: by wgbdt14 with SMTP id dt14so109582wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 22:58:11 -0700 (PDT)
Date: Wed, 5 Sep 2012 08:58:03 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: <dedekind1@gmail.com>
Subject: [PATCH] mtd: cmdlinepart: Simplify parse_cmdline_partitions
Message-ID: <20120905085803.4ff5b155@halley>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com
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
- (should be) coding fix only, semantics aren't changed
- sorry, didn't even compile tested, please verify this is sane, thanks

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 17b0bd4..46951d7 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -308,38 +308,44 @@ static int parse_cmdline_partitions(struct mtd_info *master,
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
-				if (offset + part->parts[i].size > master->size) {
-					printk(KERN_WARNING ERRP
-					       "%s: partitioning exceeds flash size, truncating\n",
-					       part->mtd_id);
-					part->parts[i].size = master->size - offset;
-					part->num_parts = i;
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
+		if (offset + part->parts[i].size > master->size) {
+			printk(KERN_WARNING ERRP
+					"%s: partitioning exceeds flash size, truncating\n",
+					part->mtd_id);
+			part->parts[i].size = master->size - offset;
+			part->num_parts = i;
 		}
+		offset += part->parts[i].size;
 	}
 
-	return 0;
+	*pparts = kmemdup(part->parts,
+			sizeof(*part->parts) * part->num_parts,
+			GFP_KERNEL);
+	if (!*pparts)
+		return -ENOMEM;
+
+	return part->num_parts;
 }
 
