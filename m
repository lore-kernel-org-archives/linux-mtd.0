Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EnjT-0003HX-M4
	for <linux-mtd@lists.infradead.org>; Sun, 11 May 2003 11:07:03 +0100
Received: from [129.187.202.12] (helo=hermes.fachschaften.tu-muenchen.de)
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19Enjj-0003By-00
	for linux-mtd@lists.infradead.org; Sun, 11 May 2003 11:07:19 +0100
Date: Sun, 11 May 2003 12:06:50 +0200
From: Adrian Bunk <bunk@fs.tum.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20030511100649.GC1107@fs.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-kernel@vger.kernel.org
cc: trivial@rustcorp.com.au
Subject: [2.5 patch] let MTD_UCLINUX depend on !MMU
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trying to compile a kernel with MTD_UCLINUX enabled for a computer with
a MMU fails at the final linking because the variable _ebss seems to be
not defined on such machines (it's only defined on m68knommu, h8300 and 
v850).

The following patch (still applies with a few lines offset against 
2.5.69-bk4) tries to correct this issue by letting MTD_UCLINUX depend on 
!MMU.


--- linux-2.5.65-full/drivers/mtd/maps/Kconfig.old	2003-03-20 16:56:25.000000000 +0100
+++ linux-2.5.65-full/drivers/mtd/maps/Kconfig	2003-03-20 16:56:45.000000000 +0100
@@ -348,7 +348,7 @@
 
 config MTD_UCLINUX
 	tristate "Generic uClinux RAM/ROM filesystem support"
-	depends on MTD_PARTITIONS
+	depends on MTD_PARTITIONS && !MMU
 	help
 	  Map driver to support image based filesystems for uClinux.
 


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
