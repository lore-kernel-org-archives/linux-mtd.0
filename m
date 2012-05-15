Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUCbv-0002GW-4l
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 07:55:59 +0000
Message-ID: <1337068763.2528.146.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/3] mtd: nand: gpmi: [FIXME] need to use
 {read,write}_oob_raw
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 15 May 2012 10:59:23 +0300
In-Reply-To: <4FB07272.4020403@freescale.com>
References: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
 <1336768235-12658-3-git-send-email-computersforpeace@gmail.com>
 <4FB07272.4020403@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-232x/1bakojGXJUjh7/J"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-232x/1bakojGXJUjh7/J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-14 at 10:48 +0800, Huang Shijie wrote:
> Hi Brian :
> > This patch is simply an added warning in the comments. Ideally, this pa=
tch
> > need not be merged, but rather, a developer will write a proper solutio=
n
> > that can use the ecc.read_oob_raw and ecc.write_oob_raw interfaces.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> > index 8250f63..033bd7a 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -1054,6 +1054,9 @@ exit_auxiliary:
> >   * ECC-based or raw view of the page is implicit in which function it =
calls
> >   * (there is a similar pair of ECC-based/raw functions for writing).
> >   *
> > + * FIXME: The following paragraph is incorrect, now that there exist
> > + * ecc.read_oob_raw and ecc.write_oob_raw functions.
> I think you can just remove the following paragraph(it's out of date now)=
.

I've pushed Brian's patch to l2-mtd.git - it is OK in this form and I
think it is better if someone who takes care of gpmi fixes-up the
comments properly instead.

--=20
Best Regards,
Artem Bityutskiy

--=-232x/1bakojGXJUjh7/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsgzcAAoJECmIfjd9wqK06usP/jKgezmOFw0vcyl+RwUbaPQd
fYoDz/+r++za7dDKCTZzPLeggaorhjk9C16LSVo6g0TDhNZts8I2TYo7O7Ve8zLa
P0WW2da23ZINS3FB/Rb/TCvdm2sVq+MxL3tbxwnJDgkP2RLvTSFM0NA1Pvw2Ftzn
u6DJgGXaflv7a8rB1mk4p519z5rS7S5edHVNooDIatTAQ0HyQM5+D7NVGtSYcsvw
b6D6dN9DwDTU9ID+SHrEfRn0aPRYIJQbZu/Apgog9hzmBJ1iI5CrtbWMBqCP60yD
QMOzeLszkanwIyBltDKqCii2RN6GNhAtWqlBWFqtK0OeEqsEnt4zlADmwZuRqqf1
/sAlcxjcunIaPaMcbqVmuoElmpmLnJl20HeN6gou+EsyA97BZNb427kMbJljIibA
IdaloCN3dBfMV8JWDVtzPzp5CkH2EHGppdErVdA/85ZY4xkLlSxdnNKEZ61uKwjV
/f0kfHUE23dDp2XfxyQrCjB+0A+Ikn3lmL0aURdp7zqpVEBYyQPDgPjzdoUp7vXu
2zUSg6GP7qKJZlKs6SnRonmXu6F01TDo9zLD9DmnF0Jc/Iq133NzBULzKHU1Z5H1
eJrgDVWMEkPbwhQuYZX1up+Ms/CQG3rGtnJ+eolEai8gapYmB37bNVg/b8WpdfQg
o4MnT7TnG8Ra5XRJ+qez
=aQKC
-----END PGP SIGNATURE-----

--=-232x/1bakojGXJUjh7/J--
