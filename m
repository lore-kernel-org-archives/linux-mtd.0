Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYoCm-0005RD-RL
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 07:20:27 +0000
Date: Tue, 9 Jan 2018 08:19:53 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v4 3/3] mtd: Remove duplicate checks on mtd_oob_ops
 parameter
Message-ID: <20180109081953.01b204ea@xps13>
In-Reply-To: <20180108233010.5d7e7c3f@bbrezillon>
References: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
 <20180108211542.11891-4-boris.brezillon@free-electrons.com>
 <20180108230455.10c0cb83@xps13>
 <20180108233010.5d7e7c3f@bbrezillon>
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

Hello Boris,

On Mon, 8 Jan 2018 23:30:10 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Mon, 8 Jan 2018 23:04:55 +0100
> Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:
>=20
> > Hello Boris,
> >=20
> > On Mon,  8 Jan 2018 22:15:42 +0100
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  =20
> > > Some of the check done in custom ->_read/write_oob()
> > > implementation are already done by the core (in
> > > mtd_check_oob_ops()).   =20
> >=20
> > Not sure this is relevant here as your series introduces changes for
> > the SPI NAND framework, but there are other places where these
> > checks are, IMHO, also redundant and could be removed. The "past
> > end" string when grepped in the MTD folder core returns a few more
> > hits.
> >=20
> > In the NAND core:
> >   - nand_do_read_oob()
> >   - nand_read_oob()
> >   - nand_do_write_oob()
> >   - nand_write_oob() =20
>=20
> That's true for nand_read/write_oob(). The one in nand_do_write_oob()
> is still needed because mtd_check_oob_ops() allows OOB writes
> crossing a page boundary. Finally, I don't see any boundary checks in
> nand_do_read_oob().

I forgot that crossing page boundaries was not a use case of
mtd_check_oob_ops(), thanks for pointing it. However in
nand_do_read/write_oob(), the comment and the code really state the
checked boundary is the end of the device. So are you sure these two
checks are needed?

[1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/na=
nd_base.c#L2226
[2]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/na=
nd_base.c#L2886

>=20
> > Maybe also in onenand_base.c, but I am less confident for this one:
> >   - onenand_bbt_read_oob() =20
>=20
> Unfortunately no, this function is directly called from onenand_bbt.c,
> which means the MTD layer layer is completely bypassed. I also found
> boundary checks in onenand_mlc_read_ops_nolock(), but again, this
> function is called from do_otp_read() which is not going through
> mtd_check_oob_ops().
>=20
> >=20
> > What do you think? =20
>=20
> I'll remove the extra checks in nand_read/write_oob(). For the other
> ones, one solution would be to expose mtd_check_oob_ops(), but I'll
> keep that for later.

Ok.

Thanks,
Miqu=C3=A8l
