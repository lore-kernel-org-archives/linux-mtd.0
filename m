Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXmf-0001XM-0Q
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:44:06 +0000
Date: Wed, 20 Jun 2018 09:43:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "Marek
 Vasut" <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 5/6] mtd: rawnand: micron: add
 ONFI_FEATURE_ON_DIE_ECC to supported features
Message-ID: <20180620094342.6689f0d4@xps13>
In-Reply-To: <b7bfe97c079e4e83bc108625224c2b16@svr-chch-ex1.atlnz.lc>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-6-chris.packham@alliedtelesis.co.nz>
 <20180619074056.420d5560@bbrezillon>
 <20180619085244.77790406@xps13>
 <b7bfe97c079e4e83bc108625224c2b16@svr-chch-ex1.atlnz.lc>
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

Hi Chris,

On Tue, 19 Jun 2018 21:22:00 +0000, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> On 19/06/18 18:53, Miquel Raynal wrote:
> > Hi Boris, Chris,
> >=20
> > On Tue, 19 Jun 2018 07:40:56 +0200, Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> >  =20
> >> On Tue, 19 Jun 2018 17:31:24 +1200
> >> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> >> =20
> >>> Add ONFI_FEATURE_ON_DIE_ECC to the set/get features list for Micron
> >>> NAND flash.
> >>>    =20
> >>
> >> Fixes: 789157e41a06 ("mtd: rawnand: allow vendors to declare (un)suppo=
rted features") =20
> >=20
> > Sorry for breaking it in my previous series.
> >  =20
> >> Cc: <stable@vger.kernel.org>
> >>
> >> No need to send a new version, I'll add that when queuing the patch.
> >>
> >> Miquel, if you're okay, I'm gonna take this patch in the mtd/fixes bra=
nch
> >> and let you deal with other patches in this series. =20
> >=20
> > Yes please, take this one.
> >=20
> > * Chris, I'll take patches 1, 2, 3 with Boris comments. =20
>=20
> OK.
>=20
> I also got a kbuild report on
>=20
> include/linux/mtd/rawnand.h:788: warning: Function parameter or member=20
> 'fixup_onfi_param_page' not described in 'nand_manufacturer_ops'
>=20
> Do you want me to send a v3 for that? (given our timezones I'll just=20
> send it anyway and you can choose to take it or just stick with v2).

I'll take v3 for sure, thanks for already sending it.

>=20
> > * Patch 4 I think I'll just drop it as nobody can test it (and it's a
> >    oneliner). I prefer people requesting a feature than complaining
> >    about a bug :) =20
>=20
> Agreed. It's in the mailing list archive now if someone needs it we can=20
> resurrect it from there
>=20
> > * Boris will take patch 5 in the mtd/fixes branch. =20
>=20
> Thanks all. Sorry our emails crossed so I couldn't just send #5 as a fix=
=20
> on it's own.
>=20
> > * I'll let you write a v3 for patch 6 only. =20
>=20
> I'll have a read through the old thread and see if I can make sense of it.

Thanks!

Miqu=C3=A8l
