From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 05/27] memory: omap-gpmc: Add GPMC-NAND ops to get
 writebufferempty status
Date: Fri, 18 Sep 2015 17:53:27 +0300
Message-ID: <1442588029-13769-6-git-send-email-rogerq@ti.com>
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is needed by OMAP NAND driver to poll the empty status
of the writebuffer.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/memory/omap-gpmc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index a80c53e..174c45b 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -81,6 +81,8 @@
 
 #define GPMC_CONFIG_LIMITEDADDRESS		BIT(1)
 
+#define GPMC_STATUS_EMPTYWRITEBUFFERSTATUS	BIT(0)
+
 #define	GPMC_CONFIG2_CSEXTRADELAY		BIT(7)
 #define	GPMC_CONFIG3_ADVEXTRADELAY		BIT(7)
 #define	GPMC_CONFIG4_OEEXTRADELAY		BIT(7)
@@ -1099,7 +1101,17 @@ void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
 	}
 }
 
-static struct gpmc_nand_ops nand_ops;
+static bool gpmc_nand_writebuffer_empty(void)
+{
+	if (gpmc_read_reg(GPMC_STATUS) & GPMC_STATUS_EMPTYWRITEBUFFERSTATUS)
+		return true;
+
+	return false;
+}
+
+static struct gpmc_nand_ops nand_ops = {
+	.nand_writebuffer_empty = gpmc_nand_writebuffer_empty,
+};
 
 /**
  * gpmc_omap_get_nand_ops - Get the GPMC NAND interface
-- 
2.1.4
