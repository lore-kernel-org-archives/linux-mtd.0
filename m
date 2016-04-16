Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arLL1-0004NV-EA
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 08:12:19 +0000
Date: Sat, 16 Apr 2016 10:11:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 10/12] mtd: nand: read ECC algorithm from the new field
Message-ID: <20160416101157.19a31ba6@bbrezillon>
In-Reply-To: <20160416095807.112d2f59@bbrezillon>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-11-git-send-email-zajec5@gmail.com>
 <20160416095807.112d2f59@bbrezillon>
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

On Sat, 16 Apr 2016 09:58:07 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Fri, 15 Apr 2016 21:54:10 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>=20
> > Now we have all drivers properly setting this new field we can start
> > using it and proceed with deprecating NAND_ECC_SOFT_BCH.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 98 ++++++++++++++++++++++++------------=
--------
> >  1 file changed, 53 insertions(+), 45 deletions(-)
> >=20

[...]

> > @@ -4248,51 +4248,59 @@ int nand_scan_tail(struct mtd_info *mtd)
> >  		ecc->algo =3D NAND_ECC_HAMMING;
> > =20
> >  	case NAND_ECC_SOFT:
> > -		ecc->calculate =3D nand_calculate_ecc;
> > -		ecc->correct =3D nand_correct_data;
> > -		ecc->read_page =3D nand_read_page_swecc;
> > -		ecc->read_subpage =3D nand_read_subpage;
> > -		ecc->write_page =3D nand_write_page_swecc;
> > -		ecc->read_page_raw =3D nand_read_page_raw;
> > -		ecc->write_page_raw =3D nand_write_page_raw;
> > -		ecc->read_oob =3D nand_read_oob_std;
> > -		ecc->write_oob =3D nand_write_oob_std;
> > -		if (!ecc->size)
> > -			ecc->size =3D 256;
> > -		ecc->bytes =3D 3;
> > -		ecc->strength =3D 1;
> > -		break;
> > -
> >  	case NAND_ECC_SOFT_BCH:
>=20
> Shouldn't we drop this case?

Nevermind, I see you're dropping it in the last patch.


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
