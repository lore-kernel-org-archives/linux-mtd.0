Received: from sorrow.cyrius.com ([65.19.161.204])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLCCr-0007cb-6L
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 04:41:26 +0000
Date: Mon, 20 Mar 2006 04:40:46 +0000
From: Martin Michlmayr <tbm@cyrius.com>
To: akpm@osdl.org
Message-ID: <20060320044046.GJ20416@deprecation.cyrius.com>
References: <20060320043802.GA20389@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060320043802.GA20389@deprecation.cyrius.com>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] [MTD] LASAT depends on MTD_CFI
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following difference was found between the mainline and linux-mips
kernel.  LASAT depends on MTD_CFI.

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>


--- linux-2.6/drivers/mtd/maps/Kconfig	2006-03-05 19:35:04.000000000 +0000
+++ mips.git/drivers/mtd/maps/Kconfig	2006-03-05 18:51:15.000000000 +0000
@@ -200,8 +200,8 @@
 	  Support for the flash chip on Tsunami TIG bus.
 
 config MTD_LASAT
-	tristate "Flash chips on LASAT board"
-	depends on LASAT
+	tristate "LASAT flash device"
+	depends on LASAT && MTD_CFI
 	help
 	  Support for the flash chips on the Lasat 100 and 200 boards.
 

-- 
Martin Michlmayr
http://www.cyrius.com/
