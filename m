Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5VGx-0008HS-3H
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 05:20:31 +0000
Received: by pbbrq8 with SMTP id rq8so5882968pbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 22:20:27 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
Date: Sun, 26 Aug 2012 13:21:38 -0400
Message-Id: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
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

There are typically two types to set the mtd partitions:

<1> set with the `size`, such as
    gpmi-nand:100m(boot),100m(kernel),1g(rootfs)

<2> set with the `offset`, such as
    gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
    gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)

If we mix these two types, such as:
     gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
     gpmi-nand:1g@200m(rootfs),100m@0(boot),100m(kernel)

It's hard to understand the cmdline. And also it is hard to sort the
partitions in this mixed type. So we explicitly forbid the mixed type.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/cmdlinepart.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index fe7e3a5..0b7b2ad 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -35,6 +35,15 @@
  *
  * 1 NOR Flash with 2 partitions, 1 NAND with one
  * edb7312-nor:256k(ARMboot)ro,-(root);edb7312-nand:-(home)
+ *
+ * Note:
+ * If you choose to set the @offset for the <partdef>, please set all
+ * the partitions with the same syntax, such as:
+ *     gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
+ *
+ * Please do _NOT_ set the partitions like this:
+ *     gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
+ * The `kernel` partition does not set with the @offset, this is not permitted.
  */
 
 #include <linux/kernel.h>
-- 
1.7.4.4
