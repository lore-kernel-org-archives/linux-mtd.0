Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fo2Qe-0002Ao-FW
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2018 08:05:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id h10-v6so7461098wre.6
 for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2018 01:05:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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
 Sven Van Asbroeck <svendev@arcx.com>, Paolo Abeni <pabeni@redhat.com>,
 Alban Bedel <albeu@free.fr>, Rob Herring <robh@kernel.org>,
 David Lechner <david@lechnology.com>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 02/29] Documentation: nvmem: document lookup entries
Date: Fri, 10 Aug 2018 10:04:59 +0200
Message-Id: <20180810080526.27207-3-brgl@bgdev.pl>
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Describe the usage of nvmem cell lookup tables.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/nvmem/nvmem.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/nvmem/nvmem.txt b/Documentation/nvmem/nvmem.txt
index 8d8d8f58f96f..9d5e3ca2b4f3 100644
--- a/Documentation/nvmem/nvmem.txt
+++ b/Documentation/nvmem/nvmem.txt
@@ -58,6 +58,34 @@ static int qfprom_probe(struct platform_device *pdev)
 It is mandatory that the NVMEM provider has a regmap associated with its
 struct device. Failure to do would return error code from nvmem_register().
 
+Additionally it is possible to create nvmem cell lookup entries and register
+them with the nvmem framework from machine code as shown in the example below:
+
+static struct nvmem_cell_lookup foobar_lookup = {
+	.info = {
+		.name = "mac-address",
+		.offset = 0xd000,
+		.bytes = ERH_ALEN,
+	},
+	.nvmem_name = "foobar",
+};
+
+static void foobar_register(void)
+{
+	...
+	nvmem_add_lookup_table(&foobar_lookup, 1);
+	...
+}
+
+A lookup entry table can be later removed if needed:
+
+static void foobar_fini(void)
+{
+	...
+	nvmem_del_lookup_table(&foobar_lookup, 1);
+	...
+}
+
 NVMEM Consumers
 +++++++++++++++
 
-- 
2.18.0
