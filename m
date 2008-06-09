Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5faG-0007VQ-LA
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 11:30:45 +0000
Date: Mon, 9 Jun 2008 13:31:24 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch 2.6.26-rc5-git] at91_nand speedup via {read,write}s{b,w}()
Message-ID: <20080609133124.0eb97e25@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <200806090313.28515.david-b@pacbell.net>
References: <200806090313.28515.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell <david-b@pacbell.net> wrote:
> This uses __raw_{read,write}s{b,w}() primitives to access data on NAND
> chips for more efficient I/O.
>=20
> On an arm926 with memory clocked at 100 MHz, this reduced the elapsed
> time for a 64 MByte read by 16%.  ("dd" /dev/mtd0 to /dev/null, with
> an 8-bit NAND using hardware ECC and 128KB blocksize.)

Nice. Here are some numbers from my setup (256 MB, 8-bit, software ECC).

Before:
real	2m38.131s
user	0m0.228s
sys	2m37.740s

After:
real	2m27.404s
user	0m0.180s
sys	2m27.068s

which is a 6.8% speedup. I guess hardware ECC helps...though I can't
seem to get it to work properly. Is there anything I need to do besides
flash_eraseall when changing the ECC layout?

Also, I wonder if we can use the DMA engine framework to get rid of all
that "sys" time...?

> Also some minor section tweaks:
>=20
>   - Use platform_driver_probe() so no pointer to probe() lingers
>     after that code has been removed at run-time.
>=20
>   - Use __exit and __exit_p so the remove() code will normally be
>     removed by the linker.
>=20
> Since these buffer read/write calls are new, this increases the runtime
> code footprint (by 88 bytes on my build, after the section tweaks).

Yeah, I spotted a bug in __raw_readsb on avr32, so I guess those
functions haven't actually been used before...

> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> ---
> Yeah, this does may you wonder why the *default* nand r/w code isn't
> using these primitives; this speedup shouldn't be platform-specific.
>=20
> Posting this now since I think this should either be incorporated into
> the new atmel_nand.c code or into drivers/mtd/nand/nand_base.c ...
> both arm and avr32 support these calls, I'm not sure whether or not
> some platforms don't support them.

I'll leave it up to the MTD people to decide whether or not to update
nand_base.c. Below is your patch rebased onto my patchset. I'll include
it in my next series after I figure out where to send it.

Haavard

=46rom ad420ea11f9c8aa0fcad2ce1c3af69c02a2dc447 Mon Sep 17 00:00:00 2001
From: David Brownell <david-b@pacbell.net>
Date: Mon, 9 Jun 2008 03:13:28 -0700
Subject: [PATCH] atmel_nand speedup via {read,write}s{b,w}()

This uses __raw_{read,write}s{b,w}() primitives to access data on NAND
chips for more efficient I/O.

On an arm926 with memory clocked at 100 MHz, this reduced the elapsed
time for a 64 MByte read by 16%.  ("dd" /dev/mtd0 to /dev/null, with
an 8-bit NAND using hardware ECC and 128KB blocksize.)

Also some minor section tweaks:

  - Use platform_driver_probe() so no pointer to probe() lingers
    after that code has been removed at run-time.

  - Use __exit and __exit_p so the remove() code will normally be
    removed by the linker.

Since these buffer read/write calls are new, this increases the runtime
code footprint (by 88 bytes on my build, after the section tweaks).

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
[haavard.skinnemoen@atmel.com: rebase onto atmel_nand rename]
Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |   46 ++++++++++++++++++++++++++++++++++++-=
---
 1 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 325ce29..d9f7a5d 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -142,6 +142,37 @@ static int atmel_nand_device_ready(struct mtd_info *mt=
d)
 }
=20
 /*
+ * Minimal-overhead PIO for data access.
+ */
+static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip =3D mtd->priv;
+
+	__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
+}
+
+static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip =3D mtd->priv;
+
+	__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
+}
+
+static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip =3D mtd->priv;
+
+	__raw_writesb(nand_chip->IO_ADDR_W, buf, len);
+}
+
+static void atmel_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip =3D mtd->priv;
+
+	__raw_writesw(nand_chip->IO_ADDR_W, buf, len / 2);
+}
+
+/*
  * write oob for small pages
  */
 static int atmel_nand_write_oob_512(struct mtd_info *mtd,
@@ -436,8 +467,14 @@ static int __init atmel_nand_probe(struct platform_dev=
ice *pdev)
=20
 	nand_chip->chip_delay =3D 20;		/* 20us command delay time */
=20
-	if (host->board->bus_width_16)		/* 16-bit bus width */
+	if (host->board->bus_width_16) {	/* 16-bit bus width */
 		nand_chip->options |=3D NAND_BUSWIDTH_16;
+		nand_chip->read_buf =3D atmel_read_buf16;
+		nand_chip->write_buf =3D atmel_write_buf16;
+	} else {
+		nand_chip->read_buf =3D atmel_read_buf;
+		nand_chip->write_buf =3D atmel_write_buf;
+	}
=20
 	platform_set_drvdata(pdev, host);
 	atmel_nand_enable(host);
@@ -546,7 +583,7 @@ err_nand_ioremap:
 /*
  * Remove a NAND device.
  */
-static int __devexit atmel_nand_remove(struct platform_device *pdev)
+static int __exit atmel_nand_remove(struct platform_device *pdev)
 {
 	struct atmel_nand_host *host =3D platform_get_drvdata(pdev);
 	struct mtd_info *mtd =3D &host->mtd;
@@ -564,8 +601,7 @@ static int __devexit atmel_nand_remove(struct platform_=
device *pdev)
 }
=20
 static struct platform_driver atmel_nand_driver =3D {
-	.probe		=3D atmel_nand_probe,
-	.remove		=3D atmel_nand_remove,
+	.remove		=3D __exit_p(atmel_nand_remove),
 	.driver		=3D {
 		.name	=3D "atmel_nand",
 		.owner	=3D THIS_MODULE,
@@ -574,7 +610,7 @@ static struct platform_driver atmel_nand_driver =3D {
=20
 static int __init atmel_nand_init(void)
 {
-	return platform_driver_register(&atmel_nand_driver);
+	return platform_driver_probe(&atmel_nand_driver, atmel_nand_probe);
 }
=20
=20
--=20
1.5.5.3
