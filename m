Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aECAS-00021y-Uo
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 08:31:40 +0000
Date: Wed, 30 Dec 2015 09:31:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?5r2Y5qCL?= <peterpansjtu@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Frans
 Klaver <fransklaver@gmail.com>, Peter Pan <peterpandong@micron.com>,
 beanhuo@micron.com, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, karlzhang@micron.com
Subject: Re: [PATCH v2 00/12] mtd: nand_bbt: introduce independent nand BBT
Message-ID: <20151230093106.6b1ee118@bbrezillon>
In-Reply-To: <CAAyFOR+J1VG9tZdahP=z=yth_om0O_58HH1BVScP3-rvsQj+VA@mail.gmail.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <CAAEAJfC4YWVC=WWTBnKrnNZypC+CKR+D59+LY7j-haTch4yevA@mail.gmail.com>
 <20151229103519.31ccaf5c@bbrezillon>
 <CAAEAJfAV_Nfm81nSEpQRyx=hcW8R-dK6_SJdGDQ_JQK5zu1jpw@mail.gmail.com>
 <20151229161156.77060900@bbrezillon>
 <CAAyFOR+J1VG9tZdahP=z=yth_om0O_58HH1BVScP3-rvsQj+VA@mail.gmail.com>
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

Hi Peter,

On Wed, 30 Dec 2015 15:18:39 +0800
=E6=BD=98=E6=A0=8B <peterpansjtu@gmail.com> wrote:

> Hi Boris and Ezequiel,
>=20
> 2015-12-29 23:11 GMT+08:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
> > On Tue, 29 Dec 2015 12:07:50 -0300
> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >
> >> On 29 December 2015 at 06:35, Boris Brezillon
> >> <boris.brezillon@free-electrons.com> wrote:
> >> > Hi,
> >> >
> >> > On Mon, 28 Dec 2015 17:42:50 -0300
> >> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >> >
> >> >> This is looking a lot better, thanks for the good work!
> >> >>
> >> >> On 15 December 2015 at 02:59, Peter Pan <peterpansjtu@gmail.com> wr=
ote:
> >> >> > Currently nand_bbt.c is tied with struct nand_chip, and it makes =
other
> >> >> > NAND family chips hard to use nand_bbt.c. Maybe it's the reason w=
hy
> >> >> > onenand has own bbt(onenand_bbt.c).
> >> >> >
> >> >> > Separate struct nand_chip from BBT code can make current BBT shar=
eable.
> >> >> > We create struct nand_bbt to take place of nand_chip in nand_bbt.=
c.
> >> >> > Struct nand_bbt contains all the information BBT needed from outs=
ide and
> >> >> > it should be embedded into NAND family chip struct (such as struc=
t nand_chip).
> >> >> > NAND family driver should allocate, initialize and free struct na=
nd_bbt.
> >> >> >
> >> >> > Below is mtd folder structure we want:
> >> >> >         mtd
> >> >> >         =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> >> >> >         =E2=94=9C=E2=94=80=E2=94=80 Makefile
> >> >> >         =E2=94=9C=E2=94=80=E2=94=80 ...
> >> >> >         =E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c
> >> >>
> >> >> Hm.. I'm not sure about having nand_bbt.c in drivers/mtd.
> >> >> What's wrong with drivers/mtd/nand ?
> >> >
> >> > I haven't reviewed the series yet, but I agree. If the BBT code is o=
nly
> >> > meant to be used on NAND based devices, it should probably stay in
> >> > drivers/mtd/nand.
> >> >
> >> >>
> >> >> In fact, I  was thinking we could go further and clean up the direc=
tories a bit
> >> >> by separating core code, from controllers code, from SPI NAND code:
> >> >>
> >> >> drivers/mtd/nand/
> >> >> drivers/mtd/nand/controllers
> >> >> drivers/mtd/nand/spi
> >> >>
> >> >> Makes any sense?
> >> >
> >> > Actually I had the secret plan of moving all (raw) NAND controller
> >> > drivers into the drivers/mtd/nand/controllers directory, though this
> >> > was for a different reason: I'd like to create another directory for
> >> > manufacturer specific code in order to support some advanced features
> >> > on NANDs that do not implement (or only partially implement) the ONFI
> >> > standard.
> >> >
> >> > The separation you're talking about here is more related to the
> >> > interface used to communicate with the NAND chip.
> >> >
> >> > How about using the following hierarchy?
> >> >
> >> > drivers/mtd/nand/<nand-core-code>
> >> > drivers/mtd/nand/interfaces/raw/<raw-nand-core-code>
> >> > drivers/mtd/nand/interfaces/raw/controllers/<raw-nand-controller-dri=
vers>
> >> > drivers/mtd/nand/interfaces/spi/<spi-nand-code>
> >> > drivers/mtd/nand/interfaces/onenand/<onenand-code>
> >> > drivers/mtd/nand/chips/<manufacturer-spcific-code>
> >> >
> >> > What do you think?
> >> >
> >>
> >> I believe we are bikeshedding here, but what the heck.
> >>
> >> That seems too involved. A simpler hierarchy could be clear enough,
> >> and seems to follow what other subsystems do:
> >>
> >> drivers/mtd/nand/<all-nand-core-code>
> >> drivers/mtd/nand/raw/<raw-nand-controller-drivers>
> >
> > And probably some common logic in there too.
> >
> >> drivers/mtd/nand/spi/<spi-nand-code>
> >> drivers/mtd/nand/onenand/<onenand-code>
> >> drivers/mtd/nand/chips/<manufacturer-spcific-code>
> >>
> >
> > I'm fine with this one too ;-).
>=20
> I'm fine with this structure too. drivers/mtd/nand folder becomes top fol=
der for
> all NAND based devices. Because (raw)NAND, SPI-NAND and ONENAND have
> different command set and feature, each has its own core - nand_base.c
> spi-nand-base.c
> and onenand_base.c. So maybe it'll take a lot effort to abstract a
> all-nand-core-code
> (of course BBT should be one of them). What's your opinion?

Absolutely, that was the idea: move everything into the
drivers/mtd/nand directory (with the structure described above), keep
some specific logic for each interface type, and see if we can factor
out some common code (I noticed that SPI NAND devices have a parameter
page which looks similar to the one exposed by ONFI compliant devices,
except this parameter page is retrieved using a different command, the
same goes for the ->{set,get}_features() functions).
But let's focus on the nand_bbt code for now.

>=20
> Also, please review the BBT patch if you have time. I think it's
> helpful on the new NAND code
> hierarchy.

I'll try to review it this week.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
