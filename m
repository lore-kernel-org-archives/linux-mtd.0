Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2az4-00074q-2l
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 04:50:02 +0000
Received: by pbbrq8 with SMTP id rq8so4600906pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 21:49:56 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: cmdlinepart: fix the wrong partitions number when
 truncating occurs
Date: Sat, 18 Aug 2012 12:51:02 -0400
Message-Id: <1345308662-24023-1-git-send-email-shijie8@gmail.com>
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

When the partition truncating occurs, the old code misses the truncated
partition. So the partitions number is not right.

This patch fixes it. Alao add a `break` to shortcut the code in this
case.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/cmdlinepart.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 4558e0f..fc960a3 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -344,7 +344,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 					       "%s: partitioning exceeds flash size, truncating\n",
 					       part->mtd_id);
 					part->parts[i].size = master->size - offset;
-					part->num_parts = i;
+					part->num_parts = i + 1;
+					break;
 				}
 				offset += part->parts[i].size;
 			}
-- 
1.7.4.4
