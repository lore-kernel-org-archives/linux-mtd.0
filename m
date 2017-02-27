Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciRvl-0004ez-Rx
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 20:30:04 +0000
From: Alban <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alban Bedel <albeu@free.fr>
Subject: [PATCH 3/3] ath9k: ahb: Add OF support
Date: Mon, 27 Feb 2017 21:28:12 +0100
Message-Id: <1488227292-18906-4-git-send-email-albeu@free.fr>
In-Reply-To: <1488227292-18906-1-git-send-email-albeu@free.fr>
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alban Bedel <albeu@free.fr>

Allow registering ath9k AHB devices defined in OF. The binding
currently only allow to set the MAC address and to optionally
disable the 2GHz or 5GHz band. The EEPROM data is loaded using
the device data API.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/net/wireless/ath/ath9k/Kconfig |  1 +
 drivers/net/wireless/ath/ath9k/ahb.c   | 55 +++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath9k/init.c  | 41 ++++++++++++++++++++++++-
 3 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/Kconfig b/drivers/net/wireless/ath/ath9k/Kconfig
index 783a38f..5d459f7 100644
--- a/drivers/net/wireless/ath/ath9k/Kconfig
+++ b/drivers/net/wireless/ath/ath9k/Kconfig
@@ -49,6 +49,7 @@ config ATH9K_PCI
 config ATH9K_AHB
 	bool "Atheros ath9k AHB bus support"
 	depends on ATH9K
+	select DEVDATA
 	default n
 	---help---
 	  This option enables the AHB bus support in ath9k.
diff --git a/drivers/net/wireless/ath/ath9k/ahb.c b/drivers/net/wireless/ath/ath9k/ahb.c
index 2bd982c..5aaaa16 100644
--- a/drivers/net/wireless/ath/ath9k/ahb.c
+++ b/drivers/net/wireless/ath/ath9k/ahb.c
@@ -18,6 +18,9 @@
 
 #include <linux/nl80211.h>
 #include <linux/platform_device.h>
+#include <linux/devdata.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
 #include <linux/module.h>
 #include "ath9k.h"
 
@@ -49,6 +52,33 @@ static const struct platform_device_id ath9k_platform_id_table[] = {
 	{},
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id ath_ahb_of_match[] = {
+	{
+		.compatible = "qca,ar9100-wmac",
+		.data = (void *)AR5416_AR9100_DEVID
+	},
+	{
+		.compatible = "qca,ar9330-wmac",
+		.data = (void *)AR9300_DEVID_AR9330
+	},
+	{
+		.compatible = "qca,ar9340-wmac",
+		.data = (void *)AR9300_DEVID_AR9340
+	},
+	{
+		.compatible = "qca,qca9550-wmac",
+		.data = (void *)AR9300_DEVID_QCA955X
+	},
+	{
+		.compatible = "qca,qca9530-wmac",
+		.data = (void *)AR9300_DEVID_AR953X
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ath_ahb_of_match);
+#endif
+
 /* return bus cachesize in 4B word units */
 static void ath_ahb_read_cachesize(struct ath_common *common, int *csz)
 {
@@ -57,9 +87,9 @@ static void ath_ahb_read_cachesize(struct ath_common *common, int *csz)
 
 static bool ath_ahb_eeprom_read(struct ath_common *common, u32 off, u16 *data)
 {
-	ath_err(common, "%s: eeprom data has to be provided externally\n",
-		__func__);
-	return false;
+	struct ath_softc *sc = (struct ath_softc *)common->priv;
+
+	return !devdata_read(sc->dev, "eeprom", off * 2, data, 2);
 }
 
 static const struct ath_bus_ops ath_ahb_bus_ops  = {
@@ -79,10 +109,20 @@ static int ath_ahb_probe(struct platform_device *pdev)
 	int ret = 0;
 	struct ath_hw *ah;
 	char hw_name[64];
+	u16 devid;
 
-	if (!dev_get_platdata(&pdev->dev)) {
-		dev_err(&pdev->dev, "no platform data specified\n");
-		return -EINVAL;
+	if (id) {
+		devid = id->driver_data;
+	} else {
+		const struct of_device_id *match;
+
+		match = of_match_device(ath_ahb_of_match, &pdev->dev);
+		if (!match) {
+			dev_err(&pdev->dev, "no device match found\n");
+			return -EINVAL;
+		}
+
+		devid = (u16)(unsigned long)match->data;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -127,7 +167,7 @@ static int ath_ahb_probe(struct platform_device *pdev)
 		goto err_free_hw;
 	}
 
-	ret = ath9k_init_device(id->driver_data, sc, &ath_ahb_bus_ops);
+	ret = ath9k_init_device(devid, sc, &ath_ahb_bus_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to initialize device\n");
 		goto err_irq;
@@ -167,6 +207,7 @@ static struct platform_driver ath_ahb_driver = {
 	.remove     = ath_ahb_remove,
 	.driver		= {
 		.name	= "ath9k",
+		.of_match_table = of_match_ptr(ath_ahb_of_match),
 	},
 	.id_table    = ath9k_platform_id_table,
 };
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index fa4b3cc..21194e5 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -23,6 +23,8 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/relay.h>
+#include <linux/clk.h>
+#include <linux/of_net.h>
 #include <net/ieee80211_radiotap.h>
 
 #include "ath9k.h"
@@ -513,6 +515,43 @@ static void ath9k_eeprom_release(struct ath_softc *sc)
 	release_firmware(sc->sc_ah->eeprom_blob);
 }
 
+#ifdef CONFIG_OF
+static int ath9k_init_of(struct ath_softc *sc)
+{
+	struct device_node *np = sc->dev->of_node;
+	struct ath_hw *ah = sc->sc_ah;
+	const void *macaddr;
+	struct clk *clk;
+	int ret = 0;
+
+	if (!np) {
+		dev_err(sc->dev, "no platform data or OF node\n");
+		return -EINVAL;
+	}
+
+	clk = clk_get(sc->dev, "ref");
+	if (!IS_ERR(clk)) {
+		ah->is_clk_25mhz = (clk_get_rate(clk) == 25000000);
+		clk_put(clk);
+	}
+
+	ah->disable_2ghz = of_property_read_bool(np, "qca,disable-2ghz");
+	ah->disable_5ghz = of_property_read_bool(np, "qca,disable-5ghz");
+
+	macaddr = of_get_mac_address(np);
+	if (macaddr)
+		memcpy(ath9k_hw_common(ah)->macaddr, macaddr, ETH_ALEN);
+
+	return ret;
+}
+#else
+static int ath9k_init_of(struct ath_softc *sc)
+{
+	dev_err(sc->dev, "no platform data\n");
+	return -EINVAL;
+}
+#endif
+
 static int ath9k_init_platform(struct ath_softc *sc)
 {
 	struct ath9k_platform_data *pdata = sc->dev->platform_data;
@@ -521,7 +560,7 @@ static int ath9k_init_platform(struct ath_softc *sc)
 	int ret;
 
 	if (!pdata)
-		return 0;
+		return ath9k_init_of(sc);
 
 	if (!pdata->use_eeprom) {
 		ah->ah_flags &= ~AH_USE_EEPROM;
-- 
2.7.4
