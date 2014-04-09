Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwNM-0005aV-HX
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:33:34 +0000
Received: by mail-ie0-f178.google.com with SMTP id lx4so2750654iec.37
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 10:33:05 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/9] Documentation: spi-nor: rewrite some portions
Date: Wed,  9 Apr 2014 10:32:49 -0700
Message-Id: <1397064774-31784-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
WIP. This could be improved more (e.g., don't spend too much time documenting
history; just document the current framework)

 Documentation/mtd/spi-nor.txt | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/Documentation/mtd/spi-nor.txt b/Documentation/mtd/spi-nor.txt
index 294d5b06f892..bfcdeb94e053 100644
--- a/Documentation/mtd/spi-nor.txt
+++ b/Documentation/mtd/spi-nor.txt
@@ -1,16 +1,20 @@
                           SPI NOR framework
                ============================================
 
-Part I - why we need this framework?
+Part I - Why do we need this framework?
 -------------------------------------
 
-The SPI bus controller only deals with the byte stream.
-Some controller does not works like a SPI bus controller, it works
-like a SPI NOR controller instead, such as the Freescale's QuadSPI controller.
+SPI bus controllers (drivers/spi/) only deal with streams of bytes; the bus
+controller operates agnostic of the specific device attached. However, some
+controllers (such as Freescale's QuadSPI controller) cannot easily handle
+arbitrary streams of bytes, but rather are designed specifically for SPI NOR.
 
-The Freescale's QuadSPI controller should know the NOR commands to
-find the right LUT sequence. Unfortunately, the old code can not meet
-this requirement.
+Specifically, Freescale's QuadSPI controller must know the NOR commands to
+find the right LUT sequence. Unfortunately, the SPI subsystem has no notion of
+opcodes, addresses, or data payloads; a SPI controller simply knows to send or
+receive bytes (Tx and Rx). Therefore, we must define a new layering scheme under
+which the controller driver is aware of the opcodes, addressing, and other
+details of the SPI NOR protocol.
 
 Part II - How does the framework work?
 -------------------------------------
@@ -40,7 +44,7 @@ m25p80 code anymore.
          ------------------------
 	       SPI NOR chip
 
-  With the SPI NOR controller driver(Freescale QuadSPI), it looks like:
+  With the SPI NOR controller driver (Freescale QuadSPI), it looks like:
                    MTD
          ------------------------
               SPI NOR framework
@@ -53,7 +57,6 @@ Part III - How can the drivers use the framework
 -------------------------------------
 
 The main API is the spi_nor_scan(). Before you call the hook, you should
-initialize the necessary fields for spi_nor{}.
-Please see the drivers/mtd/spi-nor/spi-nor.c for detail.
-Please also reference to the fsl-quadspi.c when you want to write a new driver
-for a SPI NOR controller.
+initialize the necessary fields for spi_nor{}. Please see the
+drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to the fsl-quadspi.c
+when you want to write a new driver for a SPI NOR controller.
-- 
1.8.3.2
