Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTlO9-0004OQ-5z
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 10:23:43 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update my email address
Date: Mon,  3 Dec 2018 11:23:15 +0100
Message-Id: <20181203102315.1163-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use my korg address instead of the bootlin one.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 .mailmap    | 7 ++++---
 MAINTAINERS | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/.mailmap b/.mailmap
index 28fecafa6506..b4b0b0b768dd 100644
--- a/.mailmap
+++ b/.mailmap
@@ -36,9 +36,10 @@ Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
 Ben Gardner <bgardner@wabtec.com>
 Ben M Cahill <ben.m.cahill@intel.com>
 Björn Steinbrink <B.Steinbrink@gmx.de>
-Boris Brezillon <boris.brezillon@bootlin.com> <boris.brezillon@free-electrons.com>
-Boris Brezillon <boris.brezillon@bootlin.com> <b.brezillon.dev@gmail.com>
-Boris Brezillon <boris.brezillon@bootlin.com> <b.brezillon@overkiz.com>
+Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@bootlin.com>
+Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@free-electrons.com>
+Boris Brezillon <bbrezillon@kernel.org> <b.brezillon.dev@gmail.com>
+Boris Brezillon <bbrezillon@kernel.org> <b.brezillon@overkiz.com>
 Brian Avery <b.avery@hp.com>
 Brian King <brking@us.ibm.com>
 Christoph Hellwig <hch@lst.de>
diff --git a/MAINTAINERS b/MAINTAINERS
index 0abecc528dac..a22b0c23f419 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4821,7 +4821,7 @@ F:	Documentation/gpu/meson.rst
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVERS FOR ATMEL HLCDC
-M:	Boris Brezillon <boris.brezillon@bootlin.com>
+M:	Boris Brezillon <bbrezillon@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 F:	drivers/gpu/drm/atmel-hlcdc/
@@ -8872,7 +8872,7 @@ F:	include/uapi/drm/armada_drm.h
 F:	Documentation/devicetree/bindings/display/armada/
 
 MARVELL CRYPTO DRIVER
-M:	Boris Brezillon <boris.brezillon@bootlin.com>
+M:	Boris Brezillon <bbrezillon@kernel.org>
 M:	Arnaud Ebalard <arno@natisbad.org>
 F:	drivers/crypto/marvell/
 S:	Maintained
@@ -9576,7 +9576,7 @@ F:	mm/
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	David Woodhouse <dwmw2@infradead.org>
 M:	Brian Norris <computersforpeace@gmail.com>
-M:	Boris Brezillon <boris.brezillon@bootlin.com>
+M:	Boris Brezillon <bbrezillon@kernel.org>
 M:	Marek Vasut <marek.vasut@gmail.com>
 M:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
@@ -10166,7 +10166,7 @@ S:	Supported
 F:	drivers/net/ethernet/myricom/myri10ge/
 
 NAND FLASH SUBSYSTEM
-M:	Boris Brezillon <boris.brezillon@bootlin.com>
+M:	Boris Brezillon <bbrezillon@kernel.org>
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
-- 
2.17.1
