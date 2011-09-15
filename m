Message-ID: <4E71CDB2.4000205@freescale.com>
Date: Thu, 15 Sep 2011 18:04:34 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v12 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1315450031-6371-1-git-send-email-b32955@freescale.com>
	<20081.44941.12535.496764@ipc1.ka-ro>
In-Reply-To: <20081.44941.12535.496764@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, w.sang@pengutronix.de,
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

Hi,
> Hi,
>
> Huang Shijie writes:
>> The patch set is based on Artem's tree:
>> 	http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
>>
>> The general-purpose media interface(GPMI) controller is a flexible int=
erface
>> to up to several NAND flashs.
>>
>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accel=
erator.
>>
>> With the help of BCH, the GPMI controller can choose to do the hardwar=
e ECC or
>> not.
>>
>> This driver is a _pure_ MTD NAND controller driver now.
>>
>>
>> The driver depends on another GPMI-NAND device patch set, you can find=
 them at :
>> 	[1] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416901319573&w=3D2
>> 	[2] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416912319668&w=3D2
>> 	[3] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416891119504&w=3D2
>> 	[4] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416896219539&w=3D2
>>
>> Test environment:
>> 	Using imx23 and imx28 boards for test.
>>
>> 	imx23 :
>> 	console=3DttyAMA0,115200 mtdparts=3Dgpmi-nfc:20m(boot),-(user)
>> 	Tested by USB boot and NAND boot.
>>
>>          imx28 :
>> 	#console=3DttyAMA0,115200 root=3D/dev/mmcblk0p3 rw rootwait
>> 	Tested by SD card boot mode.
>>
> How did you perform your tests?
>
> I tried this driver on our TX28 board with the result that with
> concurrent access of the SD card and the NAND flash, I still get the
> dreaded DMA timeouts within seconds:
> DMA timeout, last DMA :1
> GPMI regs:
>              HW_GPMI_CTRL0[000]=3D21800001
>            HW_GPMI_COMPARE[010]=3D00000000
>            HW_GPMI_ECCCTRL[020]=3D00000000
>           HW_GPMI_ECCCOUNT[030]=3D00000840
>            HW_GPMI_PAYLOAD[040]=3D46578000
>          HW_GPMI_AUXILIARY[050]=3D46578800
>              HW_GPMI_CTRL1[060]=3D0004000c
>            HW_GPMI_TIMING0[070]=3D00010203
>            HW_GPMI_TIMING1[080]=3D05000000
>            HW_GPMI_TIMING2[090]=3D09020101
>               HW_GPMI_STAT[0b0]=3D0d000003
>              HW_GPMI_DEBUG[0c0]=3D01000000
> BCH regs:
>                HW_BCH_CTRL[000]=3D00000100
>             HW_BCH_STATUS0[010]=3D00000010
>                HW_BCH_MODE[020]=3D00000000
>           HW_BCH_ENCODEPTR[030]=3D00000000
>             HW_BCH_DATAPTR[040]=3D00000000
>             HW_BCH_METAPTR[050]=3D00000000
>        HW_BCH_LAYOUTSELECT[070]=3D00000000
>       HW_BCH_FLASH0LAYOUT0[080]=3D030a4200
>       HW_BCH_FLASH0LAYOUT1[090]=3D08404200
>              HW_BCH_DEBUG0[100]=3D00000000
> DMA regs:
>             HW_APBHX_CTRL0[000]=3D30000000
>             HW_APBHX_CTRL1[010]=3Dffff0000
>             HW_APBHX_CTRL2[020]=3D00000000
>      HW_APBHX_CHANNEL_CTRL[030]=3D00000000
>      HW_APBHX_CHn_CURCMDAR(0)[100]=3D46e1c000
>      HW_APBHX_CHn_NXTCMDAR(0)[110]=3D46e1c04c
>           HW_APBHX_CHn_CMD(0)[120]=3D000001c8
>           HW_APBHX_CHn_BAR(0)[130]=3D00000000
>          HW_APBHX_CHn_SEMA(0)[140]=3D00000000
>        HW_APBHX_CHn_DEBUG1(0)[150]=3D00a0001e
>        HW_APBHX_CHn_DEBUG2(0)[160]=3D00000000
>      HW_APBHX_CHn_CURCMDAR(4)[2c0]=3D4652c098
>      HW_APBHX_CHn_NXTCMDAR(4)[2d0]=3D4652c0e4
>           HW_APBHX_CHn_CMD(4)[2e0]=3D000001c9
>           HW_APBHX_CHn_BAR(4)[2f0]=3D46553241
>          HW_APBHX_CHn_SEMA(4)[300]=3D00010000
>        HW_APBHX_CHn_DEBUG1(4)[310]=3D27a00015
>        HW_APBHX_CHn_DEBUG2(4)[320]=3D00000000
> BCH Geometry :
> GF length              : 13
> ECC Strength           : 8
> Page Size in Bytes     : 2112
> Metadata Size in Bytes : 10
> ECC Chunk Size in Bytes: 512
> ECC Chunk Count        : 4
> Payload Size in Bytes  : 2048
> Auxiliary Size in Bytes: 16
> Auxiliary Status Offset: 12
> Block Mark Byte Offset : 1999
> Block Mark Bit Offset  : 0
>
> I'm doing a:
> dd if=3D/dev/mtd0>  /dev/null&  dd if=3D/dev/mmcblk0>  /dev/null
> Sometimes the 'dd' accessing the SD card will stall indefinitely.
> Also copying data from SD card to flash will produce the error, though
> less likely.
>
it reproduces in my side too.
> This looks like the problem arises in the DMA driver when multiple
anyway, I will debug it.

but i will on vacation next week.

I am not sure I can fix it tomorrow.

Best Regards
Huang Shijie
> channels are being used concurrently. The GPMI driver will bail out
> with the timeout error while the MMC driver obviously has no timeout
> check for this situation.
>
> I can mostly rule out HW problems, because the same board works
> perfectly well with WindowsCE (tested with a copy operation between
> flash and SD card).
>
>
> Lothar Wa=C3=9Fmann
