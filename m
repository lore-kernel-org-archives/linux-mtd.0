Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vf6yV-0007wn-VJ
 for linux-mtd@lists.infradead.org; Sat, 09 Nov 2013 11:45:14 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] mtd: cmdlinepart: support master name is not set when
 parser partition
Date: Sat, 9 Nov 2013 11:43:06 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F1C08B3EA@szxeml512-mbs.china.huawei.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "fengguang.wu@intel.com" <fengguang.wu@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cai Zhiyong <caizhiyong@huawei.com>
Date: Sat, 9 Nov 2013 17:54:12 +0800
Subject: [PATCH 2/2] mtd: cmdlinepart: support master name is not set when =
parser partition

 -Fix compile warning with value and function undeclared.
  this reported by <fengguang.wu@intel.com> and
  Randy Dunlap <rdunlap@infradead.org>

 -support master name is not set when parser partition.
  this feature is supported in the old parser.

Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
---
 drivers/mtd/Kconfig       |  1 +
 drivers/mtd/cmdlinepart.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index daf544a..f8f45e0 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -76,6 +76,7 @@ endif # MTD_REDBOOT_PARTS
 config MTD_CMDLINE_PARTS
 	tristate "Command line partition table parsing"
 	select BLK_CMDLINE_PARSER
+	depends on BLOCK
 	depends on MTD
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index ba934a4..2074164 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -54,6 +54,7 @@
   */
=20
 #include <linux/kernel.h>
+#include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/module.h>
@@ -108,7 +109,12 @@ static int parse_cmdline_partitions(struct mtd_info *m=
aster,
 	if (!mtd_cmdline_parts)
 		return 0;
=20
-	parts =3D cmdline_parts_find(mtd_cmdline_parts, master->name);
+	/* If master->name is not set, return the first device partition. */
+	if (!master->name)
+		parts =3D mtd_cmdline_parts->next_parts;
+	else
+		parts =3D cmdline_parts_find(mtd_cmdline_parts, master->name);
+
 	if (!parts)
 		return 0;
=20
@@ -143,5 +149,5 @@ MODULE_PARM_DESC(mtdparts, "Partitioning specification"=
);
 module_param(mtdparts, charp, 0);
=20
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Marius Groeger <mag@sysgo.de>");
+MODULE_AUTHOR("Cai Zhiyong <caizhiyong@huawei.com>");
 MODULE_DESCRIPTION("Command line configuration of MTD partitions");
--=20
1.8.1.5
