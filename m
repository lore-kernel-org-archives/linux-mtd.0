Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U7vas-0002KT-AI
 for linux-mtd@lists.infradead.org; Tue, 19 Feb 2013 22:23:23 +0000
Date: Tue, 19 Feb 2013 16:23:13 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: ofpart: support partitions of 4 GB and larger
Message-ID: <3a708bb0-af78-4d31-b61f-8cff1612be8d@zimbra>
In-Reply-To: <f0151b07-ba77-472d-8c7d-b35c2113e9a2@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Joe Schaack <jschaack@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Author: Joe Schaack <jschaack@xes-inc.com>

Previously, partitions were limited to less than 4 GB in size because
the address and size were read as 32-bit values. Add support for 64-bit
values to support devices of 4 GB and larger.

Signed-off-by: Joe Schaack <jschaack@xes-inc.com>
Signed-off-by: Nate Case <ncase@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/ofpart.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 30bd907..553d6d6 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -55,6 +55,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	while ((pp = of_get_next_child(node, pp))) {
 		const __be32 *reg;
 		int len;
+		int a_cells, s_cells;
 
 		reg = of_get_property(pp, "reg", &len);
 		if (!reg) {
@@ -62,8 +63,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 			continue;
 		}
 
-		(*pparts)[i].offset = be32_to_cpu(reg[0]);
-		(*pparts)[i].size = be32_to_cpu(reg[1]);
+		a_cells = of_n_addr_cells(pp);
+		s_cells = of_n_size_cells(pp);
+		(*pparts)[i].offset = of_read_number(reg, a_cells);
+		(*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
 
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
-- 
1.7.9.5
