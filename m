From: Roland Stigge <stigge@antcom.de>
To: artem.bityutskiy@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 arnd@arndb.de, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, srinivas.bakki@nxp.com, aletes.xgr@gmail.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] dma: amba-pl08x: Export pl08x_filter_id
Date: Thu, 16 Aug 2012 10:56:36 +0200
Message-Id: <1345107396-27079-1-git-send-email-stigge@antcom.de>
Cc: Roland Stigge <stigge@antcom.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the following when compiling a driver module that uses
amba-pl08x:

ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_slc.ko] undefined!
ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_mlc.ko] undefined!

(drivers/mtd/nand/lpc32xx_* are still in l2-mtd.git)

Done as in:

drivers/dma/coh901318.c
drivers/dma/sirf-dma.c

Signed-off-by: Roland Stigge <stigge@antcom.de>

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 6fbeebb..8c2e9b6 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -1608,6 +1608,7 @@ bool pl08x_filter_id(struct dma_chan *chan, void *chan_id)
 
 	return false;
 }
+EXPORT_SYMBOL(pl08x_filter_id);
 
 /*
  * Just check that the device is there and active
