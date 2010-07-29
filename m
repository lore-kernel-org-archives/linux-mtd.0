Date: Thu, 29 Jul 2010 10:13:06 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse
	<dwmw2@infradead.org>
Subject: [PATCH -next] mtd: redwood depends on MTD_PARTITIONS
Message-Id: <20100729101306.36c20611.randy.dunlap@oracle.com>
In-Reply-To: <20100729143211.9e7edaed.sfr@canb.auug.org.au>
References: <20100729143211.9e7edaed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

redwood uses add/del_mtd_partitions(), so it should depend on
MTD_PARTITIONS.

ERROR: "add_mtd_partitions" [drivers/mtd/maps/redwood.ko] undefined!
ERROR: "del_mtd_partitions" [drivers/mtd/maps/redwood.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100729.orig/drivers/mtd/maps/Kconfig
+++ linux-next-20100729/drivers/mtd/maps/Kconfig
@@ -321,7 +321,7 @@ config MTD_CFI_FLAGADM
 
 config MTD_REDWOOD
 	tristate "CFI Flash devices mapped on IBM Redwood"
-	depends on MTD_CFI
+	depends on MTD_CFI && MTD_PARTITIONS
 	help
 	  This enables access routines for the flash chips on the IBM
 	  Redwood board. If you have one of these boards and would like to
