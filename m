Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5VH1-0008HS-9i
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 05:20:36 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so5882968pbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 22:20:35 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 3/3] mtd: cmdlinepart: fix the wrong partitions number when
 truncating occurs
Date: Sun, 26 Aug 2012 13:21:40 -0400
Message-Id: <1346001700-26895-3-git-send-email-shijie8@gmail.com>
In-Reply-To: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, shmulik.ladkani@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is based on the assumption that all the partitions are
in the right offset order.

Assume we have a 1GB(8Gb) nand chip, and we set the partitions
in the command line like this:
    #gpmi-nand:100m(boot),100m(kernel),1g(rootfs)

In this case, the partition truncating occurs. The current code will
get the following result:

     ----------------------------------
	root@freescale ~$ cat /proc/mtd
	dev:    size   erasesize  name
	mtd0: 06400000 00040000 "boot"
	mtd1: 06400000 00040000 "kernel"
     ----------------------------------

It is obvious that we lost the truncated partition `rootfs` which should
be 824M in this case.

Why? The old code sets the wrong partitions number when the truncating
occurs. This patch fixes it. Alao add a `break` to shortcut the code in this
case.

After apply this patch, the result becomes:
     ----------------------------------
	root@freescale ~$ cat /proc/mtd
	dev:    size   erasesize  name
	mtd0: 06400000 00040000 "boot"
	mtd1: 06400000 00040000 "kernel"
	mtd2: 33800000 00040000 "rootfs"
     ----------------------------------

We get the right result.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/cmdlinepart.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index f40d390..9f0afe5 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -382,7 +382,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
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
