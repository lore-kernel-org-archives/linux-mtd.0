Received: from cursor.subgra.de ([78.46.252.50])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LQOaz-0003cO-TK
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2009 16:09:28 +0000
Date: Fri, 23 Jan 2009 16:51:42 +0100
From: Benjamin Krill <ben@codiert.org>
To: linux-mtd@lists.infradead.org, dwg@au1.ibm.com, linuxppc-dev@ozlabs.org,
	vwool@ru.mvista.com
Subject: [PATCH] Check name property to determine partition nodes.
Message-ID: <20090123155142.GA481@codiert.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SLOF has a further node which could not be evaluate
by the current routine. The current routine returns
because the node hasn't the required reg property. As
fix this patch adds a check to determine the partition
child nodes.

Signed-off-by: Benjamin Krill <ben@codiert.org>
---
 drivers/mtd/ofpart.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 9e45b3f..c852cc2 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -46,6 +46,11 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 		const u32 *reg;
 		int len;
 
+		/* check if this is a partition node */
+		partname = of_get_property(pp, "name", &len);
+		if (strcmp(partname, "partition") != 0)
+			continue;
+
 		reg = of_get_property(pp, "reg", &len);
 		if (!reg || (len != 2 * sizeof(u32))) {
 			of_node_put(pp);
-- 
1.6.0.6
