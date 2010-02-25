Subject: Re: [PATCH] mtd: maps: Blackfin async: rename local funcs to avoid
	common clashes
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1263743566-26986-1-git-send-email-vapier@gentoo.org>
References: <1263743566-26986-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Feb 2010 11:32:07 +0000
Message-ID: <1267097527.30247.6163.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-17 at 10:52 -0500, Mike Frysinger wrote:
>         state->map.name       = DRIVER_NAME;
> -       state->map.read       = bfin_read;
> -       state->map.copy_from  = bfin_copy_from;
> -       state->map.write      = bfin_write;
> -       state->map.copy_to    = bfin_copy_to;
> +#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
> +       state->map.read       = bfin_flash_read;
> +       state->map.copy_from  = bfin_flash_copy_from;
> +       state->map.write      = bfin_flash_write;
> +       state->map.copy_to    = bfin_flash_copy_to;
> +#endif 

Why add the #ifdef? This driver depends on MTD_COMPLEX_MAPPINGS in
Kconfig, and rightly so -- it can never work as a 'simple' mapping.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
