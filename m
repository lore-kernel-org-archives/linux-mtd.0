Message-ID: <4E37B3C5.3050601@freescale.com>
Date: Tue, 2 Aug 2011 16:22:29 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
References: <20110722055731.GI26837@S2100-06.ap.freescale.net>
	<4E292FCF.6010608@freescale.com>
	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>
	<4E2F6F90.7030207@freescale.com>
	<CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail<20110802081253.GA23380@freescale.com>
In-Reply-To: <20110802081253.GA23380@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Koen Beel <koen.beel.barco@gmail.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B408=E6=9C=8802=E6=97=A5 16:12, Shawn Guo =E5=86=99=E9=
=81=93:
> On Tue, Aug 02, 2011 at 02:19:56PM +0800, Huang Shijie wrote:
>> Hi,
>>> On Fri, Jul 29, 2011 at 11:49 AM, Huang Shijie<b32955@freescale.com> =
  wrote:
>>>> =E4=BA=8E 2011=E5=B9=B407=E6=9C=8829=E6=97=A5 15:40, Koen Beel =E5=86=
=99=E9=81=93:
>>>>> Hi,
>>>>>
>>>>> On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann<LW@karo-electr=
onics.de>
>>>>>   wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Koen Beel writes:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I have test on mx23evk board. Still see the same issues.
>>>>>>>
>>>>>>> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie<b32955@freescale.co=
m>
>>>>>>>   wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Thanks for your test.
>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> It's not really working for me.
>>>>>>>>> I've applied all gpmi-nand driver patches and the dma driver pa=
tches.
>>>>>>>>>
>>>>>>>>> I have added following kernel parameters:
>>>>>>>>> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:=
rootfs0
>>>>>>>>> rootfstype=3Dubifs gpmi_debug_init
>>>>>>>>>
>>>>>>>>> During boot I get already get DMA timeout:
>>>>>>>>> [    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout,=
 last
>>>>>>>>> DMA
>>>>>>>>> :1
>>>>>>>>> [    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
>>>>>>>>> ...
>>>>>>>>> (see log file in attach line 89)
>>>>>>> I still see this DMA timeout when booting.
>>>>>>> What kernel parameters do you use? I still use same as above.
>>>>>>>
>>>>>> Do you have an SD card in the system? I'm getting the same error w=
hen
>>>>>> accessing an SD card. Without SD card I can use the flash without =
any
>>>>>> errors.
>>>>> No SD card in the system. At least not on my mx23evk board.
>>>>> My real target hardware has a SDIO wifi chip.
>>>> Does it conflict with the GPMI?
>>> Well I don't know if it conflicts. From what Lothar says I assume
>>> there might be a conflict between gpmi and sdio.
>> Yes, the conflict between gpmi and other module(such as SD in MX6Q)
>> is THE prime reason
>> which caused the DMA timeout.
>>
>> I am debuging the IMX6Q now, and meet the same problem.
>>
> I do not follow on this.  SD on i.mx6q does not use apbh-dma at all.
> How will it conflict with gpmi regarding to dma timeout?
>
The SD shares the same lines with GPMI, such NANDF_WE/NANDF_RE,=20
NANDF_ALE, NANDF_CS0.
If the SD card is working, the GPMI will not.


Huang Shijie
