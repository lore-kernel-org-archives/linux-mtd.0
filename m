Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEG0z-0004XB-QY
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 10:29:02 +0000
Date: Fri, 14 Feb 2014 11:28:24 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd/ts5500: Add dependency
Message-ID: <20140214112824.27b98f1d@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no point in displaying the TS5500-specific driver entries if
TS5500 board support itself isn't enabled.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.14-rc2.orig/drivers/mtd/maps/Kconfig	2014-02-14 11:21:15.116363700 +0100
+++ linux-3.14-rc2/drivers/mtd/maps/Kconfig	2014-02-14 11:23:53.286863374 +0100
@@ -124,7 +124,7 @@ config MTD_NETSC520
 
 config MTD_TS5500
 	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
-	depends on X86
+	depends on TS5500 || (X86 && COMPILE_TEST)
 	select MTD_JEDECPROBE
 	select MTD_CFI_AMDSTD
 	help


-- 
Jean Delvare
Suse L3 Support
