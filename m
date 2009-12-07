Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHXOa-0004Ac-1y
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 06:48:37 +0000
Received: by bwz4 with SMTP id 4so3449181bwz.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Dec 2009 22:48:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1259915925.8673.9.camel@localhost>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 7 Dec 2009 12:18:08 +0530
Message-ID: <ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
Subject: Re: [RFC][PATCH] Add NAND lock/unlock routines
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, Dec 4, 2009 at 2:08 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> Hi, some cosmetic comments:
>
> On Wed, 2009-12-02 at 19:54 +0530, Vimal Singh wrote:
>> I am not sure how useful it will be, but still here is a patch for revie=
w.
>> -vimal
>>
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Tue, 24 Nov 2009 18:26:43 +0530
>> Subject: [PATCH] Add NAND lock/unlock routines
>>
>> At least 'Micron' NAND parts have lock/unlock feature.
>> Adding routines for this.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =A0drivers/mtd/nand/nand_base.c | =A0217 +++++++++++++++++++++++++++++++=
++++++++++-
>> =A0include/linux/mtd/nand.h =A0 =A0 | =A0 =A06 +
>> =A02 files changed, 221 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 2957cc7..e447c24 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -757,6 +757,218 @@ static int nand_wait(struct mtd_info *mtd,
>> struct nand_chip *chip)
>> =A0}
>>
>> =A0/**
>> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
>> + *
>> + * @param mtd - mtd info
>> + * @param ofs - offset to start unlock from
>> + * @param len - length to unlock
>> + * @invert - =A0when =3D 0, unlock the range of blocks within the lower=
 and
>> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0upper boundary address
>> + * =A0 =A0 =A0 =A0 =A0 =A0whne =3D 1, unlock the range of blocks outsid=
e the boundaries
>> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of the lower and upper bo=
undary address
>> + *
>> + * @return - unlock status
>> + */
>> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 uint64_t len, int invert)
>> +{
>> + =A0 =A0 int ret =3D 0;
>> + =A0 =A0 int status, page;
>> + =A0 =A0 struct nand_chip *chip =3D mtd->priv;
>> +
>> + =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =3D %llu=
\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long long)=
ofs, len);
>> +
>> + =A0 =A0 /* Submit address of first page to unlock */
>> + =A0 =A0 page =3D (int)(ofs >> chip->page_shift);
>
> The compiler will automatically cast the result to int I believe.

I just copied this line from erase functions.
I believe its better to cast here as otherwise we may see compiler warnings=
.

>
>> + =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pagemask=
);
>> +
>> + =A0 =A0 /* Submit address of last page to unlock */
>> + =A0 =A0 page =3D (int)((ofs + len) >> chip->page_shift);
> Ditto.
>
>> + =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((page | inver=
t) & chip->pagemask));
>> +
>> + =A0 =A0 /* Call wait ready function */
>> + =A0 =A0 status =3D chip->waitfunc(mtd, chip);
>> + =A0 =A0 udelay(1000);
>> + =A0 =A0 /* See if device thinks it succeeded */
>> + =A0 =A0 if (status & 0x01) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* There was an error */
>> + =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status =3D =
0x%08x\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 __func__, status);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return ret;
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
>> + =A0 =A0 int ret =3D 0;
>> + =A0 =A0 int chipnr;
>> + =A0 =A0 struct nand_chip *chip =3D mtd->priv;
>> +
>> + =A0 =A0 /* Start address must align on block boundary */
>> + =A0 =A0 if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address=
\n", __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* Length must align on block boundary */
>> + =A0 =A0 if (len & ((1 << chip->phys_erase_shift) - 1)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block =
aligned\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* Do not allow past end of device */
>> + =A0 =A0 if ((ofs + len) > mtd->size) {
>
> () around ofs + len look a bit silly for me

This is again used from old code. But I can remove it.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of devic=
e\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* Align to last block address if size addresses end of the de=
vice */
>> + =A0 =A0 if ((ofs + len) =3D=3D mtd->size)
>> + =A0 =A0 =A0 =A0 =A0 =A0 len -=3D mtd->erasesize;
>
> And here
ok

>> +
>> + =A0 =A0 /* Grab the lock and see if the device is available */
>> + =A0 =A0 nand_get_device(chip, mtd, FL_UNLOCKING);
>> +
>> + =A0 =A0 /* Shift to get chip number */
>> + =A0 =A0 chipnr =3D (int)(ofs >> chip->chip_shift);
>
> I do not think explicit cast is needed.

same comment as previous one
>
>> +
>> + =A0 =A0 /* Select the NAND device */
>> + =A0 =A0 chip->select_chip(mtd, chipnr);
>> +
>> + =A0 =A0 /* Check, if it is write protected */
>> + =A0 =A0 if (nand_check_wp(mtd)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write p=
rotected!!!\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 ret =3D __nand_unlock(mtd, ofs, len, 0);
>> +
>> +out:
>> + =A0 =A0 /* de-select the NAND device */
>> + =A0 =A0 chip->select_chip(mtd, -1);
>> +
>> + =A0 =A0 /* Deselect and wake up anyone waiting on the device */
>> + =A0 =A0 nand_release_device(mtd);
>> +
>> + =A0 =A0 return ret;
>> +}
>
> ...
>
> And take a look at the same things in the rest of the code.
>
>> +/**
>> =A0 * nand_read_page_raw - [Intern] read raw page data without ecc
>> =A0 * @mtd: =A0 =A0 mtd info structure
>> =A0 * @chip: =A0 =A0nand chip info structure
>> @@ -2257,6 +2469,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
>> erase_info *instr,
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D chip->waitfunc(mtd, chip);
>>
>> +printk(KERN_INFO"VIMAL: status: 0x%x\n",status);
>
> Forgot to remove a debugging printk?

Yes, this is my mistake. I'll remove this and drop new version of this
patch again.

--=20
Regards,
Vimal Singh
