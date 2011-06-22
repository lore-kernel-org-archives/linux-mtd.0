Received: from smail2.alcatel.fr ([64.208.49.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZKuB-0005b6-TU
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 10:43:32 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Wed, 22 Jun 2011 12:41:10 +0200
Subject: RE: [PATCH upstream] nand: nand_base: Always initialise oob_poi
	before writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DD8D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308722112.18119.36.camel@sauron>
In-Reply-To: <1308722112.18119.36.camel@sauron>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Wrote:

>
> Added the -stable CC here and pushed to l2-mtd-2.6.git with
> some modifications.
>

This is probably my fault, but the mail previous to this had the
version which contained the stable line. That patch version (v3)did
not remove the final memset from nand_do_write_oob, as you requested.
Named both patches the same as they were pretty much indentical,
except for the memset. Didn't know the convention for patch naming
where one was going to stable, and the other to the latest so
marked the latest as upstream to differentiate.

> >   * nand_fill_oob - [Internal] Transfer client buffer to oob
> >   * @chip:  nand chip structure
> > + * @mtd:   MTD device structure
> >   * @oob:   oob data buffer
> >   * @len:   oob data write length
> >   * @ops:   oob ops structure
> >   */
> > -static uint8_t *nand_fill_oob(struct nand_chip *chip,
> uint8_t *oob, size_t len,
> > -                                           struct mtd_oob_ops *ops)
> > +static uint8_t *nand_fill_oob(struct nand_chip *chip,
> struct mtd_info *mtd,
> > +                         uint8_t *oob, size_t len, struct
> mtd_oob_ops *ops)
> >  {
>
> Since we can get chip from mtd->prive, it is not necessary to
> pass both chip and mtd to this function, it is enough to only
> pass mtd.

Fair enough. Didn't spot that. :)

>
> I've done this modification, the resulting patch is here:
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/
6a146696fdcf383d90753145dfb367e499790940
>
> Would you please take a look and even better - give it a try?
>

Yep, no problem. Will run it up on target an check all still works.

> Thanks!
>
> --
> Best Regards,
> Artem Bityutskiy
>
>=20

Thanks

Adam
