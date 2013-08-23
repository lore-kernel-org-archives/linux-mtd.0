Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VChg9-0007sa-I6
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 03:04:50 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so33236bkg.8
 for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2013 20:04:27 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Aug 2013 11:04:27 +0800
Message-ID: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
Subject: [PATCH -next] mtd: ofpart: use for_each_child_of_node() macro
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: devicetree@vger.kernel.org, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use for_each_child_of_node() macro instead of open coding it.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/ofpart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 7843a44..d64f8c3 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -43,9 +43,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		return 0;
 
 	/* First count the subnodes */
-	pp = NULL;
 	nr_parts = 0;
-	while ((pp = of_get_next_child(node, pp))) {
+	for_each_child_of_node(node,  pp) {
 		if (node_has_compatible(pp))
 			continue;
 
@@ -59,9 +58,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	if (!*pparts)
 		return -ENOMEM;
 
-	pp = NULL;
 	i = 0;
-	while ((pp = of_get_next_child(node, pp))) {
+	for_each_child_of_node(node,  pp) {
 		const __be32 *reg;
 		int len;
 		int a_cells, s_cells;
