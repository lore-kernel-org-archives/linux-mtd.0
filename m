From: Han Xu <han.xu@nxp.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Markus Pargmann
 <mpa@pengutronix.de>
CC: David Woodhouse <dwmw2@infradead.org>, Fabio Estevam
 <fabio.estevam@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, Huang Shijie <shijie.huang@intel.com>, Brian Norris
 <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Date: Tue, 12 Apr 2016 22:39:08 +0000
Message-ID: <DB5PR0401MB1845DD983AF9195311DEB20F97950@DB5PR0401MB1845.eurprd04.prod.outlook.com>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <20160224145750.21050def@bbrezillon>
 <3992227.rRuQ67A3ma@galactica>,<20160411092916.793d5abd@bbrezillon>
In-Reply-To: <20160411092916.793d5abd@bbrezillon>
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



________________________________________
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Sent: Monday, April 11, 2016 1:29 AM
To: Markus Pargmann
Cc: Han Xu; David Woodhouse; Fabio Estevam; linux-mtd@lists.infradead.org; =
kernel@pengutronix.de; Huang Shijie; Brian Norris; linux-arm-kernel@lists.i=
nfradead.org
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages

On Mon, 11 Apr 2016 08:34:35 +0200
Markus Pargmann <mpa@pengutronix.de> wrote:

> Hi Boris,
>
> On Wednesday 24 February 2016 14:57:50 Boris Brezillon wrote:
> > Hi Markus,
> >
> > On Sun, 21 Feb 2016 13:52:06 +0100
> > Markus Pargmann <mpa@pengutronix.de> wrote:
> >
> > > ECC is only calculated for written pages. As erased pages are not
> > > actively written the ECC is always invalid. For this purpose the
> > > Hardware BCH unit is able to check for erased pages and does not rais=
e
> > > an ECC error in this case. This behaviour can be influenced using the
> > > BCH_MODE register which sets the number of allowed bitflips in an era=
sed
> > > page. Unfortunately the unit is not capable of fixing the bitflips in
> > > memory.
> > >
> > > To avoid complete software checks for erased pages, we can simply che=
ck
> > > buffers with uncorrectable ECC errors because we know that any erased
> > > page with errors is uncorrectable by the BCH unit.
> > >
> > > This patch adds the generic nand_check_erased_ecc_chunk() to gpmi-nan=
d
> > > to correct erased pages. To have the valid data in the buffer before
> > > using them, this patch moves the read_page_swap_end() call before the
> > > ECC status checking for-loop.
> > >
> > > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > > ---
> > >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 49 ++++++++++++++++++++++++=
++++++----
> > >  1 file changed, 44 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/gpmi-nand/gpmi-nand.c
> > > index 235ddcb58f39..ce5a21252102 100644
> > > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > @@ -1035,14 +1035,58 @@ static int gpmi_ecc_read_page(struct mtd_info=
 *mtd, struct nand_chip *chip,
> > >   /* Loop over status bytes, accumulating ECC status. */
> > >   status =3D auxiliary_virt + nfc_geo->auxiliary_status_offset;
> > >
> > > + read_page_swap_end(this, buf, nfc_geo->payload_size,
> > > +                    this->payload_virt, this->payload_phys,
> > > +                    nfc_geo->payload_size,
> > > +                    payload_virt, payload_phys);
> > > +
> > >   for (i =3D 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> > >           if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_=
ERASED))
> > >                   continue;
> > >
> > >           if (*status =3D=3D STATUS_UNCORRECTABLE) {
> > > +                 int flips;
> > > +
> > > +                 /*
> > > +                  * The ECC hardware has an uncorrectable ECC status
> > > +                  * code in case we have bitflips in an erased page.=
 As
> > > +                  * nothing was written into this subpage the ECC is
> > > +                  * obviously wrong and we can not trust it. We assu=
me
> > > +                  * at this point that we are reading an erased page=
 and
> > > +                  * try to correct the bitflips in buffer up to
> > > +                  * ecc_strength bitflips. If this is a page with ra=
ndom
> > > +                  * data, we exceed this number of bitflips and have=
 a
> > > +                  * ECC failure. Otherwise we use the corrected buff=
er.
> > > +                  */
> > > +                 if (i =3D=3D 0) {
> > > +                         /* The first block includes metadata */
> > > +                         flips =3D nand_check_erased_ecc_chunk(
> > > +                                         buf + i * nfc_geo->ecc_chun=
k_size,
> > > +                                         nfc_geo->ecc_chunk_size,
> > > +                                         NULL, 0,
> > > +                                         auxiliary_virt,
> > > +                                         nfc_geo->metadata_size,
> > > +                                         nfc_geo->ecc_strength);
> > > +                 } else {
> > > +                         flips =3D nand_check_erased_ecc_chunk(
> > > +                                         buf + i * nfc_geo->ecc_chun=
k_size,
> > > +                                         nfc_geo->ecc_chunk_size,
> > > +                                         NULL, 0,
> > > +                                         NULL, 0,
> > > +                                         nfc_geo->ecc_strength);
> > > +                 }
> >
> > You're not checking ECC bytes. I know it's a bit more complicated to
> > implement, but as Brian stated several times, you should always check
> > ECC bytes along with data bytes when testing for an erased chunk.
> >
> > Indeed, it might appear that the user really programmed ff on the page,
> > and in this case you don't want to consider the page as erased.
> > In this case, the ECC bytes will be different from ff, and you'll
> > be able to identify it by checking those ECC bytes.
>
> Thanks for the feedback. Talking with a coworker about this we may have f=
ound a
> better approach to this that is less complicated to implement. The hardwa=
re
> unit allows us to set a bitflip threshold for erased pages. The ECC unit
> creates an ECC error only if the number of bitflips exceeds this threshol=
d, but
> it does not correct these. So the idea is to change the patch so that we =
set
> pages, that are signaled by the ECC as erased, to 0xff completely without
> checking. So the ECC will do all the work and we completely trust in its
> abilities to do it correctly.

Sounds good.

some new platforms with new gpmi controller could check the count of 0 bits=
 in page,
refer to my patch https://patchwork.ozlabs.org/patch/587124/

But for all legacy platforms, IMO, considering bitflip is rare case, set th=
reshold to 0 and
only check the uncorrectable branch and then correct data sounds better. Se=
tting threshold
and correcting all erased page may highly impact the performance.

--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
