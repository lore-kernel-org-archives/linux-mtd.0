From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 17/22] memory: omap-gpmc: Reserve WAITPIN if needed for
 WAIT monitoring
Date: Fri, 7 Aug 2015 12:12:27 +0300
Message-ID: <1438938752-31010-18-git-send-email-rogerq@ti.com>
In-Reply-To: <1438938752-31010-1-git-send-email-rogerq@ti.com>
References: <1438938752-31010-1-git-send-email-rogerq@ti.com>
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

If the device attached to GPMC wants to use the WAIT pin
for WAIT monitoring then we reserve it internally for
exclusive use.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/memory/omap-gpmc.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 264009d..0df70ab 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1779,6 +1779,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	const char *name;
 	int ret, cs;
 	u32 val;
+	struct gpio_desc *waitpin_desc = NULL;
+	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
 
 	if (of_property_read_u32(child, "reg", &cs) < 0) {
 		dev_err(&pdev->dev, "%s has no 'reg' property\n",
@@ -1880,15 +1882,28 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 			goto err;
 	}
 
+	/* Reserve wait pin if it is required and valid */
+	if (gpmc_s.wait_on_read || gpmc_s.wait_on_write) {
+		unsigned wait_pin = gpmc_s.wait_pin;
+
+		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
+							 wait_pin, "WAITPIN");
+		if (IS_ERR(waitpin_desc)) {
+			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
+			ret = PTR_ERR(waitpin_desc);
+			goto err;
+		}
+	}
+
 	ret = gpmc_cs_program_settings(cs, &gpmc_s);
 	if (ret < 0)
-		goto err;
+		goto err_cs;
 
 	ret = gpmc_cs_set_timings(cs, &gpmc_t, &gpmc_s);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to set gpmc timings for: %s\n",
 			child->name);
-		goto err;
+		goto err_cs;
 	}
 
 	/* Clear limited address i.e. enable A26-A11 */
@@ -1919,6 +1934,10 @@ err_child_fail:
 	dev_err(&pdev->dev, "failed to create gpmc child %s\n", child->name);
 	ret = -ENODEV;
 
+err_cs:
+	if (waitpin_desc)
+		gpiochip_free_own_desc(waitpin_desc);
+
 err:
 	gpmc_cs_free(cs);
 
-- 
2.1.4
