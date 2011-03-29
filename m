Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4ehW-00085z-CK
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 19:35:39 +0000
Date: Tue, 29 Mar 2011 12:35:23 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdswap: fix printk format warning
Message-Id: <20110329123523.74735727.randy.dunlap@oracle.com>
In-Reply-To: <20110329131133.c74af94d.sfr@canb.auug.org.au>
References: <20110329131133.c74af94d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

The number is actually a sizeof(), so using %zu for it builds
cleanly on 32-bit or 64-bit.

drivers/mtd/mtdswap.c:1456: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/mtdswap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110329.orig/drivers/mtd/mtdswap.c
+++ linux-next-20110329/drivers/mtd/mtdswap.c
@@ -1452,7 +1452,7 @@ static void mtdswap_add_mtd(struct mtd_b
 	oinfo = mtd->ecclayout;
 	if (!mtd->oobsize || !oinfo || oinfo->oobavail < MTDSWAP_OOBSIZE) {
 		printk(KERN_ERR "%s: Not enough free bytes in OOB, "
-			"%d available, %lu needed.\n",
+			"%d available, %zu needed.\n",
 			MTDSWAP_PREFIX, oinfo->oobavail, MTDSWAP_OOBSIZE);
 		return;
 	}
