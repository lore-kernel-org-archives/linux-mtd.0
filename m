Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjS2G-0007Y6-Sj
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 16:57:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <boris.brezillon@bootlin.co>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Tudor.Ambarus@microchip.com>
Subject: [PATCH] MAINTAINERS: add myself as SPI NOR co-maintainer
Date: Tue, 15 Jan 2019 16:57:52 +0000
Message-ID: <20190115165740.32450-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Tudor Ambarus <tudor.ambarus@microchip.com>

I have been reviewing and contributing to the SPI NOR subsystem
for the last few months and I'm willing to continue doing so.
Volunteer as a maintainer for the SPI NOR part of the MTD subsystem.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6682420421c1..7deb0e91e3ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14081,6 +14081,7 @@ F:	arch/arm/mach-spear/
=20
 SPI NOR SUBSYSTEM
 M:	Marek Vasut <marek.vasut@gmail.com>
+M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
--=20
2.9.4
