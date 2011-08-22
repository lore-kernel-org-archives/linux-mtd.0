MIME-Version: 1.0
In-Reply-To: <201108221509.49721.marek.vasut@gmail.com>
References: <1313581828-16625-1-git-send-email-b32955@freescale.com>
	<201108201343.20420.marek.vasut@gmail.com>
	<4E51E21F.3060804@freescale.com>
	<201108221509.49721.marek.vasut@gmail.com>
Date: Mon, 22 Aug 2011 10:00:46 -0400
Message-ID: <CAMiH66H-xPNARxBJ+xAWubZz2-hoJgAQtOX2=Pi8NE3vrFD_ag@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] MTD : add the common code for GPMI-NAND controller
	driver
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>, koen.beel.barco@gmail.com,
	linux-mtd@lists.infradead.org, w.sang@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

On Mon, Aug 22, 2011 at 9:09 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On Monday, August 22, 2011 06:59:11 AM Huang Shijie wrote:
>> Hi,
>>
>> thanks for your comments.
>>
>> >> +
>> >> +static inline int get_ecc_chunk_size(struct gpmi_nand_data *this)
>> >> +{
>> >> + =C2=A0/* for historical reason */
>> >> + =C2=A0return 512;
>> >
>> > Can't we just #define this? Or will there ever be something else possi=
ble
>> > here ? I thought this is the only possible behaviour on MXS.
>>
>> Please keep it here, it maybe changed in the future.
>> It ever had some code for ONFI nand, but i removed it.
>
> well if you #define it now, you can always replace the defined value with=
 a
> function later.

ok.
>
>>
>> >> +}
>> >> +
>> >> +int common_nfc_set_geometry(struct gpmi_nand_data *this)
>> >> +{
>> >> + =C2=A0struct bch_geometry *geo =3D&this->bch_geometry;
>> >> + =C2=A0struct mtd_info *mtd =3D&this->mil.mtd;
>> >> + =C2=A0unsigned int metadata_size;
>> >> + =C2=A0unsigned int status_size;
>> >> + =C2=A0unsigned int chunk_data_size_in_bits;
>> >> + =C2=A0unsigned int chunk_ecc_size_in_bits;
>> >> + =C2=A0unsigned int chunk_total_size_in_bits;
>> >> + =C2=A0unsigned int block_mark_chunk_number;
>> >> + =C2=A0unsigned int block_mark_chunk_bit_offset;
>> >> + =C2=A0unsigned int block_mark_bit_offset;
>> >> + =C2=A0int gf_len =3D 13;/* use GP13 by default */
>> >> +
>> >> + =C2=A0/* We only support BCH now. */
>> >> + =C2=A0geo->ecc_algorithm =3D "BCH";
>> >> +
>> >> + =C2=A0/*
>> >> + =C2=A0 * We always choose a metadata size of 10. Don't try to make =
sense of
>> >> + =C2=A0 * it -- this is really only for historical compatibility.
>> >> + =C2=A0 */
>> >
>> > Historical compat or you mean "the chip was designed this way, see
>> > datasheet section x.y.z"? ;-)
>>
>> Just for historical compatibility.
>> it's better to keep it as now, there is no need to change it.
>
> I'm just trying to make sense of it ... from the docs, it seems like a ch=
ip
> design thing. So this is compat with STMP37xx and 36xx ? Or even somethin=
g older
> and more obscure ?
>
it  seems the rom of the chip use the value.  I will check it tomorrow.

>>
>> >> + =C2=A0geo->metadata_size_in_bytes =3D 10;
>> >> +
>> >> + =C2=A0/* ECC chunks */
>> >> + =C2=A0geo->ecc_chunk_size_in_bytes =3D get_ecc_chunk_size(this);
>
> =C2=A0[ ... ]
>
>> >> +
>> >> +/* Can we use the upper's buffer directly for DMA? */
>> >> +void prepare_data_dma(struct gpmi_nand_data *this, enum
>> >> dma_data_direction dr) +{
>> >> + =C2=A0struct mil *mil =3D&this->mil;
>> >> + =C2=A0struct scatterlist *sgl =3D&mil->data_sgl;
>> >
>> > I still see the "MIL" present -- can't we just merge the library and t=
his
>> > ?
>>
>> the =C2=A0 `mil` is just a data structure to contain the fields now.
>> Maybe I should change the name of it.
>
> Probably, I still have a feeling of this like it's the old freescale driv=
er
> heritage and doesn't make sense now.

ok, I will change the name.

>
>>
>> >> + =C2=A0int ret;
>> >> +
>> >> + =C2=A0mil->direct_dma_map_ok =3D true;
>
>> >> +static void show_bch_geometry(struct bch_geometry *geo)
>> >> +{
>> >> + =C2=A0pr_info("---------------------------------------\n");
>> >> + =C2=A0pr_info(" =C2=A0 =C2=A0 =C2=A0 BCH Geometry\n");
>> >> + =C2=A0pr_info("---------------------------------------\n");
>> >> + =C2=A0pr_info("ECC Algorithm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %s=
\n", geo->ecc_algorithm);
>> >> + =C2=A0pr_info("ECC Strength =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : %u=
\n", geo->ecc_strength);
>> >> + =C2=A0pr_info("Page Size in Bytes =C2=A0 =C2=A0 : %u\n", geo->page_=
size_in_bytes);
>> >> + =C2=A0pr_info("Metadata Size in Bytes : %u\n", geo->metadata_size_i=
n_bytes);
>> >> + =C2=A0pr_info("ECC Chunk Size in Bytes: %u\n",
>> >> geo->ecc_chunk_size_in_bytes); + =C2=A0 pr_info("ECC Chunk Count =C2=
=A0 =C2=A0 =C2=A0 =C2=A0:
>> >> %u\n", geo->ecc_chunk_count); + =C2=A0 =C2=A0pr_info("Payload Size in=
 Bytes =C2=A0:
>> >> %u\n", geo->payload_size_in_bytes); + =C2=A0 =C2=A0 =C2=A0pr_info("Au=
xiliary Size in Bytes:
>> >> %u\n", geo->auxiliary_size_in_bytes); + =C2=A0 =C2=A0pr_info("Auxilia=
ry Status
>> >> Offset: %u\n", geo->auxiliary_status_offset); + =C2=A0 =C2=A0pr_info(=
"Block Mark
>> >> Byte Offset : %u\n", geo->block_mark_byte_offset); + =C2=A0 =C2=A0 =
=C2=A0 pr_info("Block
>> >> Mark Bit Offset =C2=A0: %u\n", geo->block_mark_bit_offset); +}
>> >
>> > We don't need this.
>>
>> I just use it for debug.
>> Why do not need it? :)
>> I think it's useful to debug.
>
> I want to use it, not debug it. I don't want to have it in dmesg. pr_info=
() is
> really unsuitable. Remove it, use pr_debug(), #define it in
> MXS_NAND_VERBOSE_DEBUG, which will be undefined at the begining of the fi=
le by
> default (probably the best approach). Someone who wants to debug this thi=
ng will
> just enable it.
>
>>
>> >> +
>> >> +int start_dma_without_bch_irq(struct gpmi_nand_data *this,
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct dma_async_tx_descriptor *desc)
>> >> +{
>> >> + =C2=A0struct completion *dma_c =3D&this->dma_done;
>> >> + =C2=A0int err;
>
> [...]
>
>> >> +
>> >> + =C2=A0if ((mil->current_chip< =C2=A00)&& =C2=A0(chip>=3D 0))
>
> btw. is the indent here OK?

I checked with the script ./script/checkpatch.
there is no error.

It's ok.

>
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpmi_begin(this);
>> >> + =C2=A0else if ((mil->current_chip>=3D 0)&& =C2=A0(chip< =C2=A00))
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpmi_end(this);
>> >> + =C2=A0else
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;
>> >
>> > Do you need this else branch at all?
>>
>> It needs a warning here.
>>
>> >> +
>> >> + =C2=A0mil->current_chip =3D chip;
>> >> +}
>> >> +
>> >> +static void gpmi_read_buf(struct mtd_info *mtd, uint8_t *buf, int le=
n)
>> >> +{
>> >> + =C2=A0struct nand_chip *nand =3D mtd->priv;
>> >> + =C2=A0struct gpmi_nand_data *this =3D nand->priv;
>> >> + =C2=A0struct mil *mil =3D&this->mil;
>> >> +
>> >> + =C2=A0logio(GPMI_DEBUG_READ);
>> >> + =C2=A0/* save the info in mil{} for future */
>> >> + =C2=A0mil->upper_buf =C2=A0=3D buf;
>> >> + =C2=A0mil->upper_len =C2=A0=3D len;
>> >> +
>> >> + =C2=A0gpmi_read_data(this);
>> >> +}
>> >> +
>> >> +static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf,
>> >> int len) +{
>> >> + =C2=A0struct nand_chip *nand =3D mtd->priv;
>> >> + =C2=A0struct gpmi_nand_data *this =3D nand->priv;
>> >> + =C2=A0struct mil *mil =3D&this->mil;
>> >> +
>> >> + =C2=A0logio(GPMI_DEBUG_WRITE);
>> >> + =C2=A0/* save the info in mil{} for future */
>> >> + =C2=A0mil->upper_buf =C2=A0=3D (uint8_t *)buf;
>> >> + =C2=A0mil->upper_len =C2=A0=3D len;
>> >> +
>> >> + =C2=A0gpmi_send_data(this);
>> >> +}
>> >> +
>> >> +static uint8_t gpmi_read_byte(struct mtd_info *mtd)
>> >> +{
>> >> + =C2=A0struct nand_chip *nand =3D mtd->priv;
>> >> + =C2=A0struct gpmi_nand_data *this =3D nand->priv;
>> >> + =C2=A0struct mil *mil =3D&this->mil;
>> >> + =C2=A0uint8_t *buf =3D mil->data_buffer_dma;
>> >> +
>> >> + =C2=A0gpmi_read_buf(mtd, buf, 1);
>> >> + =C2=A0return buf[0];
>> >> +}
>> >> +
>> >>
>> >> +static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
>> >> +{
>> >> + =C2=A0struct nand_chip *nand =3D mtd->priv;
>> >> + =C2=A0struct gpmi_nand_data *this =3D nand->priv;
>> >> + =C2=A0int block, ret =3D 0;
>> >> +
>> >> + =C2=A0/* Get block number */
>> >> + =C2=A0block =3D (int)(ofs>> =C2=A0nand->bbt_erase_shift);
>> >> + =C2=A0if (nand->bbt)
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand->bbt[block>> =C2=A02] |=3D 0=
x01<< =C2=A0((block& =C2=A00x03)<< =C2=A01);
>> >> +
>> >> + =C2=A0/* Do we have a flash based bad block table ? */
>> >> + =C2=A0if (nand->options& =C2=A0NAND_USE_FLASH_BBT)
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D nand_update_bbt(mtd, ofs)=
;
>> >
>> > if (stuff)
>> >
>> > =C2=A0 =C2=A0 return nand_update_bbt();
>>
>> I can not return it here, I need to update the ecc_stats too.
>
> You're right.
>
>>
>> > stuff from else branch
>> > .
>> > .
>> > .
>> >
>> > Besides, please don't declare variables in the middle of code.
>>
>> why?
>> it's no harm to declare the variables in the {}.
>
> And to find out what kind of variable it is, you can't just jump at the b=
egining
> of the function, you need to navigate through the code ... that's bad and
> additional work for other people.
>
thanks, got it.

>>
>> >> + =C2=A0else {
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mil *mil =3D&this->mil;
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *block_mark;
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int column, page, status, chipnr;
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chipnr =3D (int)(ofs>> =C2=A0nand=
->chip_shift);
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand->select_chip(mtd, chipnr);
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0column =3D this->swap_block_mark =
? mtd->writesize : 0;
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write the block mark. */
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_mark =3D mil->data_buffer_d=
ma;
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_mark[0] =3D 0; /* bad block=
 marker */
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Shift to get page */
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D (int)(ofs>> =C2=A0nand->=
page_shift);
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand->cmdfunc(mtd, NAND_CMD_SEQIN=
, column, page);
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand->write_buf(mtd, block_mark, =
1);
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand->cmdfunc(mtd, NAND_CMD_PAGEP=
ROG, -1, -1);
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D nand->waitfunc(mtd, na=
nd);
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status& =C2=A0NAND_STATUS_FAI=
L)
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D -EIO;
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nand->select_chip(mtd, -1);
>> >> + =C2=A0}
>> >> + =C2=A0if (!ret)
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->ecc_stats.badblocks++;
>> >> +
>> >> + =C2=A0return ret;
>> >> +}
>
> [...]
>
>> >> addr_t auxiliary);
>> >> +
>> >> +/* ONFI or TOGGLE nand */
>> >> +bool is_ddr_nand(struct gpmi_nand_data *);
>> >> +
>> >> +/* for log */
>> >> +extern int gpmi_debug;
>> >
>> > Why this extern ?
>>
>> this header can be included by gpmi-nand.c and gpmi-lib.c.
>
> This is a peculiar one ... can't you -- for example -- hide this into dri=
ver
> data?
It's a parameter of the driver.
I use it to show different log.
I think it can not be hide into driver data :(

thanks

Huang Shijie
