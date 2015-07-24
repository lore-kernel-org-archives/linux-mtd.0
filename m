Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIcOK-00025W-IB
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 12:47:58 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V4 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Fri, 24 Jul 2015 14:45:07 +0200
Cc: Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1427117782-14764-1-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1427117782-14764-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_TNjsVRzj20XI0/R"
Message-Id: <201507241445.07988.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_TNjsVRzj20XI0/R
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, March 23, 2015 at 02:36:21 PM, Graham Moore wrote:
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> ---
> V2: Add cdns prefix to driver-specific bindings.
> V3: Use existing property "is-decoded-cs" instead of creating a duplicate,
> "ext-decoder".  Timing parameters are in nanoseconds, not master reference
> clocks.  Remove bus-num completely.

Hi!

do you plan to continue on this driver any soon? If not, I'd like to take
over the mainlining if you're not opposed. I'd like to see this in mainline
soon.

btw you'll need some kind of a variation on the attached two patches in
the next iteration.

Best regards,
Marek Vasut

--Boundary-00=_TNjsVRzj20XI0/R
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-mtd-spi-nor-Fix-SRAM-config-on-CQSPI.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-mtd-spi-nor-Fix-SRAM-config-on-CQSPI.patch"

=46rom e305b9a9cd80e56aeaa19b3c2a5bb26ba3adf8d7 Mon Sep 17 00:00:00 2001
=46rom: Marek Vasut <marex@denx.de>
Date: Fri, 24 Jul 2015 10:10:23 +0200
Subject: [PATCH 1/2] mtd: spi-nor: Fix SRAM config on CQSPI

Make sure the SRAM configuration register is loaded with correct data
when initializing the controller. This might not always be the case,
since for example U-Boot configures this register and even toggling the
controller reset doesn't reset it to default value. Thus, explicitly
set the register.

Signed-off-by: Marek Vasut <marex@denx.de>
=2D--
 drivers/mtd/spi-nor/cadence-quadspi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/ca=
dence-quadspi.c
index fa7b421..a18732c 100644
=2D-- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1100,6 +1100,9 @@ static void cqspi_controller_init(struct cqspi_st *cq=
spi)
 	/* Disable all interrupts. */
 	writel(0, cqspi->iobase + CQSPI_REG_IRQMASK);
=20
+	/* Configure the SRAM split to 1:1 . */
+	writel(0x40, cqspi->iobase + CQSPI_REG_SRAMPARTITION);
+
 	cqspi_controller_enable(cqspi);
 }
=20
=2D-=20
2.1.4


--Boundary-00=_TNjsVRzj20XI0/R
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0002-mtd-spi-nor-Pass-OF-node-into-subdevs.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-mtd-spi-nor-Pass-OF-node-into-subdevs.patch"

=46rom fac766b916a64c263fdb044bdaba80a52f582ecb Mon Sep 17 00:00:00 2001
=46rom: Marek Vasut <marex@denx.de>
Date: Fri, 24 Jul 2015 14:10:09 +0200
Subject: [PATCH 2/2] mtd: spi-nor: Pass OF node into subdevs

The entire mechanism by which the CQSPI driver probes the SPI NORs
is probably broken, in particular because it uses dev pointer of
the CQSPI and passes it into spi_nor_scan(). Since the dev->of_node
therefore points into the of_node of the CQSPI, the spi-nor driver
cannot properly parse the OF properties of the subnode and thus can
not configure itself accordingly. Add a nasty hack to work around
this for now.

Signed-off-by: Marek Vasut <marex@denx.de>
=2D--
 drivers/mtd/spi-nor/cadence-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/ca=
dence-quadspi.c
index a18732c..017460e 100644
=2D-- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1203,6 +1203,7 @@ static int cqspi_probe(struct platform_device *pdev)
=20
 		nor->mtd =3D mtd;
 		nor->dev =3D dev;
+		nor->dev->of_node =3D np;
 		nor->priv =3D cqspi;
 		mtd->priv =3D nor;
=20
=2D-=20
2.1.4


--Boundary-00=_TNjsVRzj20XI0/R--
