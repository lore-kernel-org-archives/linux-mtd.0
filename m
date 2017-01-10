Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQvzA-0006IH-WD
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 12:57:11 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] UBI: Make mtd parameter readable
Date: Tue, 10 Jan 2017 14:56:43 +0200
Message-Id: <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix permissions to allow read mtd parameter back (only for owner).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/ubi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 54312431750b..7bac790d4298 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1470,7 +1470,7 @@ static int ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	return 0;
 }
 
-module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
+module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 0400);
 MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024[,ubi_num]]].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
 		      "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"
-- 
2.11.0
