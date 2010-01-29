Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NajZR-0005GY-SL
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 05:39:10 +0000
Received: by fxm22 with SMTP id 22so3324646fxm.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Jan 2010 21:39:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1264740330.21418.1.camel@localhost.localdomain>
References: <ce9ab5791001130453md91ad46ld84f9d51ccd96e87@mail.gmail.com>
	<ce9ab5791001130506g28bb330dm79225c688839323d@mail.gmail.com>
	<ce9ab5791001130520u6cbf0d9cx1f3fd16df31354d@mail.gmail.com>
	<ce9ab5791001130529l6f2ef9d5k79b6329a98baed54@mail.gmail.com>
	<1264690003.1973.138.camel@localhost>
	<ce9ab5791001282019w79ed389av6dfe45226af4ee7a@mail.gmail.com>
	<1264740330.21418.1.camel@localhost.localdomain>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 29 Jan 2010 11:08:41 +0530
Message-ID: <ce9ab5791001282138x31bbfdc0q3004de30e9db7c11@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Creating helper func for block alignment
	verfication
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

On Fri, Jan 29, 2010 at 10:15 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Fri, 2010-01-29 at 09:49 +0530, Vimal Singh wrote:
>> On Thu, Jan 28, 2010 at 8:16 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > Hi,
>> >
>> > On Wed, 2010-01-13 at 18:59 +0530, Vimal Singh wrote:
>> >> From 310f7faa8f319bd9384512f7d5a7f13dcfbeebc8 Mon Sep 17 00:00:00 200=
1
>> >> From: Vimal Singh <vimalsingh@ti.com>
>> >> Date: Wed, 13 Jan 2010 18:11:47 +0530
>> >> Subject: [PATCH] Creating helper func for block alignment verfication
>> >>
>> >> These checks are fairly common in 'nand_erase_nand', 'nand_lock'
>> >> and 'nand_unlock' functions.
>> >>
>> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> >> ---
>> >> =A0drivers/mtd/nand/nand_base.c | =A0 97 +++++++++++++++-------------=
--------------
>> >> =A01 files changed, 34 insertions(+), 63 deletions(-)
>> >>
>> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_bas=
e.c
>> >> index 4e27426..c80cec5 100644
>> >> --- a/drivers/mtd/nand/nand_base.c
>> >> +++ b/drivers/mtd/nand/nand_base.c
>> >> @@ -108,6 +108,37 @@ static int nand_do_write_oob(struct
>> >> =A0 */
>> >> =A0DEFINE_LED_TRIGGER(nand_led_trigger);
>> >>
>> >> +static int block_alignment_verification(struct mtd_info *mtd,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 loff_t ofs, uint64_t len)
>> >> +{
>> >
>> > This function checks not only alignment, so the name is bad. I suggest
>> > check_offs_len() - it at least does not lie about what it does :-)
>>
>> OK, no problem.
>>
>> >
>> >> + =A0 =A0 struct nand_chip *chip =3D mtd->priv;
>> >> +
>> >> + =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =3D %=
llu\n",
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long lo=
ng)ofs, len);
>> >
>> > No, you should keep the DEBUG part in the caller. Because of __func__.
>>
>> Agree.
>>
>> >
>> > Also please, introduce the helper in the _first_ patch, and then use i=
t
>> > in your functions in the second patch. This is more logical.
>>
>> Before 1st patch this helper will be called by just one function
>> "nand_erase_nand". And then in that creating helper function does not
>> makes sense to me.
>
> It does. It will be a preparation to the next patch.
>
>> To me doing this in 2nd patch looks more logical.
>>
>> Either way we will achieve same goal only number of lines in patches wil=
l defer.
>> So, if you still insist I can make it 1st patch.
>
> OK, it is not a big deal.

Well in that case I'll send this patch set by changing the patch order
sometime today.

--=20
Regards,
Vimal Singh
