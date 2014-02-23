Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHVQB-0005Jw-DG
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 09:32:28 +0000
Date: Sun, 23 Feb 2014 10:32:01 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd/ts5500: Add dependency
Message-ID: <20140223103201.73f63642@endymion.delvare>
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
Changes in v2:
 * Drop the dependency on X86, as suggested by Brian Norris.

 drivers/mtd/maps/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.14-rc3.orig/drivers/mtd/maps/Kconfig	2014-02-14 11:29:36.596309168 +0100
+++ linux-3.14-rc3/drivers/mtd/maps/Kconfig	2014-02-23 10:28:54.759439022 +0100
@@ -124,7 +124,7 @@ config MTD_NETSC520
 
 config MTD_TS5500
 	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
-	depends on X86
+	depends on TS5500 || COMPILE_TEST
 	select MTD_JEDECPROBE
 	select MTD_CFI_AMDSTD
 	help


-- 
Jean Delvare
Suse L3 Support
