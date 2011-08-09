Message-ID: <20033.7109.224884.866396@ipc1.ka-ro>
Date: Tue, 9 Aug 2011 13:36:37 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Huang Shijie <b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: GPMI-NAND Status?
In-Reply-To: <4E410EC5.8080600@freescale.com>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3FA88E.4070804@freescale.com>
	<20110809091906.GA1923@pengutronix.de>
	<4E410EC5.8080600@freescale.com>
Cc: Koen Beel <koen.beel.barco@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
	linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>,
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

Huang Shijie writes:
> Hi,
> > Hi,
> >
> >>> ecclayout needs to be used to show that OOB is fully in use [1]
> >>> ===============================================================
> >>>
> >>> Needed to make it work for JFFS2 and to pass the mtd-testsuite. A driver only
> >>> working with UBIFS is surely not ready for mainline.
> >>>
> >> It seems just modifying the ecclayout of GPMI-NAND can not fix the problem.
> >> It should also change the code of JFFS2 and mtd.
> >>
> >> Some one ever posted a patch about this:
> >> http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
> > This mail is about MLC. That's another issue. For SLC, ecclayout should
> > work, no?
> 
> The matter is that the GPMI/BCH will use the OOB. Please see the page 1263
> in 16.2.2 of mx28's datasheet. It shows an NAND PAGE's layout.
> 
> You may see that the OOB will be used for storing the DATA or ECC.
> There will be left some space even when i enable the BCH,  it seems the 
> left space can
> contains the jffs2's clean marker.  It needs to be confirmed. :)
> 
It possibly could be written there, if the spare area had a separate
ECC independent from the first data block. With the current ECC
layout (combined ECC for spare area and first block), writing the
clean marker would change the ECC for the first data block to non-FF
so that writing the first block lateron would again result in ECC
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
