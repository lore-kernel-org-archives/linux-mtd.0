Received: from mail02d.mail.t-online.hu ([84.2.42.7])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTc22-0008Kw-Un
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 14:11:16 +0000
Message-ID: <4B488E5A.6060505@freemail.hu>
Date: Sat, 09 Jan 2010 15:10:34 +0100
From: =?UTF-8?B?TsOpbWV0aCBNw6FydG9u?= <nm127@freemail.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/3] nand: make PCI device id constant
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Julia Lawall <julia@diku.dk>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, cocci@diku.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Márton Németh <nm127@freemail.hu>

The id_table field of the struct pci_driver is constant in <linux/pci.h>
so it is worth to make cafe_nand_tbl also constant.

The semantic match that finds this kind of pattern is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
disable decl_init,const_decl_init;
identifier I1, I2, x;
@@
	struct I1 {
	  ...
	  const struct I2 *x;
	  ...
	};
@s@
identifier r.I1, y;
identifier r.x, E;
@@
	struct I1 y = {
	  .x = E,
	};
@c@
identifier r.I2;
identifier s.E;
@@
	const struct I2 E[] = ... ;
@depends on !c@
identifier r.I2;
identifier s.E;
@@
+	const
	struct I2 E[] = ...;
// </smpl>

Signed-off-by: Márton Németh <nm127@freemail.hu>
Cc: Julia Lawall <julia@diku.dk>
Cc: cocci@diku.dk
---
diff -u -p a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
--- a/drivers/mtd/nand/cafe_nand.c 2009-12-03 04:51:21.000000000 +0100
+++ b/drivers/mtd/nand/cafe_nand.c 2010-01-08 04:27:58.000000000 +0100
@@ -848,7 +848,7 @@ static void __devexit cafe_nand_remove(s
 	kfree(mtd);
 }

-static struct pci_device_id cafe_nand_tbl[] = {
+static const struct pci_device_id cafe_nand_tbl[] = {
 	{ PCI_VENDOR_ID_MARVELL, PCI_DEVICE_ID_MARVELL_88ALP01_NAND,
 	  PCI_ANY_ID, PCI_ANY_ID },
 	{ }
