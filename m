MIME-Version: 1.0
In-Reply-To: <AANLkTil6QDRdh3s63J9Mm-B1qjMcnYjEEm-W5lC1NXVb@mail.gmail.com>
References: <AANLkTim1qcVoqSS7T8bE0Vsu6phC2iY_Ok671WYHcD0z@mail.gmail.com>
	<AANLkTil6QDRdh3s63J9Mm-B1qjMcnYjEEm-W5lC1NXVb@mail.gmail.com>
Date: Fri, 18 Jun 2010 16:08:13 +0800
Message-ID: <AANLkTikbzXgwMvnNVRkcOO-9El9hmAXhKZK_dFgStbwY@mail.gmail.com>
Subject: Re: [PATCH 02/25] pxa3xx_nand: introduce common timing to reduce read
	id times
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
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

On Fri, Jun 18, 2010 at 2:33 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Fri, Jun 18, 2010 at 1:33 PM, Haojian Zhuang
> <haojian.zhuang@gmail.com> wrote:
>> From 832379d0da4d772e45872de365053f9a15733967 Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Wed, 2 Jun 2010 21:50:25 +0800
>> Subject: [PATCH 02/25] pxa3xx_nand: introduce common timing to reduce
>> read id times
>>
>> We certainly don't need to send read id command times by times, since
>> we already know what the id is after the first read id...
>>
>> So create a common timing which could ensure it would successfully read =
id
>> out all supported chip. Then follow the build-in table to reconfigure
>> the timing.
>
> This is clever trick we'd like to have. And I'd prefer to call this a
> 'loose timing'
> or a 'default safe timing' instead of 'common timing'.
>
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 72 ++++++++++++++++-------=
----------------
>> =C2=A01 files changed, 30 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 013e075..f939083 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -226,23 +226,26 @@ const static struct pxa3xx_nand_cmdset cmdset =3D =
{
>> =C2=A0};
>>
>> =C2=A0static struct pxa3xx_nand_timing __devinitdata timing[] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 /* common timing used to detect flash id */
>> + =C2=A0 =C2=A0 =C2=A0 { 40, 80, 60, 100, 80, 100, 90000, 400, 40, },
>
> Make sure this is the loose and safe enough timing.
>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Samsung NAND series */
>> - =C2=A0 =C2=A0 =C2=A0 { 10, =C2=A00, 20, 40, 30, 40, 11123, 110, 10, },
>> + =C2=A0 =C2=A0 =C2=A0 { 10, =C2=A00, 20, =C2=A040, 30, =C2=A040, 11123,=
 110, 10, },
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Micron NAND series */
>> - =C2=A0 =C2=A0 =C2=A0 { 10, 25, 15, 25, 15, 30, 25000, =C2=A060, 10, },
>> + =C2=A0 =C2=A0 =C2=A0 { 10, 25, 15, =C2=A025, 15, =C2=A030, 25000, =C2=
=A060, 10, },
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ST NAND series */
>> - =C2=A0 =C2=A0 =C2=A0 { 10, 35, 15, 25, 15, 25, 25000, =C2=A060, 10, },
>> + =C2=A0 =C2=A0 =C2=A0 { 10, 35, 15, =C2=A025, 15, =C2=A025, 25000, =C2=
=A060, 10, },
>> =C2=A0};
>>
>> =C2=A0static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[=
] =3D {
>> - =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, &tim=
ing[0], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 2048,=
 &timing[0], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xd7ec, 128, 4096, =C2=A08, =C2=A08, 8192, &tim=
ing[0], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xa12c, =C2=A064, 2048, =C2=A08, =C2=A08, 1024,=
 &timing[1], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xb12c, =C2=A064, 2048, 16, 16, 1024, &timing[1=
], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xdc2c, =C2=A064, 2048, =C2=A08, =C2=A08, 4096,=
 &timing[1], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xcc2c, =C2=A064, 2048, 16, 16, 4096, &timing[1=
], },
>> - =C2=A0 =C2=A0 =C2=A0 { 0xba20, =C2=A064, 2048, 16, 16, 2048, &timing[2=
], },
>> + =C2=A0 =C2=A0 =C2=A0 { =C2=A0 =C2=A0 =C2=A00, =C2=A0 0, =C2=A0 =C2=A00=
, =C2=A00, =C2=A00, =C2=A0 =C2=A00, &timing[0], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, &tim=
ing[1], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 2048,=
 &timing[1], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xd7ec, 128, 4096, =C2=A08, =C2=A08, 8192, &tim=
ing[1], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xa12c, =C2=A064, 2048, =C2=A08, =C2=A08, 1024,=
 &timing[2], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xb12c, =C2=A064, 2048, 16, 16, 1024, &timing[2=
], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xdc2c, =C2=A064, 2048, =C2=A08, =C2=A08, 4096,=
 &timing[2], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xcc2c, =C2=A064, 2048, 16, 16, 4096, &timing[2=
], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xba20, =C2=A064, 2048, 16, 16, 2048, &timing[3=
], },
>> =C2=A0};
>>
>> =C2=A0#define NDTR0_tCH(c) =C2=A0 (min((c), 7) << 19)
>> @@ -859,12 +862,6 @@ static int pxa3xx_nand_config_flash(struct
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
>
> I do think these are sanity check, that's useful to prevent incorrectly d=
efined
> data (esp. coming from board code). Can we define the loose flash type as=
:
>
>> =C2=A0static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[=
] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 { =C2=A00x0000, =C2=A0 0, =C2=A0 =C2=A0512, =C2=
=A08, =C2=A08, =C2=A0 =C2=A00, &timing[0], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, &tim=
ing[1], },
>> + =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 2048,=
 &timing[1], },
>
> with a comment of /* default flash type to detect ID */?
>
> My understanding is the minimum requirement to detect the NAND ID is a
> loose timing and 512 small page, 8-bit wide bus, so with a chip_id being
> 0x0000, that should be enough to tell it's a special flash type to detect=
 ID.

There is no need to add the flash page size and bus width for the
common timing, or loose timing...
For the chip identification only need reset and read id command, and
reset and read id command only care
for the first command in NDCB0 and the timing setting in NDTR0CS0 and
NDTR1CS0, the page size is not useful
here and could make confussion if give such definition...
>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate flash information */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->oob_size =3D (f->page_size =3D=3D 2048)=
 ? 64 : 16;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (f->page_size =3D=3D =
2048) ? 4 : 2;
>> @@ -976,36 +973,27 @@ static int pxa3xx_nand_detect_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand_d=
etect_config(info) =3D=3D 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>>
>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i<pdata->num_flash; ++i) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D pdata->flash + =
i;
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
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(builtin_flash_types)=
; i++) {
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_=
types[i];
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
>> + =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_types[0];
>> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_config_flash(info, f);
>> + =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &id))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_detect;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 for (i=3D0; i<ARRAY_SIZE(builtin_flash_types) + p=
data->num_flash - 1; i++) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i < pdata->num_fl=
ash)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 f =3D pdata->flash + i;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 f =3D &builtin_flash_types[i - pdata->num_flash + 1];
>
> This looks a bit tricky and difficult to read, can you improve the
> readability here?

The chip id identification logic here is changed in latter patch in
this patch set...
If from the last patch of view, does this part looks better?

>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f->chip_id =3D=3D=
 id) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dev_info(&info->pdev->dev, "detect chip id: 0x%x\n", id);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pxa3xx_nand_config_flash(info, f);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&info->pdev->dev,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"failed to dete=
ct configured nand flash; found %04x instead of\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "failed to detect configured nand flash; found %04x instead of\n",
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id);
>> +fail_detect:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
>> =C2=A0}
>>
>
> I'm generally OK with the idea.
>
Best regards,
Lei
