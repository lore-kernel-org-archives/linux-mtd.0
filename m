Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FJ-00074f-1v
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:38 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so928274wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:36 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 006/104] mtdpart: default to cmdlinepart,
	NULL partitions probing
Date: Thu,  2 Jun 2011 18:51:16 +0400
Message-Id: <1307026293-8535-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lots of MTD devices default to cmdlinepart, NULL as partition parsing
order. Make it a default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdpart.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 630be3e..3477e16 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -712,12 +712,17 @@ int deregister_mtd_parser(struct mtd_part_parser *p)
 }
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
+static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
+
 int parse_mtd_partitions(struct mtd_info *master, const char **types,
 			 struct mtd_partition **pparts, unsigned long origin)
 {
 	struct mtd_part_parser *parser;
 	int ret = 0;
 
+	if (!types)
+		types = default_mtd_part_types;
+
 	for ( ; ret <= 0 && *types; types++) {
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
-- 
1.7.4.4
