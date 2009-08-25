Received: from cursor.subgra.de ([78.46.252.50])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MfwSC-0007PP-66
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 13:52:56 +0000
Date: Tue, 25 Aug 2009 15:52:41 +0200
From: Benjamin Krill <ben@codiert.org>
To: Kumar Gala <galak@kernel.crashing.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
Subject: [PATCH] MTD ofpart: Check availability of reg property instead of
	name property
Message-ID: <20090825135241.GA20036@codiert.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The previous implementation breaks the dts binding "mtd-physmap.txt". This
implementation fixes the issue by checking the availability of the reg
property instead of the name property.

Signed-off-by: Benjamin Krill <ben@codiert.org>
---
 drivers/mtd/ofpart.c |   21 ++++++++++-----------
 1 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 3e164f0..62d6a78 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -46,21 +46,12 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 		const u32 *reg;
 		int len;
 
-		/* check if this is a partition node */
-		partname = of_get_property(pp, "name", &len);
-		if (strcmp(partname, "partition") != 0) {
+		reg = of_get_property(pp, "reg", &len);
+		if (!reg) {
 			nr_parts--;
 			continue;
 		}
 
-		reg = of_get_property(pp, "reg", &len);
-		if (!reg || (len != 2 * sizeof(u32))) {
-			of_node_put(pp);
-			dev_err(dev, "Invalid 'reg' on %s\n", node->full_name);
-			kfree(*pparts);
-			*pparts = NULL;
-			return -EINVAL;
-		}
 		(*pparts)[i].offset = reg[0];
 		(*pparts)[i].size = reg[1];
 
@@ -75,6 +66,14 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 		i++;
 	}
 
+	if (!i) {
+		of_node_put(pp);
+		dev_err(dev, "No valid partition found on %s\n", node->full_name);
+		kfree(*pparts);
+		*pparts = NULL;
+		return -EINVAL;
+	}
+
 	return nr_parts;
 }
 EXPORT_SYMBOL(of_mtd_parse_partitions);
-- 
1.5.4.5
