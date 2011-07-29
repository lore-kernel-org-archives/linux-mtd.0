MIME-Version: 1.0
In-Reply-To: <20018.24364.787244.956361@ipc1.ka-ro>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20110721215020.GA25344@pengutronix.de>
	<4E28EEE1.2050008@freescale.com>
	<20110722055731.GI26837@S2100-06.ap.freescale.net>
	<4E292FCF.6010608@freescale.com>
	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>
	<4E2F6F90.7030207@freescale.com>
	<CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>
	<20018.24364.787244.956361@ipc1.ka-ro>
Date: Fri, 29 Jul 2011 09:40:32 +0200
Message-ID: <CAHMSPgM5W8=mE4sRDGMMfo39fvThBo_jrdG8hyhJNQ_ceV=_pA@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, shijie8@gmail.com,
	Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann <LW@karo-electronics.d=
e> wrote:
> Hi,
>
> Koen Beel writes:
>> Hi,
>>
>> I have test on mx23evk board. Still see the same issues.
>>
>> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie <b32955@freescale.com> wro=
te:
>> > Hi,
>> >
>> > Thanks for your test.
>> >
>> >> Hi,
>> >>
>> >> It's not really working for me.
>> >> I've applied all gpmi-nand driver patches and the dma driver patches.
>> >>
>> >> I have added following kernel parameters:
>> >> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:rootfs=
0
>> >> rootfstype=3Dubifs gpmi_debug_init
>> >>
>> >> During boot I get already get DMA timeout:
>> >> [ =C2=A0 =C2=A02.560000] [ start_dma_without_bch_irq : 392 ] DMA time=
out, last DMA
>> >> :1
>> >> [ =C2=A0 =C2=A03.560000] [ start_dma_with_bch_irq : 427 ] bch timeout=
!!!
>> >> ...
>> >> (see log file in attach line 89)
>>
>> I still see this DMA timeout when booting.
>> What kernel parameters do you use? I still use same as above.
>>
> Do you have an SD card in the system? I'm getting the same error when
> accessing an SD card. Without SD card I can use the flash without any
> errors.

No SD card in the system. At least not on my mx23evk board.
My real target hardware has a SDIO wifi chip.

Are you also testing on the mx23evk board? Really strange it is not
reproducible here then.
Anyone using mx23evk please give:
- revision number of board (I have tested on rev C1)
- kernel parameter used (see previous mail for mine)

Regards,
Koen

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
