Received: from keymaster.cadence.com ([158.140.2.26]
 helo=mx-sanjose5.cadence.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clWac-00068m-RP
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 08:04:56 +0000
From: Artur Jedrysek <jartur@cadence.com>
To: <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Artur Jedrysek <jartur@cadence.com>
Subject: [v2, 3/4] mtd: spi-nor: Add Xtensa CPU support for cadence-quadspi.
Date: Wed, 8 Mar 2017 08:03:51 +0000
Message-ID: <1488960231-12249-1-git-send-email-jartur@cadence.com>
In-Reply-To: <1488959932-6657-1-git-send-email-jartur@cadence.com>
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
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

Cadence Quad SPI driver successfully runs on Xtensa CPU, and Kconfig
file is updated to indicate that.

Signed-off-by: Artur Jedrysek <jartur@cadence.com>
---
Changelog:
v2: This change is extracted from previous patch (updating CQSPI driver).
---
 drivers/mtd/spi-nor/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 7252087..f195749 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -50,7 +50,7 @@ config SPI_ATMEL_QUADSPI
 
 config SPI_CADENCE_QUADSPI
 	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || COMPILE_TEST)
+	depends on OF && (ARM || XTENSA || COMPILE_TEST)
 	help
 	  Enable support for the Cadence Quad SPI Flash controller.
 
-- 
2.2.2
