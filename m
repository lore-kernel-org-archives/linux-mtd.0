Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj0ZI-0003xY-5j
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 23:16:04 +0000
Date: Mon, 7 Apr 2008 16:15:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmitry Adamushko <dmitry.adamushko@gmail.com>
Subject: Re: [PATCH] mtd/chips: add missing set_current_state() to
	cfi_{amdstd,staa}_sync()
Message-Id: <20080407161555.3dd540f9.akpm@linux-foundation.org>
In-Reply-To: <1207251503.6300.9.camel@earth>
References: <1207251503.6300.9.camel@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 03 Apr 2008 21:38:23 +0200
Dmitry Adamushko <dmitry.adamushko@gmail.com> wrote:

> From: Dmitry Adamushko <dmitry.adamushko@gmail.com>
> Subject: [mtd/chips] add missing set_current_state() to cfi_{amdstd,staa}_sync()
> 
> cfi_amdstd_sync() and cfi_staa_sync() call schedule() without changing
> task's state appropriately.
> 
> In case of e.g. chip->state == FL_ERASING, cfi_*_sync() will be busy-looping
> either redundantly for a fixed interval of time (for SCHED_NORMAL tasks) or
> possibly endlessly (for RT tasks and UP).
> 
> Signed-off-by: Dmitry Adamushko <dmitry.adamushko@gmail.com>
> 
> ---
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index d072e87..458d477 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1763,6 +1763,7 @@ static void cfi_amdstd_sync (struct mtd_info *mtd)
>  
>  		default:
>  			/* Not an idle state */
> +			set_current_state(TASK_UNINTERRUPTIBLE);
>  			add_wait_queue(&chip->wq, &wait);
>  
>  			spin_unlock(chip->mutex);
> diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
> index b344ff8..492e2ab 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0020.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0020.c
> @@ -1015,6 +1015,7 @@ static void cfi_staa_sync (struct mtd_info *mtd)
>  
>  		default:
>  			/* Not an idle state */
> +			set_current_state(TASK_UNINTERRUPTIBLE);
>  			add_wait_queue(&chip->wq, &wait);
>  
>  			spin_unlock_bh(chip->mutex);

The change certainly looks correct.  Has it been runtime tested?

Thanks.
