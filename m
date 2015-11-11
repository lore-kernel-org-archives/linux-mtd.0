Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwduL-0001fH-Qf
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 22:30:57 +0000
Received: by pabfh17 with SMTP id fh17so43217489pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 14:30:10 -0800 (PST)
Date: Wed, 11 Nov 2015 14:30:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: david@sigma-star.at, dedekind1@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH V3 01/27] mtd-utils: Restructure the mtd-utils source.
Message-ID: <20151111223007.GC71848@google.com>
References: <1444882208-4455-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1446261121-9978-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446261121-9978-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 31, 2015 at 11:12:01AM +0800, Dongsheng Yang wrote:
> * There is no code modification in this commit, only moving
> * the files to proper place.
> 
> The user tools looks a little messy as we place almost
> the all tools in the root directory of mtd-utils. To make
> it more clear, I propose to introduce the following structure
> for our source code.
> 
> mtd-utils/
> 	|-- lib
> 	|-- include
> 	|-- misc-utils
> 	|-- jffsX-utils
> 	|-- nand-utils
> 	|-- nor-utils
> 	|-- ubi-utils
> 	|-- ubifs-utils
> 	`-- tests
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
> changelog:
> 	v1:
> 		- move tools in flash-utils to misc-utils
> 		- change dir in gitignore
> 		- remove flash_info in gitignore
> 		- add mtdpart in gitignore
>  .gitignore                                         | 54 +++++++++----------

This patch doesn't apply, due to .gitignore. I don't know what repo
you're patching of, but it's not the tip of mtd-utils.git...

...

> diff --git a/.gitignore b/.gitignore
> index 83ca938..e1d23cd 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -18,33 +18,33 @@
>  #
>  # Our programs
>  #
> -/doc_loadbios
> -/docfdisk
> -/flash_erase
> -/flash_info
> -/flash_lock
> -/flash_otp_dump
> -/flash_otp_info
> -/flash_otp_lock
> -/flash_otp_write
> -/flash_unlock
> -/flashcp
> -/ftl_check
> -/ftl_format
> -/jffs2dump
> -/jffs2reader
> -/mkfs.jffs2
> -/mtd_debug

You're missing mtdpart?

> -/nanddump
> -/nandtest
> -/nandwrite
> -/nftl_format
> -/nftldump
> -/recv_image
> -/rfddump
> -/rfdformat
> -/serve_image
> -/sumtool
> +/misc-utils/mtdpart

But it shows up here?

> +/misc-utils/doc_loadbios
> +/misc-utils/docfdisk
> +/misc-utils/flash_erase
> +/misc-utils/flash_lock
> +/misc-utils/flash_otp_dump
> +/misc-utils/flash_otp_info
> +/misc-utils/flash_otp_lock
> +/misc-utils/flash_otp_write
> +/misc-utils/flash_unlock
> +/misc-utils/flashcp
> +/misc-utils/ftl_check
> +/misc-utils/ftl_format
> +/jffsX-utils/jffs2dump
> +/jffsX-utils/jffs2reader
> +/jffsX-utils/mkfs.jffs2
> +/misc-utils/mtd_debug
> +/nand-utils/nanddump
> +/nand-utils/nandtest
> +/nand-utils/nandwrite
> +/nand-utils/nftl_format
> +/nand-utils/nftldump
> +/misc-utils/recv_image
> +/nor-utils/rfddump
> +/nor-utils/rfdformat
> +/misc-utils/serve_image
> +/jffsX-utils/sumtool
>  
>  #
>  # Top-level generic files

Brian
