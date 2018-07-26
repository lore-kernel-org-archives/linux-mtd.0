Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fima7-0001Sn-PF
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 20:09:54 +0000
Date: Thu, 26 Jul 2018 22:09:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Nicholas Mc Guire <hofrat@osadl.org>, Graham Moore
 <grmoore@opensource.altera.com>, Vignesh R <vigneshr@ti.com>, Richard
 Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: make return type fit
 wait_for_completion_timeout
Message-ID: <20180726220928.710f6276@bbrezillon>
In-Reply-To: <20180725063137.GB7194@osadl.at>
References: <1532189293-5975-1-git-send-email-hofrat@osadl.org>
 <20180724224626.777149ce@bbrezillon>
 <20180725063137.GB7194@osadl.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Jul 2018 06:31:37 +0000
Nicholas Mc Guire <der.herr@hofr.at> wrote:

> On Tue, Jul 24, 2018 at 10:46:26PM +0200, Boris Brezillon wrote:
> > On Sat, 21 Jul 2018 18:08:13 +0200
> > Nicholas Mc Guire <hofrat@osadl.org> wrote:
> >  =20
> > > wait_for_completion_timeout returns an unsigned long not int. declare=
 a
> > > suitably type timeout and fix up assignment and check.
> > >=20
> > > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > > Reported-by: Vignesh R <vigneshr@ti.com>
> > > Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI F=
lash Controller") =20
> >=20
> > If you don't mind, I'd like to squash all wait_for_completion_timeout()
> > fixes into a single commit.
> > =20
> makes sense - no objections to that at all.


I also dropped the timeout vars and checked the return of
wait_for_completion_timeout() directly + removed the Fixes tag since
it's no longer possible to attach the fix to a single commit and also,
I'm sure the bug really existed (no overflow possible since the timeout
values are small enough to fit in a signed int).

Here is the resulting patch. Let me know if you're okay with this version.

Thanks,

Boris

--->8---
=46rom 69edac4ef4d1c8dac519b6d12afd4097ce72a54e Mon Sep 17 00:00:00 2001
From: Nicholas Mc Guire <hofrat@osadl.org>
Date: Sat, 21 Jul 2018 16:21:51 +0200
Subject: [PATCH] mtd: spi-nor: cadence-quadspi: fix timeout handling

wait_for_completion_timeout returns an unsigned long not an int, so
let's check its return value directly instead of storing it in ret,
and avoid checking for negative values since this cannot happen.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/ca=
dence-quadspi.c
index c3f7aaa5d18f..7a19dae717fa 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -525,15 +525,14 @@ static int cqspi_indirect_read_execute(struct spi_nor=
 *nor, u8 *rxbuf,
 	       reg_base + CQSPI_REG_INDIRECTRD);
=20
 	while (remaining > 0) {
-		ret =3D wait_for_completion_timeout(&cqspi->transfer_complete,
-						  msecs_to_jiffies
-						  (CQSPI_READ_TIMEOUT_MS));
+		if (!wait_for_completion_timeout(&cqspi->transfer_complete,
+				msecs_to_jiffies(CQSPI_READ_TIMEOUT_MS)))
+			ret =3D -ETIMEDOUT;
=20
 		bytes_to_read =3D cqspi_get_rd_sram_level(cqspi);
=20
-		if (!ret && bytes_to_read =3D=3D 0) {
+		if (ret && bytes_to_read =3D=3D 0) {
 			dev_err(nor->dev, "Indirect read timeout, no bytes\n");
-			ret =3D -ETIMEDOUT;
 			goto failrd;
 		}
=20
@@ -649,10 +648,8 @@ static int cqspi_indirect_write_execute(struct spi_nor=
 *nor, loff_t to_addr,
 		iowrite32_rep(cqspi->ahb_base, txbuf,
 			      DIV_ROUND_UP(write_bytes, 4));
=20
-		ret =3D wait_for_completion_timeout(&cqspi->transfer_complete,
-						  msecs_to_jiffies
-						  (CQSPI_TIMEOUT_MS));
-		if (!ret) {
+		if (!wait_for_completion_timeout(&cqspi->transfer_complete,
+					msecs_to_jiffies(CQSPI_TIMEOUT_MS))) {
 			dev_err(nor->dev, "Indirect write timeout\n");
 			ret =3D -ETIMEDOUT;
 			goto failwr;
@@ -986,9 +983,8 @@ static int cqspi_direct_read_execute(struct spi_nor *no=
r, u_char *buf,
 	}
=20
 	dma_async_issue_pending(cqspi->rx_chan);
-	ret =3D wait_for_completion_timeout(&cqspi->rx_dma_complete,
-					  msecs_to_jiffies(len));
-	if (ret <=3D 0) {
+	if (!wait_for_completion_timeout(&cqspi->rx_dma_complete,
+					 msecs_to_jiffies(len))) {
 		dmaengine_terminate_sync(cqspi->rx_chan);
 		dev_err(nor->dev, "DMA wait_for_completion_timeout\n");
 		ret =3D -ETIMEDOUT;
