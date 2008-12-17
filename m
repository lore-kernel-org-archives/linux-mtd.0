Subject: [PATCH] MTD: fix dataflash 64-bit divisions
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2008 18:50:27 +0200
Message-Id: <1229532627.17960.37.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <david-b@pacbell.net>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 17 Dec 2008 19:42:38 +0200
Subject: [PATCH] MTD: fix dataflash 64-bit divisions

MTD has recently been upgraded for 64-bit support, see commit
number 69423d99fc182a81f3c5db3eb5c140acc6fc64be in the
mtd-2.6.git tree (git://git.infradead.org/mtd-2.6.git)
or see this URL:
http://git.infradead.org/mtd-2.6.git?a=3Dcommit;h=3D69423d99fc182a81f3c5db3=
eb5c140acc6fc64be

Some variables in MTD data structures which were 32-bit
became 64-bit. Namely, the 'size' field in 'struct mtd_info'
and the 'addr'/'len' fields in 'struct erase_info'. This
means we have to use 'do_div' to divide them.

This patch fixes the following linking error:
ERROR: "__udivdi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!
ERROR: "__umoddi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!

This patch changes divisions of 64-bit variable so that they use
'do_div'. This patch also change some print placeholders to
get rid of gcc warnings.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: David Brownell <david-b@pacbell.net>
---
 drivers/mtd/devices/mtd_dataflash.c |   22 +++++++++++++++-------
 1 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_=
dataflash.c
index 6dd9aff..948193c 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/err.h>
+#include <asm/div64.h>
=20
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
@@ -152,15 +153,20 @@ static int dataflash_erase(struct mtd_info *mtd, stru=
ct erase_info *instr)
 	struct spi_message	msg;
 	unsigned		blocksize =3D priv->page_size << 3;
 	uint8_t			*command;
+	uint64_t		tmp;
=20
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=3D0x%x len 0x%x\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=3D0x%llx len 0x%llx\n",
 			spi->dev.bus_id,
 			instr->addr, instr->len);
=20
 	/* Sanity checks */
-	if ((instr->addr + instr->len) > mtd->size
-			|| (instr->len % priv->page_size) !=3D 0
-			|| (instr->addr % priv->page_size) !=3D 0)
+	if (instr->addr + instr->len > mtd->size)
+		return -EINVAL;
+	tmp =3D instr->len;
+	if (do_div(tmp, priv->page_size))
+		return -EINVAL;
+	tmp =3D instr->addr;
+	if (do_div(tmp, priv->page_size))
 		return -EINVAL;
=20
 	spi_message_init(&msg);
@@ -178,7 +184,9 @@ static int dataflash_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 		/* Calculate flash page address; use block erase (for speed) if
 		 * we're at a block boundary and need to erase the whole block.
 		 */
-		pageaddr =3D instr->addr / priv->page_size;
+		tmp =3D instr->len;
+		do_div(tmp, priv->page_size);
+		pageaddr =3D tmp;
 		do_block =3D (pageaddr & 0x7) =3D=3D 0 && instr->len >=3D blocksize;
 		pageaddr =3D pageaddr << priv->page_offset;
=20
@@ -667,8 +675,8 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 	if (revision >=3D 'c')
 		otp_tag =3D otp_setup(device, revision);
=20
-	dev_info(&spi->dev, "%s (%d KBytes) pagesize %d bytes%s\n",
-			name, DIV_ROUND_UP(device->size, 1024),
+	dev_info(&spi->dev, "%s (%lld KBytes) pagesize %d bytes%s\n",
+			name, (device->size + 1023) >> 10,
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
=20
--=20
1.5.4.3


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
