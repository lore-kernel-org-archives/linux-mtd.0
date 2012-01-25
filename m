Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rq02f-0002Ng-UE
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2012 10:25:28 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Minor coding style cleanup in mtdpart.c
Date: Wed, 25 Jan 2012 11:24:36 +0100
Message-Id: <1327487076-11306-1-git-send-email-sr@denx.de>
Cc: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/mtdpart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a0bd2de..5de0aac 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -768,7 +768,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 	for ( ; ret <= 0 && *types; types++) {
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
-				parser = get_partition_parser(*types);
+			parser = get_partition_parser(*types);
 		if (!parser)
 			continue;
 		ret = (*parser->parse_fn)(master, pparts, data);
-- 
1.7.8.4
