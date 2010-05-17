Subject: Re: [PATCH] mtd: gen_probe: use AMD standard command-set with
	Winbond flash chips
From: David Woodhouse <dwmw2@infradead.org>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100517093942.12147.98889.stgit@dev.siriade.com>
References: <20100517093942.12147.98889.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 May 2010 10:52:47 +0100
Message-ID: <1274089967.6930.6909.camel@macbook.infradead.org>
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

On Mon, 2010-05-17 at 11:39 +0200, Guillaume LECERF wrote:
> Tested with W19L320SBT9C [1].
> 
> [1] http://www.datasheetarchive.com/pdf-datasheets/Datasheets-40/DSA-795343.pdf
> 
> Signed-off-by: Obinou <obconseil@gmail.com>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/gen_probe.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
> index 75a8f9d..3b9a284 100644
> --- a/drivers/mtd/chips/gen_probe.c
> +++ b/drivers/mtd/chips/gen_probe.c
> @@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct map_info *map, int primary)
>  #ifdef CONFIG_MTD_CFI_AMDSTD
>  	case P_ID_AMD_STD:
>  	case P_ID_SST_OLD:
> +	case P_ID_WINBOND:
>  		return cfi_cmdset_0002(map, primary);
>  #endif
>  #ifdef CONFIG_MTD_CFI_STAA

Looks like this won't automatically load the cfi_cmdset_0002 module on
demand, from cfi_cmdset_unknown(). See how the cfi_cmdset_0001 module
does it with aliases for 0003 and 0200.

Your recent addition of P_ID_SST_OLD suffers the same problem. You want
something like this... please test (with CONFIG_MTD_CFI_AMDSTD=m):

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 87e86e9..d81079e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -489,7 +489,11 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 
 	return cfi_amdstd_setup(mtd);
 }
+struct mtd_info *cfi_cmdset_0006(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
+struct mtd_info *cfi_cmdset_0701(struct map_info *map, int primary) __attribute__((alias("cfi_cmdset_0002")));
 EXPORT_SYMBOL_GPL(cfi_cmdset_0002);
+EXPORT_SYMBOL_GPL(cfi_cmdset_0006);
+EXPORT_SYMBOL_GPL(cfi_cmdset_0701);
 
 static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 {
@@ -2040,3 +2044,5 @@ static void cfi_amdstd_destroy(struct mtd_info *mtd)
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");
 MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");
+MODULE_ALIAS("cfi_cmdset_0006");
+MODULE_ALIAS("cfi_cmdset_0701");


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
