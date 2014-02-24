From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v5 6/8] mtd: spi-nor: add a helper to find the spi_device_id
Date: Mon, 24 Feb 2014 18:37:40 +0800
Message-ID: <1393238262-8622-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1393238262-8622-1-git-send-email-b32955@freescale.com>
References: <1393238262-8622-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: angus.clark@st.com, shawn.guo@linaro.org, b44548@freescale.com,
 broonie@linaro.org, linux-doc@vger.kernel.org, b18965@freescale.com,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 sourav.poddar@ti.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the spi_nor_match_id() to find the proper spi_device_id with the
NOR flash's name in the spi_nor_ids table.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   12 ++++++++++++
 include/linux/mtd/spi-nor.h   |   12 ++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a840e88..6c8fd01 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1081,6 +1081,18 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	return 0;
 }
 
+const struct spi_device_id *spi_nor_match_id(char *name)
+{
+	const struct spi_device_id *id = spi_nor_ids;
+
+	while (id->name[0]) {
+		if (!strcmp(name, id->name))
+			return id;
+		id++;
+	}
+	return NULL;
+}
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
 MODULE_AUTHOR("Mike Lavender");
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 16d8409..41dae78 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -182,4 +182,16 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 			enum read_mode mode);
 extern const struct spi_device_id spi_nor_ids[];
 
+/**
+ * spi_nor_match_id() - find the spi_device_id by the name
+ * @name:	the name of the spi_device_id
+ *
+ * The drivers use this function to find the spi_device_id
+ * specified by the @name.
+ *
+ * Return: returns the right spi_device_id pointer on success,
+ *         and returns NULL on failure.
+ */
+const struct spi_device_id *spi_nor_match_id(char *name);
+
 #endif
-- 
1.7.2.rc3
