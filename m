Received: from hauke-m.de ([2001:41d0:8:b27b::1] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0CLm-00060j-3r
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 19:30:17 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, john@phrozen.org,
 linux-spi@vger.kernel.org, hauke.mehrtens@intel.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 01/13] MIPS: lantiq: Use of_platform_populate instead of
 __dt_register_buses
Date: Mon, 17 Apr 2017 21:29:30 +0200
Message-Id: <20170417192942.32219-2-hauke@hauke-m.de>
In-Reply-To: <20170417192942.32219-1-hauke@hauke-m.de>
References: <20170417192942.32219-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This allows populating syscon devices which are using "simple-mfd"
instead of "simple-bus".

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/lantiq/prom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 96773bed8a8a..72cc12f1b6a5 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -117,7 +117,8 @@ void __init prom_init(void)
 
 int __init plat_of_setup(void)
 {
-	return __dt_register_buses(soc_info.compatible, "simple-bus");
+	return of_platform_populate(NULL, of_default_bus_match_table, NULL,
+				    NULL);
 }
 
 arch_initcall(plat_of_setup);
-- 
2.11.0
