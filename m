Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRZfI-0004vs-4E
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 09:28:23 +0000
Date: Tue, 27 Nov 2018 10:27:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Message-ID: <20181127102757.6adc5649@xps13>
In-Reply-To: <9365718c-4993-7e3b-1519-8fef0c08c0db@kontron.de>
References: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
 <20181127092232.3a6d1661@bbrezillon>
 <9365718c-4993-7e3b-1519-8fef0c08c0db@kontron.de>
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

Hello,

Schrempf Frieder <frieder.schrempf@kontron.de> wrote on Tue, 27 Nov
2018 08:30:24 +0000:

> On 27.11.18 09:22, Boris Brezillon wrote:
> > On Tue, 27 Nov 2018 07:44:52 +0000
> > Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> >  =20
> >> Fix the size of the buffer allocated to store the in-memory BBT.
> >> This bug was previously hidden by a different bug, that was fixed in
> >> d098093ba06e. =20
> >=20
> > Oops :-/.
> >  =20
> >>
> >> Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with =
NAND devices")
> >> Cc: <stable@vger.kernel.org>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>   drivers/mtd/nand/bbt.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
> >> index 56cde38..c12497f 100644
> >> --- a/drivers/mtd/nand/bbt.c
> >> +++ b/drivers/mtd/nand/bbt.c
> >> @@ -27,7 +27,8 @@ int nanddev_bbt_init(struct nand_device *nand)
> >>   	unsigned int nwords =3D DIV_ROUND_UP(nblocks * bits_per_block,
> >>   					   BITS_PER_LONG);
> >>  =20
> >> -	nand->bbt.cache =3D kzalloc(nwords, GFP_KERNEL);
> >> +	nand->bbt.cache =3D kzalloc(nwords * (BITS_PER_LONG / BITS_PER_BYTE)=
, =20
> >=20
> > I prefer
> >=20
> > 					 * sizeof(*nand->bbt.cache)
> > If you're okay with this change, I'll fix it when applying (no need to
> > send a new version). =20
>=20
> Sure, that's ok.

I also prefer with the sizeof() operator. Thanks for fixing this!

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
