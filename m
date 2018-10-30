Date: Tue, 30 Oct 2018 10:49:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-clk@vger.kernel.org
Subject: Re: Clock configuration for the SAMA5D2 NAND controller
Message-ID: <20181030104903.518f1fdd@xps13>
In-Reply-To: <CAGkQfmMphvck9rraYq+o8zA254q7ETYyniiUV-QBsUR9X+OFKQ@mail.gmail.com>
References: <CAGkQfmNuROsD29jR_7opiXcfPB6=FuaoxaK-hF5Ezz7r-1pBZA@mail.gmail.com>
 <CAGkQfmMphvck9rraYq+o8zA254q7ETYyniiUV-QBsUR9X+OFKQ@mail.gmail.com>
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

Hi Romain,

Romain Izard <romain.izard.pro@gmail.com> wrote on Wed, 17 Oct 2018
12:42:28 +0200:

> +linux-mtd, linux-clk
>=20
> Le mer. 10 oct. 2018 =C3=A0 19:05, Romain Izard
> <romain.izard.pro@gmail.com> a =C3=A9crit :
> >
> > Hello,
> >
> > While evaluating a new flash memory chip for my product based on a SAMA=
5D2
> > chip, I tried to update my software to use the latest device tree bindi=
ngs.
> >
> > Until now, I was using the legacy bindings for the NAND controller, that
> > preserved the timings configured by the bootloader in the EBI registers=
. The
> > bindings introduced in Linux 4.13 are used together with the NAND drive=
r to
> > reconfigure the timings of the memory interface to match the speed prof=
ile
> > declared by some NAND components.
> >
> > However, when comparing the timings in the registers, there was a large
> > difference between what I calculated by hand in the past and the values
> > configured by the drivers. The difference was in fact a 2 factor.
> >
> > For me, the issue is due to the clock configuration declared in the SAM=
A5D2
> > device tree: The reference clock used by the nand-controller driver is =
the
> > clock for its parent node, which is directly the Master Clock. And on my
> > end, what I understood when writing the clock settings for my bootloade=
r was
> > that the reference clock was the HSMC clock, which derives from the H32=
MX
> > clock, which runs at half the rate of the Master Clock.
> >
> > The documentation for the SAMA5D2 is not very precise on this topic, so=
 I
> > would like to have some feedback. Is the clock used as a reference for =
the
> > chip select configuration registers the Master Clock itself, or is it t=
he
> > peripheral clock for the HSMC module ?
> >

FYI I had the same issue on the Marvell NAND controller: the actual
frequency of the controller clock was half of the "parent" clock
retrieved by clk_get_rate(), hence I needed to double the clock period
for the timings derivation in ->setup_data_interface().

If you can't get more feedback from SAMA5 people and if this works for
you, please send a patch with a nice comment.


Thanks,
Miqu=C3=A8l
