Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1ODwxS-0005Sm-I9
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 09:49:59 +0000
Received: by fxm12 with SMTP id 12so3353089fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 May 2010 02:49:56 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: gen_probe: use AMD standard command-set with Winbond
	flash chips
Date: Mon, 17 May 2010 11:51:45 +0200
References: <20100517093942.12147.98889.stgit@dev.siriade.com>
In-Reply-To: <20100517093942.12147.98889.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201005171151.45960.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Guillaume LECERF <glecerf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guillaume,

On Monday 17 May 2010 11:39:42 Guillaume LECERF wrote:
> Tested with W19L320SBT9C [1].
> 
> [1]
> http://www.datasheetarchive.com/pdf-datasheets/Datasheets-40/DSA-795343.pd
> f
> 

That's correct, thanks!

> Signed-off-by: Obinou <obconseil@gmail.com>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Acked-by: Florian Fainelli <florian@openwrt.org>

> ---
>  drivers/mtd/chips/gen_probe.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
> index 75a8f9d..3b9a284 100644
> --- a/drivers/mtd/chips/gen_probe.c
> +++ b/drivers/mtd/chips/gen_probe.c
> @@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct map_info
> *map, int primary) #ifdef CONFIG_MTD_CFI_AMDSTD
>  	case P_ID_AMD_STD:
>  	case P_ID_SST_OLD:
> +	case P_ID_WINBOND:
>  		return cfi_cmdset_0002(map, primary);
>  #endif
>  #ifdef CONFIG_MTD_CFI_STAA
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
