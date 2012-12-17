Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkP3a-0006Az-Bp
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 00:59:47 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so8303259iea.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2012 16:59:46 -0800 (PST)
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 2/2] mtd: cmdlinepart: skip partitions truncated to zero
Date: Sun, 16 Dec 2012 19:59:30 -0500
Message-Id: <78eb5cec3f992756ef28276f9022aa27dc6f0579.1355438632.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Perform flash size truncation before skipping zero sized partition
so that if the result is a zero sized, it will be skipped like the
others.

Signed-off-by: Christopher Cordahi <christophercordahi@nanometrics.ca>
---
 drivers/mtd/cmdlinepart.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index c1efb4c..525c579 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -330,6 +330,14 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 		if (part->parts[i].size == SIZE_REMAINING)
 			part->parts[i].size = master->size - offset;
 
+		if (offset + part->parts[i].size > master->size) {
+			printk(KERN_WARNING ERRP
+			       "%s: partitioning exceeds flash size, truncating\n",
+			       part->mtd_id);
+			part->parts[i].size = master->size - offset;
+		}
+		offset += part->parts[i].size;
+
 		if (part->parts[i].size == 0) {
 			printk(KERN_WARNING ERRP
 			       "%s: skipping zero sized partition\n",
@@ -338,16 +346,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			memmove(&part->parts[i], &part->parts[i + 1],
 				sizeof(*part->parts) * (part->num_parts - i));
 			i--;
-			continue;
 		}
-
-		if (offset + part->parts[i].size > master->size) {
-			printk(KERN_WARNING ERRP
-			       "%s: partitioning exceeds flash size, truncating\n",
-			       part->mtd_id);
-			part->parts[i].size = master->size - offset;
-		}
-		offset += part->parts[i].size;
 	}
 
 	*pparts = kmemdup(part->parts, sizeof(*part->parts) * part->num_parts,
-- 
1.7.1
