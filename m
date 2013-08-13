Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9FwK-0001qx-Se
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 14:51:18 +0000
Date: Tue, 13 Aug 2013 11:50:43 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
Subject: Re: [PATCH 1/1] Resubmit mtd: mtdoops: fix for a potential memory
 leak in mtdoops_notify_remove
Message-ID: <20130813145041.GB2359@localhost>
References: <1376369315-5170-1-git-send-email-nilanjan.roychowdhury@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1376369315-5170-1-git-send-email-nilanjan.roychowdhury@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nilanjan,

On Mon, Aug 12, 2013 at 09:48:35PM -0700, Nilanjan Roychowdhury wrote:
> we are allocating cxt->oops_page_used using vmalloc in mtdoops_notify_add for
> every mtd_info addition but not freeing it in mtdoops_notify_remove. Also care is
> taken so that we do not free the same pointer again in module remove.
> 

Could you re-send this with a better commit message?

In particular we'd like to see why you're doing this, explaining
how the current implementation implies a possible leak, explaining under
what circumstance this leak.

I think it would be great if you could test the patch and also add
some information about the testing scenario.

Please note the subject should be "[PATCH v2] mtd: ...", with a
proper patch version number. The next patch will be v3 (and so on) which
should be stated in the subject.

Also...

> Signed-off-by: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
> ---

In this place (between the "---" and the diffstat) you can put some
changelog information, like this:

Changes from v2:
 * Did this and that.

Changes from v1:
 * Added check to vfree() in remove function as suggested by Ezequiel.

>  drivers/mtd/mtdoops.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 97bb8f6..4b8b621 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -386,6 +386,8 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
>  	cxt->mtd = NULL;
>  	flush_work(&cxt->work_erase);
>  	flush_work(&cxt->work_write);
> +	vfree(cxt->oops_page_used);
> +	cxt->oops_page_used = NULL;
>  }
>  
>  
> @@ -439,7 +441,8 @@ static void __exit mtdoops_exit(void)
>  
>  	unregister_mtd_user(&mtdoops_notifier);
>  	vfree(cxt->oops_buf);
> -	vfree(cxt->oops_page_used);
> +	if (cxt->oops_page_used)
> +		vfree(cxt->oops_page_used);
>  }
>  
>  
> -- 
> 1.7.9.5
> 

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
