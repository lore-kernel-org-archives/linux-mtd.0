Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWkaZ-0002oi-KE
 for linux-mtd@lists.infradead.org; Sat, 23 Jun 2018 15:36:37 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: replace VMLINUX_SYMBOL_STR() with string literal
Date: Sun, 24 Jun 2018 00:35:42 +0900
Message-Id: <1529768142-9989-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the special case handling for Blackfin and Metag was removed by
commit 94e58e0ac312 ("export.h: remove code for prefixing symbols with
underscore"), VMLINUX_SYMBOL_STR() can be replaced with string literal.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/chips/gen_probe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index b57ceea..879bebf 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -202,10 +202,10 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
 	struct cfi_private *cfi = map->fldrv_priv;
 	__u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
 #ifdef CONFIG_MODULES
-	char probename[sizeof(VMLINUX_SYMBOL_STR(cfi_cmdset_%4.4X))];
+	char probename[sizeof("cfi_cmdset_%4.4X")];
 	cfi_cmdset_fn_t *probe_function;
 
-	sprintf(probename, VMLINUX_SYMBOL_STR(cfi_cmdset_%4.4X), type);
+	sprintf(probename, "cfi_cmdset_%4.4X", type);
 
 	probe_function = __symbol_get(probename);
 	if (!probe_function) {
-- 
2.7.4
