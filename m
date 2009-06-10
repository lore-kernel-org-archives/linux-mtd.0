Received: from rex.securecomputing.com ([203.24.151.4] helo=cyberguard.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEDdv-0001Mx-57
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 02:34:29 +0000
Message-ID: <4A2F1BAA.4070102@snapgear.com>
Date: Wed, 10 Jun 2009 12:34:18 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [uClinux-dev] [PATCH 3/3] mtd/maps: uclinux: do not allow to
	be	built as a module
References: <20090526231902.GA6295@linux-sh.org>
	<1243380798-10089-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <1243380798-10089-3-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Mike Frysinger wrote:
> There isn't any benefit to building the uClinux MTD map as a module as the
> rootfs it requires in order to actually be usable is appended to the
> kernel image, not the module.  No known system builds it this way either,
> so change the option to "bool".
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> CC: Paul Mundt <lethal@linux-sh.org>
> CC: Greg Ungerer <gerg@uclinux.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> CC: uclinux-dev@uclinux.org
> CC: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/maps/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 82923bd..907873b 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -501,7 +501,7 @@ config MTD_BFIN_ASYNC
>  	  If compiled as a module, it will be called bfin-async-flash.
>  
>  config MTD_UCLINUX
> -	tristate "Generic uClinux RAM/ROM filesystem support"
> +	bool "Generic uClinux RAM/ROM filesystem support"
>  	depends on MTD_PARTITIONS && MTD_RAM && !MMU
>  	help
>  	  Map driver to support image based filesystems for uClinux.

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
