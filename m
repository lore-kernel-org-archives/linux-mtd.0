Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PABhc-0005AH-QB
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 01:18:21 +0000
Received: by fxm15 with SMTP id 15so1760842fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Oct 2010 18:18:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20101022154030.11097.40767.stgit@dev.siriade.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154030.11097.40767.stgit@dev.siriade.com>
Date: Mon, 25 Oct 2010 09:18:16 +0800
Message-ID: <AANLkTinTpHtLRU_cXYsvc0EmBCcxDG+e1i9bY1Es7=fp@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: cfi_cmdset_0002: add CFI detection for SST
	38VF640x chips
From: yidong zhang <zhangyd6@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: fggs@terra.com.br, linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	w.sang@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 22, 2010 at 11:40 PM, Guillaume LECERF <glecerf@gmail.com> wrot=
e:
> Add support for SST38VF640x chips in CFI mode.
>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> Signed-off-by: yidong zhang <zhangyd6@gmail.com>
> ---
> =A0drivers/mtd/chips/cfi_cmdset_0002.c | =A0 19 +++++++++++++++++++
> =A01 files changed, 19 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index a359967..0248253 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -296,6 +296,21 @@ static void fixup_sst39vf_rev_b(struct mtd_info *mtd=
, void *param)
> =A0 =A0 =A0 =A0sector_erase_cmd =3D CMD(0x50);
> =A0}
>
> +static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd, void *par=
am)
> +{
> + =A0 =A0 =A0 struct map_info *map =3D mtd->priv;
> + =A0 =A0 =A0 struct cfi_private *cfi =3D map->fldrv_priv;
> +
> + =A0 =A0 =A0 fixup_sst39vf_rev_b(mtd, param);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* CFI reports 1024 sectors (0x03ff +1) of 64KBytes (0x01=
00 *256) where
> + =A0 =A0 =A0 =A0* it should report a size of 8KBytes (0x0020 *256).
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 cfi->cfiq->EraseRegionInfo[0] =3D 0x002003ff;
> + =A0 =A0 =A0 pr_warning("%s: Bad 38VF640x CFI data, adjust sector size f=
rom 64 to 8KBytes\n", mtd->name);
> +}
> +
> =A0static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
> =A0{
> =A0 =A0 =A0 =A0struct map_info *map =3D mtd->priv;
> @@ -347,6 +362,10 @@ static struct cfi_fixup cfi_fixup_table[] =3D {
> =A0 =A0 =A0 =A0{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
> =A0 =A0 =A0 =A0{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
> =A0 =A0 =A0 =A0{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
> + =A0 =A0 =A0 { CFI_MFR_SST, 0x536A, fixup_sst38vf640x_sectorsize, NULL, =
}, /* SST38VF6402 */
> + =A0 =A0 =A0 { CFI_MFR_SST, 0x536B, fixup_sst38vf640x_sectorsize, NULL, =
}, /* SST38VF6401 */
> + =A0 =A0 =A0 { CFI_MFR_SST, 0x536C, fixup_sst38vf640x_sectorsize, NULL, =
}, /* SST38VF6404 */
> + =A0 =A0 =A0 { CFI_MFR_SST, 0x536D, fixup_sst38vf640x_sectorsize, NULL, =
}, /* SST38VF6403 */
> =A0#if !FORCE_WORD_WRITE
> =A0 =A0 =A0 =A0{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, =
},
> =A0#endif
The SST38VF640x chips have no Extended Query table. I think we should
move them to the
 cfi_nopri_fixup_table.

>
>
