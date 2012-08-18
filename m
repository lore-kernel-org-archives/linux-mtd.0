Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2bF4-0007aN-UJ
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 05:06:35 +0000
Received: by pbbrq8 with SMTP id rq8so4617306pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 22:06:33 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH v2] mtd: mtdpart: break it as soon as we parse out the
 partitions
Date: Sat, 18 Aug 2012 13:07:41 -0400
Message-Id: <1345309661-26165-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We may cause a memory leak when the @types has more then one parser.

Take the `default_mtd_part_types` for example. The default_mtd_part_types has
two parsers now: `cmdlinepart` and `ofpart`.

Assume the following case:
The kernel command line sets the partitions like:
	#gpmi-nand:20m(boot),20m(kernel),1g(rootfs),-(user)
But the devicetree file(such as arch/arm/boot/dts/imx28-evk.dts) also sets
the same partitions as the kernel command line does.

In the current code, the partitions parsed out by the `ofpart` will
overwrite the @pparts which has already set by the `cmdlinepart` parser,
and the the partitions parsed out by the `cmdlinepart` is missed.
A memory leak occurs.

So we should break the code as soon as we parse out the partitions,
In actually, this patch makes a priority order between the parsers.
If one parser has already parsed out the partitions successfully,
it's no need to use another parser anymore.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
v1 --> v2:
	fix the wrong comment.
---
 drivers/mtd/mtdpart.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d518e4d..f8c08ec 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -711,6 +711,8 @@ static const char *default_mtd_part_types[] = {
  * partition parsers, specified in @types. However, if @types is %NULL, then
  * the default list of parsers is used. The default list contains only the
  * "cmdlinepart" and "ofpart" parsers ATM.
+ * Note: If there are more then one parser in @types, the kernel only takes the
+ * partitions parsed out by the first parser.
  *
  * This function may return:
  * o a negative error code in case of failure
@@ -735,11 +737,12 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 		if (!parser)
 			continue;
 		ret = (*parser->parse_fn)(master, pparts, data);
+		put_partition_parser(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
+			break;
 		}
-		put_partition_parser(parser);
 	}
 	return ret;
 }
-- 
1.7.4.4
