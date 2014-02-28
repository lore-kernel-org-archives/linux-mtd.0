From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v5 4/8 fix] Documentation: add the document for the SPI NOR
 framework
Date: Fri, 28 Feb 2014 15:58:00 +0800
Message-ID: <1393574280-17302-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1393238262-8622-5-git-send-email-b32955@freescale.com>
References: <1393238262-8622-5-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: angus.clark@st.com, shawn.guo@linaro.org, broonie@linaro.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 computersforpeace@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the document for the SPI NOR framework.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
fix a typo
---
 Documentation/mtd/spi-nor.txt |   59 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/mtd/spi-nor.txt

diff --git a/Documentation/mtd/spi-nor.txt b/Documentation/mtd/spi-nor.txt
new file mode 100644
index 0000000..294d5b0
--- /dev/null
+++ b/Documentation/mtd/spi-nor.txt
@@ -0,0 +1,59 @@
+                          SPI NOR framework
+               ============================================
+
+Part I - why we need this framework?
+-------------------------------------
+
+The SPI bus controller only deals with the byte stream.
+Some controller does not works like a SPI bus controller, it works
+like a SPI NOR controller instead, such as the Freescale's QuadSPI controller.
+
+The Freescale's QuadSPI controller should know the NOR commands to
+find the right LUT sequence. Unfortunately, the old code can not meet
+this requirement.
+
+Part II - How does the framework work?
+-------------------------------------
+
+This framework just adds a new layer between the MTD and the SPI bus driver.
+With this new layer, the SPI NOR controller driver does not depend on the
+m25p80 code anymore.
+
+   Before this framework, the layer is like:
+
+                   MTD
+         ------------------------
+                  m25p80
+         ------------------------
+	       SPI bus driver
+         ------------------------
+	        SPI NOR chip
+
+   After this framework, the layer is like:
+                   MTD
+         ------------------------
+              SPI NOR framework
+         ------------------------
+                  m25p80
+         ------------------------
+	       SPI bus driver
+         ------------------------
+	       SPI NOR chip
+
+  With the SPI NOR controller driver(Freescale QuadSPI), it looks like:
+                   MTD
+         ------------------------
+              SPI NOR framework
+         ------------------------
+                fsl-quadSPI
+         ------------------------
+	       SPI NOR chip
+
+Part III - How can the drivers use the framework
+-------------------------------------
+
+The main API is the spi_nor_scan(). Before you call the hook, you should
+initialize the necessary fields for spi_nor{}.
+Please see the drivers/mtd/spi-nor/spi-nor.c for detail.
+Please also reference to the fsl-quadspi.c when you want to write a new driver
+for a SPI NOR controller.
-- 
1.7.2.rc3
