Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOVh1-0002Tu-LE
 for linux-mtd@lists.infradead.org; Fri, 14 Mar 2014 17:14:50 +0000
Date: Fri, 14 Mar 2014 18:14:20 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Fix Elan SC520 dependencies
Message-ID: <20140314181420.009c1b55@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anyone working with an AMD Elan SC520 development or evaluation board
would be building a dedicated kernel for it, so we can make the
sc520cdp and netsc520 maps depend on MELAN. SC520_CPUFREQ already
depends on MELAN so it makes things more consistent. It also makes
kernel configuration for every other x86 user easier.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
I _think_ the code should build everywhere so COMPILE_TEST is OK. If
not, please let me know and we'll discuss it.

 drivers/mtd/maps/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-3.14-rc6.orig/drivers/mtd/maps/Kconfig	2014-03-10 18:32:15.305850964 +0100
+++ linux-3.14-rc6/drivers/mtd/maps/Kconfig	2014-03-14 17:59:13.335432890 +0100
@@ -108,7 +108,7 @@ config MTD_SUN_UFLASH
 
 config MTD_SC520CDP
 	tristate "CFI Flash device mapped on AMD SC520 CDP"
-	depends on X86 && MTD_CFI
+	depends on (MELAN || COMPILE_TEST) && MTD_CFI
 	help
 	  The SC520 CDP board has two banks of CFI-compliant chips and one
 	  Dual-in-line JEDEC chip. This 'mapping' driver supports that
@@ -116,7 +116,7 @@ config MTD_SC520CDP
 
 config MTD_NETSC520
 	tristate "CFI Flash device mapped on AMD NetSc520"
-	depends on X86 && MTD_CFI
+	depends on (MELAN || COMPILE_TEST) && MTD_CFI
 	help
 	  This enables access routines for the flash chips on the AMD NetSc520
 	  demonstration board. If you have one of these boards and would like


-- 
Jean Delvare
SUSE L3 Support
