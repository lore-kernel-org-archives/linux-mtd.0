Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA0UN-0002ft-DX
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:52:12 +0000
Date: Wed, 13 Apr 2011 15:51:52 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v5 1/4] ARM: add GPMI support for imx23/imx28
Message-ID: <20110413135152.GS18850@pengutronix.de>
References: <1302675881-18862-1-git-send-email-b32955@freescale.com>
	<1302675881-18862-2-git-send-email-b32955@freescale.com>
	<20110413114304.GA1897@S2100-06.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20110413114304.GA1897@S2100-06.ap.freescale.net>
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	Huang Shijie <b32955@freescale.com>,
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

Hi Shawn,

On Wed, Apr 13, 2011 at 07:43:05PM +0800, Shawn Guo wrote:
> On Wed, Apr 13, 2011 at 02:24:38PM +0800, Huang Shijie wrote:
> > +	MX23_PAD_GPMI_D01__GPMI_D01 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_D02__GPMI_D02 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_D03__GPMI_D03 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_D04__GPMI_D04 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_D05__GPMI_D05 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_D06__GPMI_D06 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_D07__GPMI_D07 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_CLE__GPMI_CLE |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_ALE__GPMI_ALE |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_WPN__GPMI_WPN |
> > +		(MXS_PAD_12MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_WRN__GPMI_WRN |
> > +		(MXS_PAD_12MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_RDN__GPMI_RDN |
> > +		(MXS_PAD_12MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_RDY0__GPMI_RDY0 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_RDY1__GPMI_RDY1 |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_CE0N__GPMI_CE0N |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +	MX23_PAD_GPMI_CE1N__GPMI_CE1N |
> > +		(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL),
> > +
> 
> mmc (ssp) has pin conflict with gpmi on both mx23evk and mx28evk.
hmm,

	 $ git grep GPMI linus/master -- arch/arm/mach-mxs/mach-mx23evk.c
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D08__LCD_D18 | MXS
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D09__LCD_D19 | MXS
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D10__LCD_D20 | MXS
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D11__LCD_D21 | MXS
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D12__LCD_D22 | MXS
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D13__LCD_D23 | MXS
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D08__SSP1_DATA4 |
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D09__SSP1_DATA5 |
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D10__SSP1_DATA6 |
	linus/master:arch/arm/mach-mxs/mach-mx23evk.c:  MX23_PAD_GPMI_D11__SSP1_DATA7 |

so MX23_PAD_GPMI_D08 - MX23_PAD_GPMI_D13 is used (D08-D11 twice). So the
problem is already in linus/master. Is it that what you mean?

> How do you usually handle such pin conflicts on board?
I don't understand this question. Maybe: deciding which pad mux to use?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
