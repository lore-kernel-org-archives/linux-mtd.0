Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCahE-0002aJ-JD
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 15:19:24 +0000
Subject: Re: [patch 4/4] mtd/nand: fix multi-chip suspend problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200911172245.nAHMjnss001994@imap1.linux-foundation.org>
References: <200911172245.nAHMjnss001994@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Nov 2009 17:19:04 +0200
Message-Id: <1258989544.18407.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: b24347@freescale.com, leoli@freescale.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-17 at 14:45 -0800, akpm@linux-foundation.org wrote:
> From: Li Yang <leoli@freescale.com>
> 
> Symptom:
> device_suspend(): mtd_cls_suspend+0x0/0x58 returns -11
> PM: Device mtd14 failed to suspend: error -11
> PM: Some devices failed to suspend
> 
> This patch enables other chips to be suspended if the active chip of
> the controller has been suspended.
> 
> Signed-off-by: Jin Qing <b24347@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  drivers/mtd/nand/nand_base.c |   14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff -puN drivers/mtd/nand/nand_base.c~mtd-nand-fix-multi-chip-suspend-problem drivers/mtd/nand/nand_base.c
> --- a/drivers/mtd/nand/nand_base.c~mtd-nand-fix-multi-chip-suspend-problem
> +++ a/drivers/mtd/nand/nand_base.c
> @@ -697,10 +697,16 @@ nand_get_device(struct nand_chip *chip, 
>  		spin_unlock(lock);
>  		return 0;
>  	}
> -	if (new_state == FL_PM_SUSPENDED) {
> -		spin_unlock(lock);
> -		return (chip->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
> -	}
> +	if (new_state == FL_PM_SUSPENDED)
> +		if (chip->controller->active->state == FL_PM_SUSPENDED) {
> +			chip->state = FL_PM_SUSPENDED;
> +			spin_unlock(lock);
> +			return 0;
> +		} else {
> +			spin_unlock(lock);
> +			return -EAGAIN;
> +		}
> +
>  	set_current_state(TASK_UNINTERRUPTIBLE);
>  	add_wait_queue(wq, &wait);
>  	spin_unlock(lock);

This patch casing the following gcc warning:

drivers/mtd/nand/nand_base.c: In function ‘nand_get_device’:
drivers/mtd/nand/nand_base.c:700: warning: suggest explicit braces to
avoid ambiguous ‘else’

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
