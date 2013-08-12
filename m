Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8vti-0000AT-Fg
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 17:27:15 +0000
Date: Mon, 12 Aug 2013 14:26:50 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
Subject: Re: [PATCH 1/1] mtd: mtdoops: fix for a potential memory leak in
 mtdoops_notify_remove
Message-ID: <20130812172649.GB7198@localhost>
References: <1376251908-7451-1-git-send-email-nilanjan.roychowdhury@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1376251908-7451-1-git-send-email-nilanjan.roychowdhury@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 11, 2013 at 01:11:48PM -0700, Nilanjan Roychowdhury wrote:
> we are allocating cxt->oops_page_used using vmalloc in mtdoops_notify_add for
> every mtd_info addition but not freeing it in mtdoops_notify_remove
> 
> Signed-off-by: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
> ---
>  drivers/mtd/mtdoops.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 97bb8f6..02f49aa 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -386,6 +386,7 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
>  	cxt->mtd = NULL;
>  	flush_work(&cxt->work_erase);
>  	flush_work(&cxt->work_write);
> +	vfree(cxt->oops_page_used);
>  }
>  
> -- 
> 1.7.9.5
> 

Have you tested this patch doing an unregister/module remove cycle?

I'm not entirely sure, but I *think* you must also remove the
vfree(cxt->oops_page_used); at mtdoops_exit(). Otherwise,
you might call vfree() twice, the second time on a garbage pointer.

The reason for this is that the unregister_mtd_user(&mtdoops_notifier);
call in mtdoops_exit() will call the .remove callback (causing the first
vfree() with this patch) and then call vfree() for the second time, explicitly.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
