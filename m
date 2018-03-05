Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1esqST-0005vq-1A
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 13:47:19 +0000
Date: Mon, 5 Mar 2018 14:47:02 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Mark
 Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Vignesh R <vigneshr@ti.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180305144702.0afd663e@bbrezillon>
In-Reply-To: <7314a397-2821-ceb8-a9ff-f14d0dd2a176@wedev4u.fr>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <c45b9709-be32-d864-c8b2-0e33d7da28b2@wedev4u.fr>
 <20180305100025.3b25ae3d@bbrezillon>
 <7314a397-2821-ceb8-a9ff-f14d0dd2a176@wedev4u.fr>
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

On Mon, 5 Mar 2018 14:01:59 +0100
Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:

> Hi Boris,
>=20
> Le 05/03/2018 =C3=A0 10:00, Boris Brezillon a =C3=A9crit=C2=A0:
> > Hello Cyrille,
> >=20
> > On Sun, 4 Mar 2018 22:15:20 +0100
> > Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:
> >  =20
> >>> +
> >>> +static int spi_check_buswidth_req(struct spi_mem *mem, u8 buswidth, =
bool tx)
> >>> +{
> >>> +	u32 mode =3D mem->spi->mode;
> >>> +
> >>> +	switch (buswidth) {
> >>> +	case 1:
> >>> +		return 0;
> >>> +
> >>> +	case 2:
> >>> +		if ((tx && (mode & (SPI_TX_DUAL | SPI_TX_QUAD))) ||
> >>> +		    (!tx && (mode & (SPI_RX_DUAL | SPI_RX_QUAD))))   =20
> >>
> >> Some SPI (flash) controller may support Quad protocols but no Duals
> >> protocols at all. Hence you should only test SPI_{R,T]X_DUAL. =20
> >=20
> > Hm, I'd rather not change that, since it's what have been used so far.
> > Note that a controller that wants to put more constraints can still
> > implement the ->supports_op() hook.
> >  =20
> >>
> >> Anyway, I think the function should completely be removed because
> >> SPI_{R,T}X_{DUAL,QUAD} flags should be deprecated.
> >>
> >> They were fine when introduced long time ago when Quad SPI flashes only
> >> supported Fast Read 1-1-4 and maybe few of them Page Program 1-1-4.
> >>
> >> However for many years now, Quad SPI flashes support far much SPI prot=
ocols
> >> and commands. For instance:
> >> Fast Read 1-1-4
> >> Fast Read 1-4-4
> >> (Fast Read 4-4-4)
> >> Page Program 1-1-4
> >> Page Program 1-4-4
> >> Page Program 4-4-4
> >>
> >> Fast Read x-y-z means that:
> >> - the op code is transfered (tx) on x I/O line(s)
> >> - the address, mode and dummies are transfered (tx) on y I/O line(s)
> >> - the data are received (rx) on z I/O line(s)
> >>
> >> Page Program x-y-z stands for:
> >> - the op code being transfered (tx) on x I/O line(s)
> >> - the address is transfered (tx) on y I/O line(s)
> >> the data are transfered (tx) on z I/O line(s)
> >>
> >> Then some SPI flash controllers and/or memories may support Fast Read =
1-4-4
> >> but not Page Program 1-1-4 whereas others may support Page Program 1-1=
-4
> >> but not Fast Read 1-4-4.
> >>
> >> So using only SPI_{R,T}X_{DUAL,QUAD} flags, how do we make the differe=
nce
> >> between support of Fast Read 1-4-4 and Page Program 1-1-4 or between
> >> Fast Read 1-1-4 and Fast Read 1-4-4 ? =20
> >=20
> > I think you're mixing 2 different things:
> >=20
> > 1/ The RX/TX buswidth capabilities for generic SPI/DualSPI/QuadSPI
> >    transfers, which is, I guess, what these flags have been created for
> >=20
> > 2/ The buswidth of each instruction of a memory-like operation (by
> >    instruction I mean, CMD, ADDR, DATA cycles)
> >=20
> > There is no reason for a generic SPI controller to specify things for
> > #2, because it doesn't know anything about this spi-mem protocol, all
> > it can do is send/recv data using a specific bus width.
> > =20
>=20
> I might be wrong but I think SPI flashes are the only SPI devices using m=
ore
> than one I/O line to send and receive data.

FPGAs, and I there are and will be other devices using the spi-mem
protocol to address non-memory devices. After all, this protocol is
just enforcing a specific sequence that has nothing memory-specific.

>=20
> Anyway, let assume devices other than SPI flash also use many I/O lines
> hence make use of the SPI_{R,T}X_{DUAL,QUAD} flags.
>=20
> It looks like this series is dealing a new SPI API dedicated to SPI memor=
ies.

I said memory-like devices, and it's actually about supporting any kind
of devices that follow the spi-mem protocol, or in other words, any
kind of communication where transactions are of the following form:

1/ an opcode
2/ 0 to N address cycles
3/ 0 to N dummy cycles
4/ 0 to N data in/out cycles

> Just my opinion but 1/ and the associated SPI_{R,T}X_{DUAL,QUAD} flags sh=
ould
> be left only for the generic SPI API, - with spi_sync(), 'struct spi_mess=
age',
> 'struct spi_transfer' and so on.

And that's what pretty much what I'm doing: a controller implementing
the spi_mem_ops interface can check the operation by itself, if the
default check based on SPI_{R,T}X_{DUAL,QUAD} flags is not sufficient.

>=20
> On the other hand, the new SPI flash dedicated API should only focus on 2/
> and totally ignore the SPI_{R,T}X_{DUAL,QUAD} flags.

Not when we fallback to the generic API, but otherwise, I'm fine with
making ->supports_op() mandatory and only providing the generic checks
as a helper.

>=20
> If we take the example of the sama5d2 QSPI controller, we can use more th=
an one
> I/O line only when configure in "serial flash memory" mode. However when =
in "spi"
> mode, when can only use regular MOSI and MISO lines.
>=20
> With spi_mem_supports_op() as proposed below, we would have to set both S=
PI_RX_QUAD
> and SPI_TX_QUAD to allow Fast Read 1-4-4 when in "serial flash memory" mo=
de.
> However with other SPI devices, hence when in "spi" mode, the SPI_{R,T}X_=
QUAD flags
> would still be set though the controller cannot support more than a singl=
e I/O line.

Okay, that's a good reason to get this generic check out of the
spi_mem_supports_op() path and instead provide a generic helper that
can be used by drivers which wants to rely on SPI_{R,T}X_{DUAL,QUAD}
flags.

>=20
> The SPI_{R,T}_{DUAL,QUAD} flags could be tested in a default implementati=
on of
> spi_mem_supports_op() but should not be tested as mandatory flags for all=
 SPI
> (flash) controllers.

Agreed. I still think we need a way to restrict the number of IO-lines
based on board-related information, and if spi->mode is not appropriate
for that, we need it somewhere else. Otherwise, you might end-up
assuming QSPI is supported by both the device and the controller, while
the connections on the board is, for instance, limiting it to SPI or
DualSPI.


> >  =20
> >>> +
> >>> +/**
> >>> + * struct spi_mem_op - describes a SPI memory operation
> >>> + * @cmd.buswidth: number of IO lines used to transmit the command
> >>> + * @cmd.opcode: operation opcode
> >>> + * @addr.nbytes: number of address bytes to send. Can be zero if the=
 operation
> >>> + *		 does not need to send an address
> >>> + * @addr.buswidth: number of IO lines used to transmit the address c=
ycles
> >>> + * @addr.buf: buffer storing the address bytes
> >>> + * @dummy.nbytes: number of dummy bytes to send after an opcode or a=
ddress. Can
> >>> + *		  be zero if the operation does not require dummy bytes
> >>> + * @dummy.buswidth: number of IO lanes used to transmit the dummy by=
tes
> >>> + * @data.buswidth: number of IO lanes used to send/receive the data
> >>> + * @data.dir: direction of the transfer
> >>> + * @data.buf.in: input buffer
> >>> + * @data.buf.out: output buffer
> >>> + */
> >>> +struct spi_mem_op {
> >>> +	struct {
> >>> +		u8 buswidth;
> >>> +		u8 opcode;
> >>> +	} cmd;
> >>> +
> >>> +	struct {
> >>> +		u8 nbytes;
> >>> +		u8 buswidth;
> >>> +		const u8 *buf;   =20
> >>
> >> For the address value, I would rather use some loff_t type, instead of
> >> const u8 *.=20
> >> Actually, most (if not all) SPI flash controllers have some hardware
> >> register to set the address value of the SPI flash command to be
> >> sent. Hence having this value directly in the right format would avoid=
 to
> >> convert. =20
> >=20
> > What is the appropriate format? An address encoded in a 64-bit integer
> > does not give any information on how these bytes should be transmitted
> > on the bus. SPI NOR is passing the address in big endian, SPI NAND seems
> > to do the same, but we're not sure this will be the case for all kind of
> > memories or devices using this spi-mem protocol.
> >=20
> > Also, by passing it through an integer we limit ourselves to 8 bytes.
> > That should be enough, but who knows :-).
> >=20
> > If we go for this loff_t field, we'll have to add an endianness field
> > here and force all drivers to check it.
> > =20
>=20
> I don't think we need any endianness field. We already use loff_t only,
> without additional endianness paramater, in spi-nor but also in the above
> MTD layer (see 'struct mtd_info') and till now it has just worked fine.

It's not about the MTD layer. Can you predict that all devices will
transmit the address in big-endian? I can't.

>=20
> Most, if not all, SPI flash controllers have a dedicated field in one of
> their registers to write the address value into it. Generally, this regis=
ter
> is written with an integer in the CPU native byte order so no need to con=
vert.

It's not about how you write your register, but in which order address
bytes are transmitted on the SPI wire. Currently, SPI NOR use the MSB
first scheme, but that won't necessarily be the case for other SPI
devices.

>=20
> And anyway, if some conversion is ever needed, the SPI flash controller
> driver knows it so we could set as a rule that the integer value for the
> address is always stored in the native CPU byte order. At least most SPI =
flash
> controller driver won't have to convert from a const u8 * to some unsigned
> integral type more suited to their register accesses.

They will have to at least make sure it's properly encoded: if the
device is expecting the address to be transmitted LSB first (AKA
little-endian), they'll have to swap address bytes before writing the
value to the register.

> =20
> >> AFAIK, only m25p80 needs to convert from loff_t to u8 * and only
> >> when using the regular SPI API, ie spi_sync(), as the 'struct
> >> spi_flash_read_messag' already uses some integral type too. =20
> >=20
> > And I'm not sure this was a good idea.
> >  =20
> >>
> >> =20
> >>> +	} addr;
> >>> +
> >>> +	struct {
> >>> +		u8 nbytes;
> >>> +		u8 buswidth;
> >>> +	} dummy;
> >>> +
> >>> +	struct {
> >>> +		u8 buswidth;
> >>> +		enum spi_mem_data_dir dir;
> >>> +		unsigned int nbytes;
> >>> +		/* buf.{in,out} must be DMA-able. */
> >>> +		union {
> >>> +			void *in;
> >>> +			const void *out;
> >>> +		} buf;
> >>> +	} data;   =20
> >>
> >> Also, you should add another member in this structure to set the 'type=
' of
> >> operation for the SPI flash command:
> >> - register read
> >> - register write
> >> - memory read
> >> - memory write
> >> - memory erase
> >> [- SFDP read ? ]
> >> [- OTP read/write ? ] =20
> >=20
> > No, really, that's not belonging here. It's entirely SPI NOR specific.
> >  =20
>=20
> I disagree with you on that. Except for SFDP of course, this will also ap=
ply to
> SPI NAND as well. And this information should be passed down to the SPI (=
flash)
> controller driver, instead of being lost at the SPI NAND/NOR levels,

I'm not saying we should keep these information at the spi-nor/nand
level, just saying we should find a way to make it look like a generic
solution so that SPI controllers don't have to guess what they should
do based on the memory operation type.

Typically, why should a SPI controller care about whether the operation
is an erase, a reg read or a reg write. From the controller PoV, it's
just an spi-mem operation.
The use cases you want to optimize are read/write user-data, and this
can be done in different ways (direct memory mapping is one solution).

> so the SPI
> controller driver could take the proper actions (data cache flush/invalid=
ation
> for memory operations,

This one has to do with direct mapping, so an API to allow direct
mapping should help address that.

> enabling/disabling on-the-fly data scrambling,

And what's the problem with passing the scramble information on a
per-operation basis and letting the upper layer decide when it's a good
idea to use it or not?

> and other
> controller specific constraints).

Could you be more specific?

I really have the feeling you're reviewing that with your SPI NOR
maintainer eye, while, as I said several times, I'm trying to
address the problem more generically. My intent is not to move every
bits you have in the spi-nor layer to the spi layer. Instead, we can
progressively provide a consistent API that helps you deal with memory
devices (I guess supporting direct memory mapping is the next step if
we want to get the best perfs out of these advanced controllers) in a
device agnostic fashion.

Regards,

Boris

--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
