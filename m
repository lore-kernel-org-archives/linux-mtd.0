Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHbQJ-0007tW-QJ
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 11:06:40 +0000
Received: by bwz4 with SMTP id 4so3573291bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Dec 2009 03:06:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1260178153.25784.28.camel@localhost>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 7 Dec 2009 16:36:14 +0530
Message-ID: <ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
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

On Mon, Dec 7, 2009 at 2:59 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Mon, 2009-12-07 at 12:18 +0530, Vimal Singh wrote:
>> On Fri, Dec 4, 2009 at 2:08 PM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
>> > Hi, some cosmetic comments:
>> >
>> > On Wed, 2009-12-02 at 19:54 +0530, Vimal Singh wrote:
>> >> I am not sure how useful it will be, but still here is a patch for re=
view.
>> >> -vimal
>> >>
>> >> From: Vimal Singh <vimalsingh@ti.com>
>> >> Date: Tue, 24 Nov 2009 18:26:43 +0530
>> >> Subject: [PATCH] Add NAND lock/unlock routines
>> >>
>> >> At least 'Micron' NAND parts have lock/unlock feature.
>> >> Adding routines for this.
>> >>
>> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> >> ---
>> >> =A0drivers/mtd/nand/nand_base.c | =A0217 ++++++++++++++++++++++++++++=
+++++++++++++-
>> >> =A0include/linux/mtd/nand.h =A0 =A0 | =A0 =A06 +
>> >> =A02 files changed, 221 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_bas=
e.c
>> >> index 2957cc7..e447c24 100644
>> >> --- a/drivers/mtd/nand/nand_base.c
>> >> +++ b/drivers/mtd/nand/nand_base.c
>> >> @@ -757,6 +757,218 @@ static int nand_wait(struct mtd_info *mtd,
>> >> struct nand_chip *chip)
>> >> =A0}
>> >>
>> >> =A0/**
>> >> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
>> >> + *
>> >> + * @param mtd - mtd info
>> >> + * @param ofs - offset to start unlock from
>> >> + * @param len - length to unlock
>> >> + * @invert - =A0when =3D 0, unlock the range of blocks within the lo=
wer and
>> >> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0upper boundary address
>> >> + * =A0 =A0 =A0 =A0 =A0 =A0whne =3D 1, unlock the range of blocks out=
side the boundaries
>> >> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of the lower and upper=
 boundary address
>> >> + *
>> >> + * @return - unlock status
>> >> + */
>> >> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 uint64_t len, int invert)
>> >> +{
>> >> + =A0 =A0 int ret =3D 0;
>> >> + =A0 =A0 int status, page;
>> >> + =A0 =A0 struct nand_chip *chip =3D mtd->priv;
>> >> +
>> >> + =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =3D %=
llu\n",
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long lo=
ng)ofs, len);
>> >> +
>> >> + =A0 =A0 /* Submit address of first page to unlock */
>> >> + =A0 =A0 page =3D (int)(ofs >> chip->page_shift);
>> >
>> > The compiler will automatically cast the result to int I believe.
>>
>> I just copied this line from erase functions.
>> I believe its better to cast here as otherwise we may see compiler warni=
ngs.
>
> Good point. Could you please create a validation checking helper instead
> of duplicating code?

IMHO that should be done in a separate patch.


--=20
Regards,
Vimal Singh
