To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v1] mtd: nand: tango: Reset pbus to raw mode in probe
Message-ID: <e73bf318-c715-af8c-3fdc-3c5c93a13472@sigmadesigns.com>
Date: Tue, 3 Jan 2017 11:01:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Language: 
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux should not expect the boot loader to properly configure the
peripheral bus "pad mode", so reset PBUS_PAD_MODE to raw.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 drivers/mtd/nand/tango_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index d370c0382808..2456640fe4d5 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -644,6 +644,8 @@ static int tango_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->pbus_base))
 		return PTR_ERR(nfc->pbus_base);
 
+	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
+
 	clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
