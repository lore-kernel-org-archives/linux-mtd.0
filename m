Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eAHhJ-0002Rh-9J
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 15:46:31 +0000
Date: Thu, 2 Nov 2017 16:45:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Peter Rosin <peda@axentia.se>,
 devicetree@vger.kernel.org
Subject: Re: sam9x5: MTD numbering changed
Message-ID: <20171102164555.033dc99b@bbrezillon>
In-Reply-To: <1509636493.16695.9.camel@gmail.com>
References: <1509621436.16695.3.camel@gmail.com>
 <20171102133954.055ce285@bbrezillon>
 <1509632027.16695.5.camel@gmail.com>
 <20171102160909.6eee6289@bbrezillon>
 <1509636493.16695.9.camel@gmail.com>
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

On Thu, 02 Nov 2017 16:28:13 +0100
Richard Genoud <richard.genoud@gmail.com> wrote:

> +Nicolas
> [its email got lost somehow]
> Le jeudi 02 novembre 2017 =C3=A0 16:09 +0100, Boris Brezillon a =C3=A9cri=
t=C2=A0:
> > On Thu, 02 Nov 2017 15:13:47 +0100
> > Richard Genoud <richard.genoud@gmail.com> wrote:
> >  =20
> > > Le jeudi 02 novembre 2017 =C3=A0 13:39 +0100, Boris Brezillon a =C3=
=A9crit=C2=A0: =20
> > > > +Nicolas
> > > >=20
> > > > Hi Richard,
> > > >=20
> > > > On Thu, 02 Nov 2017 12:17:16 +0100
> > > > Richard Genoud <richard.genoud@gmail.com> wrote:
> > > > =C2=A0=C2=A0 =20
> > > > > Hi,
> > > > >=20
> > > > > I've got an at91sam9g35-cm based board, with 4 partition on the
> > > > > spi-
> > > > > dataflas and 5 partitions on the NAND flash.
> > > > > Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new
> > > > > NAND
> > > > > bindings"),
> > > > > the NAND partitions were mtd0-4 and spi-dataflash partitions
> > > > > mtd5-
> > > > > 8.
> > > > >=20
> > > > > Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new
> > > > > NAND
> > > > > bindings"),
> > > > > the spi-dataflash partitions are discovered before the NAND
> > > > > partitions.
> > > > > So NAND partition became mtd4-8 and spi-dataflash partition
> > > > > mtd0-3.
> > > > >=20
> > > > > This broke some script that relied on the mtd numbering.
> > > > >=20
> > > > > Updating those scripts to rely on the mtd device name instead
> > > > > of
> > > > > number=C2=A0is not really a problem. The real problem is when an
> > > > > older
> > > > > script using mtd numbering is run on the new system : I expect
> > > > > dead
> > > > > kittens everywhere !=C2=A0=C2=A0 =20
> > > >=20
> > > > Crap! That was one of the thing I was afraid of when changing the
> > > > binding: probe order has an impact on ids assigned to MTD devs,
> > > > and
> > > > since things are not defined at the same place in the DT, it
> > > > changes
> > > > the probe order.
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > > So, I'd like to know if there's a way to force the older
> > > > > numbering
> > > > > ?=C2=A0=C2=A0 =20
> > > >=20
> > > > Reverting the patches is probably the easiest way (and it's
> > > > easily
> > > > backportable). Now, if we want to switch to the new bindings at
> > > > some
> > > > point we'll need to support DT aliases for mtd devs:
> > > >=20
> > > > aliases {
> > > > 	mtdX =3D &flashpartN;
> > > > 	mtdY =3D &flashdevM;
> > > > };
> > > >=20
> > > > The problem with this solution is that it only works if all
> > > > partitions
> > > > are defined in the DT, which is not always the case (they can be
> > > > defined
> > > > on the command line with mtdparts=3D).=C2=A0=C2=A0 =20
> > >=20
> > > Yes, and if they are different from the ones declared in
> > > at91sam9x5cm.dtsi, they are likely defined with mtdparts=3D, since
> > > AFAIK,
> > > we can't remove a declared partitionning.
> > >=20
> > > I'll disable the ebi and switch back to the old binding in my dts
> > > for
> > > now. =20
> > > > =C2=A0=C2=A0 =20
> > > > > (I tried poking around the DTS without succ=C3=A8s).
> > > > >=20
> > > > > any idea ?=C2=A0=C2=A0 =20
> > > >=20
> > > > I don't have a perfect solution, but the problem you report
> > > > clearly
> > > > shows that relying on MTD numbering is unsafe and should be
> > > > avoided.=C2=A0=C2=A0 =20
> > >=20
> > > Clearly, but who doesn't ? ;)
> > >  =20
> >=20
> > Just had a lengthy discussion with Alexandre, and he brought a valid
> > point: there has never been any guarantee on MTD numbering. Not only
> > the order of DT nodes have an impact on the probe order, but also the
> > order in which drivers are linked when creating the kernel image. Yes
> > these things usually don't change, but I'm not sure it's a good idea
> > to let user-space apps think it will never change in the future.
> >=20
> > How about fixing the scripts you were referring to instead of
> > reverting
> > the change? What's the blocking point? =20
>=20
> I already fixed the user-space scripts (and actually, they predate the
> device-tree era, so at that time, relying on MTD numbering wasn't so
> bad :)).
> Anyway, here's the blocking point :
>=20
> We have firmwares with an embedded script to update our boards. (more
> or less a FW + script in a zip file).
> Those old firmwares are already in the wild and rely on the old MTD
> numbering (yes, that's bad).
>=20
>=20
> So, even if all new scripts are corrected in the new firmwares,
> downgrading a board with an old firmware/old script will brick the
> board.
> So I'll have to detect that and forbid downgrading.

Not sure what you refer to when you're talking about 'FW', but I'd
expect it to contain a kernel [+ a dtb] + a rootfs, so if you're using
an old "FW+update-script", you will still have the old numbering and
the old script will work just fine, and if you switch to a newer version
of the "FW+update-script" based on a 4.13 kernel+dtb you will anyway
have the updated script. Am I missing something?

>=20
> That's not the end of the world, but if I can find a trick to prevent
> it, I'll be happier !
>=20
>=20
> Regards,
>=20
> Richard
>=20
>=20
> >=20
> > Regards,
> >=20
> > Boris =20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
