Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecRHT-00036X-N5
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 07:40:09 +0000
Date: Fri, 19 Jan 2018 08:39:52 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: walter harms <wharms@bfs.de>
Cc: kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH][next] mtd: nand: fix spelling mistake: "suceed"->
 "succeed"
Message-ID: <20180119083952.23c4baeb@xps13>
In-Reply-To: <5A5DDCA0.1000908@bfs.de>
References: <20180116102808.23232-1-colin.king@canonical.com>
 <5A5DDCA0.1000908@bfs.de>
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

Can you please change the prefix, it should be:

mtd: nand: marvell:

On Tue, 16 Jan
2018 12:06:08 +0100 walter harms <wharms@bfs.de> wrote:

> Am 16.01.2018 11:28, schrieb Colin King:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > Trivial fix to spelling mistakes in dev_err error message text.
> >=20
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/mtd/nand/marvell_nand.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/marvell_nand.c
> > b/drivers/mtd/nand/marvell_nand.c index b8fec6093b75..4bd53b360277
> > 100644 --- a/drivers/mtd/nand/marvell_nand.c
> > +++ b/drivers/mtd/nand/marvell_nand.c
> > @@ -517,7 +517,7 @@ static int marvell_nfc_prepare_cmd(struct
> > nand_chip *chip) /* Poll ND_RUN and clear NDSR before issuing any
> > command */ ret =3D marvell_nfc_wait_ndrun(chip);
> >  	if (ret) {
> > -		dev_err(nfc->dev, "Last operation did not
> > suceed\n");
> > +		dev_err(nfc->dev, "Last operation did not
> > succeed\n"); return ret;
> >  	}
> >   =20
>=20
> not succeed =3D=3D Failed ??

I personally do not have a preference, as long as there is a clear
error message in this case.

> someone who is debugging may also interessted to know what operation
> failed.

It is not as easy to do, but starting from enabling dynamic debug in
both the driver and the NAND core should give you enough traces to
locate the issue.

Thanks,
Miqu=C3=A8l
