Message-ID: <4E37970C.4070903@freescale.com>
Date: Tue, 2 Aug 2011 14:19:56 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Koen Beel <koen.beel.barco@gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>	<20110721215020.GA25344@pengutronix.de>	<4E28EEE1.2050008@freescale.com>	<20110722055731.GI26837@S2100-06.ap.freescale.net>	<4E292FCF.6010608@freescale.com>	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>	<4E2F6F90.7030207@freescale.com>	<CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>	<20018.24364.787244.956361@ipc1.ka-ro>	<CAHMSPgM5W8=mE4sRDGMMfo39fvThBo_jrdG8hyhJNQ_ceV=_pA@mail.gmail.com>	<4E32823C.3060007@freescale.com>
	<CAHMSPgMTf1UnMyvsSZM1in-FEAoWyS5VSdczsxfHgujGJ0DFtw@mail.gmail.com>
In-Reply-To: <CAHMSPgMTf1UnMyvsSZM1in-FEAoWyS5VSdczsxfHgujGJ0DFtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?TG90aGE=?= =?UTF-8?B?ciBXYcOfbWFubg==?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> On Fri, Jul 29, 2011 at 11:49 AM, Huang Shijie<b32955@freescale.com>  w=
rote:
>> =E4=BA=8E 2011=E5=B9=B407=E6=9C=8829=E6=97=A5 15:40, Koen Beel =E5=86=99=
=E9=81=93:
>>> Hi,
>>>
>>> On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann<LW@karo-electron=
ics.de>
>>>   wrote:
>>>> Hi,
>>>>
>>>> Koen Beel writes:
>>>>> Hi,
>>>>>
>>>>> I have test on mx23evk board. Still see the same issues.
>>>>>
>>>>> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie<b32955@freescale.com>
>>>>>   wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Thanks for your test.
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> It's not really working for me.
>>>>>>> I've applied all gpmi-nand driver patches and the dma driver patc=
hes.
>>>>>>>
>>>>>>> I have added following kernel parameters:
>>>>>>> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:ro=
otfs0
>>>>>>> rootfstype=3Dubifs gpmi_debug_init
>>>>>>>
>>>>>>> During boot I get already get DMA timeout:
>>>>>>> [    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout, l=
ast
>>>>>>> DMA
>>>>>>> :1
>>>>>>> [    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
>>>>>>> ...
>>>>>>> (see log file in attach line 89)
>>>>> I still see this DMA timeout when booting.
>>>>> What kernel parameters do you use? I still use same as above.
>>>>>
>>>> Do you have an SD card in the system? I'm getting the same error whe=
n
>>>> accessing an SD card. Without SD card I can use the flash without an=
y
>>>> errors.
>>> No SD card in the system. At least not on my mx23evk board.
>>> My real target hardware has a SDIO wifi chip.
>> Does it conflict with the GPMI?
> Well I don't know if it conflicts. From what Lothar says I assume
> there might be a conflict between gpmi and sdio.
Yes, the conflict between gpmi and other module(such as SD in MX6Q) is=20
THE prime reason
which caused the DMA timeout.

I am debuging the IMX6Q now, and meet the same problem.

> For now I see the same problem on both the evk (no sd/sdio card) and
> on my real target hardware (fixed sdio chip).
>
>>> Are you also testing on the mx23evk board? Really strange it is not
>>> reproducible here then.
>>> Anyone using mx23evk please give:
>> I tested the code in mx23evk.
>> After boot the kernel and login the shell, I met a problem:
>>   the flash_eraseall can not run with the log:
>> "Floating point exception"
>> :(
>>
>>
>>> - revision number of board (I have tested on rev C1)
>> Revision number is C.
>>> - kernel parameter used (see previous mail for mine)
>>>
>> "console=3DttyAMA0,115200 root=3D/dev/mmcblk0p1 rw rootwait gpmi_debug=
_init"
> You have a rootfs on an SD card? And gpmi is working? No conflicts on
I ever put the rootfs in the NAND. But I put the rootfs in the
SD card now.

The GPMI is working. No confilct on DMA now.
But I do not do much test on the NAND, such as bonnie++.
So it need to further test.

Best Regards
Huang Shijie
> dma or something?
> Have you hard coded the mtdparts in the init code? I pass something
> like "mtdparts=3Dgpmi-nand:20m(boot),-(user)" as kernel parameter, but
> you don't...
>
>>
>> Best Regards
>> Huang Shijie
>>> Regards,
>>> Koen
>>>
>>>> Lothar Wa=C3=9Fmann
>>>> --
>>>> ___________________________________________________________
>>>>
>>>> Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
>>>> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
>>>> Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
>>>> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>>>>
>>>> www.karo-electronics.de | info@karo-electronics.de
>>>> ___________________________________________________________
>>>>
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
