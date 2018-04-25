Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBLAt-000526-Kr
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 14:13:37 +0000
Date: Wed, 25 Apr 2018 16:13:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Nadav Haklai
 <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH 0/3] Changes in Marvell NAND controller DT parsing code
Message-ID: <20180425161313.49fabd6d@xps13>
In-Reply-To: <20180425152007.0bc6d3c9@bbrezillon>
References: <20180425125331.8234-1-miquel.raynal@bootlin.com>
 <20180425152007.0bc6d3c9@bbrezillon>
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

On Wed, 25 Apr 2018 15:20:07 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Hi Miquel,
>=20
> On Wed, 25 Apr 2018 14:53:28 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hello,
> >=20
> > At first I just wanted to send a fix to avoid timeouts at boot time when
> > using old bindings (harmless):
> >=20
> > [    1.367460] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x0000=
0080)
> > [    1.474292] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x0000=
0280)
> >=20
> > This is addressed in the first patch and comes from the DT parsing of
> > the number of Chip Select lines.
> >=20
> > While working on it, Boris pointed another issue with the 'num-cs'
> > property (legacy bindings) in some code that should not exist anyway. I
> > removed that code in patch 2.
> >=20
> > Finally, while writing the second patch, I discovered a better way to h=
andle
> > the code besides (that handles the CS count for new bindings) by using
> > of_property_count_elems_of_size(). Patch 3 makes the switch.
> >=20
> > Regards,
> > Miqu=C3=A8l
> >=20
> >=20
> > Miquel Raynal (3):
> >   mtd: rawnand: marvell: fix the chip-select DT parsing logic
> >   mtd: rawnand: marvell: fix CS pin count with old bindings
> >   mtd: rawnand: marvell: use OF helper to read a property element count=
 =20
>=20
> I usually ask people to properly split their changes, but this time I'd
> prefer to have everything in a single patch so that I can queue it to
> the fixes branch.

That's sad :) but sure, I'll squash all of that.

Thanks,
Miqu=C3=A8l

>=20
> Regards,
>=20
> Boris
>=20



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
