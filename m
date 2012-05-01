Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPGIU-0004nW-Ed
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 16:51:31 +0000
Received: by lagy4 with SMTP id y4so3164943lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 09:51:26 -0700 (PDT)
Message-ID: <4FA01421.9080808@mvista.com>
Date: Tue, 01 May 2012 20:49:37 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Afzal Mohammed <afzal@ti.com>
Subject: Re: [PATCH v4 06/39] ARM: OMAP2+: onenand: return value in init
 function
References: <cover.1335874494.git.afzal@ti.com>
 <91c09cb6a6cb5e87acdcc3f6100a87b4c2a3dd41.1335874494.git.afzal@ti.com>
In-Reply-To: <91c09cb6a6cb5e87acdcc3f6100a87b4c2a3dd41.1335874494.git.afzal@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: khilman@ti.com, nm@ti.com, linux@arm.linux.org.uk, tony@atomide.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, balbi@ti.com,
 dbaryshkov@gmail.com, kyungmin.park@samsung.com, vimal.newwork@gmail.com,
 grinberg@compulab.co.il, artem.bityutskiy@linux.intel.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, notasas@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 01-05-2012 16:20, Afzal Mohammed wrote:

> Modify board_onenand_init to return platform data. This
> would be required for boards to be able to pass it to
> gpmc driver so that it finally reaches onenand driver.

> Also un-static the function so that boards can use it.

> Signed-off-by: Afzal Mohammed<afzal@ti.com>
[...]

> diff --git a/arch/arm/mach-omap2/board-flash.h b/arch/arm/mach-omap2/board-flash.h
> index 052964c..75ba49f 100644
> --- a/arch/arm/mach-omap2/board-flash.h
> +++ b/arch/arm/mach-omap2/board-flash.h
> @@ -52,3 +52,15 @@ board_nand_init(struct mtd_partition *nand_parts,
>   	return NULL;
>   }
>   #endif
> +
> +#if defined(CONFIG_MTD_ONENAND_OMAP2) || \
> +		defined(CONFIG_MTD_ONENAND_OMAP2_MODULE)

    You can use IS_ENABLED(CONFIG_MTD_ONENAND_OMAP2) instead these two.

> +extern struct omap_onenand_platform_data * __init
> +board_onenand_init(struct mtd_partition *onenand_parts, u8 nr_parts, u8 cs);
> +#else
> +static inline struct omap_onenand_platform_data *
> +__init board_onenand_init(struct mtd_partition *nor_parts, u8 nr_parts, u8 cs)
> +{
> +	return NULL;
> +}
> +#endif

WBR, Sergei
