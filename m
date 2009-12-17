Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NLCrf-0001s8-Nl
	for linux-mtd@lists.infradead.org; Thu, 17 Dec 2009 09:41:48 +0000
Received: by bwz4 with SMTP id 4so1377599bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Dec 2009 01:41:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1260185336.3047.0.camel@localhost>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
	<ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
	<1260185336.3047.0.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 17 Dec 2009 15:11:21 +0530
Message-ID: <ce9ab5790912170141s557342d5l4fced74a46a96e5c@mail.gmail.com>
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

On Mon, Dec 7, 2009 at 4:58 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Mon, 2009-12-07 at 16:36 +0530, Vimal Singh wrote:
>> On Mon, Dec 7, 2009 at 2:59 PM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
>> > On Mon, 2009-12-07 at 12:18 +0530, Vimal Singh wrote:
>> >> On Fri, Dec 4, 2009 at 2:08 PM, Artem Bityutskiy <dedekind1@gmail.com=
> wrote:
>> >> > Hi, some cosmetic comments:
>> >> >
>> >> > On Wed, 2009-12-02 at 19:54 +0530, Vimal Singh wrote:
>> >> >> I am not sure how useful it will be, but still here is a patch for=
 review.
>> >> >> -vimal
>> >> >>
>> >> >> From: Vimal Singh <vimalsingh@ti.com>
>> >> >> Date: Tue, 24 Nov 2009 18:26:43 +0530
>> >> >> Subject: [PATCH] Add NAND lock/unlock routines
>> >> >>
>> >> >> At least 'Micron' NAND parts have lock/unlock feature.
>> >> >> Adding routines for this.
>> >> >>
>> >> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> >> >> ---
>> >> >> =A0drivers/mtd/nand/nand_base.c | =A0217 +++++++++++++++++++++++++=
++++++++++++++++-
>> >> >> =A0include/linux/mtd/nand.h =A0 =A0 | =A0 =A06 +
>> >> >> =A02 files changed, 221 insertions(+), 2 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_=
base.c
>> >> >> index 2957cc7..e447c24 100644
>> >> >> --- a/drivers/mtd/nand/nand_base.c
>> >> >> +++ b/drivers/mtd/nand/nand_base.c
>> >> >> @@ -757,6 +757,218 @@ static int nand_wait(struct mtd_info *mtd,
>> >> >> struct nand_chip *chip)
>> >> >> =A0}
>> >> >>
>> >> >> =A0/**
>> >> >> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
>> >> >> + *
>> >> >> + * @param mtd - mtd info
>> >> >> + * @param ofs - offset to start unlock from
>> >> >> + * @param len - length to unlock
>> >> >> + * @invert - =A0when =3D 0, unlock the range of blocks within the=
 lower and
>> >> >> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0upper boundary addr=
ess
>> >> >> + * =A0 =A0 =A0 =A0 =A0 =A0whne =3D 1, unlock the range of blocks =
outside the boundaries
>> >> >> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of the lower and up=
per boundary address
>> >> >> + *
>> >> >> + * @return - unlock status
>> >> >> + */
>> >> >> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
>> >> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 uint64_t len, int invert)
>> >> >> +{
>> >> >> + =A0 =A0 int ret =3D 0;
>> >> >> + =A0 =A0 int status, page;
>> >> >> + =A0 =A0 struct nand_chip *chip =3D mtd->priv;
>> >> >> +
>> >> >> + =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =
=3D %llu\n",
>> >> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long=
 long)ofs, len);
>> >> >> +
>> >> >> + =A0 =A0 /* Submit address of first page to unlock */
>> >> >> + =A0 =A0 page =3D (int)(ofs >> chip->page_shift);
>> >> >
>> >> > The compiler will automatically cast the result to int I believe.
>> >>
>> >> I just copied this line from erase functions.
>> >> I believe its better to cast here as otherwise we may see compiler wa=
rnings.
>> >
>> > Good point. Could you please create a validation checking helper inste=
ad
>> > of duplicating code?
>>
>> IMHO that should be done in a separate patch.
>
> Right, you can first send this as a separate patch, and then the rest as
> a follow up one.

when I went back on validation checking's I notice:

-nand_read: does validation for access to past end of the device
-nand_do_read_oob: does it for access to past oob and device.
-nand_read_oob: does for access to past end of the device

-nand_write: does it for access to past end of the device
-nand_do_write_ops: does it for page alignment
-nand_do_write_oob: does it for access to past oob and device and page
alignment
-panic_nand_write: does it for access to past end of the device

-nand_erase_nand: does it for access to past end of the device and
block alignment 'lock/unlock' routines are doing same validations as
'nand_erase_nand' does.

There is no consistancy in validation checks other than between
'erase' and 'lock/unlock'.
Now since currently only 'erase' function does those validations. We
can have patch for separate validation functions only after
'lock/unlock' patch.

Any comment or suggestions?

--=20
Regards,
Vimal Singh
