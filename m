Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJp3A-0007z2-8b
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 20:31:05 +0000
Date: 27 Jul 2015 20:30:43 -0000
Message-Id: <a642dbbeed33b678daa6f8bc4642b92b596a8a73.1438028045.git.hramrach@gmail.com>
In-Reply-To: <cover.1438028045.git.hramrach@gmail.com>
References: <cover.1438028045.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 1/3] mtd: mtdpart: add debug prints to partition parser.
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The probe of a mtd device can fail when a partition parser returns
error. The failure due to partition parsing can be quite mysterious when
multiple partitioning schemes are comiled in and any of them can fail
the probe.

Add debug prints which show what parsers were tried and what they
returned.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/mtdpart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..a79c4f7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -759,12 +759,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		types = default_mtd_part_types;
 
 	for ( ; ret <= 0 && *types; types++) {
+		pr_debug("Parsing partitions %s on %s", *types, master->name);
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
 			parser = get_partition_parser(*types);
+		pr_debug("%s got parser %s", master->name,
+			 parser ? parser->name : NULL);
 		if (!parser)
 			continue;
 		ret = (*parser->parse_fn)(master, pparts, data);
+		pr_debug("%s parser %s: %i", master->name, parser->name, ret);
 		put_partition_parser(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-- 
2.1.4
