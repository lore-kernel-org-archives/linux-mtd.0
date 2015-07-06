Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCEnj-00017l-3Q
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 22:23:47 +0000
Received: by pacgz10 with SMTP id gz10so28050310pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2015 15:23:25 -0700 (PDT)
Date: Mon, 6 Jul 2015 15:23:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: fangwei <fangwei1@huawei.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2: remove unneeded kfree.
Message-ID: <20150706222318.GB18370@brian-ubuntu>
References: <55239023.5000107@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55239023.5000107@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 07, 2015 at 04:06:59PM +0800, fangwei wrote:
> c->oobbuf hasn't been kmalloced in jffs2_dataflash_setup, so
> there is no need to free it.
> 
> Signed-off-by: Wei Fang <fangwei1@huawei.com>
> ---
>  fs/jffs2/wbuf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> index 09ed551..63f31c0 100644
> --- a/fs/jffs2/wbuf.c
> +++ b/fs/jffs2/wbuf.c
> @@ -1274,7 +1274,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
>  #ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
>         c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
>         if (!c->wbuf_verify) {
> -               kfree(c->oobbuf);
>                 kfree(c->wbuf);
>                 return -ENOMEM;
>         }

Your patches are whitespace damaged and cannot be applied. Please fix
your mailer and resend. Consider retesting by sending to yourself and
try using git-am. If all else fails, git-send-email is your friend.

Thanks,
Brian
