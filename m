MIME-Version: 1.0
In-Reply-To: <52172A81.5090501@freescale.com>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-4-git-send-email-b32955@freescale.com>
 <CAHSAbzN166J=DFi+1koPUpnFpJVHwtbC1AP21ywhAAissQxPxg@mail.gmail.com>
 <52172A81.5090501@freescale.com>
Date: Fri, 23 Aug 2013 21:59:09 +0800
Message-ID: <CAHSAbzOUCO2ghLVq4F6xnoowMZ6PKp6qo33PrN7OrY12W_yfQg@mail.gmail.com>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
From: yuhang wang <wangyuhang2014@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Shawn Guo <shawn.guo@linaro.org>, b44548@freescale.com,
 Artem Bityutskiy <dedekind1@gmail.com>, b18965@freescale.com,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Shijie

2013/8/23 Huang Shijie <b32955@freescale.com>:
> =D3=DA 2013=C4=EA08=D4=C223=C8=D5 17:05, yuhang wang =D0=B4=B5=C0:
>>>
>>> +       u16 sr_cr;
>>> >  +       int ret;
>>> >
>>> >    #ifdef CONFIG_MTD_OF_PARTS
>>> >           if (!of_device_is_available(np))
>>> >  @@ -1014,6 +1050,21 @@ static int m25p_probe(struct spi_device *spi)
>>> >           else
>>> >                   flash->read_opcode =3D OPCODE_NORM_READ;
>>> >
>>> >  +       /* Try to enable the Quad Read */
>>> >  +       if (np&&  of_property_read_bool(np, "m25p,quad-read")) {
>>>
>>> >  +               /* The configuration register is set by the second
>>> > byte. */
>>> >  +               sr_cr =3D CR_QUAD<<  8;
>>> >  +
>>> >  +               /* Write the QUAD bit to the Configuration Register.
>>> > */
>>> >  +               write_enable(flash);
>>> >  +               if (write_sr_cr(flash, sr_cr) =3D=3D 0) {
>>> >  +                       /* read back and check it */
>>> >  +                       ret =3D read_cr(flash);
>>> >  +                       if (ret>  0&&  (ret&  CR_QUAD))
>>>
>>> >  +                               flash->read_opcode =3D OPCODE_QIOR;
>>> >  +               }
>>> >  +       }
>>> >  +
>>
>> Well, M25p80.c support lots of flash devices, so driver should be as
>> general as possible. Firstly not all the devices m25p80 supports set
>> quad mode as your sequence, perhaps write_sr_cr can not match all the
>
> It does not matter the NOR flash supports the write_sr_cr() or not,
> If the NOR flash does not support the write_sr_cr(), it may fails, and yo=
u
> will not set the OPCODE_QIOR for the
> m25p80_read.
>
>
So your purpose of the patch is to make m25p80 support quad read or
just support QIOR? if it's the previous one, when set quad support in
DT, but it is possible that quad mode set failed and m25p80 driver
still read in single mode. In such case, user won't get any error
message, so user won't know  what transfer mode the flash works in. Or
you just aimed to support QIOR, so the name in DT(quad read) seems not
appropriate.

>> m25p80 flash. Secondly, why you only support QIOR(high performance)
>> not QOR or DOR. Maybe QIOR seems too special, so what if user want to
>> use QOR if he set quad mode in DTS.
>>
> Frankly speaking, i am reluctant to support the QIOR, it is a little slow=
.
> :)
>
> So the the QIOR is lowest speed for QUADSPI controller, and i do not want=
 to
> support the DOR.
>
> In my new version, i add the support for DDR QIOR read which is the doubl=
e
> rate of the QIOR.
>
> The user should knows if the NOR flash supports the quad-read or not, and
> set the proper DT.
>
>
It is slow in your spi system, but to m25p80 it should be general.
Maybe some others will use that function. So I think it is better to
supplement the other operations.

>> Another point, if command changed to OPCODE_QIOR, there should also
>> should be some correct in m25p_read. such as the number of dummy data.
>
> I only need to change the read opcode.
>
>> QIOR can support read without read command if set the certain bit in
>> transfer, these aspects did not reflect in your patch.
>>
> For the Quadspi, it will handle the dummy by the LUT sequence, such as DD=
R
> QUAD read, the LUT sequence will
> set proper dummy (6 cycles for S25FL128S). I do not need the m25p_read to
> set the dummy.
>
>
Also the same point to above, it is OK to your spi controller, but
your current m25p80 patch can not content others. If I don't have the
SPI controller which support LUT sequence, so my spi controller driver
rely on the info that m25p80 provides, then your patch won't work.

Best regards
