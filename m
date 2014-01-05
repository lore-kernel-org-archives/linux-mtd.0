Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzjLz-0002Gj-S1
 for linux-mtd@lists.infradead.org; Sun, 05 Jan 2014 08:46:40 +0000
Received: by mail-pa0-f52.google.com with SMTP id ld10so17503536pab.11
 for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2014 00:46:17 -0800 (PST)
Date: Sun, 5 Jan 2014 00:46:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH] mtd: Hide CONFIG_MTD_BLKDEVS from the menu
Message-ID: <20140105084547.GA2929@brian-ubuntu>
References: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Fri, Dec 13, 2013 at 10:58:44AM -0300, Ezequiel Garcia wrote:
> Make this option a hidden one and get a cleaner configuration.
> This option just selects a common infrastructure for MTD-based devices
> to expose a block interface. There is no point in allowing a separate
> enable/disable.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 5fab4e6e..2a0ca2a 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -158,9 +158,7 @@ config MTD_BCM47XX_PARTS
>  comment "User Modules And Translation Layers"
>  
>  config MTD_BLKDEVS
> -	tristate "Common interface to block layer for MTD 'translation layers'"
> -	depends on BLOCK
> -	default n
> +	bool
>  
>  config MTD_BLOCK
>  	tristate "Caching block device access to MTD devices"

Hmm, I'm seeing some issues with this patch. I think it's problematic
that you are changing MTD_BLKDEVS from tristate to bool. We can't have
MTD_BLKDEVS built into the kernel while MTD itself is built as a module.
This manifests in linker errors in my all-module builds, with .config
like this (note that MTD_BLKDEVS gets "select"ed by MTD_SWAP, which
forces it to be built-in, not built as a module):

CONFIG_MTD=m
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_SWAP=m

[...]
  Building modules, stage 2.
    MODPOST 14 modules
    ERROR: "deregister_mtd_blktrans" [drivers/mtd/mtdswap.ko] undefined!
    ERROR: "register_mtd_blktrans" [drivers/mtd/mtdswap.ko] undefined!
    ERROR: "add_mtd_blktrans_dev" [drivers/mtd/mtdswap.ko] undefined!
    ERROR: "mtd_blktrans_cease_background" [drivers/mtd/mtdswap.ko] undefined!
    ERROR: "del_mtd_blktrans_dev" [drivers/mtd/mtdswap.ko] undefined!
    make[1]: *** [__modpost] Error 1
    make: *** [modules] Error 2

I believe the correct solution would be the following additional diff:

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index cdaa4e512c97..5ebcda39f554 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -161,7 +161,7 @@ comment "User Modules And Translation Layers"
 # MTD block device support is select'ed if needed
 #
 config MTD_BLKDEVS
-	bool
+	tristate
 
 config MTD_BLOCK
 	tristate "Caching block device access to MTD devices"
--

I'll squash this into your patch if I don't hear any objections.

Brian
