Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV39e-0008Kz-JP
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 13:21:03 +0000
Received: by bwz4 with SMTP id 4so15521408bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 05:20:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791001130506g28bb330dm79225c688839323d@mail.gmail.com>
References: <ce9ab5791001130453md91ad46ld84f9d51ccd96e87@mail.gmail.com>
	<ce9ab5791001130506g28bb330dm79225c688839323d@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 13 Jan 2010 18:50:37 +0530
Message-ID: <ce9ab5791001130520u6cbf0d9cx1f3fd16df31354d@mail.gmail.com>
Subject: Re: [PATCH 2/2] Creating helper func for block alignment verfication
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please drop this patch. This patch breaks compilation. My bad...
I will be posting new version of this patch soon.

I apology for creating noise.

-vimal

On Wed, Jan 13, 2010 at 6:36 PM, Vimal Singh <vimal.newwork@gmail.com> wrot=
e:
> On Wed, Jan 13, 2010 at 6:23 PM, Vimal Singh <vimal.newwork@gmail.com> wr=
ote:
>> From cde21be80002b49fb8baeb341e8ae5a1a2394cb6 Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Wed, 13 Jan 2010 18:11:47 +0530
>> Subject: [PATCH] Creating helper func for block alignment verfication
>>
>> These checks are fairly common in 'nand_erase_nand', 'nand_lock'
>> and 'nand_unlock' fucntions.
>>
>
> I just ran checkpatch.pl and this patch had an error.
> Corrected patch is below.
>
> -vimal
>
> From 310f7faa8f319bd9384512f7d5a7f13dcfbeebc8 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Wed, 13 Jan 2010 18:11:47 +0530
> Subject: [PATCH] Creating helper func for block alignment verfication
>
> These checks are fairly common in 'nand_erase_nand', 'nand_lock'
> and 'nand_unlock' functions.
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 97 +++++++++++++++-----------------=
----------
> =A01 files changed, 34 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4e27426..c80cec5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -108,6 +108,37 @@ static int nand_do_write_oob(struct
> =A0*/
> =A0DEFINE_LED_TRIGGER(nand_led_trigger);
>
> +static int block_alignment_verification(struct mtd_info *mtd,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 loff_t ofs, uint64_t len)
> +{
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> +
> + =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =3D %=
llu\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long lo=
ng)ofs, len);
> +
> + =A0 =A0 =A0 /* Start address must align on block boundary */
> + =A0 =A0 =A0 if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned addr=
ess\n", __func__);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Length must align on block boundary */
> + =A0 =A0 =A0 if (len & ((1 << chip->phys_erase_shift) - 1)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not blo=
ck aligned\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Do not allow past end of device */
> + =A0 =A0 =A0 if (ofs + len > mtd->size) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of de=
vice\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0/**
> =A0* nand_release_device - [GENERIC] release chip
> =A0* @mtd: =A0 =A0 =A0 MTD device structure
> @@ -894,28 +925,8 @@ int nand_unlock(struct mtd_info
> =A0 =A0 =A0 =A0int chipnr;
> =A0 =A0 =A0 =A0struct nand_chip *chip =3D mtd->priv;
>
> - =A0 =A0 =A0 /* Start address must align on block boundary */
> - =A0 =A0 =A0 if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned addr=
ess\n", __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Length must align on block boundary */
> - =A0 =A0 =A0 if (len & ((1 << chip->phys_erase_shift) - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not blo=
ck aligned\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 if (block_alignment_verification(mtd, ofs, len))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Do not allow past end of device */
> - =A0 =A0 =A0 if (ofs + len > mtd->size) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of de=
vice\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> - =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/* Align to last block address if size addresses end of th=
e device */
> =A0 =A0 =A0 =A0if (ofs + len =3D=3D mtd->size)
> @@ -968,31 +979,8 @@ int nand_lock(struct mtd_info
> =A0 =A0 =A0 =A0int chipnr, status, page;
> =A0 =A0 =A0 =A0struct nand_chip *chip =3D mtd->priv;
>
> - =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =3D %=
llu\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long lo=
ng)ofs, len);
> -
> - =A0 =A0 =A0 /* Start address must align on block boundary */
> - =A0 =A0 =A0 if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned addr=
ess\n", __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Length must align on block boundary */
> - =A0 =A0 =A0 if (len & ((1 << chip->phys_erase_shift) - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not blo=
ck aligned\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 if (block_alignment_verification(mtd, ofs, len))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Do not allow past end of device */
> - =A0 =A0 =A0 if (ofs + len > mtd->size) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of de=
vice\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> - =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0nand_get_device(chip, mtd, FL_LOCKING);
>
> @@ -2495,25 +2483,8 @@ int nand_erase_nand(struct
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, =
(unsigned long long)instr->addr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(unsigned =
long long)instr->len);
>
> - =A0 =A0 =A0 /* Start address must align on block boundary */
> - =A0 =A0 =A0 if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned addr=
ess\n", __func__);
> + =A0 =A0 =A0 if (block_alignment_verification(mtd, instr->addr, instr->l=
en))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Length must align on block boundary */
> - =A0 =A0 =A0 if (instr->len & ((1 << chip->phys_erase_shift) - 1)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not blo=
ck aligned\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Do not allow erase past end of device */
> - =A0 =A0 =A0 if ((instr->len + instr->addr) > mtd->size) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Erase past end=
 of device\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> - =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0instr->fail_addr =3D MTD_FAIL_ADDR_UNKNOWN;
>
> --
> 1.5.5
>



--=20
Regards,
Vimal Singh
