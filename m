Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9wvd-0000sf-9L
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 10:04:05 +0000
Date: Wed, 13 Apr 2011 12:03:53 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 1/4] ARM: add GPMI support for imx23/imx28
Message-ID: <20110413100353.GP18850@pengutronix.de>
References: <1302675881-18862-1-git-send-email-b32955@freescale.com>
	<1302675881-18862-2-git-send-email-b32955@freescale.com>
	<20110413090304.GM18850@pengutronix.de>
	<4DA5725A.9000106@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4DA5725A.9000106@freescale.com>
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	veli-pekka.peltola@bluegiga.com, ffainelli@freebox.fr,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

> >>diff --git a/arch/arm/mach-mxs/mach-mx23evk.c b/arch/arm/mach-mxs/mach-mx23evk.c
> >IMHO adding the device to machines should be a seperate patch.
> Do I have to split the driver into two parts? one for ARM-KERNEL,
> and another for MTD?
> If I have to do it, I will split the driver.
I'm not sure I understood what you mean here. I havn't looked at the mtd
part of this series, but I think having:

 - ARM: mxs: add GPMI support for imx23/imx28
 - ARM: mxs: add gpmi device for mx2[38]evk
 - MTD: what
 - MTD: ever
 - MTD: is
 - MTD: needed

is OK.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
