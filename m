Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS6Fg-0000Ii-DJ
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 16:30:13 +0000
Received: by pdbfa8 with SMTP id fa8so3315421pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 09:29:51 -0700 (PDT)
Date: Wed, 19 Aug 2015 09:29:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: richard@nod.at, dedekind1@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: correct the size of nnode in memset
Message-ID: <20150819162947.GW60523@google.com>
References: <1439972932-12116-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439972932-12116-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 19, 2015 at 04:28:52PM +0800, Dongsheng Yang wrote:
> There is a typo in lpt to memset nnode by the
> size in sizeof(stuct ubifs_pnode).
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Pushed to mtd-utils.git, as it's obvious. Good catch!

I'll take a look at your restructuring patches eventually. But I'll
usually just defer UBIFS stuff to Richard/Artem/others.

> ---
>  mkfs.ubifs/lpt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
> index f6d4352..6aa0b88 100644
> --- a/mkfs.ubifs/lpt.c
> +++ b/mkfs.ubifs/lpt.c
> @@ -384,7 +384,7 @@ int create_lpt(struct ubifs_info *c)
>  		goto out;
>  	}
>  	memset(pnode, 0 , sizeof(struct ubifs_pnode));
> -	memset(nnode, 0 , sizeof(struct ubifs_pnode));
> +	memset(nnode, 0 , sizeof(struct ubifs_nnode));

FWIW, struct ubifs_pnode and struct ubifs_nnode look like they would be
the same size when using 32-bit pointers, but a bit different (see the
third field in structs ubifs_nbranch and ubifs_lprops) with 64-bit.

>  
>  	c->lscan_lnum = c->main_first;
>  
> -- 
> 1.8.4.2

Brian
