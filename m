Received: from xdsl-664.zgora.dialog.net.pl ([81.168.226.152] helo=tuxland.pl)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFzAd-0000vN-0H
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 22:22:24 +0100
From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 53] Documentation/DocBook/mtdnand.tmpl: kmalloc + memset
	conversion to kzalloc
Date: Tue, 31 Jul 2007 23:22:18 +0200
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707312322.18508.m.kozlowski@tuxland.pl>
Cc: dwmw2@infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 Documentation/DocBook/mtdnand.tmpl |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/Documentation/DocBook/mtdnand.tmpl	2007-07-26 13:07:45.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/Documentation/DocBook/mtdnand.tmpl	2007-07-31 12:16:02.000000000 +0200
@@ -275,16 +275,13 @@ int __init board_init (void)
 	int err = 0;

 	/* Allocate memory for MTD device structure and private data */
-	board_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct nand_chip), GFP_KERNEL);
+	board_mtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
 	if (!board_mtd) {
 		printk ("Unable to allocate NAND MTD device structure.\n");
 		err = -ENOMEM;
 		goto out;
 	}

-	/* Initialize structures */
-	memset ((char *) board_mtd, 0, sizeof(struct mtd_info) + sizeof(struct nand_chip));
-
 	/* map physical adress */
 	baseaddr = (unsigned long)ioremap(CHIP_PHYSICAL_ADDRESS, 1024);
 	if(!baseaddr){
