Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUzUV-0006b6-WF
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 09:26:21 +0000
Received: by bwz4 with SMTP id 4so15369017bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 01:26:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1263372005.2917.21.camel@localhost>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
	<ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
	<1260185336.3047.0.camel@localhost>
	<ce9ab5790912170141s557342d5l4fced74a46a96e5c@mail.gmail.com>
	<ce9ab5791001060548g6075dcd5tb15bcd18c9a4b458@mail.gmail.com>
	<1263372005.2917.21.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 13 Jan 2010 14:55:54 +0530
Message-ID: <ce9ab5791001130125ka4bfa26s906758545e679792@mail.gmail.com>
Subject: Re: [PATCH - V2] Add NAND lock/unlock routines
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2010 at 2:10 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> Hi Vimal,
>
> please, find my nit-picks below :-)
>
> On Wed, 2010-01-06 at 19:18 +0530, Vimal Singh wrote:
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =C2=A0drivers/mtd/nand/nand_base.c | =C2=A0216 +++++++++++++++++++++++++=
++++++++++++++++-
>> =C2=A0include/linux/mtd/nand.h =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +
>> =C2=A02 files changed, 218 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 8f2958f..2ceec1c 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -835,6 +835,218 @@ static int nand_wait(struct mtd_info
>> =C2=A0}
>>
>> =C2=A0/**
>> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
>> + *
>> + * @param mtd - mtd info
>> + * @param ofs - offset to start unlock from
>> + * @param len - length to unlock
>> + * @invert - =C2=A0when =3D 0, unlock the range of blocks within the lo=
wer and
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0upper boundary address
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whne =3D 1, unlock the rang=
e of blocks outside the boundaries
>> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0of the lower and upper boundary address
>> + *
>> + * @return - unlock status
>> + */
>> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t len, int i=
nvert)
>> +{
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 int status, page;
>> + =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> +
>> + =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =
=3D %llu\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
__func__, (unsigned long long)ofs, len);
>> +
>> + =C2=A0 =C2=A0 /* Submit address of first page to unlock */
>> + =C2=A0 =C2=A0 page =3D (int)(ofs >> chip->page_shift);
>
> Why this cast is needed?

I'll remove this.

>
>> + =C2=A0 =C2=A0 chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pa=
gemask);
>> +
>> + =C2=A0 =C2=A0 /* Submit address of last page to unlock */
>> + =C2=A0 =C2=A0 page =3D (int)(ofs + len >> chip->page_shift);
>
> And this?

this too.

>
>> + =C2=A0 =C2=A0 chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((page | invert) & chip->pagemask));
>
> Why the third operand requires additional braces?

i'll correct it.

>
>> +
>> + =C2=A0 =C2=A0 /* Call wait ready function */
>> + =C2=A0 =C2=A0 status =3D chip->waitfunc(mtd, chip);
>> + =C2=A0 =C2=A0 udelay(1000);
>> + =C2=A0 =C2=A0 /* See if device thinks it succeeded */
>> + =C2=A0 =C2=A0 if (status & 0x01) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* There was an error */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Error status =3D 0x%08x\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, status);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +/**
>> + * nand_unlock - [REPLACABLE] unlocks specified locked blockes
>> + *
>> + * @param mtd - mtd info
>> + * @param ofs - offset to start unlock from
>> + * @param len - length to unlock
>> + *
>> + * @return - unlock status
>> + */
>> +static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +{
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 int chipnr;
>> + =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> +
>> + =C2=A0 =C2=A0 /* Start address must align on block boundary */
>> + =C2=A0 =C2=A0 if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Unaligned address\n", __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* Length must align on block boundary */
>> + =C2=A0 =C2=A0 if (len & ((1 << chip->phys_erase_shift) - 1)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Length not block aligned\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* Do not allow past end of device */
>> + =C2=A0 =C2=A0 if (ofs + len > mtd->size) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Past end of device\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>
> To make this nicely, you need to create a helper for checking. And then
> try to use that helper for other functions as well.

Next time I'll have a patch set where 1st patch will be this one and
2nd will do helper function work.

>
>> +
>> + =C2=A0 =C2=A0 /* Align to last block address if size addresses end of =
the device */
>> + =C2=A0 =C2=A0 if (ofs + len =3D=3D mtd->size)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D mtd->erasesize;
>> +
>> + =C2=A0 =C2=A0 /* Grab the lock and see if the device is available */
>> + =C2=A0 =C2=A0 nand_get_device(chip, mtd, FL_UNLOCKING);
>
> I understand that you copied some pieces of code. But I think the
> comment about is very redundant. It repeats everywhere, and comments an
> obvious thing.

OK, Removing these in next version of the patch.

>
>> +
>> + =C2=A0 =C2=A0 /* Shift to get chip number */
>> + =C2=A0 =C2=A0 chipnr =3D (int)(ofs >> chip->chip_shift);
>> +
>> + =C2=A0 =C2=A0 /* Select the NAND device */
>> + =C2=A0 =C2=A0 chip->select_chip(mtd, chipnr);
>
> This is a similar on, IMHO.

this one too.

>
>> +
>> + =C2=A0 =C2=A0 /* Check, if it is write protected */
>> + =C2=A0 =C2=A0 if (nand_check_wp(mtd)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Device is write protected!!!\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 ret =3D __nand_unlock(mtd, ofs, len, 0);
>> +
>> +out:
>> + =C2=A0 =C2=A0 /* de-select the NAND device */
>> + =C2=A0 =C2=A0 chip->select_chip(mtd, -1);
>> +
>> + =C2=A0 =C2=A0 /* Deselect and wake up anyone waiting on the device */
>> + =C2=A0 =C2=A0 nand_release_device(mtd);
> And the above 2.
>
> And similar useless comments are in the 'lock' function..

I'll take care of these, everywhere else.

>
>> +
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +/**
>> + * nand_lock - [REPLACABLE] locks all blockes present in the device
>> + *
>> + * @param mtd - mtd info
>> + * @param ofs - offset to start unlock from
>> + * @param len - length to unlock
>> + *
>> + * @return - lock status
>> + *
>> + * This feature is not support in many NAND parts. 'Micron' NAND parts
>> + * do have this feature, but it allows only to lock all blocks not for
>> + * specified range for block.
>> + *
>> + * Implementing 'lock' feature by making use of 'unlock', for now.
>> + */
>> +static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +{
>> + =C2=A0 =C2=A0 int ret =3D 0;
>> + =C2=A0 =C2=A0 int chipnr, status, page;
>> + =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> +
>> + =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =
=3D %llu\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
__func__, (unsigned long long)ofs, len);
>> +
>> + =C2=A0 =C2=A0 /* Start address must align on block boundary */
>> + =C2=A0 =C2=A0 if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Unaligned address\n", __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* Length must align on block boundary */
>> + =C2=A0 =C2=A0 if (len & ((1 << chip->phys_erase_shift) - 1)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Length not block aligned\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* Do not allow past end of device */
>> + =C2=A0 =C2=A0 if (ofs + len > mtd->size) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Past end of device\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>
> Repeated pattern, needs a helper function.

same comment as I said before about this.

>
>> +
>> + =C2=A0 =C2=A0 /* Grab the lock and see if the device is available */
>> + =C2=A0 =C2=A0 nand_get_device(chip, mtd, FL_LOCKING);
>> +
>> + =C2=A0 =C2=A0 /* Shift to get first page */
>> + =C2=A0 =C2=A0 page =3D (int)(ofs >> chip->page_shift);
>> + =C2=A0 =C2=A0 chipnr =3D (int)(ofs >> chip->chip_shift);
>> +
>> + =C2=A0 =C2=A0 /* Select the NAND device */
>> + =C2=A0 =C2=A0 chip->select_chip(mtd, chipnr);
>> +
>> + =C2=A0 =C2=A0 /* Check, if it is write protected */
>> + =C2=A0 =C2=A0 if (nand_check_wp(mtd)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Device is write protected!!!\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D MTD_ERASE_FAILED;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* Submit address of first page to unlock */
>> + =C2=A0 =C2=A0 page =3D (int)(ofs >> chip->page_shift);
>> + =C2=A0 =C2=A0 chip->cmdfunc(mtd, NAND_CMD_LOCK, -1, page & chip->pagem=
ask);
>> +
>> + =C2=A0 =C2=A0 /* Call wait ready function */
>> + =C2=A0 =C2=A0 status =3D chip->waitfunc(mtd, chip);
>> + =C2=A0 =C2=A0 udelay(1000);
>> + =C2=A0 =C2=A0 /* See if device thinks it succeeded */
>> + =C2=A0 =C2=A0 if (status & 0x01) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* There was an error */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBUG(MTD_DEBUG_LEVEL0, "%s:=
 Error status =3D 0x%08x\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, status);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (len !=3D -1)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D __nand_unlock(mtd, o=
fs, len, 0x1);
>> +
>> +out:
>> + =C2=A0 =C2=A0 /* de-select the NAND device */
>> + =C2=A0 =C2=A0 chip->select_chip(mtd, -1);
>> +
>> + =C2=A0 =C2=A0 /* Deselect and wake up anyone waiting on the device */
>> + =C2=A0 =C2=A0 nand_release_device(mtd);
>> +
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +/**
>> =C2=A0 * nand_read_page_raw - [Intern] read raw page data without ecc
>> =C2=A0 * @mtd: =C2=A0 =C2=A0 mtd info structure
>> =C2=A0 * @chip: =C2=A0 =C2=A0nand chip info structure
>> @@ -2999,8 +3211,8 @@ int nand_scan_tail(struct mtd_info *mtd)
>> =C2=A0 =C2=A0 =C2=A0 mtd->read_oob =3D nand_read_oob;
>> =C2=A0 =C2=A0 =C2=A0 mtd->write_oob =3D nand_write_oob;
>> =C2=A0 =C2=A0 =C2=A0 mtd->sync =3D nand_sync;
>> - =C2=A0 =C2=A0 mtd->lock =3D NULL;
>> - =C2=A0 =C2=A0 mtd->unlock =3D NULL;
>> + =C2=A0 =C2=A0 mtd->lock =3D nand_lock;
>> + =C2=A0 =C2=A0 mtd->unlock =3D nand_unlock;
>
> What makes you believe it is safe to assign these call-backs here?
>
> AFAICS, this means it will be done for all flashes. Do all of them
> support lock/unlock? I did not investigate this, but I think that
> probably not.

OK. In that case I'll rather not do it here and do it in my specific driver=
.

--
Thanks,
Vimal

>
>
>> =C2=A0 =C2=A0 =C2=A0 mtd->suspend =3D nand_suspend;
>> =C2=A0 =C2=A0 =C2=A0 mtd->resume =3D nand_resume;
>> =C2=A0 =C2=A0 =C2=A0 mtd->block_isbad =3D nand_block_isbad;
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index ccab9df..698eada 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -82,6 +82,10 @@ extern void nand_wait_ready(struct mtd_info *mtd);
>> =C2=A0#define NAND_CMD_ERASE2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00xd0
>> =C2=A0#define NAND_CMD_RESET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0xff
>>
>> +#define NAND_CMD_LOCK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x2a
>> +#define NAND_CMD_UNLOCK1 =C2=A0 =C2=A0 0x23
>> +#define NAND_CMD_UNLOCK2 =C2=A0 =C2=A0 0x24
>> +
>> =C2=A0/* Extended commands for large page devices */
>> =C2=A0#define NAND_CMD_READSTART =C2=A0 0x30
>> =C2=A0#define NAND_CMD_RNDOUTSTART 0xE0
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>



--=20
Regards,
Vimal Singh
