Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOQwN-0007g4-SB
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 17:33:01 +0000
Date: Sun, 18 Nov 2018 18:32:48 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Julien Su <juliensu@mxic.com.tw>, Mark Brown
 <broonie@kernel.org>, Mason Yang <masonccyang@mxic.com.tw>,
 linux-spi@vger.kernel.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH RFC 05/18] spi: spi-mem: mxic: Add support for DTR and
 Octo mode
Message-ID: <20181118183248.5ef63c04@bbrezillon>
In-Reply-To: <20181118182111.3c199434@xps13>
References: <20181012084825.23697-1-boris.brezillon@bootlin.com>
 <20181012084825.23697-6-boris.brezillon@bootlin.com>
 <20181118182111.3c199434@xps13>
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

On Sun, 18 Nov 2018 18:21:11 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 12 Oct 2018
> 10:48:12 +0200:
>=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/spi/spi-mxic.c | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > index ce59ea2ecfe2..70e6bc9a099e 100644
> > --- a/drivers/spi/spi-mxic.c
> > +++ b/drivers/spi/spi-mxic.c
> > @@ -281,10 +281,11 @@ static int mxic_spi_data_xfer(struct mxic_spi *mx=
ic, const void *txbuf,
> >  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
> >  				     const struct spi_mem_op *op)
> >  {
> > -	if (op->data.buswidth > 4 || op->addr.buswidth > 4 ||
> > -	    op->dummy.buswidth > 4 || op->cmd.buswidth > 4)
> > +	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
> > +	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
> >  		return false;
> > =20
> > + =20
>=20
> Extra space here
>=20
> >  	if (op->data.nbytes && op->dummy.nbytes &&
> >  	    op->data.buswidth !=3D op->dummy.buswidth)
> >  		return false;
> > @@ -302,6 +303,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> >  	int nio =3D 1, i, ret;
> >  	u32 ss_ctrl;
> >  	u8 addr[8];
> > +	u8 cmd[2];
> > =20
> >  	ret =3D mxic_spi_clk_setup(mem->spi);
> >  	if (ret)
> > @@ -311,6 +313,8 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> >  	if (ret)
> >  		return ret;
> > =20
> > +	if (mem->spi->mode & (SPI_RX_OCTO | SPI_TX_OCTO))
> > +		nio =3D 8;
> >  	if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
> >  		nio =3D 4;
> >  	else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
> > @@ -323,17 +327,21 @@ static int mxic_spi_mem_exec_op(struct spi_mem *m=
em,
> >  	       mxic->regs + HC_CFG);
> >  	writel(HC_EN_BIT, mxic->regs + HC_EN);
> > =20
> > -	ss_ctrl =3D OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
> > +	ss_ctrl =3D OP_CMD_BYTES(op->cmd.nbytes) |
> > +		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
> > +		  (op->cmd.dtr ? OP_CMD_DDR : 0);
> > =20
> >  	if (op->addr.nbytes)
> >  		ss_ctrl |=3D OP_ADDR_BYTES(op->addr.nbytes) |
> > -			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
> > +			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1) |
> > +			   (op->addr.dtr ? OP_ADDR_DDR : 0);
> > =20
> >  	if (op->dummy.nbytes)
> >  		ss_ctrl |=3D OP_DUMMY_CYC(op->dummy.nbytes);
> > =20
> >  	if (op->data.nbytes) {
> > -		ss_ctrl |=3D OP_DATA_BUSW(fls(op->data.buswidth) - 1);
> > +		ss_ctrl |=3D OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
> > +			   (op->data.dtr ? OP_DATA_DDR : 0);
> >  		if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> >  			ss_ctrl |=3D OP_READ;
> >  	}
> > @@ -343,7 +351,14 @@ static int mxic_spi_mem_exec_op(struct spi_mem *me=
m,
> >  	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
> >  	       mxic->regs + HC_CFG);
> > =20
> > -	ret =3D mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
> > +	if (op->cmd.nbytes =3D=3D 2) {
> > +		cmd[0] =3D op->cmd.opcode >> 8;
> > +		cmd[1] =3D op->cmd.opcode;
> > +	} else {
> > +		cmd[0] =3D op->cmd.opcode;
> > +	} =20
>=20
> I haven't played with this code yet and maybe I'll regret this but
> wouldn't be easier for developers to have this in patch 4:
>=20
>  struct spi_mem_op {
>  	struct {
> +		u8 nbytes;
>  		u8 buswidth;
>  		bool dtr;
> -		u8 opcode;
> +		u8 opcode[2]; /* <- an array of opcodes instead of an u16? */

Just wanted to stay consistent with what we have for the address
cycles, but maybe I should clarify how the opcode should be
transmitted on the wire (MSB first).

>  	} cmd;
>=20
> This way I think we would avoid endianness considerations and reading
> would be eased.
>=20
> > +
> > +	ret =3D mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
> >  	if (ret)
> >  		goto out;
> >   =20
>=20
>=20
> Thanks,
> Miqu=C3=A8l
