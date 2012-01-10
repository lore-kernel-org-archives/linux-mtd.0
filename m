Received: from zmc.proxad.net ([212.27.53.206])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkf5G-0003g5-Dq
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 17:02:03 +0000
Date: Tue, 10 Jan 2012 18:02:00 +0100 (CET)
From: Florian Fainelli <ffainelli@freebox.fr>
To: "Ira W. Snyder" <iws@ovro.caltech.edu>
Message-ID: <834779565.1495241326214920100.JavaMail.root@zimbra-corp-1-b8>
In-Reply-To: <20120110165554.GB30403@ovro.caltech.edu>
Subject: Re: [PATCH] MTD: make panic_write() conditional to CONFIG_MTD_OOPS
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, Florian Fainelli <ffainelli@freebox.fr>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
Reply-To: Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ira,

----- "Ira W. Snyder" <iws@ovro.caltech.edu> a =C3=A9crit :

> On Tue, Jan 10, 2012 at 05:51:03PM +0100, Florian Fainelli wrote:
> > The mtdoops driver is the only user of the panic_write callback
> > make all panic_write related code conditionnal to CONFIG_MTD_OOPS
> > so we can save some code. Since CONFIG_MTD_OOPS can be a module
> > use the newly introduced IS_ENABLED() macro to cope with that.
> >=20
> > It is safe to define the panic_write callback as NULL when
> > CONFIG_MTD_OOPS is disabled since the mtdoops drivers check for the
> > callback being non-NULL and returns an error if this the case.
> >=20
> > Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> > ---
[snip]
> > diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> > index a061bc1..9f6a2a9 100644
> > --- a/drivers/mtd/onenand/onenand_base.c
> > +++ b/drivers/mtd/onenand/onenand_base.c
> > @@ -1736,6 +1736,7 @@ static void onenand_panic_wait(struct mtd_info
> *mtd)
> >   *
> >   * Write with ECC
> >   */
> > +#if IS_ENABLED(CONFIG_MTD_OOPS)
>=20
> This #if should be moved up above onenand_panic_wait() which is only
> used from onenand_panic_write().

Indeed, thanks for spotting this.

>=20
> Other than that, the patch looks good to me.

Thanks.
--
Florian

>=20
> Ira
>=20
> >  static int onenand_panic_write(struct mtd_info *mtd, loff_t to,
> size_t len,
> >  =09=09=09 size_t *retlen, const u_char *buf)
> >  {
> > @@ -1819,6 +1820,10 @@ static int onenand_panic_write(struct
> mtd_info *mtd, loff_t to, size_t len,
> >  =09*retlen =3D written;
> >  =09return ret;
> >  }
> > +#else
> > +#define onenand_panic_write=09NULL
> > +#endif
> > +
> > =20
> >  /**
> >   * onenand_fill_auto_oob - [INTERN] oob auto-placement transfer
> > --=20
> > 1.7.5.4
> >
