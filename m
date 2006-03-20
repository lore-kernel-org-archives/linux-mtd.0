Received: from sorrow.cyrius.com ([65.19.161.204])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLCCd-0007c2-1I
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 04:41:13 +0000
Date: Mon, 20 Mar 2006 04:40:26 +0000
From: Martin Michlmayr <tbm@cyrius.com>
To: akpm@osdl.org
Message-ID: <20060320044026.GH20416@deprecation.cyrius.com>
References: <20060320043802.GA20389@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060320043802.GA20389@deprecation.cyrius.com>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/12] [MTD] Re-add module description for ms02-nv to Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In an unrelated MTD commit, a description about the ms02-nv module
got removed from Kconfig.  While I personally agree with this
removal, the module maintainer (Maciej W. Rozycki) would like to
see it added back.  In the absense of any consistency regarding
Kconfig descriptions his wish should be followed.

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>
Acked-by: Maciej W. Rozycki <macro@linux-mips.org>


--- linux-2.6/drivers/mtd/devices/Kconfig	2006-03-05 19:35:04.000000000 +0000
+++ mips.git/drivers/mtd/devices/Kconfig	2006-03-05 18:51:15.000000000 +0000
@@ -47,6 +47,11 @@
 	  accelerator.  Say Y here if you have a DECstation 5000/2x0 or a
 	  DECsystem 5900 equipped with such a module.
 
+	  If you want to compile this driver as a module ( = code which can be
+	  inserted in and removed from the running kernel whenever you want),
+	  say M here and read <file:Documentation/modules.txt>.  The module will
+	  be called ms02-nv.o.
+
 config MTD_DATAFLASH
 	tristate "Support for AT45xxx DataFlash"
 	depends on MTD && SPI_MASTER && EXPERIMENTAL

-- 
Martin Michlmayr
http://www.cyrius.com/
