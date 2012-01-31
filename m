Received: from rcsinet15.oracle.com ([148.87.113.117])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rs9Td-000388-Ej
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 08:54:10 +0000
Date: Tue, 31 Jan 2012 11:54:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: nand: fix printk() warnings
Message-ID: <20120131085405.GD22039@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, kernel-janitors@vger.kernel.org,
 Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gcc complains here:
drivers/mtd/nand/docg4.c: In function ‘probe_docg4’:
drivers/mtd/nand/docg4.c:1277:4: warning: format ‘%x’ expects argument of type ‘unsigned int’, but argument 3 has type ‘resource_size_t’ [-Wformat]
drivers/mtd/nand/docg4.c:1277:4: warning: format ‘%x’ expects argument of type ‘unsigned int’, but argument 4 has type ‘resource_size_t’ [-Wformat]

We have a standard way of printing these using a format string
extension.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 3ec1d10..8a0d7f6 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1272,9 +1272,7 @@ static int __init probe_docg4(struct platform_device *pdev)
 
 	virtadr = ioremap(r->start, resource_size(r));
 	if (!virtadr) {
-		dev_err(dev, "Diskonchip ioremap failed: "
-			"0x%x bytes at 0x%x\n",
-			resource_size(r), r->start);
+		dev_err(dev, "Diskonchip ioremap failed: %pR\n", r);
 		return -EIO;
 	}
 
