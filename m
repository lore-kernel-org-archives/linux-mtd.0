Received: from oproxy9.bluehost.com ([2605:dc00:100:2::a2])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJp8O-0006vL-7R
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 16:50:37 +0000
Message-ID: <4F8C780D.9010702@xenotime.net>
Date: Mon, 16 Apr 2012 12:50:37 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] mtd: fix sbc2_flash build when PCI is not enabled
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
In-Reply-To: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Tim Hockin <thockin@sun.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@xenotime.net>

sbc2_flash.c is a PCI driver, but its build fails when CONFIG_PCI
is not enabled, so make it depend on PCI.

drivers/mtd/maps/scb2_flash.c:237:1: warning: data definition has no type or storage class
drivers/mtd/maps/scb2_flash.c:237:1: warning: type defaults to 'int' in declaration of 'module_pci_driver'
drivers/mtd/maps/scb2_flash.c:237:1: warning: parameter names (without types) in function declaration

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	David Woodhouse <dwmw2@infradead.org>
Cc:	linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120416.orig/drivers/mtd/maps/Kconfig
+++ linux-next-20120416/drivers/mtd/maps/Kconfig
@@ -224,7 +224,7 @@ config MTD_CK804XROM
 
 config MTD_SCB2_FLASH
 	tristate "BIOS flash chip on Intel SCB2 boards"
-	depends on X86 && MTD_JEDECPROBE
+	depends on X86 && MTD_JEDECPROBE && PCI
 	help
 	  Support for treating the BIOS flash chip on Intel SCB2 boards
 	  as an MTD device - with this you can reprogram your BIOS.
