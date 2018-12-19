Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZcOW-0004dV-Td
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 14:00:19 +0000
From: "Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>, "Bean Huo (beanhuo)"
 <beanhuo@micron.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: RE: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 19 Dec 2018 13:59:49 +0000
Message-ID: <SN6PR08MB502421AE43E6824C3CC5C1E4CBBE0@SN6PR08MB5024.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20181219141732.3e09bdc9@bbrezillon>
In-Reply-To: <20181219141732.3e09bdc9@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Are there  non UBI/UBIFS cases?
Can you please be specific?
Zoltan=20

-----Original Message-----
From: Boris Brezillon [mailto:bbrezillon@kernel.org]=20
Sent: Mittwoch, 19. Dezember 2018 14:18
To: Bean Huo (beanhuo) <beanhuo@micron.com>
Cc: linux-mtd@lists.infradead.org; Miquel Raynal <miquel.raynal@bootlin.com=
>; Richard Weinberger <richard@nod.at>; Zoltan Szubbocsev (zszubbocsev) <zs=
zubbocsev@micron.com>; tglx@linutronix.de
Subject: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block

Hi Bean

On Wed, 19 Dec 2018 11:03:06 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> On some legacy planar 2D Micron NAND devices when a block erase=20
> command is issued, occasionally even though a block erase operation=20
> successfully completes and returns a pass status, the flash block may=20
> not be completely erased.
> Subsequent operations to this block on very rare cases can result in=20
> subtle failures or corruption. These extremely rare cases should=20
> nevertheless be considered.
>=20
> These rare occurrences have been observed on partially written blocks.=20
> Partially written blocks are not uncommon with UBI/UBIFS.
>=20
> To avoid this rare occurrence, we make sure that at least 15 pages=20
> have been programmed to a block before it is erased. In case we find=20
> that less than 15 pages have been programmed, additional pages are=20
> programmed in the block. The observation is that additional pages=20
> rarely need to be written and most of the time UBI/UBIFS erases blocks=20
> that contain more programmed pages.

Okay, so 15 is the right number :-). Can you tell us which parts are potent=
ially impacted by this problem?

Regarding the patch itself, it's breaking the layering we have in MTD/UBI/U=
BIFS and does not address the non-UBI/UBIFS case, so I don't think we'll go=
 for this approach. But that's good to have Micron's feedback on this issue=
.

Thanks,

Boris

>=20
> Signed-off-by: beanhuo <beanhuo@micron.com>
> Reviewed-by:  ZOLTAN SZUBBOCSEV < zszubbocsev@micron.com>
> ---
>  drivers/mtd/mtdcore.c | 125=20
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdcore.h |  16 +++++++
>  2 files changed, 141 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c index=20
> 8bbbb75..b3879b5 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -801,6 +801,127 @@ void __put_mtd_device(struct mtd_info *mtd)  } =20
> EXPORT_SYMBOL_GPL(__put_mtd_device);
> =20
> +static int mtd_check_pattern(const void *buf, uint8_t patt, int size)=20
> +{
> +	int i;
> +
> +	for (i =3D 0; i < size; i++)
> +		if (((const uint8_t *)buf)[i] !=3D patt)
> +			return 0;
> +	return 1;
> +}
> +
> +static int checkup_partial_filling(struct mtd_info *mtd, struct=20
> +erase_info *instr) {
> +	int retlen;
> +	int ret;
> +	u_char * data_buf, * oob_buf;
> +	uint32_t empty_page_mask =3D 0;
> +	uint32_t programmed_page =3D 0;
> +	loff_t addr;
> +	int nextpage =3D LAST_CHECKPU_PAGE; /* We defined the maximum page to c=
heck is page14,
> +	                      first page is page0*/
> +	int cur_page =3D 0;
> +	ret =3D 0;
> +
> +	if ((mtd->type !=3D MTD_NANDFLASH) && (mtd->type !=3D MTD_MLCNANDFLASH)=
)
> +		return 0; /* Only works on NAND */
> +
> +	data_buf =3D kmalloc(mtd->writesize, GFP_KERNEL);
> +	oob_buf =3D kmalloc(mtd->oobsize, GFP_KERNEL);
> +	addr =3D instr->addr; /* this is page0 address*/
> +
> +	if (data_buf)
> +	    memset(data_buf, 0xff, mtd->writesize);
> +	else
> +	    goto end;
> +	if (oob_buf)
> +	    memset(oob_buf, 0x00, mtd->oobsize);
> +	else
> +	    goto end;
> +
> +	for( ; nextpage > 0; ) {
> +		ret =3D mtd_read(mtd, addr, mtd->writesize, &retlen, data_buf);
> +		if ((ret) || (retlen !=3D mtd->writesize))
> +			goto next; /* Read error, currently, we directly skip it */
> +
> +		if (mtd_check_pattern(data_buf, 0xff, retlen)) {
> +			if (cur_page =3D=3D 0)
> +			    break; /* page 0 is empty, skip block filling checkup */
> +
> +			/* Mark page need to program later */
> +			empty_page_mask |=3D (1 << cur_page);
> +		} else {
> +			programmed_page |=3D (1 << cur_page);
> +			if (LAST_CHECKPU_PAGE !=3D nextpage)
> +		/*
> +		 * Because we checked page0 firstly, at this time the nextpage
> +		 * is page13. And if page0 is programmed, then we start to
> +		 * check from page13,page11,page9...,page3,respectively.
> +		 * We olny check odd page. So if the nextpage is not page13
> +		 * and cur_page is programmed, we consider that the current
> +		 * cur_page is the last programmed page since the pages of PEB
> +		 * are programmed sequentially.
> +		*/
> +			break;
> +		}
> +next:
> +		addr =3D instr->addr + mtd->writesize * nextpage;
> +		cur_page =3D nextpage;
> +		if (nextpage > 1)
> +			nextpage =3D ((nextpage % 2) ? (nextpage - 2) : (nextpage - 1));
> +		else
> +			break;
> +	}
> +
> +	if (empty_page_mask =3D=3D 0x00)
> +		goto end;
> +
> +	int i;
> +	struct ubifs_filling_head * filling =3D data_buf;
> +	filling->magic =3D 0x00000000;
> +	filling->sqnum =3D 0;
> +	filling->node_type =3D 0xCE;
> +	filling->group_type =3D 0;
> +	filling->padding[0] =3D filling->padding[1] =3D 0xAA;
> +	filling->len =3D cpu_to_le32(UBIFS_PEB_PAD_NODE_SZ);
> +	int pad  =3D mtd->writesize - UBIFS_PEB_PAD_NODE_SZ;
> +	filling->pad_len =3D cpu_to_le32(pad);
> +	filling->crc =3D 0x00000000;
> +	memset(data_buf + UBIFS_PEB_PAD_NODE_SZ, 0xAA, pad);
> +
> +    struct mtd_oob_ops ops;
> +    ops.mode =3D MTD_OPS_RAW;
> +    ops.len =3D 0;
> +    ops.ooblen =3D mtd->oobsize - 16;
> +    ops.ooboffs =3D 16;
> +    ops.datbuf =3D NULL;
> +    ops.oobbuf =3D oob_buf;
> +=20
> +	empty_page_mask|=3D0x3;
> +	/* Always over-write EC and VID pages with a wrong EC/VID magic=20
> +bytes. */
> +
> +	for ( i =3D 0; i <=3D LAST_CHECKPU_PAGE ; ) {
> +        /* Start to program  filling data into empty page,
> +	   we only program the odd page. */
> +		if (empty_page_mask & (1 << i)) {
> +			addr =3D instr->addr + mtd->writesize * i;
> +            if ((i =3D=3D 0) || (i =3D=3D 1)) {
> +            ret =3D mtd_write(mtd, addr, mtd->writesize, &retlen, data_b=
uf);
> +            ret =3D mtd->_write_oob(mtd, addr, &ops); /* clear OOB */
> +            } else
> +            ret =3D mtd_write(mtd, addr, mtd->writesize, &retlen, data_b=
uf);
> +		}
> +		if (i =3D=3D 0)
> +		i =3D 1;
> +		else
> +		i +=3D 2;
> +	}
> +end:
> +	kfree(data_buf);
> +	kfree(oob_buf);
> +	return 0;
> +}
>  /*
>   * Erase is an asynchronous operation.  Device drivers are supposed
>   * to call instr->callback() whenever the operation completes, even=20
> @@ -820,6 +941,10 @@ int mtd_erase(struct mtd_info *mtd, struct erase_inf=
o *instr)
>  		mtd_erase_callback(instr);
>  		return 0;
>  	}
> +
> +#ifdef PARTIAL_FILLING_CHECKUP
> +    checkup_partial_filling(mtd, instr); #endif
>  	return mtd->_erase(mtd, instr);
>  }
>  EXPORT_SYMBOL_GPL(mtd_erase);
> diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h index=20
> 7b03533..0e5ad67 100644
> --- a/drivers/mtd/mtdcore.h
> +++ b/drivers/mtd/mtdcore.h
> @@ -5,6 +5,22 @@
> =20
>  extern struct mutex mtd_table_mutex;
> =20
> +#define PARTIAL_FILLING_CHECKUP 1 /* Used to turn on/off partial filling
> +		 block checkup before erasing this block.*/ #define=20
> +LAST_CHECKPU_PAGE 13 struct ubifs_filling_head {
> +	__le32 magic;
> +	__le32 crc;
> +	__le64 sqnum;
> +	__le32 len;
> +	__u8 node_type;
> +	__u8 group_type;
> +	__u8 padding[2];
> +	__le32 pad_len;
> +} __packed;
> +
> +#define UBIFS_PEB_PAD_NODE_SZ  sizeof(struct ubifs_filling_head)
> +
>  struct mtd_info *__mtd_next_device(int i);  int add_mtd_device(struct=20
> mtd_info *mtd);  int del_mtd_device(struct mtd_info *mtd);
