Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN3A-0007UB-IQ
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 9/9] mtd: mtdcore: use const qualifier
Date: Tue, 12 Mar 2013 13:08:28 +0200
Message-Id: <1363086508-2405-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
References: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Be a bit stricter and add few more 'const' qualifiers.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdpart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9ee0911..3014933 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -694,7 +694,7 @@ EXPORT_SYMBOL_GPL(deregister_mtd_parser);
  * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
  * are changing this array!
  */
-static const char *default_mtd_part_types[] = {
+static const char * const default_mtd_part_types[] = {
 	"cmdlinepart",
 	"ofpart",
 	NULL
-- 
1.7.10.4
