Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCSho-00080I-Cv
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 15:55:58 +0000
Date: Wed, 8 Nov 2017 16:55:23 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: fix interpretation of NAND_CMD_NONE in core
 ->cmdfunc()
Message-ID: <20171108165523.48b02be4@xps13>
In-Reply-To: <20171108111536.7266af29@bbrezillon>
References: <20171106220704.2340-1-miquel.raynal@free-electrons.com>
 <20171108111536.7266af29@bbrezillon>
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

> How about rewording it like that:
>=20
> "
> Some drivers (like nand_hynix.c) call ->cmdfunc() with NAND_CMD_NONE
> and a column address and expect the controller to only send address
> cycles. Right now, the default ->cmdfunc() implementations provided by
> the core do not filter out the command cycle in this case and forwards
> the request to the controller driver through the ->cmd_ctrl() method.
> The thing is, NAND controller drivers can get is wrong and send a
> command cycle with a NAND_CMD_NONE opcode and since NAND_CMD_NONE is
> -1, and the command field is usually casted to an u8, we end up
> sending the 0xFF command which is actually a RESET operation.
>=20
>=20
> Add conditions in nand_command[_lp]() functions to sending the initial
> command cycle when command =3D=3D NAND_CMD_NONE.
> "

This is better explained. I put yours, with
s/drivers can get is wrong/drivers can get this wrong/

>=20
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c
> > b/drivers/mtd/nand/nand_base.c index c63e4a88a653..851f25383622
> > 100644 --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -710,7 +710,8 @@ static void nand_command(struct mtd_info *mtd,
> > unsigned int command, chip->cmd_ctrl(mtd, readcmd, ctrl);
> >  		ctrl &=3D ~NAND_CTRL_CHANGE;
> >  	}
> > -	chip->cmd_ctrl(mtd, command, ctrl);
> > +	if (command !=3D NAND_CMD_NONE)
> > +		chip->cmd_ctrl(mtd, command, ctrl);
> > =20
> >  	/* Address cycle, when necessary */
> >  	ctrl =3D NAND_CTRL_ALE | NAND_CTRL_CHANGE; =20
>=20
> You should probably also add a new case in the switch-case block to
> bail-out when command =3D=3D NAND_CMD_NONE.

Oh that is right, there is nothing to wait for in that case.

Thank you,
Miqu=C3=A8l
