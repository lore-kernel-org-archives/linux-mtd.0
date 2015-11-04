Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtwpP-0007kI-Gn
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 12:06:12 +0000
Received: by qgeo38 with SMTP id o38so38348113qge.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 04:05:49 -0800 (PST)
Date: Wed, 4 Nov 2015 09:01:46 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-cris-kernel@axis.com, Jesper Nilsson <jespern@axis.com>
Subject: Re: [PATCH] mtd: don't WARN about overloaded users of
 mtd->reboot_notifier.notifier_call
Message-ID: <20151104120146.GA30628@laptop.cereza>
References: <1446598913-133086-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446598913-133086-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03 Nov 05:01 PM, Brian Norris wrote:
> There are multiple types of users of mtd->reboot_notifier.notifier_call:
> 
> (1) A while back, the cfi_cmdset_000{1,2} chip drivers implemented a
> reboot notifier to (on a best effort basis) attempt to reset their flash
> chips before rebooting.
> 
> (2) More recently, we implemented a common _reboot() hook so that MTD
> drivers (particularly, NAND flash) could better halt I/O operations
> without having to reimplement the same notifier boilerplate.
> 
> Currently, the WARN_ONCE() condition here was written to handle (2), but
> at the same time it mis-diagnosed case (1) as an already-registered MTD.
> Let's fix this by having the WARN_ONCE() condition better imitate the
> condition that immediately follows it. (Wow, I don't know how I missed
> that one.)
> 
> (Side note: Unfortunately, we can't yet combine the reboot notifier code
> for (1) and (2) with a patch like [1], because some users of (1) also
> use mtdconcat, and so the mtd_info struct from cfi_cmdset_000{1,2} won't
> actually get registered with mtdcore, and therefore their reboot
> notifier won't get registered.)
> 
> [1] http://patchwork.ozlabs.org/patch/417981/
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Jesper Nilsson <jespern@axis.com>
> Cc: linux-cris-kernel@axis.com
> ---
> This is probably a 4.4 candidate
> 

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,

>  drivers/mtd/mtdcore.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index b1eea48c501d..a91cee90aef9 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -616,7 +616,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  	 * does cause problems with parse_mtd_partitions() above (e.g.,
>  	 * cmdlineparts will register partitions more than once).
>  	 */
> -	WARN_ONCE(mtd->reboot_notifier.notifier_call, "MTD already registered\n");
> +	WARN_ONCE(mtd->_reboot && mtd->reboot_notifier.notifier_call,
> +		  "MTD already registered\n");
>  	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
>  		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
>  		register_reboot_notifier(&mtd->reboot_notifier);
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
