From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] arm: omap2: gpmc-onenand: drop __init annotation
Date: Sun, 23 Dec 2012 21:01:19 -0300
Message-Id: <1356307280-8323-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1356307280-8323-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1356307280-8323-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 martinez.javier@gmail.com, matthias.bgg@googlemail.com, eballetbo@gmail.com,
 zonque@gmail.com, grant.likely@secretlab.ca, jon-hunter@ti.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, b-cousson@ti.com
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
