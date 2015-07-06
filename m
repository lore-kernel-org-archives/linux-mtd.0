Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCErw-0002zt-7o
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 22:28:08 +0000
Received: by pdbci14 with SMTP id ci14so113065365pdb.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2015 15:27:47 -0700 (PDT)
Date: Mon, 6 Jul 2015 15:27:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Fang <fangwei1@huawei.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2: remove unneeded kfree
Message-ID: <20150706222740.GC18370@brian-ubuntu>
References: <558BADE1.2070704@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <558BADE1.2070704@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 25, 2015 at 03:29:37PM +0800, Wei Fang wrote:
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

I just realized I responded to your email from months ago. But I see you
sent the same patch here. Both are similarly whitespace damaged. Please
fix and test on your end before resending again.

Thanks,
Brian
