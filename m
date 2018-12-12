Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX1uj-0002wH-Ex
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 10:38:52 +0000
Date: Wed, 12 Dec 2018 11:38:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Boris
 Brezillon <boris.brezillon@bootlin.com>
Subject: Re: Raw NAND bad block marker positions
Message-ID: <20181212113827.4e371302@xps13>
In-Reply-To: <e937e18d-5099-5969-3b17-1f2d9ffa3a44@kontron.de>
References: <e937e18d-5099-5969-3b17-1f2d9ffa3a44@kontron.de>
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

Hi Frieder,

Schrempf Frieder <frieder.schrempf@kontron.de> wrote on Wed, 12 Dec
2018 10:32:04 +0000:

> Hi,
>=20
> the current implementation for checking/setting the bad block markers in=
=20
> raw NAND flash devices supports three setups for the position of the=20
> markers within the bad block:
>=20
> * BBM in first page only
> * BBM in last page only
> * BBM in first or second page
>=20
> This is controlled by the flags NAND_BBT_SCANLASTPAGE and=20
> NAND_BBT_SCAN2NDPAGE. It is not supported to set both flags to check=20
> first, second and last page.
>=20
> Though some devices seem to require this kind of setup. We know of some=20
> ESMT SLC NANDs, that were accidentally shipped with BBM in the first or=20
> last page, instead of first or second page as claimed in the datasheet.
>=20
> Also the documents for Cypress/Spansion/AMD NANDs claim that the=20
> software needs to check first, second and last page for BBMs (e.g. [1]).
>=20
> It doesn't look like it would be difficult to make NAND_BBT_SCANLASTPAGE=
=20
> and NAND_BBT_SCAN2NDPAGE work together, but I wanted to ask if someone=20
> already stumbled upon this problem or if someone has any comments or=20
> suggestions, before trying to patch this?

I don't, but I would welcome such change, I don't think it is very
invasive anyway.


Thanks,
Miqu=C3=A8l
