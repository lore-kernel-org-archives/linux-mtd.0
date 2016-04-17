Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arq1U-00031V-LK
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 16:58:13 +0000
Date: Sun, 17 Apr 2016 18:57:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/12] mtd: nand: read ECC algorithm from the new field
Message-ID: <20160417185739.4c7411a0@bbrezillon>
In-Reply-To: <20160417185005.2c293b36@bbrezillon>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-11-git-send-email-zajec5@gmail.com>
 <20160416095807.112d2f59@bbrezillon>
 <CACna6rwsieP8q4U-NheMrDLhVM11K6cBOXbd6PDWNREikv5kTA@mail.gmail.com>
 <20160417185005.2c293b36@bbrezillon>
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

On Sun, 17 Apr 2016 18:50:05 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Sun, 17 Apr 2016 18:27:40 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>=20
> > On 16 April 2016 at 09:58, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote:
> > > On Fri, 15 Apr 2016 21:54:10 +0200
> > > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> > >
> > >> Now we have all drivers properly setting this new field we can start
> > >> using it and proceed with deprecating NAND_ECC_SOFT_BCH.
> > >>
> > >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > >> ---
> > >>  drivers/mtd/nand/nand_base.c | 98 ++++++++++++++++++++++++---------=
-----------
> > >>  1 file changed, 53 insertions(+), 45 deletions(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_ba=
se.c
> > >> index e1f3cf8..ffd1b32 100644
> > >> --- a/drivers/mtd/nand/nand_base.c
> > >> +++ b/drivers/mtd/nand/nand_base.c
> > >> @@ -4154,7 +4154,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> > >>       /*
> > >>        * If no default placement scheme is given, select an appropri=
ate one.
> > >>        */
> > >> -     if (!mtd->ooblayout && (ecc->mode !=3D NAND_ECC_SOFT_BCH)) {
> > >> +     if (!mtd->ooblayout && ecc->algo !=3D NAND_ECC_BCH) {
> > >
> > > Should be:
> > >
> > >         if (!mtd->ooblayout && ecc->algo =3D=3D NAND_ECC_SOFT &&
> > >             ecc->algo !=3D NAND_ECC_BCH) {
> > >
> > > Otherwise you're also taking the NAND_ECC_HW + NAND_ECC_BCH into
> > > account.
> >=20
> > Pretty much yes, but without
> > [PATCH 11/12] of: mtd: drop support for NAND_ECC_SOFT_BCH as "soft_bch"=
 mapping
> > we may be getting NAND_ECC_SOFT as well as NAND_ECC_SOFT_BCH. And
> > 11/12 can't be applied before 10/12. We'll need to support both values
> > for this very short moment (after 10/12 but before 11/12).
>=20
>=20
> Why can't you move patch 11 before patch 10. The DT parsing code has
> already been patched to set both ecc->algo to NAND_ECC_BCH and
> ecc->mode to NAND_ECC_SOFT, so, to it seems perfectly safe to reorder
> those changes to me (and change the test as suggested).
>=20
> Am I missing something?
>=20

Forget what I just said. How about merging those 2 patches into a
single one?

BTW, I did not complain so far, but you're trying to split every
single change into it's own patch, and I don't think it's required for
such simple change as assigning ecc->algo to NAND_ECC_BCH wherever
ecc->algo is set to NAND_ECC_SOFT_BCH (even if the patch touches
different drivers).
And the problem we're facing here is partly caused by this attempt to
split every change in its own patch.

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
