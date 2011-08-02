MIME-Version: 1.0
In-Reply-To: <4E37D375.7000400@freescale.com>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20018.43621.688990.319528@ipc1.ka-ro>
	<CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
	<201107311551.48223.marek.vasut@gmail.com>
	<CAHMSPgMK_zM17NXgsbrzs8Zw0VXtDoP12_1V7oeROSF=aBDuYg@mail.gmail.com>
	<4E379B28.7090902@freescale.com>
	<CAHMSPgM4K5o_aGK31yyFcGK-hH4WBeqVkA5dZU=FvAiKGmHA9A@mail.gmail.com>
	<4E37BA02.5030400@freescale.com>
	<CAHMSPgOBhZVgjXZTWWPtwBxrF4g1tFa2E5N+Yjs+ku-0BwKPVA@mail.gmail.com>
	<4E37D375.7000400@freescale.com>
Date: Tue, 2 Aug 2011 14:32:17 +0200
Message-ID: <CAHMSPgPnjKE49jn3HPjkztKroRrjRjLMyDWnkOb78KjecbQK3Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Aug 2, 2011 at 12:37 PM, Huang Shijie <b32955@freescale.com> wrote:
> hi:
>>
>>> The following is my test environment:
>>> [0] Hardware:
>>> =C2=A0 =C2=A0 =C2=A0 MX23EVK PCB REV C
>>
>> I have the same hardware. But also on our own hardware (mx23, but
>> different dram and different nand) it's failing with the same output
>> as on the evk (see log file in previous mail).
>
> I will check the schematic of mx23 tomorrow, and find what will cause
> conflict with GPMI.
>>>
>>> [1] SW:
>>> =C2=A0 =C2=A0kernel:git://git.linaro.org/people/shawnguo/linux-2.6.git =
mxs-gpmi
>>> =C2=A0 =C2=A0.config: my_config , you can find it in my previous email.
>>> =C2=A0 =C2=A0cmdline: console=3DttyAMA0,115200 root=3D/dev/mmcblk0p1 rw=
 rootwait
>>> gpmi_debug_init mtdparts=3Dgpmi-nand:20m(boot),-(user)
>>
>> I use that git and your config file. Only thing i have changed to the
>> config is to integrate the initramfs rootfs.
>> Would it be possible for you to test using rootfs in initramfs? Now
>
> could you tell me how can i test the rootfs in initramfs?
> I have no idea about how to test it.

Via the linux menuconfig:
- Check the option "General setup > Initial RAM filesystem and RAM
disk (initramfs/initrd) support"
- Fill in "General setup > Initramfs source file(s)" (e.g. the path to
a cpio archive of the rootfs, or just the directory containing the
extracted rootfs).

>
>
>> you are using the mmc card as rootfs which is on the dma engine and
>> bus.
>>
>>
>>> [2] test shell script:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> echo 0x20> =C2=A0/sys/module/gpmi_nand/parameters/gpmi_debug
>>
>> As said, don't have that gpmi_debug sysfs entry. Sure you don't have
>> any other modification done which are not in that git branch?
>
> The sysfs entry does exit.
> Please check carefully.
> The code in gpmi-nand.c defines it.

Ok, I see the module_param entry at the beginning of gpmi-nand.c.
Must have overlooked it as in previous mail you mentioned the path was
/sys/devices/platform/imx23-gpmi-nand/gpmi_debug
But no problem, it's working now.

>
>
>>> flash_eraseall /dev/mtd1
>>> ubiformat /dev/mtd1
>>> flash_eraseall /dev/mtd1
>>> ubiattach /dev/ubi_ctrl -m 1
>>> ubimkvol /dev/ubi0 -N test -m
>>> mount -t ubifs ubi0:test tmp
>>> bonnie++ -d tmp -u 0 -s 2 -r 1
>>> bonnie++ -d tmp -u 0 -s 2 -r 1
>>> bonnie++ -d tmp -u 0 -s 2 -r 1
>>> umount tmp
>>> ubidetach /dev/ubi_ctrl -m 1
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> [3] conclusion
>>> =C2=A0 It runs well in my mx23 board, and no DMA-TIMEOUT occur.
>>> I think there is some conflict in your board.
>>
>> Don't know what conflict I would have with my board. I just use the
>> board without anything (mmc, lcd, ...) attached to it.
>>
>>> BTW:
>>> =C2=A0 I split the MTD to 20M and (the rest size).
>>
>> So do I.
>>
>>> The flash_eraseall works well.
>>> If i do not split the MTD, the flash_eraseall will not work.
>>
>> That's strange because I use flash_eraseall on my mtd1 which is 108 MB.
>> I don't know how you boot but my uboot is in mtd0, so don't use that
>
> I boot the kernel by the USB with sb_loader.
>
> Best Regards
> Huang Shijie
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
