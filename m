MIME-Version: 1.0
In-Reply-To: <20083.21122.830407.146310@ipc1.ka-ro>
References: <1315450031-6371-1-git-send-email-b32955@freescale.com>
	<20081.44941.12535.496764@ipc1.ka-ro>
	<4E71CDB2.4000205@freescale.com>
	<20083.21122.830407.146310@ipc1.ka-ro>
Date: Sun, 18 Sep 2011 19:40:28 +0800
Message-ID: <CAMiH66HvHhHHp=bGm_=Bsh+3WW3nzdm_c1DkqObE_KKO-7dfMw@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] add the GPMI controller driver for IMX23/IMX28
From: Huang Shijie <shijie8@gmail.com>
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: marek.vasut@gmail.com, koen.beel.barco@gmail.com, dedekind1@gmail.com,
	w.sang@pengutronix.de, Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lothar:

On Fri, Sep 16, 2011 at 9:43 PM, Lothar Wa=C3=9Fmann <LW@karo-electronics.d=
e> wrote:
> Hi,
>
> Huang Shijie writes:
>> Hi,
>> > Hi,
>> >
>> > Huang Shijie writes:
>> >> The patch set is based on Artem's tree:
>> >> =C2=A0 =C2=A0http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
>> >>
>> >> The general-purpose media interface(GPMI) controller is a flexible in=
terface
>> >> to up to several NAND flashs.
>> >>
>> >> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC acce=
lerator.
>> >>
>> >> With the help of BCH, the GPMI controller can choose to do the hardwa=
re ECC or
>> >> not.
>> >>
>> >> This driver is a _pure_ MTD NAND controller driver now.
>> >>
>> >>
>> >> The driver depends on another GPMI-NAND device patch set, you can fin=
d them at :
>> >> =C2=A0 =C2=A0[1] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416901=
319573&w=3D2
>> >> =C2=A0 =C2=A0[2] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416912=
319668&w=3D2
>> >> =C2=A0 =C2=A0[3] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416891=
119504&w=3D2
>> >> =C2=A0 =C2=A0[4] http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416896=
219539&w=3D2
>> >>
>> >> Test environment:
>> >> =C2=A0 =C2=A0Using imx23 and imx28 boards for test.
>> >>
>> >> =C2=A0 =C2=A0imx23 :
>> >> =C2=A0 =C2=A0console=3DttyAMA0,115200 mtdparts=3Dgpmi-nfc:20m(boot),-=
(user)
>> >> =C2=A0 =C2=A0Tested by USB boot and NAND boot.
>> >>
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx28 :
>> >> =C2=A0 =C2=A0#console=3DttyAMA0,115200 root=3D/dev/mmcblk0p3 rw rootw=
ait
>> >> =C2=A0 =C2=A0Tested by SD card boot mode.
>> >>
>> > How did you perform your tests?
>> >
>> > I tried this driver on our TX28 board with the result that with
>> > concurrent access of the SD card and the NAND flash, I still get the
>> > dreaded DMA timeouts within seconds:
>> > DMA timeout, last DMA :1
>> > GPMI regs:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_CTRL0[000]=3D2=
1800001
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_COMPARE[010]=3D000000=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_ECCCTRL[020]=3D000000=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_GPMI_ECCCOUNT[030]=3D00000840
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_PAYLOAD[040]=3D465780=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_AUXILIARY[050]=3D46578800
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_CTRL1[060]=3D0=
004000c
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_TIMING0[070]=3D000102=
03
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_TIMING1[080]=3D050000=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_TIMING2[090]=3D090201=
01
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_GPMI_STAT[0b0]=3D0=
d000003
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_GPMI_DEBUG[0c0]=3D0=
1000000
>> > BCH regs:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_BCH_CTRL[000=
]=3D00000100
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_BCH_STATUS0[010]=3D000000=
10
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_BCH_MODE[020=
]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_BCH_ENCODEPTR[030]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_BCH_DATAPTR[040]=3D000000=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_BCH_METAPTR[050]=3D000000=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_BCH_LAYOUTSELECT[070]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0 HW_BCH_FLASH0LAYOUT0[080]=3D030a4200
>> > =C2=A0 =C2=A0 =C2=A0 HW_BCH_FLASH0LAYOUT1[090]=3D08404200
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_BCH_DEBUG0[100]=3D0=
0000000
>> > DMA regs:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CTRL0[000]=3D300000=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CTRL1[010]=3Dffff00=
00
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CTRL2[020]=3D000000=
00
>> > =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHANNEL_CTRL[030]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_CURCMDAR(0)[100]=3D46e1c000
>> > =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_NXTCMDAR(0)[110]=3D46e1c04c
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CHn_CMD(0)[120]=3D000001c8
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CHn_BAR(0)[130]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_SEMA(0)[140]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_DEBUG1(0)[150]=3D00a0001e
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_DEBUG2(0)[160]=3D00000000
>> > =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_CURCMDAR(4)[2c0]=3D4652c098
>> > =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_NXTCMDAR(4)[2d0]=3D4652c0e4
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CHn_CMD(4)[2e0]=3D000001c9
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HW_APBHX_CHn_BAR(4)[2f0]=3D46553241
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_SEMA(4)[300]=3D00010000
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_DEBUG1(4)[310]=3D27a00015
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0HW_APBHX_CHn_DEBUG2(4)[320]=3D00000000
>> > BCH Geometry :
>> > GF length =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 13
>> > ECC Strength =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 8
>> > Page Size in Bytes =C2=A0 =C2=A0 : 2112
>> > Metadata Size in Bytes : 10
>> > ECC Chunk Size in Bytes: 512
>> > ECC Chunk Count =C2=A0 =C2=A0 =C2=A0 =C2=A0: 4
>> > Payload Size in Bytes =C2=A0: 2048
>> > Auxiliary Size in Bytes: 16
>> > Auxiliary Status Offset: 12
>> > Block Mark Byte Offset : 1999
>> > Block Mark Bit Offset =C2=A0: 0
>> >
>> > I'm doing a:
>> > dd if=3D/dev/mtd0> =C2=A0/dev/null& =C2=A0dd if=3D/dev/mmcblk0> =C2=A0=
/dev/null
>> > Sometimes the 'dd' accessing the SD card will stall indefinitely.
>> > Also copying data from SD card to flash will produce the error, though
>> > less likely.
>> >
>> it reproduces in my side too.
>> > This looks like the problem arises in the DMA driver when multiple
>> anyway, I will debug it.
>>
>> but i will on vacation next week.
>>
>> I am not sure I can fix it tomorrow.
>>
> I now found, that selecting 'CONFIG_PREEMPT_NONE' in the kernel config
> dramatically decreases the chance of hitting this problem.
>
> I've checked the mxs-dma and gpmi-nand drivers, but could not find
> anything fishy wrt preemption.
thanks for your hard work.

I think you could focus on the mxs-dma driver.
I read code of sd driver.
The only common place which gpmi and sd uses is the dma submit code.

The DMA maybe become unstabe when the gpmi and sd submit the DMA
operation at the same time. :(
I remember you ever submit a patch about the mxs-dma.
Could you try it with your patch?

thanks

Huang Shijie




>
>
> Lothar Wa=C3=9Fmann
> --
> ___________________________________________________________
>
> Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
> Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>
> www.karo-electronics.de | info@karo-electronics.de
> ___________________________________________________________
>
