Message-ID: <4DA57FAA.7030309@freescale.com>
Date: Wed, 13 Apr 2011 18:49:14 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 1/4] ARM: add GPMI support for imx23/imx28
References: <1302675881-18862-1-git-send-email-b32955@freescale.com>
	<1302675881-18862-2-git-send-email-b32955@freescale.com>
	<20110413090304.GM18850@pengutronix.de>
	<4DA5725A.9000106@freescale.com>
	<20110413100353.GP18850@pengutronix.de>
In-Reply-To: <20110413100353.GP18850@pengutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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

hi:
> Hello,
>
>>>> diff --git a/arch/arm/mach-mxs/mach-mx23evk.c b/arch/arm/mach-mxs/mach-mx23evk.c
>>> IMHO adding the device to machines should be a seperate patch.
>> Do I have to split the driver into two parts? one for ARM-KERNEL,
>> and another for MTD?
>> If I have to do it, I will split the driver.
> I'm not sure I understood what you mean here. I havn't looked at the mtd
> part of this series, but I think having:
>
>   - ARM: mxs: add GPMI support for imx23/imx28
>   - ARM: mxs: add gpmi device for mx2[38]evk
>   - MTD: what
>   - MTD: ever
>   - MTD: is
>   - MTD: needed
>
> is OK.
>
ok, thanks.

Best Regards
Huang Shijie
> Best regards
> Uwe
>
