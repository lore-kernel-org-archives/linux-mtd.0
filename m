Message-ID: <4DA270B9.6030700@freescale.com>
Date: Mon, 11 Apr 2011 11:08:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH V4 0/4] add the GPMI controller driver for IMX23/IMX28
References: <19869.40520.368078.270732@ipc1.ka-ro>	<4D9E75FF.6090603@freescale.com>
	<19870.59289.913018.127715@ipc1.ka-ro>
In-Reply-To: <19870.59289.913018.127715@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lothar:

> Hi,
>
> Huang Shijie writes:
>> Hi Lothar:
>>> Hi,
>>>
>>> Huang Shijie writes:
>>>> Does some one have any comments about this driver?
>>>>
>>> I'm still not happy with the rom-helper code that IMO does not belong
>>> in this driver.
>> Could you tell me which part of the rom-helper code is not belong the
>> driver?
>>
> All of it. I don't see a point in having it, when all that it does can
> be achieved with standard functions already.
>
I am afraid most of the rom-help code can not be removed, the  reasons ar=
e:
[1] imx23 does not need the swap-block-mark feature. The swap-block-mark=20
feature is used
    by the BCH hardware ecc-correction module. But the imx28 does need=20
the swap-block-mark feature.
    Why? the firmwares in both chips are a little different. The=20
rom-help code is used to distinguish
    this, and _DO_ some necessary initializations. After the=20
initialization, the NAND_SCAN will works.

[2] In the NAND boot mode, we also need to check the swap-block-mark to=20
do the right ECC read pages.



BUT the default partition layout code really can be removed. It somehow=20
can be regards as not belonged to
the driver.

thanks.
>>> Also, I would integrate the code from the hal-*.c files into the main
>>> file and remove all the function hooks, since the functions are the
>> thanks for your advice.
>>
>> This driver will serve for many platforms, not only the imx23 and imx2=
8.
>> I am merging the imx508 code to the driver.
>> I feel lucky that i did not merge all the code into the main file, whi=
ch
>> will
>> make the code mess.
>>
> You would probably end up with some more functions that are
> implemented for the different variants. They could be prefixed with
> the SoC name and selected in the probe() function depending on the
> platform id. I don't see why this should get messy.
>
I really do not like to package all the code into one file which makes=20
the file bigger and bigger.
Frankly speaking, I regard it as a bad idea. I think it's messy.

imx508 will support DDR mode for ONFI NAND and TOGGLE nand which need to=20
do lot of TIMING initialization for both mode.
It is a long initialization code. Keep the code in separate file is to=20
make the code tidy. Do you think it's a
grace method to keep it in one file? I do not think so. :)

yes, I can use the PREFIXED name for different variants. But I think=20
that will create more code.
The current *hal.c only contains the different implementation for variant=
s.


> If the imx508 driver is so much different from the other variants,
> that merging it gets too messy, it's probably better to not merge it
> with the other variants anyway.
>
It just needs a separate hal-508.c file.
> Lothar Wa=C3=9Fmann

Thanks a lot.

Best Regards
Huang Shijie
