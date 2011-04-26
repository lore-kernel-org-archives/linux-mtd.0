Message-ID: <19894.39377.436330.612744@ipc1.ka-ro>
Date: Tue, 26 Apr 2011 12:09:21 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 1/3] MTD : add the common code for GPMI controller
	driver
In-Reply-To: <4DB63360.8010908@freescale.com>
References: <1303267549-18377-1-git-send-email-b32955@freescale.com>
	<1303267549-18377-2-git-send-email-b32955@freescale.com>
	<19887.57747.43423.753598@ipc1.ka-ro>
	<4DB63360.8010908@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	dedekind1@gmail.com
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
> Hi:
> > Huang Shijie writes:
> >> +/* debug control */
> >> +int gpmi_debug;
> >> +
> > This could be a module_param.
> >
> I think the module_param is not easy to use.
> I want to know the log when the gpmi driver is running, and change the 
> log level as soon
> as my need changs.
> 
> So I prefer to use the origin method.
> 
> 
|static int debug;
|module_param(debug, int, S_IRUGO | S_IWUSR);
is all you need to do exactly what you want.

You can write to /sys/module/imx28-gpmi-nfc/parameters/debug at any
time to change the debug level.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
