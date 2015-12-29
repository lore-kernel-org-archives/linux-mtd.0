Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDvwk-0001PO-3m
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 15:12:23 +0000
Date: Tue, 29 Dec 2015 16:11:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Peter Pan <peterpansjtu@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Frans
 Klaver <fransklaver@gmail.com>, Peter Pan <peterpandong@micron.com>,
 beanhuo@micron.com, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, karlzhang@micron.com
Subject: Re: [PATCH v2 00/12] mtd: nand_bbt: introduce independent nand BBT
Message-ID: <20151229161156.77060900@bbrezillon>
In-Reply-To: <CAAEAJfAV_Nfm81nSEpQRyx=hcW8R-dK6_SJdGDQ_JQK5zu1jpw@mail.gmail.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <CAAEAJfC4YWVC=WWTBnKrnNZypC+CKR+D59+LY7j-haTch4yevA@mail.gmail.com>
 <20151229103519.31ccaf5c@bbrezillon>
 <CAAEAJfAV_Nfm81nSEpQRyx=hcW8R-dK6_SJdGDQ_JQK5zu1jpw@mail.gmail.com>
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

On Tue, 29 Dec 2015 12:07:50 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 29 December 2015 at 06:35, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi,
> >
> > On Mon, 28 Dec 2015 17:42:50 -0300
> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >
> >> This is looking a lot better, thanks for the good work!
> >>
> >> On 15 December 2015 at 02:59, Peter Pan <peterpansjtu@gmail.com> wrote:
> >> > Currently nand_bbt.c is tied with struct nand_chip, and it makes oth=
er
> >> > NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> >> > onenand has own bbt(onenand_bbt.c).
> >> >
> >> > Separate struct nand_chip from BBT code can make current BBT shareab=
le.
> >> > We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> >> > Struct nand_bbt contains all the information BBT needed from outside=
 and
> >> > it should be embedded into NAND family chip struct (such as struct n=
and_chip).
> >> > NAND family driver should allocate, initialize and free struct nand_=
bbt.
> >> >
> >> > Below is mtd folder structure we want:
> >> >         mtd
> >> >         =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> >> >         =E2=94=9C=E2=94=80=E2=94=80 Makefile
> >> >         =E2=94=9C=E2=94=80=E2=94=80 ...
> >> >         =E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c
> >>
> >> Hm.. I'm not sure about having nand_bbt.c in drivers/mtd.
> >> What's wrong with drivers/mtd/nand ?
> >
> > I haven't reviewed the series yet, but I agree. If the BBT code is only
> > meant to be used on NAND based devices, it should probably stay in
> > drivers/mtd/nand.
> >
> >>
> >> In fact, I  was thinking we could go further and clean up the director=
ies a bit
> >> by separating core code, from controllers code, from SPI NAND code:
> >>
> >> drivers/mtd/nand/
> >> drivers/mtd/nand/controllers
> >> drivers/mtd/nand/spi
> >>
> >> Makes any sense?
> >
> > Actually I had the secret plan of moving all (raw) NAND controller
> > drivers into the drivers/mtd/nand/controllers directory, though this
> > was for a different reason: I'd like to create another directory for
> > manufacturer specific code in order to support some advanced features
> > on NANDs that do not implement (or only partially implement) the ONFI
> > standard.
> >
> > The separation you're talking about here is more related to the
> > interface used to communicate with the NAND chip.
> >
> > How about using the following hierarchy?
> >
> > drivers/mtd/nand/<nand-core-code>
> > drivers/mtd/nand/interfaces/raw/<raw-nand-core-code>
> > drivers/mtd/nand/interfaces/raw/controllers/<raw-nand-controller-driver=
s>
> > drivers/mtd/nand/interfaces/spi/<spi-nand-code>
> > drivers/mtd/nand/interfaces/onenand/<onenand-code>
> > drivers/mtd/nand/chips/<manufacturer-spcific-code>
> >
> > What do you think?
> >
>=20
> I believe we are bikeshedding here, but what the heck.
>=20
> That seems too involved. A simpler hierarchy could be clear enough,
> and seems to follow what other subsystems do:
>=20
> drivers/mtd/nand/<all-nand-core-code>
> drivers/mtd/nand/raw/<raw-nand-controller-drivers>

And probably some common logic in there too.

> drivers/mtd/nand/spi/<spi-nand-code>
> drivers/mtd/nand/onenand/<onenand-code>
> drivers/mtd/nand/chips/<manufacturer-spcific-code>
>=20

I'm fine with this one too ;-).

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
