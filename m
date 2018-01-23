Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1edvl0-00048V-9V
 for linux-mtd@lists.infradead.org; Tue, 23 Jan 2018 10:24:48 +0000
Date: Tue, 23 Jan 2018 11:24:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH] mtd: Make sure the device supports erase operations in
 mtd_erase()
Message-ID: <20180123112424.36e5e426@bbrezillon>
In-Reply-To: <20180123090046.503b1129@xps13>
References: <20180122093801.19618-1-boris.brezillon@free-electrons.com>
 <20180123090046.503b1129@xps13>
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

On Tue, 23 Jan 2018 09:00:46 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Hello Boris,
>=20
> On Mon, 22 Jan 2018 10:38:01 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>=20
> > Some devices do not implement ->_erase() or have an invalid ->erasesize
> > value. In this case, mtd_erase() should return -ENOTSUPP.
> >=20
> > Note that the test is not done on the MTD_NO_ERASE flag because this
> > flag means 'erasing a block before writing to it is unnecessary',
> > not 'the erase operation is not supported'. Actually, some drivers are
> > setting the MTD_NO_ERASE flag but still implementing the ->_erase()
> > hook and setting a valid ->erasesize value.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/mtdcore.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index d7ab091b36b2..f24144cbc99c 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -971,10 +971,14 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
> >   */
> >  int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
> >  {
> > +	if (!mtd->erasesize || !mtd->_erase)
> > +		return -ENOTSUPP;
> > +
> >  	if (instr->addr >=3D mtd->size || instr->len > mtd->size - instr->add=
r)
> >  		return -EINVAL;
> >  	if (!(mtd->flags & MTD_WRITEABLE))
> >  		return -EROFS; =20
>=20
> This remark is not inherent to this patch in particular but as we are
> adding a new error path, I thought it might be interesting to also
> patch:
> - INFTL_formatblock() from inftlmount.c [1] (mtd_erase called twice)
> - NFTL_formatblock() from nftlmount.c [2]
>=20
> They both call mtd_erase() without checking the return code and then
> error out only if instr->state =3D=3D MTD_ERASE_FAILED, which has not been
> set before quitting mtd_erase() in the conditions above. I guess the
> right thing to do is to add another condition in both functions on the
> return code of mtd_erase(). What do you think?

This sounds reasonable.

>=20
> Otherwise:
> Reviewed-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Thanks.

Boris

>=20
> Have a good day,
> Miqu=C3=A8l
>=20
> [1]
> http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/inftlmou=
nt.c#L396
> [2]
> http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nftlmoun=
t.c#L334
