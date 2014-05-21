Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnD8W-0006qp-4H
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 20:29:16 +0000
Received: by mail-ig0-f177.google.com with SMTP id l13so2633754iga.4
 for <linux-mtd@lists.infradead.org>; Wed, 21 May 2014 13:28:54 -0700 (PDT)
Date: Wed, 21 May 2014 13:28:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Subject: Re: [PATCH v5] mtd: lpddr: add driver for LPDDR2-NVM PCM memories
Message-ID: <20140521202850.GI22233@ld-irv-0074>
References: <20140521014908.GE22233@ld-irv-0074>
 <1400657638-2562-1-git-send-email-vincenzo.aliberti@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400657638-2562-1-git-send-email-vincenzo.aliberti@gmail.com>
Cc: fengguang.wu@intel.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 21, 2014 at 09:33:58AM +0200, Vincenzo Aliberti wrote:
> MTD: LPDDR: Add Driver for LPDDR2-NVM PCM memories
> 
> Signed-off-by: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> 
> ---
> Changes in v5:
> 	- Add dependency from ARM architecture

I already pulled your driver into l2-mtd.git. Please base any
submissions on that branch.

> --- a/drivers/mtd/lpddr/Kconfig
> +++ b/drivers/mtd/lpddr/Kconfig
> @@ -17,4 +17,12 @@ config MTD_QINFO_PROBE
>  	    Window QINFO interface, permits software to be used for entire
>  	    families of devices. This serves similar purpose of CFI on legacy
>  	    Flash products
> +
> +config MTD_LPDDR2_NVM
> +	depends on MTD && ARM

I would note the dependency is only for writel_relaxed(), so we can fix
this up in the future, if we get support on other ARCH's.

I'll just send a patch.

> +	tristate "Support for LPDDR2-NVM flash chips"
> +	help
> +	  This option enables support of PCM memories with a LPDDR2-NVM
> +	  (Low power double data rate 2) interface.
> +
>  endmenu

Brian
