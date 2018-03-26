Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0RoI-0001kj-6g
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2018 13:05:19 +0000
Date: Mon, 26 Mar 2018 15:04:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Maxime Ripard
 <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring
 <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
 Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROME mode
Message-ID: <20180326150451.0d398bdd@xps13>
In-Reply-To: <20180321105327.27a28987@bbrezillon>
References: <20180321083618.18355-1-boris.brezillon@bootlin.com>
 <20180321105327.27a28987@bbrezillon>
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

Hi Boris,

On Wed, 21 Mar 2018 10:53:27 +0100, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Wed, 21 Mar 2018 09:36:18 +0100
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>=20
> > This mode is not used by any existing setup and should not be used
> > because it overrides the BBMs. Let's just remove it before someone =20
>=20
> 	     ^ 'overwrites' not 'overrides'
>=20
> > starts using it.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  .../devicetree/bindings/mtd/sunxi-nand.txt         |   4 +-
> >  drivers/mtd/nand/raw/sunxi_nand.c                  | 155 +++----------=
--------
> >  2 files changed, 22 insertions(+), 137 deletions(-)

Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
