Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enVHf-0008KU-KR
 for linux-mtd@lists.infradead.org; Sun, 18 Feb 2018 20:10:06 +0000
Date: Sun, 18 Feb 2018 21:09:50 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Shreeya Patel
 <shreeya.patel23498@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, outreachy-kernel
 <outreachy-kernel@googlegroups.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [Outreachy kernel] Re: [PATCH NAND 0/5] Replace printk
 statements with pr_*macros
Message-ID: <20180218210950.30fe9310@bbrezillon>
In-Reply-To: <1518978365.2969.6.camel@gmail.com>
References: <cover.1518797480.git.shreeya.patel23498@gmail.com>
 <CAAEAJfAg_hei2PF37_oX2tf+Mv43ye-nEOt+KRVFerp1Jfzn2Q@mail.gmail.com>
 <alpine.DEB.2.20.1802161822560.4340@hadrien>
 <CAAEAJfAtvm5bii9eyUnYmU=tQCOvE_hPk0eBJQ1vwgogbGYr-A@mail.gmail.com>
 <20180216184840.096e534c@bbrezillon>
 <1518976870.2784.4.camel@gmail.com>
 <20180218191347.76f4a287@bbrezillon>
 <1518978365.2969.6.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shreeya,

Please try to keep everyone in the loop when you reply to an email. All
discussions should happen publicly to keep everyone aware of the
progress and let other developers/maintainers take part to the
discussion if they have something to add.


On Sun, 18 Feb 2018 23:56:05 +0530
Shreeya Patel <shreeya.patel23498@gmail.com> wrote:

> On Sun, 2018-02-18 at 19:13 +0100, Boris Brezillon wrote:
> > On Sun, 18 Feb 2018 23:31:10 +0530
> > Shreeya Patel <shreeya.patel23498@gmail.com> wrote:
> >  =20
> > >=20
> > > On Fri, 2018-02-16 at 18:48 +0100, Boris Brezillon wrote:
> > >=20
> > > Hello Sir,
> > >  =20
> > > >=20
> > > > On Fri, 16 Feb 2018 14:26:56 -0300
> > > > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > On 16 February 2018 at 14:23, Julia Lawall <julia.lawall@lip6.f =
=20
> > > > > r> =20
> > > > > wrote:=C2=A0=C2=A0 =20
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > On Fri, 16 Feb 2018, Ezequiel Garcia wrote:
> > > > > > =C2=A0=C2=A0=C2=A0 =20
> > > > > > >=20
> > > > > > >=20
> > > > > > > Hi Shreeya,
> > > > > > >=20
> > > > > > > Thanks for the contribution.
> > > > > > >=20
> > > > > > > On 16 February 2018 at 13:50, Shreeya Patel
> > > > > > > <shreeya.patel23498@gmail.com> wrote:=C2=A0=C2=A0=C2=A0=C2=A0=
 =20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > This patchset removes all the log levels i.e. KERN_WARN,
> > > > > > > > KERN_NOTICE, KERN_ERR, KERN_INFO, KERN_DEBUG used in the
> > > > > > > > printk
> > > > > > > > statements and replaces the printk statements with
> > > > > > > > appropriate
> > > > > > > > pr_*macros.
> > > > > > > > According to the kernel coding style, pr_*macro is the
> > > > > > > > preferred
> > > > > > > > way to print the message.
> > > > > > > > =C2=A0=C2=A0=C2=A0 =20
> > > > > > > So, two things to begin with.
> > > > > > >=20
> > > > > > > First of all, despite this contribution being part of
> > > > > > > outreachy,
> > > > > > > I believe you can include mailing lists in your case.
> > > > > > >=20
> > > > > > > In other words, don't use the "nol" option in
> > > > > > > get_maintainer
> > > > > > > script and Cc the MTD mailing list: linux-mtd at
> > > > > > > lists.infradead.org.=C2=A0=C2=A0=C2=A0=C2=A0 =20
> > > > > > Shouldn't the dev_* functions also be usable?
> > > > > > =C2=A0=C2=A0=C2=A0 =20
> > > > > Provided that:
> > > > > 1. it's applicable, i.e. if in the context of a device.=C2=A0=C2=
=A0 =20
> > > > Yep, be careful with that. The MTD/NAND subsystem initializes
> > > > mtd->dev.name quite late, so it's not safe to use &mtd->dev with
> > > > dev_<loglevel>(). Note that you can use the NAND controller pdev- =
=20
> > > > >dev=C2=A0 =20
> > > > if
> > > > available.=C2=A0=C2=A0 =20
> > > I would like to ask here that what will be the benefit or good
> > > cause if
> > > I use pdev->dev?
> > > How is it different from others? =20
> > Well, pdev->dev is guaranteed to be properly initialized when you
> > pass
> > it to dev_<loglevel>(). This is not the case with mtd->dev which is
> > initialized in mtd_device_register(), but the NAND controller driver
> > usually does some operations on the NAND device before reaching this
> > point (reading the ID, reading the bad block markers to determine
> > which
> > blocks are bad, ...).
> >  =20
> Thanks for making me understand.
>=20
> > Anyway, I think it's better if you first do the
> > s/printk(KERN_<LOGLEVEL>(/pr_<loglevel>(/ replacement. Replacing
> > pr_xxx
> > by dev_xxx is something we can do afterwards. =20
>=20
> I've created one patch where I have replaced printk
> with dev_* and used pdev->dev.

Okay. pdev->dev is not always directly accessible so doing
s/printk(KERN_<LOGLEVEL>/dev_<loglevel>(&pdev->dev, / is likely to
cause build failures. But I guess you compile-tested the changes you're
about to submit.

Regards,

Boris


--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
