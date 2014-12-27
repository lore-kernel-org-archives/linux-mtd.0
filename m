Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y4ou0-0006YO-Gh
 for linux-mtd@lists.infradead.org; Sat, 27 Dec 2014 10:47:21 +0000
From: Oleksij Rempel <linux@rempel-privat.de>
To: boris.brezillon@free-electrons.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] nand: add Types of controllers from ECC point of view
Date: Sat, 27 Dec 2014 11:46:35 +0100
Message-Id: <1419677195-4900-1-git-send-email-linux@rempel-privat.de>
Cc: Oleksij Rempel <linux@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

it is mostly copy&paste of Boris Brezillons answer on linux-mtd list.

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 doc/nand.xml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/doc/nand.xml b/doc/nand.xml
index 281e0e0..197241c 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -113,6 +113,21 @@ protection or connected to VCC to enable writes unconditionally. As NAND flash u
 a command driven programming and erasing, an  accidental write or erase is not 
 likely to happen. The Ready / Busy output is not necessary for operation, 
  but it can be tied to a GPIO or an interrupt line. </p>
+
+<h3>Types of controllers from ECC point of view</h3>
+<p>1) Wiser controllers are generating 0xff ECC bytes for a data chunk
+(chunk == ECC step size) filled with 0xff. With BCH algorithms this is
+easily done by XORing the ECC bytes with the appropriate pattern (see
+soft BCH implementation)</p>
+<p>2) Some controller just verify if the data chunk + ECC bytes are all
+0xff before passing it to the ECC engine. If they are filled with 0xff
+the ECC correction is bypassed.</p>
+<p>This method has one drawback: it does not properly handle bitflips
+occurring in erased pages (if one bitflip occurs the NAND controller
+consider the chunk as not empty, and pass it to the BCH engine).</p>
+<p>3) The controller does not handle erased pages at all, and in this case
+you'll have to manually test it (see is_buf_blank in drivers/mtd/nand/pxa3xx_nand.c) when you
+encounter an ECC error.</p>
 </div>
 	
 <hr size="2" />
-- 
1.9.1
