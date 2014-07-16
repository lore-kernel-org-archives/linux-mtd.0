Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7K0F-0003AX-49
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 07:51:52 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8S003RNOHPLK80@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 16:51:26 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Bean Huo' <beanhuo@outlook.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com
References: <BLU185-W10713E955F9530C4D53490A6F70@phx.gbl>
 <BLU185-W62B0858FCD7D3A71127B41A6F70@phx.gbl>
In-reply-to: <BLU185-W62B0858FCD7D3A71127B41A6F70@phx.gbl>
Subject: Re: [PATCH v5] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 16 Jul 2014 16:51:25 +0900
Message-id: <002201cfa0ca$be634b10$3b29e130$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-language: ko
Cc: b32955@freescale.com, artem.bityutskiy@linux.intel.com,
 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 paul.gortmaker@windriver.com, linux-mtd@lists.infradead.org,
 christian.riesch@omicron.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, July 16, 2014 4:19 PM, Bean Huo wrote:
>=20
> For some Norflashes,the size of the buffer program has been
> increased from 256 bytes to 512 bytes,2ms maximum timeout can
> not adapt to all the different vendor's norflash.There maximum
> timeout information in the CFI area,so the best way is to choose
> the result calculated according to timeout field of struct cfi_ident
> that probed from norflash's CFI aera.This is also a standard defined
> by CFI.If haven't probed this information,or smaller than 2000us,then
> specify a defualt value 2000us.
>=20
> Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash =
devices.
>=20
> Signed-off-by: bean huo <beanhuo@outlook.com>
> ---
> changes
> 	v1->v2:Deleted unused parameters in this patch
> 		(word_write_time_max and erase_time_max).Using usecs_to_jiffies
> 		instead of msecs_to_jiffies for convert timeout value into jiffies.
> 	v2->v3:Removed unnecessary messages form comments and deleted =
trailing whitespace.
> 	V3->v4:If haven't probed timeout information,or smaller than =
2000us,specify default
> 	 =A0 =A0 =A0 2000us.
> 	v4->v5:add one whitespace
> =A0drivers/mtd/chips/cfi_cmdset_0002.c | =A0 28 =
++++++++++++++++++++++++++--
> =A01 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c =
b/drivers/mtd/chips/cfi_cmdset_0002.c
> index e21fde9..c248a8c 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -628,6 +628,24 @@ struct mtd_info *cfi_cmdset_0002(struct map_info =
*map, int primary)
> =A0		cfi->chips[i].word_write_time =3D =
1<<cfi->cfiq->WordWriteTimeoutTyp;
> =A0		cfi->chips[i].buffer_write_time =3D =
1<<cfi->cfiq->BufWriteTimeoutTyp;
> =A0		cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTimeoutTyp;
> +		/*
> +		 * First calculate the timeout max according to timeout
> +		 * field of struct cfi_ident that probed from chip's CFI
> +		 * aera.If haven't probed this information,or smaller than
> +		 * 2000us,we will specify defualt value 2000us,and the time
> +		 * unit is us.
> +		 */
> +		if (cfi->cfiq->BufWriteTimeoutTyp &&
> +			cfi->cfiq->BufWriteTimeoutMax){
> +			cfi->chips[i].buffer_write_time_max =3D
> +				1<<(cfi->cfiq->BufWriteTimeoutTyp +
> +					cfi->cfiq->BufWriteTimeoutMax);
> +			} else {
> +				cfi->chips[i].buffer_write_time_max =3D 0;
> +				}

Please keep the coding style as below.

		if ( ) {
			...
		} else {
			...
		}

Best regards,
Jingoo Han

> +		cfi->chips[i].buffer_write_time_max =3D
> +			((cfi->chips[i].buffer_write_time_max>=3D 2000)
> +			 ? cfi->chips[i].buffer_write_time_max : 2000);
> =A0		cfi->chips[i].ref_point_counter =3D 0;
> =A0		init_waitqueue_head(&(cfi->chips[i].wq));
> =A0	}
> @@ -1462,8 +1480,14 @@ static int __xipram do_write_buffer(struct =
map_info *map, struct flchip *chip,
> =A0{
> =A0	struct cfi_private *cfi =3D map->fldrv_priv;
> =A0	unsigned long timeo =3D jiffies + HZ;
> -	/* see comments in do_write_oneword() regarding uWriteTimeo. */
> -	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> +	/*
> +	 * Use the result that calculated according to timeout field
> +	 * of struct cfi_ident that probed from norflash's CFI aera.
> +	 * See more comments in cfi_cmdset_0002().uWriteTimeout is
> +	 * used for timeout step,it must be concerted into jiffies.
> +	 */
> +	unsigned long uWriteTimeout =3D
> +				usecs_to_jiffies(chip->buffer_write_time_max);
> =A0	int ret =3D -EIO;
> =A0	unsigned long cmd_adr;
> =A0	int z, words;
> --
> 1.7.9.5 		 	   		  =3D
