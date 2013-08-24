Received: from mail-pd0-f171.google.com ([209.85.192.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD7U8-0004wn-Gg
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 06:38:08 +0000
Received: by mail-pd0-f171.google.com with SMTP id g10so1495384pdj.16
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 23:37:44 -0700 (PDT)
Date: Fri, 23 Aug 2013 23:37:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 7/9] jffs2: init the ret with -EINVAL
Message-ID: <20130824063739.GD32074@brian-ubuntu>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-8-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376879478-22128-8-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com,
 matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 10:31:16AM +0800, Huang Shijie wrote:
> If the media is not SLC nand, dataflash, Sibley flash or a
> ubi volume, we should return -EINVAL to the caller.
> The caller should exit in this case.
> 
> Current code returns 0 in this case which is not proper.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  fs/jffs2/fs.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index fe3c052..0452445 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -702,7 +702,7 @@ void jffs2_gc_release_page(struct jffs2_sb_info *c,
>  }
>  
>  static int jffs2_flash_setup(struct jffs2_sb_info *c) {
> -	int ret = 0;
> +	int ret = -EINVAL;

This doesn't look correct to me. This function isn't meant to screen out
unsupported flash; it's only for doing special things for certain flash.
In fact, I think this will break many NOR flash which currently pass
through this function without doing anything.

If you really want to make MLC NAND fail, you should do it with an
explicit check for MLC, and you probably don't want it in this function.
Maybe in jffs2_do_fill_super(), near the other 'if (c->mtd->type == ...)'
checks (but outside of the #ifndef, of course).

>  
>  	if (jffs2_cleanmarker_oob(c)) {
>  		/* NAND flash... do setup accordingly */

Brian
