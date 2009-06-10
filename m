Received: from rex.securecomputing.com ([203.24.151.4] helo=cyberguard.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEDQ9-0000Xx-6l
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 02:20:18 +0000
Message-ID: <4A2F105C.2040206@snapgear.com>
Date: Wed, 10 Jun 2009 11:46:04 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [uClinux-dev] [PATCH 1/2] mtd/maps: uclinux: fix building when
	partition support is disabled
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Timofei Bondarenko <tim@ipi.ac.ru>, uclinux-dist-devel@blackfin.uclinux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Mike Frysinger wrote:
> From: Timofei Bondarenko <tim@ipi.ac.ru>
> 
> The uClinux map driver doesn't even use partitions, so we shouldn't require
> it in order to work properly.
> 
> Signed-off-by: Timofei Bondarenko <tim@ipi.ac.ru>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> CC: Greg Ungerer <gerg@uclinux.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> CC: uclinux-dev@uclinux.org
> CC: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/maps/uclinux.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index 81756e3..57699c2 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -87,7 +87,11 @@ static int __init uclinux_mtd_init(void)
>  	mtd->priv = mapp;
>  
>  	uclinux_ram_mtdinfo = mtd;
> +#ifdef CONFIG_MTD_PARTITIONS
>  	add_mtd_partitions(mtd, uclinux_romfs, NUM_PARTITIONS);
> +#else
> +	add_mtd_device(mtd);
> +#endif
>  
>  	return(0);
>  }
> @@ -97,7 +101,11 @@ static int __init uclinux_mtd_init(void)
>  static void __exit uclinux_mtd_cleanup(void)
>  {
>  	if (uclinux_ram_mtdinfo) {
> +#ifdef CONFIG_MTD_PARTITIONS
>  		del_mtd_partitions(uclinux_ram_mtdinfo);
> +#else
> +		del_mtd_device(uclinux_ram_mtdinfo);
> +#endif
>  		map_destroy(uclinux_ram_mtdinfo);
>  		uclinux_ram_mtdinfo = NULL;
>  	}

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
