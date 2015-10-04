Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zir8q-0005H0-Ks
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2015 21:48:25 +0000
Received: by wicge5 with SMTP id ge5so95882236wic.0
 for <linux-mtd@lists.infradead.org>; Sun, 04 Oct 2015 14:48:02 -0700 (PDT)
Date: Sun, 4 Oct 2015 22:47:58 +0100
From: Brian Norris <computersforpeace@gmail.com>
To: fangwei1@huawei.com, David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2: fix a memleak in read_direntry()
Message-ID: <20151004214758.GA27301@localhost>
References: <1443497035-25220-1-git-send-email-fangwei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443497035-25220-1-git-send-email-fangwei1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 11:23:55AM +0800, fangwei1@huawei.com wrote:
> From: Wei Fang <fangwei1@huawei.com>
> 
> Need to free the memory allocated for 'fd' if failed to read all
> of the remainder name.
> 
> Signed-off-by: Wei Fang <fangwei1@huawei.com>

Patch looks OK to me, and obvious. Applied, but I'm open to comments.

Brian

> ---
>  fs/jffs2/readinode.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index 28e0aab..bfebbf1 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
> @@ -660,8 +660,12 @@ static inline int read_direntry(struct jffs2_sb_info *c, struct jffs2_raw_node_r
>  
>  		err = jffs2_flash_read(c, (ref_offset(ref)) + read,
>  				rd->nsize - already, &read, &fd->name[already]);
> -		if (unlikely(read != rd->nsize - already) && likely(!err))
> +		if (unlikely(read != rd->nsize - already) && likely(!err)) {
> +			jffs2_free_full_dirent(fd);
> +			JFFS2_ERROR("short read: wanted %d bytes, got %zd\n",
> +				    rd->nsize - already, read);
>  			return -EIO;
> +		}
>  
>  		if (unlikely(err)) {
>  			JFFS2_ERROR("read remainder of name: error %d\n", err);
> -- 
> 1.7.1
> 
