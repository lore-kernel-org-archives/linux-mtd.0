Received: from mail-vw0-f186.google.com ([209.85.212.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mv67L-0002MD-CQ
	for linux-mtd@lists.infradead.org; Tue, 06 Oct 2009 09:14:04 +0000
Received: by vws16 with SMTP id 16so3019655vws.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Oct 2009 02:13:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1254819360-17191-2-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1254819360-17191-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1254819360-17191-2-git-send-email-ext-mika.2.korhonen@nokia.com>
Date: Tue, 6 Oct 2009 18:13:57 +0900
Message-ID: <9c9fda240910060213s7a2eff22icbf5d5f81431eb48@mail.gmail.com>
Subject: Re: [PATCH 1/2] MTD: OneNAND: move erase method to a separate
	function
From: Kyungmin Park <kmpark@infradead.org>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: amul.saha@samsung.com, artem.bityutskiy@nokia.com,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 6, 2009 at 5:55 PM, Mika Korhonen
<ext-mika.2.korhonen@nokia.com> wrote:
> Separate the actual execution of erase to a new function:
> onenand_block_by_block_erase(). This is done in preparation for
> the multiblock erase support.
>
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0143 +++++++++++++++++++++-----=
----------
> =A01 files changed, 84 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index ff66e43..13090f3 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2141,77 +2141,43 @@ static int onenand_block_isbad_nolock(struct mtd_=
info *mtd, loff_t ofs, int allo
> =A0}
>
> =A0/**
> - * onenand_erase - [MTD Interface] erase block(s)
> + * onenand_block_by_block_erase - [Internal] erase block(s) using regula=
r erase
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0* @param instr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0erase instruction
> + * @param region =A0 =A0 =A0 erase region
> + * @param block_size =A0 erase block size
> =A0*
> - * Erase one ore more blocks
> + * Erase one or more blocks one block at a time
> =A0*/
> -static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
> +static int onenand_block_by_block_erase(struct mtd_info *mtd,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct erase_info *instr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct mtd_erase_region_info *region,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned int block_size)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> - =A0 =A0 =A0 unsigned int block_size;
> =A0 =A0 =A0 =A0loff_t addr =3D instr->addr;
> - =A0 =A0 =A0 loff_t len =3D instr->len;
> - =A0 =A0 =A0 int ret =3D 0, i;
> - =A0 =A0 =A0 struct mtd_erase_region_info *region =3D NULL;
> + =A0 =A0 =A0 int len =3D instr->len;
> =A0 =A0 =A0 =A0loff_t region_end =3D 0;
> + =A0 =A0 =A0 int ret =3D 0;
>
> - =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start =3D 0x%012llx=
, len =3D %llu\n", (unsigned long long) instr->addr, (unsigned long long) i=
nstr->len);
> -
> - =A0 =A0 =A0 /* Do not allow erase past end of device */
> - =A0 =A0 =A0 if (unlikely((len + addr) > mtd->size)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Erase past =
end of device\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (FLEXONENAND(this)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Find the eraseregion of this address */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D flexonenand_region(mtd, addr);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 region =3D &mtd->eraseregions[i];
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D region->erasesize;
> + =A0 =A0 =A0 if (region) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* region is set for Flex-OneNAND */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0region_end =3D region->offset + region->er=
asesize * region->numblocks;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start address within region must align o=
n block boundary.
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Erase region's start offset is always =
block start address.
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely((addr - region->offset) & (blo=
ck_size - 1))) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Unaligned address\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D 1 << this->erase_shift;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start address must align on block bounda=
ry */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(addr & (block_size - 1))) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Unaligned address\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Length must align on block boundary */
> - =A0 =A0 =A0 if (unlikely(len & (block_size - 1))) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Length not =
block aligned\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 instr->fail_addr =3D MTD_FAIL_ADDR_UNKNOWN;
> -
> - =A0 =A0 =A0 /* Grab the lock and see if the device is available */
> - =A0 =A0 =A0 onenand_get_device(mtd, FL_ERASING);
> -
> - =A0 =A0 =A0 /* Loop through the blocks */
> =A0 =A0 =A0 =A0instr->state =3D MTD_ERASING;
>
> + =A0 =A0 =A0 /* Loop through the blocks */
> =A0 =A0 =A0 =A0while (len) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cond_resched();
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Check if we have a bad block, we do not=
 erase bad blocks */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (onenand_block_isbad_nolock(mtd, addr, =
0)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk (KERN_WARNING "onena=
nd_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long=
 long) addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "onenan=
d_block_by_block_erase: "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"attempt to =
erase a bad block at addr "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"0x%012llx\n=
", (unsigned long long) addr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0instr->state =3D MTD_ERASE=
_FAILED;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto erase_exit;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->command(mtd, ONENAND_CMD_ERASE, addr=
, block_size);
> @@ -2221,11 +2187,12 @@ static int onenand_erase(struct mtd_info *mtd, st=
ruct erase_info *instr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D this->wait(mtd, FL_ERASING);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Check, if it is write protected */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Failed erase, block %d\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0onenand_block(this, addr));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_bl=
ock_by_block_erase: "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Failed eras=
e, block %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_bloc=
k(this, addr));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0instr->state =3D MTD_ERASE=
_FAILED;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0instr->fail_addr =3D addr;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto erase_exit;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len -=3D block_size;
> @@ -2241,24 +2208,82 @@ static int onenand_erase(struct mtd_info *mtd, st=
ruct erase_info *instr)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (len & (block_size - 1)=
) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* FIXME: =
This should be handled at MTD partitioning level. */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_erase: Unaligned address\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto erase_=
exit;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_block_by_block_erase: "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0"Unaligned address\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +
> +/**
> + * onenand_erase - [MTD Interface] erase block(s)
> + * @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> + * @param instr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0erase instruction
> + *
> + * Erase one or more blocks
> + */
> +static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 unsigned int block_size;
> + =A0 =A0 =A0 loff_t addr =3D instr->addr;
> + =A0 =A0 =A0 loff_t len =3D instr->len;
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 struct mtd_erase_region_info *region =3D NULL;
> + =A0 =A0 =A0 loff_t region_offset =3D 0;
> +
> + =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start=3D0x%012llx, =
len=3D%llu\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 (unsigned long long) instr->addr,
> + =A0 =A0 =A0 =A0 =A0 =A0 (unsigned long long) instr->len);
> +
> + =A0 =A0 =A0 /* Do not allow erase past end of device */
> + =A0 =A0 =A0 if (unlikely((len + addr) > mtd->size)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Erase past =
end of device\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Find the eraseregion of this address */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int i =3D flexonenand_region(mtd, addr);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 region =3D &mtd->eraseregions[i];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D region->erasesize;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start address within region must align o=
n block boundary.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Erase region's start offset is always =
block start address.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 region_offset =3D region->offset;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D 1 << this->erase_shift;
> + =A0 =A0 =A0 }

No { } here.

>
> + =A0 =A0 =A0 /* Start address must align on block boundary */
> + =A0 =A0 =A0 if (unlikely((addr - region_offset) & (block_size - 1))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Unaligned a=
ddress\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 instr->state =3D MTD_ERASE_DONE;
> + =A0 =A0 =A0 /* Length must align on block boundary */
> + =A0 =A0 =A0 if (unlikely(len & (block_size - 1))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Length not =
block aligned\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 instr->fail_addr =3D MTD_FAIL_ADDR_UNKNOWN;
>
> -erase_exit:
> + =A0 =A0 =A0 /* Grab the lock and see if the device is available */
> + =A0 =A0 =A0 onenand_get_device(mtd, FL_ERASING);
>
> - =A0 =A0 =A0 ret =3D instr->state =3D=3D MTD_ERASE_DONE ? 0 : -EIO;
> + =A0 =A0 =A0 ret =3D onenand_block_by_block_erase(mtd, instr, region, bl=
ock_size);
>
> =A0 =A0 =A0 =A0/* Deselect and wake up anyone waiting on the device */
> =A0 =A0 =A0 =A0onenand_release_device(mtd);
>
> =A0 =A0 =A0 =A0/* Do call back function */
> =A0 =A0 =A0 =A0if (!ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 instr->state =3D MTD_ERASE_DONE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd_erase_callback(instr);

Are you missing curly braces { } here?

Thank you
Kyungmin Park
