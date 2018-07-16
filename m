Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff0ih-0007t4-99
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 10:27:09 +0000
Date: Mon, 16 Jul 2018 12:26:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] Documentation: mtd: remove stale pxa3xx NAND
 controller documentation
Message-ID: <20180716122643.0049fa4c@xps13>
In-Reply-To: <20180714224612.1477269b@windsurf>
References: <20180714135428.26955-1-miquel.raynal@bootlin.com>
 <20180714135428.26955-2-miquel.raynal@bootlin.com>
 <20180714224612.1477269b@windsurf>
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

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Sat, 14 Jul
2018 22:46:12 +0200:

> Hello,
>=20
> On Sat, 14 Jul 2018 15:54:28 +0200, Miquel Raynal wrote:
> > It is preferred to have the documentation about the drivers directly
> > embedded in the driver itself. Remove this file now that the most
> > important information from this file have been re-written in
> > marvell_nand.c.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> I agree with moving the documentation to the driver itself, but the
> documentation you've added in PATCH 1/2 into the driver is much, much
> more limited than the documentation present in this file.

I think you are right on the fact that showing how data/spare/ecc bytes
might be exposed by the controller is something useful.

I will add the example given in the doc.

Thanks,
Miqu=C3=A8l
