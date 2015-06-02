Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzhAc-0003iL-6b
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2015 08:03:35 +0000
Message-ID: <556D633E.70300@nod.at>
Date: Tue, 02 Jun 2015 10:03:10 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/4] mtd: warn when registering the same master many times
References: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
 <1433200640-17858-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1433200640-17858-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.06.2015 um 01:17 schrieb Brian Norris:
> When CONFIG_MTD_PARTITIONED_MASTER=y, it is fatal to call
> mtd_device_parse_register() twice on the same MTD, as we try to register
> the same device/kobject multipile times.
> 
> When CONFIG_MTD_PARTITIONED_MASTER=n, calling
> mtd_device_parse_register() is more of just a nuisance, as we can mostly
> navigate around any conflicting actions.
> 
> But anyway, doing so is a Bad Thing (TM), and we should complain loudly
> for any drivers that try to do this.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/mtdcore.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 03eec42dc715..f0e157e0be89 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -387,6 +387,14 @@ int add_mtd_device(struct mtd_info *mtd)
>  	struct mtd_notifier *not;
>  	int i, error;
>  
> +	/*
> +	 * May occur, for instance, on buggy drivers which call
> +	 * mtd_device_parse_register() multiple times on the same master MTD,
> +	 * especially with CONFIG_MTD_PARTITIONED_MASTER=y.
> +	 */
> +	if (WARN(mtd->backing_dev_info, "MTD already registered\n"))
> +		return -EEXIST;
> +
>  	mtd->backing_dev_info = &mtd_bdi;
>  
>  	BUG_ON(mtd->writesize == 0);
> @@ -597,6 +605,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  	 * does cause problems with parse_mtd_partitions() above (e.g.,
>  	 * cmdlineparts will register partitions more than once).
>  	 */
> +	WARN(mtd->reboot_notifier.notifier_call, "MTD already registered\n");
>  	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
>  		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
>  		register_reboot_notifier(&mtd->reboot_notifier);

One minor nit, IMHO WARN_ONCE() would make more sense.

Beside of that:
Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
