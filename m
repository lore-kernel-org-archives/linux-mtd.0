Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8o9A-0006cJ-4Y
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:06:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v2 2/3] mtd: cmdlinepart: fix the wrong partitions number when
 truncating occurs
Date: Tue, 4 Sep 2012 15:43:47 +0800
Message-ID: <1346744628-13840-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1346744628-13840-1-git-send-email-b32955@freescale.com>
References: <1346744628-13840-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 shmulik.ladkani@gmail.com, Huang Shijie <b32955@freescale.com>
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

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/cmdlinepart.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index dde8e84..edd17e0 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -347,7 +347,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
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
1.7.0.4
