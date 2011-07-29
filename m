Message-ID: <20018.24364.787244.956361@ipc1.ka-ro>
Date: Fri, 29 Jul 2011 09:20:12 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Koen Beel <koen.beel.barco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
In-Reply-To: <CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20110721215020.GA25344@pengutronix.de>
	<4E28EEE1.2050008@freescale.com>
	<20110722055731.GI26837@S2100-06.ap.freescale.net>
	<4E292FCF.6010608@freescale.com>
	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>
	<4E2F6F90.7030207@freescale.com>
	<CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>
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

Koen Beel writes:
> Hi,
> 
> I have test on mx23evk board. Still see the same issues.
> 
> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie <b32955@freescale.com> wrote:
> > Hi,
> >
> > Thanks for your test.
> >
> >> Hi,
> >>
> >> It's not really working for me.
> >> I've applied all gpmi-nand driver patches and the dma driver patches.
> >>
> >> I have added following kernel parameters:
> >> mtdparts=gpmi-nand:20m(boot),-(user) ubi.mtd=1 root=ubi0:rootfs0
> >> rootfstype=ubifs gpmi_debug_init
> >>
> >> During boot I get already get DMA timeout:
> >> [    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout, last DMA
> >> :1
> >> [    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
> >> ...
> >> (see log file in attach line 89)
> 
> I still see this DMA timeout when booting.
> What kernel parameters do you use? I still use same as above.
> 
Do you have an SD card in the system? I'm getting the same error when
accessing an SD card. Without SD card I can use the flash without any
errors.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
