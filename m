Message-ID: <4E37976D.1010008@freescale.com>
Date: Tue, 2 Aug 2011 14:21:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Koen Beel <koen.beel.barco@gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>	<20110721215020.GA25344@pengutronix.de>	<4E28EEE1.2050008@freescale.com>	<20110722055731.GI26837@S2100-06.ap.freescale.net>	<4E292FCF.6010608@freescale.com>	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>	<4E2F6F90.7030207@freescale.com>	<CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>	<20018.24364.787244.956361@ipc1.ka-ro>	<CAHMSPgM5W8=mE4sRDGMMfo39fvThBo_jrdG8hyhJNQ_ceV=_pA@mail.gmail.com>	<20018.43621.688990.319528@ipc1.ka-ro>
	<CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
In-Reply-To: <CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, shijie8@gmail.com,
	Shawn Guo <shawn.guo@freescale.com>,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B407=E6=9C=8829=E6=97=A5 23:00, Koen Beel =E5=86=99=E9=
=81=93:
> On Fri, Jul 29, 2011 at 2:41 PM, Lothar Wa=C3=9Fmann<LW@karo-electronic=
s.de>  wrote:
>> Hi,
>>
>> Koen Beel writes:
>>> Hi,
>>>
>>> On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann<LW@karo-electron=
ics.de>  wrote:
>>>> Hi,
>>>>
>>>> Koen Beel writes:
>>>>> Hi,
>>>>>
>>>>> I have test on mx23evk board. Still see the same issues.
>>>>>
>>>>> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie<b32955@freescale.com>=
  wrote:
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
ast DMA
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
>>>
>>> Are you also testing on the mx23evk board? Really strange it is not
>>> reproducible here then.
>>> Anyone using mx23evk please give:
>>> - revision number of board (I have tested on rev C1)
>>> - kernel parameter used (see previous mail for mine)
>>>
>> It's getting ever more strange. I only have problems with concurrent
>> access to the flash and SD-card when I do file system based accessed
>> to the SD card.
>> A 'dd if=3D/dev/mmcblk0 of=3D/dev/null' while excessively using the fl=
ash
>> works well, while mounting the SD card and doing an 'ls' produces
>> immediate BCH DMA timeouts.
>>
>> Perhaps someone can make anything out of that.
> I have checked and the function dma_irq_callback is never called
> during my tests. This means the DMA transfer does not even works once.
If the GPMI do not work well, it will not toggle the DMA to work, so the=20
DMA may timeout.



Huang Shijie
> Also no clue here ...
>
>>
>> Lothar Wa=C3=9Fmann
>> --
>> ___________________________________________________________
>>
>> Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
>> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
>> Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
>> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>>
>> www.karo-electronics.de | info@karo-electronics.de
>> ___________________________________________________________
>>
