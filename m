Date: Mon, 10 Dec 2018 11:19:09 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] spi: spi-mem: Add driver for NXP FlexSPI controller
Message-ID: <20181210111909.35384eee@bbrezillon>
In-Reply-To: <VI1PR04MB57267D9F69719B4BEF38BF8699A50@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <1542366701-16065-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1542366701-16065-2-git-send-email-yogeshnarayan.gaur@nxp.com>
 <eb8a31d8-2ba6-f27c-addf-545c77921b77@kontron.de>
 <VI1PR04MB57267D9F69719B4BEF38BF8699A50@VI1PR04MB5726.eurprd04.prod.outlook.com>
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

On Mon, 10 Dec 2018 09:41:51 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> > > +/* Instead of busy looping invoke readl_poll_timeout functionality.
> > > +*/ static int fspi_readl_poll_tout(struct nxp_fspi *f, void __iomem =
*base,
> > > +				u32 mask, u32 delay_us,
> > > +				u32 timeout_us, bool condition)
> > > +{
> > > +	u32 reg;
> > > +
> > > +	if (!f->devtype_data->little_endian)
> > > +		mask =3D (u32)cpu_to_be32(mask);
> > > +
> > > +	if (condition)
> > > +		return readl_poll_timeout(base, reg, (reg & mask),
> > > +					  delay_us, timeout_us);
> > > +	else
> > > +		return readl_poll_timeout(base, reg, !(reg & mask),
> > > +					  delay_us, timeout_us); =20
> >=20
> > I would rather use a local variable to store the condition:
> >=20
> > bool c =3D condition ? (reg & mask):!(reg & mask);
> >  =20
> With these type of usage getting below warning messages.
> =20
> drivers/spi/spi-nxp-fspi.c: In function =E2=80=98fspi_readl_poll_tout.isr=
a.10.constprop=E2=80=99:
> drivers/spi/spi-nxp-fspi.c:446:21: warning: =E2=80=98reg=E2=80=99 may be =
used uninitialized in this function [-Wmaybe-uninitialized]
>   bool cn =3D c ? (reg & mask) : !(reg & mask);
>=20
> If assign value to reg =3D 0xffffffff then timeout is start getting hit f=
or False case and if assign value 0 then start getting timeout hit for true=
 case.
>=20
> I would rather not try to modify this function.

I agree. Let's keep this function readable even if this implies
duplicating a few lines of code.

>=20
> > return readl_poll_timeout(base, reg, c, delay_us, timeout_us);
> >  =20
> > > +}
> > > +
> > > +/*
> > > + * If the slave device content being changed by Write/Erase, need to
> > > + * invalidate the AHB buffer. This can be achieved by doing the reset
> > > + * of controller after setting MCR0[SWRESET] bit.
> > > + */
> > > +static inline void nxp_fspi_invalid(struct nxp_fspi *f) {
> > > +	u32 reg;
> > > +	int ret;
> > > +
> > > +	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
> > > +	fspi_writel(f, reg | FSPI_MCR0_SWRST, f->iobase + FSPI_MCR0);
> > > +
> > > +	/* w1c register, wait unit clear */
> > > +	ret =3D fspi_readl_poll_tout(f, f->iobase + FSPI_MCR0,
> > > +				   FSPI_MCR0_SWRST, 0, POLL_TOUT, false);
> > > +	WARN_ON(ret);
> > > +}
> > > +
> > > +static void nxp_fspi_prepare_lut(struct nxp_fspi *f,
> > > +				 const struct spi_mem_op *op)
> > > +{
> > > +	void __iomem *base =3D f->iobase;
> > > +	u32 lutval[4] =3D {};
> > > +	int lutidx =3D 1, i;
> > > +
> > > +	/* cmd */
> > > +	lutval[0] |=3D LUT_DEF(0, LUT_CMD, LUT_PAD(op->cmd.buswidth),
> > > +			     op->cmd.opcode);
> > > +
> > > +	/* addr bus width */
> > > +	if (op->addr.nbytes) {
> > > +		u32 addrlen =3D 0;
> > > +
> > > +		switch (op->addr.nbytes) {
> > > +		case 1:
> > > +			addrlen =3D ADDR8BIT;
> > > +			break;
> > > +		case 2:
> > > +			addrlen =3D ADDR16BIT;
> > > +			break;
> > > +		case 3:
> > > +			addrlen =3D ADDR24BIT;
> > > +			break;
> > > +		case 4:
> > > +			addrlen =3D ADDR32BIT;
> > > +			break;
> > > +		default:
> > > +			dev_err(f->dev, "In-correct address length\n");
> > > +			return;
> > > +		} =20
> >=20
> > You don't need to validate op->addr.nbytes here, this is already done in
> > nxp_fspi_supports_op(). =20
>=20
> Yes, I need to validate op->addr.nbytes else LUT would going to be progra=
mmed for 0 addrlen.
> I have checked this on the target.

Also agree there. Some operations have 0 address bytes. We could also
test addr.buswidth, but I'm fine with the addr.nbytes test too.


> > > +static void nxp_fspi_select_mem(struct nxp_fspi *f, struct spi_device
> > > +*spi) {
> > > +	unsigned long rate =3D spi->max_speed_hz;
> > > +	int ret;
> > > +	uint64_t size_kb;
> > > +
> > > +	/*
> > > +	 * Return, if previously selected slave device is same as current
> > > +	 * requested slave device.
> > > +	 */
> > > +	if (f->selected =3D=3D spi->chip_select)
> > > +		return;
> > > +
> > > +	/* Reset FLSHxxCR0 registers */
> > > +	fspi_writel(f, 0, f->iobase + FSPI_FLSHA1CR0);
> > > +	fspi_writel(f, 0, f->iobase + FSPI_FLSHA2CR0);
> > > +	fspi_writel(f, 0, f->iobase + FSPI_FLSHB1CR0);
> > > +	fspi_writel(f, 0, f->iobase + FSPI_FLSHB2CR0);
> > > +
> > > +	/* Assign controller memory mapped space as size, KBytes, of flash.=
 */
> > > +	size_kb =3D FSPI_FLSHXCR0_SZ(f->memmap_phy_size); =20
> >  =20
> Above description of this function, explains the reason for using memmap_=
phy_size.
> This is not the arbitrary size, but the memory mapped size being assigned=
 to the controller.
>=20
> > You are still using memory of arbitrary size (memmap_phy_size) for mapp=
ing the
> > flash. Why not use the same approach as in the QSPI driver and just map
> > ahb_buf_size until we implement the dirmap API? =20
> The approach which being used in QSPI driver didn't work here, I have tri=
ed with that.
> In QSPI driver, while preparing LUT we are assigning read/write address i=
n the LUT preparation and have to for some unknown hack have to provide mac=
ro for LUT_MODE instead of LUT_ADDR.
> But this thing didn't work for FlexSPI.
> I discussed with HW IP owner and they suggested only to use LUT_ADDR for =
specifying the address length of the command i.e. 3-byte or 4-byte address =
command (NOR) or 1-2 byte address command for NAND.

Actually, we would have used a LUT_ADDR too if the QSPI IP was support
ADDR instructions with a number of bytes < 3, but for some unknown
reasons it does not work.=20

>=20
> Thus, in LUT preparation we have assigned only the base address.
> Now if I have assigned ahb_buf_size to FSPI_FLSHXXCR0 register then for r=
ead/write data beyond limit of ahb_buf_size offset I get data corruption.

Why would you do that? We have the ->adjust_op_size() exactly for this
reason, so, if someone tries to do a spi_mem_op with data.nbytes >
ahb_buf_size you should return an error.

>=20
> Thus, for generic approach have assigned FSPI_FLSHXXCR0 equal to the memo=
ry mapped size to the controller. This would also not going to depend on th=
e number of CS present on the target.

I kind of agree with Frieder on that one, I think it's preferable to
limit the per-read-op size to ahb_buf_size and let the upper layer
split the request in several sub-requests. On the controller side of
things, you just have to have a mapping of ahb_buf_size per-CS. If you
want to further optimize things, implement the dirmap hooks.

>=20
> > You are already aligning the AHB reads for this in nxp_fspi_adjust_op_s=
ize().
> >  =20
> Yes, max read data size can be ahb_buf_size. Thus we need to check max re=
ad size with ahb_buf_size.

Well, it's never a bad thing to check it twice, just in case the
spi-mem user is misusing the API.

> > > +static void nxp_fspi_fill_txfifo(struct nxp_fspi *f,
> > > +				 const struct spi_mem_op *op)
> > > +{
> > > +	void __iomem *base =3D f->iobase;
> > > +	int i, j, ret;
> > > +	int size, tmp_size, wm_size;
> > > +	u32 data =3D 0;
> > > +	u32 *txbuf =3D (u32 *) op->data.buf.out;
> > > +
> > > +	/* clear the TX FIFO. */
> > > +	fspi_writel(f, FSPI_IPTXFCR_CLR, base + FSPI_IPTXFCR);
> > > +
> > > +	/* Default value of water mark level is 8 bytes. */
> > > +	wm_size =3D 8;
> > > +	size =3D op->data.nbytes / wm_size;
> > > +	for (i =3D 0; i < size; i++) {
> > > +		/* Wait for TXFIFO empty */
> > > +		ret =3D fspi_readl_poll_tout(f, f->iobase + FSPI_INTR,
> > > +					   FSPI_INTR_IPTXWE, 0,
> > > +					   POLL_TOUT, true);
> > > +		WARN_ON(ret);
> > > +
> > > +		j =3D 0;
> > > +		tmp_size =3D wm_size;
> > > +		while (tmp_size > 0) {
> > > +			data =3D 0;
> > > +			memcpy(&data, txbuf, 4);
> > > +			fspi_writel(f, data, base + FSPI_TFDR + j * 4);
> > > +			tmp_size -=3D 4;
> > > +			j++;
> > > +			txbuf +=3D 1;
> > > +		}
> > > +		fspi_writel(f, FSPI_INTR_IPTXWE, base + FSPI_INTR);
> > > +	}
> > > +
> > > +	size =3D op->data.nbytes % wm_size;
> > > +	if (size) {
> > > +		/* Wait for TXFIFO empty */
> > > +		ret =3D fspi_readl_poll_tout(f, f->iobase + FSPI_INTR,
> > > +					   FSPI_INTR_IPTXWE, 0,
> > > +					   POLL_TOUT, true);
> > > +		WARN_ON(ret);
> > > +
> > > +		j =3D 0;
> > > +		tmp_size =3D 0;
> > > +		while (size > 0) {
> > > +			data =3D 0;
> > > +			tmp_size =3D (size < 4) ? size : 4;
> > > +			memcpy(&data, txbuf, tmp_size);
> > > +			fspi_writel(f, data, base + FSPI_TFDR + j * 4);
> > > +			size -=3D tmp_size;
> > > +			j++;
> > > +			txbuf +=3D 1;
> > > +		}
> > > +		fspi_writel(f, FSPI_INTR_IPTXWE, base + FSPI_INTR);
> > > +	} =20
> >=20
> > All these nested loops to fill the TX buffer and also the ones below to=
 read the
> > RX buffer look much more complicated than they should really be. Can yo=
u try to
> > make this more readable? =20
> Yes
> >=20
> > Maybe something like this would work:
> >=20
> > for (i =3D 0; i < ALIGN_DOWN(op->data.nbytes, 8); i +=3D 8) {
> > 	/* Wait for TXFIFO empty */
> > 	ret =3D fspi_readl_poll_tout(f, f->iobase + FSPI_INTR,
> > 				   FSPI_INTR_IPTXWE, 0,
> > 				   POLL_TOUT, true);
> >=20
> > 	fspi_writel(f, op->data.buf.out + i, base + FSPI_TFDR);
> > 	fspi_writel(f, op->data.buf.out + i + 4, base + FSPI_TFDR + 4);
> > 	fspi_writel(f, FSPI_INTR_IPTXWE, base + FSPI_INTR); } =20
> With this above 2 lines we are hardcoding it for read/write with watermar=
k size as 8 bytes.
> Watermark size can be variable and depends on the value of IPRXFCR/IPTXFC=
R register with default value as 8 bytes
> Thus, I would still prefer to use the internal for loop instead of 2 fspi=
_writel(...) for FSPI_TFDR and FSPI_TFDR + 4 register write commands.

Just like you're hardcoding wm_size to 8, so I don't see a difference
here. And I indeed prefer Frieder's version.
