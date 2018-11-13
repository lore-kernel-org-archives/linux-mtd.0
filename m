Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMZGn-0006P4-G6
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 14:02:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id i73-v6so6744787wmd.5
 for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2018 06:02:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S . Miller" <davem@davemloft.net>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 11/25] net: cadence: switch to using nvmem_get_mac_address()
Date: Tue, 13 Nov 2018 15:01:19 +0100
Message-Id: <20181113140133.17385-12-brgl@bgdev.pl>
In-Reply-To: <20181113140133.17385-1-brgl@bgdev.pl>
References: <20181113140133.17385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now have a generalized helper routine to read the MAC address from
nvmem which takes struct device as argument. The nvmem subsystem will
then try device tree first before all other potential providers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 1d86b4d5645a..d9a208f7bb40 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4055,7 +4055,7 @@ static int macb_probe(struct platform_device *pdev)
 	if (mac) {
 		ether_addr_copy(bp->dev->dev_addr, mac);
 	} else {
-		err = of_get_nvmem_mac_address(np, bp->dev->dev_addr);
+		err = nvmem_get_mac_address(&pdev->dev, bp->dev->dev_addr);
 		if (err) {
 			if (err == -EPROBE_DEFER)
 				goto err_out_free_netdev;
-- 
2.19.1
