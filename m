Date: Fri, 31 Aug 2018 12:46:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "David S . Miller" <davem@davemloft.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Naren <naren.kernel@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lukas Wunner <lukas@wunner.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Sven Van Asbroeck <svendev@arcx.com>,
 Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
 Rob Herring <robh@kernel.org>, David Lechner <david@lechnology.com>,
 Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, briannorris@chromium.org
Subject: Re: [PATCH v2 00/29] at24: remove at24_platform_data
Message-ID: <20180831194643.GA62862@ban.mtv.corp.google.com>
References: <20180810080526.27207-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Aug 10, 2018 at 10:04:57AM +0200, Bartosz Golaszewski wrote:
> Most boards use the EEPROM to store the MAC address. This series adds
> support for cell lookups to the nvmem framework, registers relevant
> cells for all users, adds nvmem support to eth_platform_get_mac_address(),
> converts davinci_emac driver to using it and replaces at24_platform_data
> with device properties.

We already have:

of_get_nvmem_mac_address() (which does exactly what you're adding,
except it's DT specific)
of_get_mac_address()
fwnode_get_mac_address()
device_get_mac_address()

and now you've taught me that this exists too:

eth_platform_get_mac_address()

These mostly don't share code, and with your series, they'll start to
diverge even more as to what they support. Can you please help rectify
that, instead of widening the gap?

For instance, you can delete most of eth_platform_get_mac_address() and
replace it with device_get_mac_address() [1]. And you could add your new
stuff to fwnode_get_mac_address().

And important part to note here is that you code isn't just useful for
ethernet -- it could be useful for Wifi devices too. So IMO, sticking it
only in an "eth" function is the wrong move.

Brian

[1] arch_get_platform_mac_address() is the only part I wouldn't want to
replicate into a truly generic helper. The following should be a no-op
refactor, AIUI:

diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index ee28440f57c5..b738651f71e1 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -47,12 +47,12 @@
 #include <linux/inet.h>
 #include <linux/ip.h>
 #include <linux/netdevice.h>
+#include <linux/property.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/if_ether.h>
-#include <linux/of_net.h>
 #include <linux/pci.h>
 #include <net/dst.h>
 #include <net/arp.h>
@@ -528,19 +528,11 @@ unsigned char * __weak arch_get_platform_mac_address(void)
 int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
 {
 	const unsigned char *addr;
-	struct device_node *dp;
 
-	if (dev_is_pci(dev))
-		dp = pci_device_to_OF_node(to_pci_dev(dev));
-	else
-		dp = dev->of_node;
-
-	addr = NULL;
-	if (dp)
-		addr = of_get_mac_address(dp);
-	if (!addr)
-		addr = arch_get_platform_mac_address();
+	if (device_get_mac_address(dev, mac_addr, ETH_ALEN))
+		return 0;
 
+	addr = arch_get_platform_mac_address();
 	if (!addr)
 		return -ENODEV;
 
