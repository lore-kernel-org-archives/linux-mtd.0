Message-ID: <4E802CDA.4080808@freescale.com>
Date: Mon, 26 Sep 2011 15:42:18 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v12 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1315450031-6371-1-git-send-email-b32955@freescale.com>	<20081.44941.12535.496764@ipc1.ka-ro>	<4E71B741.7010907@freescale.com>
	<20081.49563.934890.760378@ipc1.ka-ro>
In-Reply-To: <20081.49563.934890.760378@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Frank LI <B20596@freescale.com>, dedekind1@gmail.com,
	koen.beel.barco@gmail.com, w.sang@pengutronix.de,
	marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
	shijie8@gmail.com, s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lothar,
> Hi,
>
> Huang Shijie writes:
>> Hi,
>>    add more CC.
>>> Hi,
>>>
>>> Huang Shijie writes:
>>>> The patch set is based on Artem's tree:
>>>> 	http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
>>>>
>>>> The general-purpose media interface(GPMI) controller is a flexible i=
nterface
>>>> to up to several NAND flashs.
>>>>
>>>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC acc=
elerator.
>>>>
>>>> With the help of BCH, the GPMI controller can choose to do the hardw=
are ECC or
>>>> not.
>>>>
>>>> This driver is a _pure_ MTD NAND controller driver now.
>>>>
>>>>
>>>> The driver depends on another GPMI-NAND device patch set, you can fi=
nd them at :
>>>> 	[1] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416901319573&w=3D=
2
>>>> 	[2] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416912319668&w=3D=
2
>>>> 	[3] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416891119504&w=3D=
2
>>>> 	[4] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416896219539&w=3D=
2
>>>>
>>>> Test environment:
>>>> 	Using imx23 and imx28 boards for test.
>>>>
>>>> 	imx23 :
>>>> 	console=3DttyAMA0,115200 mtdparts=3Dgpmi-nfc:20m(boot),-(user)
>>>> 	Tested by USB boot and NAND boot.
>>>>
>>>>           imx28 :
>>>> 	#console=3DttyAMA0,115200 root=3D/dev/mmcblk0p3 rw rootwait
>>>> 	Tested by SD card boot mode.
>>>>
>>> How did you perform your tests?
>>>
>>> I tried this driver on our TX28 board with the result that with
>> The nand conflicats with SD card1. You will get the DMA timeout if you
>> use it.
>> Do you use sd card0 or sd card1?
>>
> I'm using the SSP0 port.
>
>> BTW:I tested the gpmi driver with SD card0. It works fine.
>>
> What exactly did you do in your test?
> Can you try the concurrent 'dd' commands that I used?
I tested the following :
   #dd if=3D/dev/mmcblk0 > /dev/null

[943147.630000] mmcblk0: error -110 transferring data, sector 3972320, nr=
 256, cmd response 0x900, card status 0x80b00
[943147.640000] mmcblk0: retrying using single block read
[943158.250000] mmcblk0: error -110 transferring data, sector 3972480, nr=
 96, cmd response 0x900, card status 0x0
[943158.260000] end_request: I/O error, dev mmcblk0, sector 3972480
[943168.780000] mmcblk0: r/w command failed, status =3D 0x80900
[943168.790000] end_request: I/O error, dev mmcblk0, sector 3972481
[943168.790000] Buffer I/O error on device mmcblk0, logical block 496560
[943168.790000] end_request: I/O error, dev mmcblk0, sector 3972488
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496561
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972496
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496562
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972504
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496563
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972512
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496564
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972520
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496565
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972528
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496566
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972536
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496567
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972544
[943168.810000] Buffer I/O error on device mmcblk0, logical block 496568
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972552
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972560
[943168.810000] end_request: I/O error, dev mmcblk0, sector 3972568
[943179.450000] mmcblk0: error -110 transferring data, sector 3972480, nr=
 8, cmd response 0x900, card status 0x80b00
[943179.460000] mmcblk0: retrying using single block read
[943189.990000] mmcblk0: error -110 transferring data, sector 3972480, nr=
 8, cmd response 0x900, card status 0x0
[943190.000000] end_request: I/O error, dev mmcblk0, sector 3972480
[943200.530000] mmcblk0: r/w command failed, status =3D 0x80900
[943200.530000] end_request: I/O error, dev mmcblk0, sector 3972481
[943200.530000] quiet_error: 3 callbacks suppressed
[943200.530000] Buffer I/O error on device mmcblk0, logical block 496560
dd: /dev/mmcblk0: Input/output error
root@freescale ~$
-------------------------------------------------------------------------=
------------------------

It seems only test the SD card also can reproduce the same DMA bug.

Best Regards
Huang Shijie

>
> Lothar Wa=C3=9Fmann
