Received: from gerard.telenet-ops.be ([195.130.132.48])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgJJh-00083v-Sf
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 19:08:04 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] mtd: pasemi_nand.c: Remove superfluous name cast
Date: Tue, 12 Nov 2013 20:07:16 +0100
Message-Id: <1384283245-9419-4-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
References: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
Cc: Olof Johansson <olof@lixom.net>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

device_driver.name is "const char *"

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/pasemi_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 4d174366a0f0..90f871acb0ef 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -223,7 +223,7 @@ MODULE_DEVICE_TABLE(of, pasemi_nand_match);
 static struct platform_driver pasemi_nand_driver =
 {
 	.driver = {
-		.name = (char*)driver_name,
+		.name = driver_name,
 		.owner = THIS_MODULE,
 		.of_match_table = pasemi_nand_match,
 	},
-- 
1.7.9.5
