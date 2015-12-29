Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDqh3-0000WX-Sr
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 09:35:50 +0000
Date: Tue, 29 Dec 2015 10:35:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Peter Pan <peterpansjtu@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 fransklaver@gmail.com, Peter Pan <peterpandong@micron.com>,
 beanhuo@micron.com, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, karlzhang@micron.com
Subject: Re: [PATCH v2 00/12] mtd: nand_bbt: introduce independent nand BBT
Message-ID: <20151229103519.31ccaf5c@bbrezillon>
In-Reply-To: <CAAEAJfC4YWVC=WWTBnKrnNZypC+CKR+D59+LY7j-haTch4yevA@mail.gmail.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <CAAEAJfC4YWVC=WWTBnKrnNZypC+CKR+D59+LY7j-haTch4yevA@mail.gmail.com>
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

Hi,

On Mon, 28 Dec 2015 17:42:50 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> This is looking a lot better, thanks for the good work!
>=20
> On 15 December 2015 at 02:59, Peter Pan <peterpansjtu@gmail.com> wrote:
> > Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> > NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> > onenand has own bbt(onenand_bbt.c).
> >
> > Separate struct nand_chip from BBT code can make current BBT shareable.
> > We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> > Struct nand_bbt contains all the information BBT needed from outside and
> > it should be embedded into NAND family chip struct (such as struct nand=
_chip).
> > NAND family driver should allocate, initialize and free struct nand_bbt.
> >
> > Below is mtd folder structure we want:
> >         mtd
> >         =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> >         =E2=94=9C=E2=94=80=E2=94=80 Makefile
> >         =E2=94=9C=E2=94=80=E2=94=80 ...
> >         =E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c
>=20
> Hm.. I'm not sure about having nand_bbt.c in drivers/mtd.
> What's wrong with drivers/mtd/nand ?

I haven't reviewed the series yet, but I agree. If the BBT code is only
meant to be used on NAND based devices, it should probably stay in
drivers/mtd/nand.

>=20
> In fact, I  was thinking we could go further and clean up the directories=
 a bit
> by separating core code, from controllers code, from SPI NAND code:
>=20
> drivers/mtd/nand/
> drivers/mtd/nand/controllers
> drivers/mtd/nand/spi
>=20
> Makes any sense?

Actually I had the secret plan of moving all (raw) NAND controller
drivers into the drivers/mtd/nand/controllers directory, though this
was for a different reason: I'd like to create another directory for
manufacturer specific code in order to support some advanced features
on NANDs that do not implement (or only partially implement) the ONFI
standard.

The separation you're talking about here is more related to the
interface used to communicate with the NAND chip.

How about using the following hierarchy?

drivers/mtd/nand/<nand-core-code>
drivers/mtd/nand/interfaces/raw/<raw-nand-core-code>
drivers/mtd/nand/interfaces/raw/controllers/<raw-nand-controller-drivers>
drivers/mtd/nand/interfaces/spi/<spi-nand-code>
drivers/mtd/nand/interfaces/onenand/<onenand-code>
drivers/mtd/nand/chips/<manufacturer-spcific-code>

What do you think?

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
