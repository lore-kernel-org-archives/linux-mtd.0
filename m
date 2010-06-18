MIME-Version: 1.0
In-Reply-To: <AANLkTikDDFYY65l5YYGW3a0O2bWDyKRO6VRb15aaFtF7@mail.gmail.com>
References: <AANLkTim1qcVoqSS7T8bE0Vsu6phC2iY_Ok671WYHcD0z@mail.gmail.com>
	<AANLkTil6QDRdh3s63J9Mm-B1qjMcnYjEEm-W5lC1NXVb@mail.gmail.com>
	<AANLkTikbzXgwMvnNVRkcOO-9El9hmAXhKZK_dFgStbwY@mail.gmail.com>
	<AANLkTikDDFYY65l5YYGW3a0O2bWDyKRO6VRb15aaFtF7@mail.gmail.com>
Date: Fri, 18 Jun 2010 17:15:20 +0800
Message-ID: <AANLkTil6D3Cijy1JZ3aQLBGBfi99zOGDy5Xl8OmY_T_8@mail.gmail.com>
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

On Fri, Jun 18, 2010 at 4:12 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
>>>> - =C2=A0 =C2=A0 =C2=A0 if (f->page_size !=3D 2048 && f->page_size !=3D=
 512)
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 if (f->flash_width !=3D 16 && f->flash_width !=
=3D 8)
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>>> -
>>>
>>> I do think these are sanity check, that's useful to prevent incorrectly=
 defined
>>> data (esp. coming from board code). Can we define the loose flash type =
as:
>>>
>>>> =C2=A0static struct pxa3xx_nand_flash __devinitdata builtin_flash_type=
s[] =3D {
>>>> + =C2=A0 =C2=A0 =C2=A0 { =C2=A00x0000, =C2=A0 0, =C2=A0 =C2=A0512, =C2=
=A08, =C2=A08, =C2=A0 =C2=A00, &timing[0], },
>>>> + =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, &t=
iming[1], },
>>>> + =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 204=
8, &timing[1], },
>>>
>>> with a comment of /* default flash type to detect ID */?
>>>
>>> My understanding is the minimum requirement to detect the NAND ID is a
>>> loose timing and 512 small page, 8-bit wide bus, so with a chip_id bein=
g
>>> 0x0000, that should be enough to tell it's a special flash type to dete=
ct ID.
>>
>> There is no need to add the flash page size and bus width for the
>> common timing, or loose timing...
>> For the chip identification only need reset and read id command, and
>> reset and read id command only care
>> for the first command in NDCB0 and the timing setting in NDTR0CS0 and
>> NDTR1CS0, the page size is not useful
>> here and could make confussion if give such definition...
>
> I know, but I'd like to keep the checking of page_size, and flash_width,
> if you take a look into the rest of the code how much it is assumed that
> page_size being either 2048 or 512, flash_width being 8 or 16, you'll
> know why such an error checking here is mandatory actually.

I know that the configure_flash function need to check page_size &
flash_width to set the
ndcr. But what the setting would not affect the reset/read id result anyway=
...
For there is some chip has the same bytes in the first two bytes, I
choose to always read out
4 bytes data when send read id command in latter patch of this patch set...

>
>>>
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate flash information */
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->oob_size =3D (f->page_size =3D=3D 204=
8) ? 64 : 16;
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (f->page_size =3D=
=3D 2048) ? 4 : 2;
>>>> @@ -976,36 +973,27 @@ static int pxa3xx_nand_detect_flash(struct
>>>> pxa3xx_nand_info *info,
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand=
_detect_config(info) =3D=3D 0)
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>>>>
>>>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i<pdata->num_flash; ++i) {
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D pdata->flash =
+ i;
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_con=
fig_flash(info, f))
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__readid(info, =
&id))
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id =3D=3D f->ch=
ip_id)
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;
>>>> - =C2=A0 =C2=A0 =C2=A0 }
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(builtin_flash_type=
s); i++) {
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flas=
h_types[i];
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_con=
fig_flash(info, f))
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__readid(info, =
&id))
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>>>> -
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id =3D=3D f->ch=
ip_id)
>>>> + =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_types[0];
>>>> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_config_flash(info, f);
>>>> + =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &id))
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_detect;
>>>> +
>>>> + =C2=A0 =C2=A0 =C2=A0 for (i=3D0; i<ARRAY_SIZE(builtin_flash_types) +=
 pdata->num_flash - 1; i++) {
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i < pdata->num_=
flash)
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 f =3D pdata->flash + i;
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 f =3D &builtin_flash_types[i - pdata->num_flash + 1];
>>>
>>> This looks a bit tricky and difficult to read, can you improve the
>>> readability here?
>>
>> The chip id identification logic here is changed in latter patch in
>> this patch set...
>> If from the last patch of view, does this part looks better?
>>
>
> Not sure, I'd rather this being separated into two loops if that helps
> readability.
>
>>>
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f->chip_id =3D=
=3D id) {
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_info(&info->pdev->dev, "detect chip id: 0x%x\n", id);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pxa3xx_nand_config_flash(info, f);
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>>>
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&info->pdev->dev,
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"failed to de=
tect configured nand flash; found %04x instead of\n",
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 "failed to detect configured nand flash; found %04x instead of\n=
",
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id);
>>>> +fail_detect:
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
>>>> =C2=A0}
>>>>
>>>
>>> I'm generally OK with the idea.
>>>
>> Best regards,
>> Lei
>>
>
