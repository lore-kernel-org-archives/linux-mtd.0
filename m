From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH v2 2/3] arm: omap2: gpmc-onenand: drop __init annotation
Date: Sat, 19 Jan 2013 19:27:56 -0300
Message-Id: <1358634477-25868-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1358634477-25868-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1358634477-25868-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, martinez.javier@gmail.com,
 Ezequiel Garcia <elezegarcia@gmail.com>, matthias.bgg@googlemail.com,
 eballetbo@gmail.com, devicetree-discuss@lists.ozlabs.org, zonque@gmail.com,
 grant.likely@secretlab.ca, tony@atomide.com, linux-mtd@lists.infradead.org,
 jon-hunter@ti.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, b-cousson@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gpmc_onenand_init() will be called from another driver's probe() function,
so drop the __init annotation, in order to prevent section mismatches.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/mach-omap2/gpmc-onenand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc-onenand.c b/arch/arm/mach-omap2/gpmc-onenand.c
index 94a349e..fadd8743 100644
--- a/arch/arm/mach-omap2/gpmc-onenand.c
+++ b/arch/arm/mach-omap2/gpmc-onenand.c
@@ -356,7 +356,7 @@ static int gpmc_onenand_setup(void __iomem *onenand_base, int *freq_ptr)
 	return ret;
 }
 
-void __init gpmc_onenand_init(struct omap_onenand_platform_data *_onenand_data)
+void gpmc_onenand_init(struct omap_onenand_platform_data *_onenand_data)
 {
 	int err;
 
-- 
1.7.8.6
