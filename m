Received: from rex.securecomputing.com ([203.24.151.4] helo=cyberguard.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEDQ9-0000Xw-6d
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 02:20:18 +0000
Message-ID: <4A2F10B2.7000003@snapgear.com>
Date: Wed, 10 Jun 2009 11:47:30 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH 2/3] mtd/maps: uclinux: mark local stuff static
References: <20090526231902.GA6295@linux-sh.org>
	<1243380798-10089-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1243380798-10089-2-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Mike Frysinger wrote:
> The uclinux_ram_mtdinfo, uclinux_romfs, and uclinux_point symbols do not
> need to be visible outside of this module, so mark them static.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> CC: Greg Ungerer <gerg@uclinux.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> CC: uclinux-dev@uclinux.org
> CC: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/maps/uclinux.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index 61d4087..d4314fb 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -30,11 +30,11 @@ struct map_info uclinux_ram_map = {
>  	.size = 0,
>  };
>  
> -struct mtd_info *uclinux_ram_mtdinfo;
> +static struct mtd_info *uclinux_ram_mtdinfo;
>  
>  /****************************************************************************/
>  
> -struct mtd_partition uclinux_romfs[] = {
> +static struct mtd_partition uclinux_romfs[] = {
>  	{ .name = "ROMfs" }
>  };
>  
> @@ -42,7 +42,7 @@ struct mtd_partition uclinux_romfs[] = {
>  
>  /****************************************************************************/
>  
> -int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
> +static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
>  	size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	struct map_info *map = mtd->priv;

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
