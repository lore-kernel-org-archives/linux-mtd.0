Date: Tue, 24 Jun 2008 22:20:53 +0900
From: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
To: dwmw2@infradead.org
Subject: [PATCH] au1550nd: remove unused variable
Message-Id: <20080624222053.105a7b56.yoichi_yuasa@tripeaks.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, yoichi_yuasa@tripeaks.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unused variable from au1550 NAND driver.

Signed-off-by: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>

diff -pruN -X mips/Documentation/dontdiff mips-orig/drivers/mtd/nand/au1550nd.c mips/drivers/mtd/nand/au1550nd.c
--- mips-orig/drivers/mtd/nand/au1550nd.c	2007-09-05 11:22:36.347628750 +0900
+++ mips/drivers/mtd/nand/au1550nd.c	2007-09-05 15:18:46.419306500 +0900
@@ -604,8 +604,6 @@ module_init(au1xxx_nand_init);
  */
 static void __exit au1550_cleanup(void)
 {
-	struct nand_chip *this = (struct nand_chip *)&au1550_mtd[1];
-
 	/* Release resources, unregister device */
 	nand_release(au1550_mtd);
 
