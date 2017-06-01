Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dGKTE-0003Gh-48
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 07:24:38 +0000
Date: Thu, 1 Jun 2017 09:24:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, marex@denx.de,
 linux-mtd@lists.infradead.org, peterpansjtu@gmail.com,
 linshunquan1@hisilicon.com
Subject: Re: [PATCH v6 10/15] nand: spi: add basic blocks for infrastructure
Message-ID: <20170601092412.0ec0d89a@bbrezillon>
In-Reply-To: <4f9fa40c-c2b6-005b-42e3-0cea0b8ee347@wedev4u.fr>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-11-git-send-email-peterpandong@micron.com>
 <4f9fa40c-c2b6-005b-42e3-0cea0b8ee347@wedev4u.fr>
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

Hi Cyrille,

Le Wed, 31 May 2017 23:45:55 +0200,
Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> a =C3=A9crit :

> Hi Peter,
>=20
> Le 24/05/2017 =C3=A0 09:07, Peter Pan a =C3=A9crit :
> > This is the first commit for spi nand framkework.
> > This commit is to add add basic building blocks
> > for the SPI NAND infrastructure.
> >=20
> > Signed-off-by: Peter Pan <peterpandong@micron.com>
> > ---
> >  drivers/mtd/nand/Kconfig      |   1 +
> >  drivers/mtd/nand/Makefile     |   1 +
> >  drivers/mtd/nand/spi/Kconfig  |   5 +
> >  drivers/mtd/nand/spi/Makefile |   1 +
> >  drivers/mtd/nand/spi/core.c   | 419 ++++++++++++++++++++++++++++++++++=
++++++++
> >  include/linux/mtd/spinand.h   | 267 +++++++++++++++++++++++++++
> >  6 files changed, 694 insertions(+)
> >  create mode 100644 drivers/mtd/nand/spi/Kconfig
> >  create mode 100644 drivers/mtd/nand/spi/Makefile
> >  create mode 100644 drivers/mtd/nand/spi/core.c
> >  create mode 100644 include/linux/mtd/spinand.h
> >  =20
> [...]
> > diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> > new file mode 100644
> > index 0000000..dd9da71
> > --- /dev/null
> > +++ b/include/linux/mtd/spinand.h
> > @@ -0,0 +1,267 @@ =20
> [...]
> > +#define SPINAND_MAX_ADDR_LEN	4
> > +
> > +/**
> > + * struct spinand_op - SPI NAND operation description
> > + * @cmd: opcode to send
> > + * @n_addr: address bytes
> > + * @addr_nbits: number of bit used to transfer address
> > + * @dummy_types: dummy bytes followed address
> > + * @addr: buffer held address
> > + * @n_tx: size of tx_buf
> > + * @tx_buf: data to be written
> > + * @n_rx: size of rx_buf
> > + * @rx_buf: data to be read
> > + * @data_nbits: number of bit used to transfer data
> > + */
> > +struct spinand_op {
> > +	u8 cmd;
> > +	u8 n_addr;
> > +	u8 addr_nbits;
> > +	u8 dummy_bytes;
> > +	u8 addr[SPINAND_MAX_ADDR_LEN]; =20
>=20
> I think it would be better to use some integral type (maybe loff_t)
> rather than an array of u8. Indeed integers are better suited to some
> (Q)SPI controllers, especially those using some kind of memory area
> mapped into the system bus.

I had a look at at least 2 SPI NAND datasheets and they all express the
number of addr cycles in bytes. I really think we should stay as
close as possible to the specs even if this implies a small penalty for
some controller drivers. BTW, I could argue that some controllers are
expecting an array of bytes and not an integer :-P.=20

>=20
> For other SPI controllers, it would still be easy to build an array of
> u8 if needed from a loff_t.

Just as easy as creating an loff_t from an array of bytes ;-).

>=20
>=20
> > +	u32 n_tx;
> > +	const u8 *tx_buf;
> > +	u32 n_rx; =20
>=20
> just a detail but n_tx and n_rx could be merged into a single n_buf:
> - at the spi-nor side, tx_buf and rx_buf can never be both !=3D NULL
> - at the spi-nand side, looking at the gen_spi_spinand_exec_op()
>   function, this is still true.

Indeed. How about having a union to still enforce constness on the tx
buf and an extra variable to specify the direction.

	union {
		const u8 *tx;
		u8 *rx;
	} buf;

	u32 datalen;
	enum spinand_data_dir datadir;

>=20
> > +	u8 *rx_buf;
> > +	u8 data_nbits;
> > +};
>=20
> Besides, this structure is really close to
> 'struct spi_flash_read_message' from include/spi/spi.h.
> So I think it would be interesting to rework a little bit the structure
> from the SPI sub-system so it can fit your needs and support all kind of
> SPI flash commands, not only read commands.
> Then this structure could be used by both the spi-nand and spi-nor
> sub-systems.

I like this idea, but I'd like to get the SPI NAND framework merge
first. Peter has been working on this for several years and I think
it's time to get it merged even if it's not perfect. We can still
improve things afterwards.

>=20
> Hence 'struct spi_flash_read_message' could be renamed into 'struct
> spi_flash_message', 'struct spi_flash_op' 'struct spi_flash_command' or
> whatever... as long as we just remove the "read" part.
>=20
> In the reworked structure, I propose to add some enum or flags to
> provide the SPI controller with the kind of SPI flash command we want it
> to execute, actually a SPI flash command type:
> - SFLASH_TYPE_READ:  (Fast) Read (spi-nor) / Read From Cache (spi-nand)
> - SFLASH_TYPE_WRITE:  Page Program (spi-nor) or Program Load (spi-nand)
> - SFLASH_TYPE_ERASE: Sector/Block Erase
> - SFLASH_TYPE_READ_REG: Read ID, Read Status, Page Read, ...
> - SFLASH_TYPE_WRITE_REG: Write Enable, Write Status, ...

Why is this needed? The opcode[+addr-cycles][+data-cycles] sequence
should be enough.

>=20
> Based on my experience with SPI NOR memories, it's not reliable to guess
> the type of the SPI flash command only from its instruction op code:
> most of the instruction op codes are pretty standard but *really* often
> many SPI flash manufacturers have their own quirks and use different and
> unexpected op codes...

SPI controllers (even if they're QSPI/flash oriented) should be able to
send any kind of command. A command (or operation) is a specific
sequence of opcode[+addr-cycles][+data-cycles].

Vendors can have their own private commands or even decide to adapt
the standard command sequence, but that's all flash specific, and the
controller code should not be impacted here. All the controller needs
to know is the sequence it's supposed to execute, and that's all.

>=20
> So providing the type of SPI flash command would clarify and allow the
> (Q)SPI controller driver to tell the spi-nand/spi-nor frameworks whether
> this SPI flash command is supported by spi_flash_command_exec() / exec_op=
().
>=20
> That's why I suggest to add 2 new optional handlers in 'struct
> spi_master' from the SPI sub-system:
>=20
> bool (*spi_flash_is_command_supported)(struct spi_device *spi,
> 				       const struct spi_flash_command *)
>=20
> and
>=20
> int (*spi_flash_command_exec)(struct spi_device *spi,
> 			      const struct spi_flash_command *cmd);

I agree on this.

>=20
> For some (Q)SPI controllers, like those from Cadence and TI I guess,
> spi_flash_is_command_supported() is likely to return true only for a SPI
> flash command type of SFLASH_TYPE_READ.

But why do you need those high-level definitions? With the full
sequence (including the datalen+datadir) + the number of lines
(quad/dual/single), you should be able to know whether the controller
supports the command/operation or not.

>=20
> Other (Q)SPI controllers, like the one from Atmel, would return true for
> any command. Indeed, the regular spi_sync() API based on
> 'struct spi_message' and 'struct spi_transfer' is not suited at all for
> the Atmel QSPI controller.
>=20
> If spi_flash_is_command_supported() returns false or is not implemented
> by the SPI controller driver, then you can use a default implementation
> based on spi_sync(), actually the one you propose through your
> gen_spi_spinand_exec_op() function.

I'm not sure I understand the purpose of
->spi_flash_is_command_supported() anymore. Is this about reporting
when the controller can optimize things, and if it returns false the
framework falls back to the less optimized spi_sync() approach, or is
this here to say 'no, I can't send this command, you should return
-ENOTSUPP to the caller'.

AFAICT, if you can fallback to spi_sync() that means you support all
commands except those that require Quad or Dual mode. Am I wrong?

>=20
> The idea behind that is, in term, to replace the current
> flash_read_supported() / spi_flash_read() functions by the more generic
> spi_flash_is_command_supported() / spi_flash_command_exec().
> We just want to extend the already existing SPI API to support more SPI
> flash commands than the only (Fast) Read commands.
>=20
> Also, if done at the SPI sub-system side, this API could be used by both
> the spi-nand and spi-nor sub-systems, then we could imagine moving some
> (Q)SPI controller drivers, like drivers/mtd/spi-nor/atmel-quadspi.c,
> back into the SPI sub-system, where they should belong.
>=20
> Currently, the Atmel QSPI driver dwells in the spi-nor sub-system simply
> because, as I said, the spi-sync() API is not suited at all for the
> hardware register interface. However with the proper SPI API, this
> controller could also be used with SPI NAND memories.

Your solution sounds promising, but I'm focusing on short-term
solutions. I think we'll keep going with the current implementation
(with only minor modifications) and see how things evolve. Once your
generic solution is ready it should be pretty easy to adapt the
spi-nand framework.

Thanks for your inputs.

BTW, you didn't answer my questions on dummy-bits in address cycles,
but I think I got my answers by reading the datasheets ;-).

Boris
