Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRSuo-0005lp-3W
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 20:20:58 +0000
Received: by mail-ie0-f178.google.com with SMTP id to1so3082014ieb.23
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 13:20:35 -0700 (PDT)
Date: Wed, 2 Oct 2013 13:20:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: diskonchip: Fix incorrect placement of __initdata
Message-ID: <20131002202031.GU23337@ld-irv-0074.broadcom.com>
References: <1376300447-7126-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376300447-7126-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 03:10:47PM +0530, Sachin Kamat wrote:
> __initdata should be placed between the variable name and equal
> sign for the variable to be placed in the intended section.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/nand/diskonchip.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> index eaa3c29..b68a495 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c
> @@ -38,7 +38,7 @@
>  #define CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS 0
>  #endif
>  
> -static unsigned long __initdata doc_locations[] = {
> +static unsigned long doc_locations[] __initdata = {
>  #if defined (__alpha__) || defined(__i386__) || defined(__x86_64__)
>  #ifdef CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH
>  	0xfffc8000, 0xfffca000, 0xfffcc000, 0xfffce000,

Pushed to l2-mtd.git. If you're really interested in seeing this
changed, there are a few other similar places in drivers/mtd/. Feel free
to send a patch.

Thanks,
Brian
