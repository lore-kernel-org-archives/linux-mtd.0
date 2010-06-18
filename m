MIME-Version: 1.0
In-Reply-To: <AANLkTimeJYwret1ZlEHaX_-T14qB3WteQwpn9y7_1Zo9@mail.gmail.com>
References: <AANLkTim1qcVoqSS7T8bE0Vsu6phC2iY_Ok671WYHcD0z@mail.gmail.com>
	<AANLkTil6QDRdh3s63J9Mm-B1qjMcnYjEEm-W5lC1NXVb@mail.gmail.com>
	<AANLkTikbzXgwMvnNVRkcOO-9El9hmAXhKZK_dFgStbwY@mail.gmail.com>
	<AANLkTikDDFYY65l5YYGW3a0O2bWDyKRO6VRb15aaFtF7@mail.gmail.com>
	<AANLkTil6D3Cijy1JZ3aQLBGBfi99zOGDy5Xl8OmY_T_8@mail.gmail.com>
	<AANLkTimeJYwret1ZlEHaX_-T14qB3WteQwpn9y7_1Zo9@mail.gmail.com>
Date: Fri, 18 Jun 2010 18:01:02 +0800
Message-ID: <AANLkTimU35i4hpzwb34lbqYrP0ijoWw6KH3q_ntb2fHh@mail.gmail.com>
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

On Fri, Jun 18, 2010 at 5:19 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Fri, Jun 18, 2010 at 5:15 PM, Lei Wen <adrian.wenl@gmail.com> wrote:
>> On Fri, Jun 18, 2010 at 4:12 PM, Eric Miao <eric.y.miao@gmail.com> wrote=
:
>>>>>> - =C2=A0 =C2=A0 =C2=A0 if (f->page_size !=3D 2048 && f->page_size !=
=3D 512)
>>>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>>>>> -
>>>>>> - =C2=A0 =C2=A0 =C2=A0 if (f->flash_width !=3D 16 && f->flash_width =
!=3D 8)
>>>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>>>>> -
>>>>>
>>>>> I do think these are sanity check, that's useful to prevent incorrect=
ly defined
>>>>> data (esp. coming from board code). Can we define the loose flash typ=
e as:
>>>>>
>>>>>> =C2=A0static struct pxa3xx_nand_flash __devinitdata builtin_flash_ty=
pes[] =3D {
>>>>>> + =C2=A0 =C2=A0 =C2=A0 { =C2=A00x0000, =C2=A0 0, =C2=A0 =C2=A0512, =
=C2=A08, =C2=A08, =C2=A0 =C2=A00, &timing[0], },
>>>>>> + =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, =
&timing[1], },
>>>>>> + =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 2=
048, &timing[1], },
>>>>>
>>>>> with a comment of /* default flash type to detect ID */?
>>>>>
>>>>> My understanding is the minimum requirement to detect the NAND ID is =
a
>>>>> loose timing and 512 small page, 8-bit wide bus, so with a chip_id be=
ing
>>>>> 0x0000, that should be enough to tell it's a special flash type to de=
tect ID.
>>>>
>>>> There is no need to add the flash page size and bus width for the
>>>> common timing, or loose timing...
>>>> For the chip identification only need reset and read id command, and
>>>> reset and read id command only care
>>>> for the first command in NDCB0 and the timing setting in NDTR0CS0 and
>>>> NDTR1CS0, the page size is not useful
>>>> here and could make confussion if give such definition...
>>>
>>> I know, but I'd like to keep the checking of page_size, and flash_width=
,
>>> if you take a look into the rest of the code how much it is assumed tha=
t
>>> page_size being either 2048 or 512, flash_width being 8 or 16, you'll
>>> know why such an error checking here is mandatory actually.
>>
>> I know that the configure_flash function need to check page_size &
>> flash_width to set the
>> ndcr. But what the setting would not affect the reset/read id result any=
way...
>> For there is some chip has the same bytes in the first two bytes, I
>> choose to always read out
>> 4 bytes data when send read id command in latter patch of this patch set=
...
>>
>
> My understanding is that NAND READID will at least work with the assumpti=
on
> of 512bytes/page and 8-bit wide bus, no matter how the NAND chips are
> connected. (unless some one comes up with a insane design of using multip=
le
> interlaced NAND chips of different types).
>
> Again, assume the NAND controller is not initialized (register values bei=
ng
> garbage or all zero-ed), do you still think you can read out the ID witho=
ut
> letting it know the page size, bus width and etc?
>

Well... I understand it is good to reserve the page size and width
judgement in configuration.
I would make this part revert back to its original state...
For read id, it would not care for the page size and width setting in NDCR.=
..
