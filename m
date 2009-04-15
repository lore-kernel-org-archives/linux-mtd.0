Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu1sl-0007Fn-99
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 09:58:21 +0000
Date: Wed, 15 Apr 2009 11:58:10 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: Re: [PATCH] mtd: fix Kconfig comment about 'armflash'
In-Reply-To: <20090406131054.16163.11343.stgit@Programuotojas>
Message-ID: <alpine.LNX.2.00.0904151158020.13028@wotan.suse.de>
References: <20090406131054.16163.11343.stgit@Programuotojas>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: trivial@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 Apr 2009, Paulius Zaleckas wrote:

> The real 'armflash' map driver is selected by CONFIG_MTD_ARM_INTEGRATOR
> 
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
> ---
> 
>  drivers/mtd/Kconfig |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 7d04fb9..b8e35a0 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -154,7 +154,8 @@ config MTD_AFS_PARTS
>  
>  	  You will still need the parsing functions to be called by the driver
>  	  for your particular device. It won't happen automatically. The
> -	  'armflash' map driver (CONFIG_MTD_ARMFLASH) does this, for example.
> +	  'armflash' map driver (CONFIG_MTD_ARM_INTEGRATOR) does this, for
> +	  example.
>  
>  config MTD_OF_PARTS
>  	tristate "Flash partition map based on OF description"

Applied to trivial tree, thanks.

-- 
Jiri Kosina
SUSE Labs
