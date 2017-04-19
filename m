Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0uTK-0004mM-Up
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 18:37:01 +0000
Received: by mail-io0-x243.google.com with SMTP id d203so6067535iof.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 11:36:37 -0700 (PDT)
Date: Wed, 19 Apr 2017 11:36:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jffs2: fix spelling mistake: "requestied" -> "requested"
Message-ID: <20170419183634.GA20555@google.com>
References: <20170223003400.9617-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170223003400.9617-1-colin.king@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 23, 2017 at 12:34:00AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> trivial fix to spelling mistake in JFFS2_ERROR message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/jffs2/readinode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index 06a71db..40f3fd4 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
> @@ -1366,7 +1366,7 @@ int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
>  		jffs2_add_ino_cache(c, f->inocache);
>  	}
>  	if (!f->inocache) {
> -		JFFS2_ERROR("requestied to read an nonexistent ino %u\n", ino);
> +		JFFS2_ERROR("requested to read an nonexistent ino %u\n", ino);

Also:

s/an nonexistent/a nonexisten/

Made that fixup and pushed to l2-mtd.git. Thanks.

Brian

>  		return -ENOENT;
>  	}
>  
> -- 
> 2.10.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
