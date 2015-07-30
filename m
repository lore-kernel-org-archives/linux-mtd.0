Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKqzT-0007GN-6d
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 16:47:31 +0000
Received: by pdrg1 with SMTP id g1so27256604pdr.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jul 2015 09:47:09 -0700 (PDT)
Date: Thu, 30 Jul 2015 09:47:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: richard.weinberger@gmail.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] ubifs: Kconfig: fix the description in Kconfig
Message-ID: <20150730164701.GA42191@google.com>
References: <1435728600-14560-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435728600-14560-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 01, 2015 at 01:29:59PM +0800, Dongsheng Yang wrote:
> If unsure we would say 'N' rather than 'Y'.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
> index ba66d50..f9aaad1 100644
> --- a/fs/ubifs/Kconfig
> +++ b/fs/ubifs/Kconfig
> @@ -27,11 +27,11 @@ config UBIFS_FS_LZO
>  	default y
>  	help
>  	   LZO compressor is generally faster than zlib but compresses worse.
> -	   Say 'Y' if unsure.
> +	   Say 'N' if unsure.

Why would we recommend 'N' yet set the default to 'Y'? Seems like
some dissonance.

Also, I'm not an expert on UBIFS, but I imagine the suggestion to say
yes is because of legacy support; what if you need to mount a file
system that was created with LZO?

>  
>  config UBIFS_FS_ZLIB
>  	bool "ZLIB compression support" if UBIFS_FS_ADVANCED_COMPR
>  	depends on UBIFS_FS
>  	default y
>  	help
> -	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
> +	  Zlib compresses better than LZO but it is slower. Say 'N' if unsure.

Same here.

Brian
