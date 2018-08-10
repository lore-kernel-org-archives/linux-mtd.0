Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fo2Qf-0002E4-83
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2018 08:05:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id h14-v6so7447716wrw.13
 for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2018 01:05:40 -0700 (PDT)
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
Subject: [PATCH v2 04/29] nvmem: provide nvmem_dev_name()
Date: Fri, 10 Aug 2018 10:05:01 +0200
Message-Id: <20180810080526.27207-5-brgl@bgdev.pl>
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

Kernel users don't have any means of checking the names of nvmem
devices. Add a routine that returns the name of the nvmem provider.

This will be useful for nvmem notifier subscribers - otherwise they
can't check what device is being added/removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 6 ++++++
 include/linux/nvmem-consumer.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 128c8e51bff2..31df2e6d6f72 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1440,6 +1440,12 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
 
+const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return dev_name(&nvmem->dev);
+}
+EXPORT_SYMBOL_GPL(nvmem_dev_name);
+
 static int __init nvmem_init(void)
 {
 	return bus_register(&nvmem_bus_type);
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index ae4d30347602..14bb86a7a78d 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -69,6 +69,8 @@ int nvmem_device_cell_write(struct nvmem_device *nvmem,
 
 int nvmem_register_notifier(struct notifier_block *nb);
 int nvmem_unregister_notifier(struct notifier_block *nb);
+
+const char *nvmem_dev_name(struct nvmem_device *nvmem);
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -167,6 +169,11 @@ static inline int int nvmem_unregister_notifier(struct notifier_block *nb)
 {
 	return -ENOSYS;
 }
+
+static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return NULL;
+}
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0
