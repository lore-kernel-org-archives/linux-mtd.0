Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwVqI-0005Lw-GT
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 14:58:15 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR subsystem
Date: Tue, 18 Oct 2016 16:58:44 +0200
Message-ID: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would like to volunteer as a maintainer for the SPI NOR part of the MTD
subsystem.

Over the last months, a significant number of SPI NOR related patches have
been submitted, some of them have been reviewed, but very few have finally
been merged. Hence, the number of pending SPI NOR related patches continues
to increase over the time.

Through my work on SPI NOR memories from many manufacturers over the last
two years, I've gained a solid understanding of this technology.
I've already helped by reviewing patches from other contributors on the
mailing list, and would like to help getting those patches integrated by
volunteering as a maintainer for this specific area.

Boris Brezillon has already stepped up as a maintainer for the NAND
sub-subsystem in MTD, and the SPI NOR sub-subsystem could be handled in
the same way: I would be reviewing patches touching this area, collecting
them and sending pull requests to Brian Norris.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 757f9c4b388d..73e9319b3f9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11390,6 +11390,16 @@ W:	http://www.st.com/spear
 S:	Maintained
 F:	drivers/clk/spear/
 
+SPI NOR SUBSYSTEM
+M:	Cyrille Pitchen <cyrille.pitchen@atmel.com>
+L:	linux-mtd@lists.infradead.org
+W:	http://www.linux-mtd.infradead.org/
+Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+T:	git git://github.com/spi-nor/linux.git
+S:	Maintained
+F:	drivers/mtd/spi-nor/
+F:	include/linux/mtd/spi-nor.h
+
 SPI SUBSYSTEM
 M:	Mark Brown <broonie@kernel.org>
 L:	linux-spi@vger.kernel.org
-- 
2.7.4
