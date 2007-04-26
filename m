Received: from agminet01.oracle.com ([141.146.126.228])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hgwkh-0008GH-LR
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 01:42:49 -0400
Date: Wed, 25 Apr 2007 22:41:34 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -mm] MTD: fix plat-ram printk format
Message-Id: <20070425224134.d4a21c2d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

drivers/mtd/maps/plat-ram.c:172: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/maps/plat-ram.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-2.6.21-rc7-mm1.orig/drivers/mtd/maps/plat-ram.c
+++ linux-2.6.21-rc7-mm1/drivers/mtd/maps/plat-ram.c
@@ -169,7 +169,8 @@ static int platram_probe(struct platform
 		goto exit_free;
 	}
 
-	dev_dbg(&pdev->dev, "got platform resource %p (0x%lx)\n", res, res->start);
+	dev_dbg(&pdev->dev, "got platform resource %p (0x%llx)\n", res,
+		(unsigned long long)res->start);
 
 	/* setup map parameters */
 
