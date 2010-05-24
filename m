MIME-Version: 1.0
In-Reply-To: <4BFA29F9.8000400@compulab.co.il>
References: <AANLkTilOX0zNdwYfGrbJ-gJ7M6spBUIQqwZPFvAe4fbr@mail.gmail.com>
	<4BFA29F9.8000400@compulab.co.il>
Date: Mon, 24 May 2010 16:20:35 +0800
Message-ID: <AANLkTin4apWmBaCbBGIlSjfDNhhfU8-2s9ZgSpGc2u8k@mail.gmail.com>
Subject: Re: [PATCH 02/20] mtd: pxa3xx_nand: introduce common timing to reduce
	read id times
From: Lei Wen <adrian.wenl@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 24, 2010 at 3:25 PM, Mike Rapoport <mike@compulab.co.il> wrote:
> Haojian Zhuang wrote:
>>
>> From 35a06a21643049e146aba95057e7fe89c55d4b32 Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Mon, 22 Mar 2010 10:24:48 +0800
>> Subject: [PATCH] mtd: pxa3xx_nand: introduce common timing to reduce
>> read id times
>>
>> We certainly don't need to send read id command times by times, since
>> we already know what the id is after the first read id...
>>
>> So create a common timing which could ensure it would successfully read =
id
>> out all supported chip. Then follow the build-in table to reconfigure
>> the timing.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 33 +++++++++++++++++------=
----------
>> =C2=A01 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index da40b9a..5658398 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -225,7 +225,13 @@ const static struct pxa3xx_nand_cmdset cmdset =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.lock_status =C2=A0 =C2=A0=3D 0x007A,
>> =C2=A0};
>>
>> +/**
>> + * The timing defined in the builtin_flash_types[0]
>> + * could be considered as the common timing which is used to
>> + * detect the chip id before we know how to optimize further
>> + */
>> =C2=A0static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[=
] =3D {
>> +{ 0, 0, 0, 0, 0, 0, { 40, 80, 60, 100, 80, 100, 90000, 400, 40, }, },
>> =C2=A0{ 0x46ec, 32, 512, 16, 16, 4096, { 10, 0, 20, 40, 30, 40, 11123, 1=
10, 10,
>> }, },
>> =C2=A0{ 0xdaec, 64, 2048, 8, 8, 2048, { 10, 0, 20, 40, 30, 40, 11123, 11=
0, 10,
>> }, },
>> =C2=A0{ 0xd7ec, 128, 4096, 8, 8, 8192, { 10, 0, 20, 40, 30, 40, 11123, 1=
10, 10,
>> }, },
>> @@ -850,12 +856,6 @@ static int pxa3xx_nand_config_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_platform_data *pdata =3D p=
dev->dev.platform_data;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ndcr =3D 0x00000FFF; /* disable all =
interrupts */
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (f->page_size !=3D 2048 && f->page_size !=3D 5=
12)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 if (f->flash_width !=3D 16 && f->flash_width !=3D=
 8)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> -
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate flash information */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->oob_size =3D (f->page_size =3D=3D 2048)=
 ? 64 : 16;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (f->page_size =3D=3D =
2048) ? 4 : 2;
>> @@ -967,23 +967,24 @@ static int pxa3xx_nand_detect_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand_d=
etect_config(info) =3D=3D 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>>
>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(builtin_flash_types)=
; i++) {
>> + =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_types[0];
>> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_config_flash(info, f);
>> + =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &id))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_detect;
>>
>> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i < ARRAY_SIZE(builtin_flash_types)=
; i++) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D &builtin_fl=
ash_types[i];
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_confi=
g_flash(info, f))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &i=
d))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id =3D=3D f->chip=
_id)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f->chip_id =3D=3D=
 id) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dev_info(&info->pdev->dev, "detect chip id:
>> 0x%x\n", id);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pxa3xx_nand_config_flash(info, f);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&info->pdev->dev,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"failed to dete=
ct configured nand flash; found %04x
>> instead of\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "failed to detect configured nand flash; found
>> %04x instead of\n",
>
> Instead of what?
> And, what if the flash is not listed in the builtin_flash_types? Does it
> really mean it's
> -ENODEV?

Yes, when the flash type is not listed in, you should add the new one manua=
lly.
For now, just add two lines is enough for a new type flash.

The reason why we do this is for different flash has different
attribute that need to be seperated supported.
For example, if one flash need different timing and higher ecc(This
function is not included in this patch set, I would submit it later),
the driver need to know it to deal in correct behavior.

Best regards,
Lei
