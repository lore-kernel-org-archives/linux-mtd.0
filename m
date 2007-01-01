Received: from moutng.kundenserver.de ([212.227.126.177])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H1VYN-0005G6-Gu
	for linux-mtd@lists.infradead.org; Mon, 01 Jan 2007 17:22:50 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Pierre Ossman <drzeus-mmc@drzeus.cx>
Subject: Re: [RFC] MTD driver for MMC cards
Date: Mon, 1 Jan 2007 23:22:13 +0100
References: <200612281418.20643.arnd@arndb.de> <4597ADD2.90700@drzeus.cx>
In-Reply-To: <4597ADD2.90700@drzeus.cx>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200701012322.14735.arnd@arndb.de>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 31 December 2006 13:32, Pierre Ossman wrote:
> Arnd Bergmann wrote:
>
> I'm a complete MTD noob, but what uses does the MTD layer have besides
> JFFS2. If it's none, than this advantage isn't that big of a deal.=20
>
> > * It becomes possible to use MMC cards with jffs2 even with CONFIG_BLOCK
> >   disabled, which can save a significant amount of kernel memory on
> >   small machines that have an MMC slot but no other block device.
> >=20
>=20
> From what I've heard, JFFS2 is close to unusuable on the sizes of modern
> SD/MMC cards. So I'd like to see some more use cases before I'm ready
> to let this in. =20

There are multiple efforts in progress to get a jffs2 replacement. NAND
flash in embedded devices has the same size as it has on MMC card
potentially, so we will need one soon. David Woodhouse has pushed the
limit that jffs2 can reasonably used to 512MB, which is the size used
in the OLPC XO laptop. If there are ways to get beyond that (which I
find unlikely), there will be a hard limit 2GB or 4GB because of
limitations in the fs layout.

One promising effort for a replacement is J=F6rn's logfs
(http://wiki.laptop.org/go/Logfs), which should scale well to many
gigabytes. A driver based on MMC would be a nice development tool
for that, since it enables regular PCs as a debugging machine
instead of having to load test kernels onto an actual embedded
machine.

Another thing I have been thinking about was an MTD version of
fat16/fat32. There are a number of optimizations that you can
do for flash media, including:

=2D limiting the number of writes to the FAT
=2D erasing blocks when they are freed in the FS
=2D always writing full erase blocks if the erase block
  size matches the cluster size
=2D optimize for wear leveling instead of avoiding
  fragmentation

I read that the SD cards have some restrictions of how
the fat fs needs to be laid out on them, presumably to
make sure clusters are aligned with erase blocks.
Do you have any specific information on what SD actually
requires?

> > I still want to be sure that I'm on the right track with this driver
> > and did not make a conceptual mistake.
> >=20
>=20
> I can comment it from a MMC perspective, but the MTD stuff I will have to=
 assume is correct.

ok, that's fine. I've talked to a few MTD people about it already
and I understand much more about MTD than I do about MMC ;-)

> > @@ -616,6 +616,8 @@ static void mmc_decode_csd(struct mmc_ca
> >  		csd->r2w_factor =3D UNSTUFF_BITS(resp, 26, 3);
> >  		csd->write_blkbits =3D UNSTUFF_BITS(resp, 22, 4);
> >  		csd->write_partial =3D UNSTUFF_BITS(resp, 21, 1);
> > +		csd->erase_blksize =3D (UNSTUFF_BITS(resp, 37, 5) + 1) *
> > +					(UNSTUFF_BITS(resp, 42, 5) + 1);
> >  	} else {
> >  		/*
> >  		 * We only understand CSD structure v1.1 and v1.2.
>=20
> NAK. SD uses another format for erase blocks. See the simplified physical=
 spec.

ok, I'll have a look. I keep having trouble identifying the right
specifications (physical spec sounded like it was only about wiring
and electric properties, so I did not look at that). Maybe it would
be good if you could put pointers to the relevant documents into
your Wiki?

> > +/*
> > + * transfer a block to/from the card. The block needs to be aligned
> > + * to mtd->writesize. If we want to implement an mtd_writev method,
> > + * this needs to use stream operations with an appropriate stop
> > + * command as well.
> > + */
> > +static int mmc_mtd_transfer_low(struct mmc_card *card, loff_t off, siz=
e_t len,
> > +			size_t *retlen, u_char *buf, int write)
> > +{
> > +	struct scatterlist sg;
> > +	struct mmc_data data =3D {
> > +		.blksz =3D 1 << card->csd.read_blkbits,
> > +		.blocks =3D len >> card->csd.read_blkbits,
>=20
> First of all, you cannot assume that read_blkbits is a valid block
> size when doing writes.=20

Right, I see. I introduced that bug when I merged parts of the read and
write paths.

Is it fair to assume that write_blkbits is always bigger than
read_blkbits, so that one can be used in both cases?

> Secondly, the cards default in a block size of 512 bytes, so you need
> to tell the card your desired block size during probe.=20

Ok.

> > +		.flags =3D write ? MMC_DATA_WRITE : MMC_DATA_READ,
> > +		.sg =3D &sg,
> > +		.sg_len =3D 1,
> > +	};
> > +	struct mmc_command cmd =3D {
> > +		.arg =3D off,
> > +		.data =3D &data,
> > +		.flags =3D MMC_RSP_R1 | MMC_CMD_ADTC,
> > +		.opcode =3D write ? MMC_WRITE_BLOCK : MMC_READ_SINGLE_BLOCK,
>=20
> You set .blocks above, so I have to assume it can be more than 1.
> So you need to change the opcodes accordingly.=20
>
> > +	};
> > +	struct mmc_request mrq =3D {
> > +		.cmd =3D &cmd,
> > +		.data =3D &data,
> > +	};
>=20
> And it also means you need a stop command.

I tried to do multiple block access at first, but then took it out again.
If it turns out valuable to have these, I'll implement it properly later.
Does it make a difference performance-wise to do larger accesses?

> > +
> > +	/* copied from the block driver, don't understand why this is needed =
*/
>=20
> Now this gives me a bad feeling. Have you read any spec about the MMC
> protocol or are you just winging it?=20

Understanding the details would be one of the next steps. This was just
a quick hack for now, to see how complex the driver gets, and to see
if it's worth doing.

> It is needed because the card goes into programming state after a write,
> where it is very unresponsive to other commands.=20

ok, thanks for the explanation.

> > +
> > +	ret =3D mmc_card_claim_host(card);
> > +	if (ret) {
> > +		dev_warn(&card->dev, "%s: mmc_card_claim_host returned %d\n",
> > +			__FUNCTION__, ret);
> > +		ret =3D -EIO;
> > +		goto error;
> > +	}
>=20
> mmc_card_claim_host() is currently very stupid in that it requires you to
> call mmc_card_release_host() on error. I intend to fix that some time in
> the future. =20

ok.

> > +/*
> > + * Initialize an mmc card. We create a new MTD device for each
> > + * MMC card we find. The operations are rather straightforward,
> > + * so we don't even need our own data structure to contain the
> > + * mtd_info.
> > + */
> > +static int mmc_mtd_probe(struct mmc_card *card)
> > +{
> > +	struct mtd_info *mtd;
> > +	int ret;
> > +
> > +	if (!(card->csd.cmdclass & CCC_ERASE))
> > +		return -ENODEV;
> > +
>=20
> You should probably check for CCC_BLOCK_READ here.
>=20
> And your driver needs to check if the card support writes
> (both by mmc_card_readonly() and CCC_BLOCK_WRITE).=20

ok.

Thanks a lot for your detailed response!

	Arnd <><
