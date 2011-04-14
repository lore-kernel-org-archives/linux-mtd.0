Message-ID: <4DA659D0.9030504@freescale.com>
Date: Thu, 14 Apr 2011 10:20:00 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v5 2/4] MTD : add the common code for GPMI controller
	driver
References: <1302675881-18862-1-git-send-email-b32955@freescale.com>	<1302675881-18862-3-git-send-email-b32955@freescale.com>
	<19877.65411.687158.113390@ipc1.ka-ro>
In-Reply-To: <19877.65411.687158.113390@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org, ffainelli@freebox.fr,
	veli-pekka.peltola@bluegiga.com, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
> Huang Shijie writes:
>> +int common_nfc_set_geometry(struct gpmi_nfc_data *this)
>> +{
>> +	struct nfc_geometry       *geo =3D&this->nfc_geometry;
>> +	struct mtd_info		  *mtd =3D&this->mil.mtd;
>> +	struct nand_chip	*chip =3D&this->mil.nand;
>>
> inconsistent indentation. You should decide whether to use<TAB>  or
> <SPACE>  for indentation. This is a global issue.
ok. thanks.
>> +	unsigned int              metadata_size;
>> +	unsigned int              status_size;
>> +	unsigned int              chunk_data_size_in_bits;
>> +	unsigned int              chunk_ecc_size_in_bits;
>> +	unsigned int              chunk_total_size_in_bits;
>> +	unsigned int              block_mark_chunk_number;
>> +	unsigned int              block_mark_chunk_bit_offset;
>> +	unsigned int              block_mark_bit_offset;
>> +
>> +	/* We only support BCH now. */
>> +	geo->ecc_algorithm =3D "BCH";
>> +
>> +	/*
>> +	 * We always choose a metadata size of 10. Don't try to make sense o=
f
>> +	 * it -- this is really only for historical compatibility.
>> +	 */
>> +	geo->metadata_size_in_bytes =3D 10;
>> +
>> +	/* ECC chunks */
>> +	geo->ecc_chunk_size_in_bytes =3D get_ecc_chunk_size(this);
>> +
>> +	/*
>> +	 * Compute the total number of ECC chunks in a page. This includes t=
he
>> +	 * slightly larger chunk at the beginning of the page, which contain=
s
>> +	 * both data and metadata.
>> +	 */
>> +	geo->ecc_chunk_count =3D mtd->writesize / geo->ecc_chunk_size_in_byt=
es;
>> +
>> +	/*
>> +	 * We use the same ECC strength for all chunks, including the first =
one.
>> +	 */
>> +	geo->ecc_strength =3D get_ecc_strength(this);
>> +	if (!geo->ecc_strength) {
>> +		log("Unsupported page geometry.");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Compute the page size, include page and oob. */
>> +	geo->page_size_in_bytes =3D mtd->writesize + mtd->oobsize;
>> +
>> +	/*
>> +	 * ONFI/TOGGLE nand needs GF14, so re-culculate DMA page size.
>>
> s/culculate/calculate/
>
>> +	 * The ONFI nand must do the reculation,
>>
> s/reculation/recalculation/
>
>> +	 * else it will fail in DMA in some platform(such as imx50).
>> +	 */
>> +	if (is_ddr_nand(chip))
>> +		geo->page_size_in_bytes =3D mtd->writesize +
>> +				geo->metadata_size_in_bytes +
>> +			(geo->ecc_strength * 14 * 8 / geo->ecc_chunk_count);
>> +
>> +	geo->payload_size_in_bytes =3D mtd->writesize;
>> +	/*
>> +	 * In principle, computing the auxiliary buffer geometry is NFC
>> +	 * version-specific. However, at this writing, all versions share th=
e
>> +	 * same model, so this code can also be shared.
>> +	 *
>> +	 * The auxiliary buffer contains the metadata and the ECC status. Th=
e
>> +	 * metadata is padded to the nearest 32-bit boundary. The ECC status
>> +	 * contains one byte for every ECC chunk, and is also padded to the
>> +	 * nearest 32-bit boundary.
>> +	 */
>> +	metadata_size =3D (geo->metadata_size_in_bytes + 0x3)&  ~0x3;
>> +	status_size   =3D (geo->ecc_chunk_count        + 0x3)&  ~0x3;
>>
> You might use:
> metadata_size =3D ALIGN(geo->metadata_size_in_bytes, 4);
> status_size =3D ALIGN(geo->ecc_chunk_count, 4);
>
thanks.
>> +	geo->auxiliary_size_in_bytes =3D metadata_size + status_size;
>> +	geo->auxiliary_status_offset =3D metadata_size;
>> +
>> +	/* Check if we're going to do block mark swapping. */
>> +	if (!this->swap_block_mark)
>> +		return 0;
>> +
>> +	/*
>> +
>>
>>
>> +
>> +static int mil_pre_bbt_scan(struct gpmi_nfc_data  *this)
>> +{
>> +	struct nand_chip *nand =3D&this->mil.nand;
>> +	struct mtd_info *mtd =3D&this->mil.mtd;
>> +	struct nand_ecclayout *layout =3D nand->ecc.layout;
>> +	struct nfc_hal *nfc =3D this->nfc;
>> +	int error;
>> +
>> +	/* fix the ECC layout before the scanning */
>> +	layout->eccbytes          =3D 0;
>> +	layout->oobavail          =3D mtd->oobsize;
>> +	layout->oobfree[0].offset =3D 0;
>> +	layout->oobfree[0].length =3D mtd->oobsize;
>> +
>> +	mtd->oobavail =3D nand->ecc.layout->oobavail;
>> +
>> +	/* Set up swap block-mark, must be set before the mil_set_geometry()=
 */
>> +	this->swap_block_mark =3D true;
>> +	if (GPMI_IS_MX23(this))
>> +		this->swap_block_mark =3D false;
>>
> if ... else ...?
else is "true" by default.
>> +	/* Set up the medium geometry */
>> +	error =3D mil_set_geometry(this);
>> +	if (error)
>> +		return error;
>> +
>> +	/* extra init */
>> +	if (nfc->extra_init) {
>> +		error =3D nfc->extra_init(this);
>> +		if (error !=3D 0)
>> +			return error;
>> +	}
>> +
>> +	/* NAND boot init, depends on the mil_set_geometry(). */
>> +	return nand_boot_init(this);
>> +}
>> +
>> +static int mil_scan_bbt(struct mtd_info *mtd)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct gpmi_nfc_data *this =3D nand->priv;
>> +	int                      error;
>> +
>> +	/* Prepare for the BBT scan. */
>> +	error =3D mil_pre_bbt_scan(this);
>> +	if (error)
>> +		return error;
>> +
>> +	/* use the default BBT implementation */
>> +	return nand_default_bbt(mtd);
>> +}
>> +
>> +static const char *cmd_parse =3D "cmdlinepart";
>> +static int mil_partitions_init(struct gpmi_nfc_data *this)
>> +{
>> +	struct gpmi_nfc_platform_data *pdata =3D this->pdata;
>> +	struct mil *mil =3D&this->mil;
>> +	struct mtd_info *mtd =3D&mil->mtd;
>> +	int  error =3D 0;
>> +
>> +	/* The complicated partitions layout use this. */
>> +	if (pdata->partitions&&  pdata->partition_count>  0)
>> +		return add_mtd_partitions(mtd, pdata->partitions,
>> +						pdata->partition_count);
>> +
>> +	/* use the command line for simple partitions layout */
>> +	mil->partition_count =3D parse_mtd_partitions(mtd,
>> +						&cmd_parse,
>> +						&mil->partitions, 0);
>> +	if (mil->partition_count)
>> +		error =3D add_mtd_partitions(mtd, mil->partitions,
>> +						mil->partition_count);
>>
> I would do the cmdline parsing first, so that any compiled-in
> partitioning can be overridden with cmdline parameters.
>
ok, thanks.
>> +	return error;
>> +}
>> +
>> +static void mil_partitions_exit(struct gpmi_nfc_data *this)
>> +{
>> +	struct mil *mil =3D&this->mil;
>> +
>> +	if (mil->partition_count) {
>> +		struct mtd_info *mtd =3D&mil->mtd;
>> +
>> +		del_mtd_partitions(mtd);
>> +		kfree(mil->partitions);
>> +		mil->partition_count =3D 0;
>> +	}
>> +}
>> +
>> +/* Initializes the MTD Interface Layer */
>> +int gpmi_nfc_mil_init(struct gpmi_nfc_data *this)
>> +{
>> +	struct gpmi_nfc_platform_data  *pdata =3D  this->pdata;
>> +	struct mil                     *mil   =3D&this->mil;
>> +	struct mtd_info                *mtd   =3D&mil->mtd;
>> +	struct nand_chip               *nand  =3D&mil->nand;
>> +	int                            error;
>> +
>> +	/* Initialize MIL data */
>> +	mil->current_chip	=3D -1;
>> +	mil->command_length	=3D  0;
>> +	mil->page_buffer_virt	=3D  0;
>>
> 	mil->page_buffer_virt	=3D  NULL;
>
>> +	mil->page_buffer_phys	=3D ~0;
>> +	mil->page_buffer_size	=3D  0;
>> +
>> +	/* Initialize the MTD data structures */
>> +	mtd->priv		=3D nand;
>> +	mtd->name		=3D "gpmi-nfc-main";
>>
> Why not 'gpmi-nfc' like the driver name?
>
ok. Yes, the current driver name is a little long.

Best Regards
Huang Shijie
> Lothar Wa=C3=9Fmann
