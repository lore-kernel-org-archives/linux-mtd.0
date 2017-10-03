From: Vignesh R <vigneshr@ti.com>
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 5/6] mtd: spi-nor: cadence-quadspi: Fix error path in probe
Date: Tue, 3 Oct 2017 10:49:24 +0530
Message-ID: <20171003051925.8821-6-vigneshr@ti.com>
In-Reply-To: <20171003051925.8821-1-vigneshr@ti.com>
References: <20171003051925.8821-1-vigneshr@ti.com>
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

Fix the reversed goto labels, so that we disable cqspi controller only
if its enabled previously. This is a minor cleanup.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d9629e8f4798..60b557e00cfb 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1255,9 +1255,9 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	return ret;
-probe_irq_failed:
-	cqspi_controller_enable(cqspi, 0);
 probe_setup_failed:
+	cqspi_controller_enable(cqspi, 0);
+probe_irq_failed:
 	clk_disable_unprepare(cqspi->clk);
 	return ret;
 }
-- 
2.14.1
