Message-ID: <52172A81.5090501@freescale.com>
Date: Fri, 23 Aug 2013 17:25:21 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: yuhang wang <wangyuhang2014@gmail.com>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>	<1376885403-12156-4-git-send-email-b32955@freescale.com>
 <CAHSAbzN166J=DFi+1koPUpnFpJVHwtbC1AP21ywhAAissQxPxg@mail.gmail.com>
In-Reply-To: <CAHSAbzN166J=DFi+1koPUpnFpJVHwtbC1AP21ywhAAissQxPxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: shawn.guo@linaro.org, b44548@freescale.com, dedekind1@gmail.com,
 b18965@freescale.com, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8823=E6=97=A5 17:05, yuhang wang =E5=86=99=
=E9=81=93:
>> +       u16 sr_cr;
>> >  +       int ret;
>> >
>> >    #ifdef CONFIG_MTD_OF_PARTS
>> >           if (!of_device_is_available(np))
>> >  @@ -1014,6 +1050,21 @@ static int m25p_probe(struct spi_device *spi=
)
>> >           else
>> >                   flash->read_opcode =3D OPCODE_NORM_READ;
>> >
>> >  +       /* Try to enable the Quad Read */
>> >  +       if (np&&  of_property_read_bool(np, "m25p,quad-read")) {
>> >  +               /* The configuration register is set by the second =
byte. */
>> >  +               sr_cr =3D CR_QUAD<<  8;
>> >  +
>> >  +               /* Write the QUAD bit to the Configuration Register=
. */
>> >  +               write_enable(flash);
>> >  +               if (write_sr_cr(flash, sr_cr) =3D=3D 0) {
>> >  +                       /* read back and check it */
>> >  +                       ret =3D read_cr(flash);
>> >  +                       if (ret>  0&&  (ret&  CR_QUAD))
>> >  +                               flash->read_opcode =3D OPCODE_QIOR;
>> >  +               }
>> >  +       }
>> >  +
> Well, M25p80.c support lots of flash devices, so driver should be as
> general as possible. Firstly not all the devices m25p80 supports set
> quad mode as your sequence, perhaps write_sr_cr can not match all the
It does not matter the NOR flash supports the write_sr_cr() or not,
If the NOR flash does not support the write_sr_cr(), it may fails, and=20
you will not set the OPCODE_QIOR for the
m25p80_read.

> m25p80 flash. Secondly, why you only support QIOR(high performance)
> not QOR or DOR. Maybe QIOR seems too special, so what if user want to
> use QOR if he set quad mode in DTS.
>
Frankly speaking, i am reluctant to support the QIOR, it is a little=20
slow. :)

So the the QIOR is lowest speed for QUADSPI controller, and i do not=20
want to support the DOR.

In my new version, i add the support for DDR QIOR read which is the=20
double rate of the QIOR.

The user should knows if the NOR flash supports the quad-read or not,=20
and set the proper DT.

> Another point, if command changed to OPCODE_QIOR, there should also
> should be some correct in m25p_read. such as the number of dummy data.
I only need to change the read opcode.
> QIOR can support read without read command if set the certain bit in
> transfer, these aspects did not reflect in your patch.
>
For the Quadspi, it will handle the dummy by the LUT sequence, such as=20
DDR QUAD read, the LUT sequence will
set proper dummy (6 cycles for S25FL128S). I do not need the m25p_read=20
to set the dummy.


thanks
Huang Shijie
