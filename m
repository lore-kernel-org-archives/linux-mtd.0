From: Afzal Mohammed <afzal@ti.com>
To: Tony Lindgren <tony@atomide.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 14/15] mtd: nand: omap: gpmc header removal
Date: Fri, 5 Oct 2012 21:24:50 +0530
Message-ID: <483b3586b25cfe4069e9a1953733a94814b3db7b.1349450454.git.afzal@ti.com>
In-Reply-To: <cover.1349450454.git.afzal@ti.com>
References: <cover.1349450454.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Paul Walmsley <paul@pwsan.com>, Afzal Mohammed <afzal@ti.com>,
 linux-mtd@lists.infradead.org, Jon Hunter <jon-hunter@ti.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, linux-omap@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand driver no longer needs gpmc header, remove it.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 drivers/mtd/nand/omap2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index e3fc8d7..d6664d7 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -28,7 +28,6 @@
 #endif
 
 #include <plat/dma.h>
-#include <plat/gpmc.h>
 #include <linux/platform_data/mtd-nand-omap2.h>
 
 #define	DRIVER_NAME	"omap2-nand"
-- 
1.7.12
