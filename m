Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ0mj-0006ZY-TU
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 21:50:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 miquel.raynal@bootlin.com, bkenward@solarflare.com
Subject: [PATCH] mtdram: Expose module parameters
Date: Mon, 17 Dec 2018 22:50:15 +0100
Message-Id: <20181217215015.32392-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since we can set module parameters also when a driver is built in,
it makes no sense to protect module parameter with #ifdef MODULE.
Now the mtdram sizes can also set when the module is not a loadable
module.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/devices/mtdram.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 222cc347ce5d..3669d67cacb8 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -25,14 +25,12 @@ static unsigned long writebuf_size =3D 64;
 #define MTDRAM_TOTAL_SIZE (total_size * 1024)
 #define MTDRAM_ERASE_SIZE (erase_size * 1024)
=20
-#ifdef MODULE
 module_param(total_size, ulong, 0);
 MODULE_PARM_DESC(total_size, "Total device size in KiB");
 module_param(erase_size, ulong, 0);
 MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
 module_param(writebuf_size, ulong, 0);
 MODULE_PARM_DESC(writebuf_size, "Device write buf size in Bytes (Default=
: 64)");
-#endif
=20
 // We could store these in the mtd structure, but we only support 1 devi=
ce..
 static struct mtd_info *mtd_info;
--=20
2.20.1
