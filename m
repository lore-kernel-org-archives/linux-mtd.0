Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qf5Px-00054l-Fd
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 07:24:06 +0000
Date: Fri, 8 Jul 2011 09:23:59 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v6 2/4] ARM: mxs: add new a pad control
Message-ID: <20110708072359.GO29624@pengutronix.de>
References: <1310102885-4102-1-git-send-email-b32955@freescale.com>
	<1310102885-4102-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1310102885-4102-3-git-send-email-b32955@freescale.com>
Cc: arnd@arndb.de, s.hauer@pengutronix.de, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 08, 2011 at 01:28:03PM +0800, Huang Shijie wrote:
> add a new pad control which is used in some rare cases,
> such as gpmi-nand device.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  arch/arm/mach-mxs/include/mach/iomux.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-mxs/include/mach/iomux.h b/arch/arm/mach-mxs/include/mach/iomux.h
> index 7abdf58..1f31762 100644
> --- a/arch/arm/mach-mxs/include/mach/iomux.h
> +++ b/arch/arm/mach-mxs/include/mach/iomux.h
> @@ -94,6 +94,9 @@ typedef u32 iomux_cfg_t;
>  /* generic pad control used in most cases */
>  #define MXS_PAD_CTRL	(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL)
>  
> +/* special pad control used in rare cases */
I'd not talk about "rare cases" in the comment. It applies to most pads,
that they are used rarely (at most once per machine :-)
> +#define MXS_PAD_CTRL_12MA	(MXS_PAD_12MA | MXS_PAD_3V3 | MXS_PAD_NOPULL)
But other than that I fully support this definition.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
