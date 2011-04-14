Message-ID: <19878.38524.705271.384302@ipc1.ka-ro>
Date: Thu, 14 Apr 2011 08:38:52 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 2/4] MTD : add the common code for GPMI controller
	driver
In-Reply-To: <4DA659D0.9030504@freescale.com>
References: <1302675881-18862-1-git-send-email-b32955@freescale.com>
	<1302675881-18862-3-git-send-email-b32955@freescale.com>
	<19877.65411.687158.113390@ipc1.ka-ro>
	<4DA659D0.9030504@freescale.com>
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org, ffainelli@freebox.fr,
	veli-pekka.peltola@bluegiga.com, shijie8@gmail.com,
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
> >> +	this->swap_block_mark = true;
> >> +	if (GPMI_IS_MX23(this))
> >> +		this->swap_block_mark = false;
> >>
> > if ... else ...?
> else is "true" by default.
>
I meant it would be clearer to do:
	if (GPMI_IS_MX23(this))
		this->swap_block_mark = false;
	else
		this->swap_block_mark = true;


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
