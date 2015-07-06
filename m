Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCEVI-0005Kw-FD
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 22:04:45 +0000
Received: by pddu5 with SMTP id u5so25322709pdd.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2015 15:04:23 -0700 (PDT)
Date: Mon, 6 Jul 2015 15:04:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: richard.weinberger@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/4] mtd-utils: fix the trailing whitespace problems
Message-ID: <20150706220416.GC22005@brian-ubuntu>
References: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 01, 2015 at 11:44:14AM +0800, Dongsheng Yang wrote:
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  MAKEDEV                        | 2 +-
>  fectest.c                      | 3 +--
>  tests/ubi-tests/stress-test.sh | 8 ++++----
>  ubi-utils/libubi.c             | 2 +-
>  4 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/MAKEDEV b/MAKEDEV
> index b31e61f..a4141b5 100755
> --- a/MAKEDEV
> +++ b/MAKEDEV
> @@ -38,5 +38,5 @@ for a in `seq 0 16` ; do
>  	mknod /dev/mtd$a c 90 `expr $a + $a`
>  	mknod /dev/mtdr$a c 90 `expr $a + $a + 1`
>  	mknod /dev/mtdblock$a b 31 $a
> -done	
> +done
>  
> diff --git a/fectest.c b/fectest.c
> index c1fbd52..fd577f3 100644
> --- a/fectest.c
> +++ b/fectest.c
> @@ -11,7 +11,6 @@
>  #include <crc32.h>
>  
>  #define ERASE_SIZE 131072
> -//#define PKT_SIZE 1400

The subject isn't exactly correct, since you're also killing this
comment. But these look good. Pushed patches 1, 2, and 3. I'll reexamine
4, as it's a bit bigger of a change.

Thanks,
Brian

>  #define NR_PKTS ((ERASE_SIZE + PKT_SIZE - 1) / PKT_SIZE)
>  #define DROPS 8
>  
> @@ -83,7 +82,7 @@ int main(void)
>  		fd = open("after", O_WRONLY|O_TRUNC|O_CREAT, 0644);
>  		if (fd >= 0)
>  			write(fd, pktbuf, ERASE_SIZE);
> -		
> +
>  		exit(1);
>  	}
>  
> diff --git a/tests/ubi-tests/stress-test.sh b/tests/ubi-tests/stress-test.sh
> index 50c563a..a150495 100755
> --- a/tests/ubi-tests/stress-test.sh
> +++ b/tests/ubi-tests/stress-test.sh
> @@ -60,12 +60,12 @@ print_params()
>  	if [ "$module" = "nandsim" ]; then
>  		printf "%s" "page size ${page_size}KiB, VID offset $vid_offs, "
>  	fi
> -	printf "%s\n" "fastmap $fastmap" 
> +	printf "%s\n" "fastmap $fastmap"
>  }
>  
>  # Load mtdram with specified size and PEB size
>  # Usage: load_mtdram <flash size> <PEB size>
> -# 1. Flash size is specified in MiB 
> +# 1. Flash size is specified in MiB
>  # 2. PEB size is specified in KiB
>  load_mtdram()
>  {
> @@ -86,7 +86,7 @@ print_separator()
>  # Usage: run_test <nandsim|mtdram> <flash size> <PEB size> \
>  #                 <Page size> <VID hdr offs> <enable fastmap>
>  # 1. Simulator type (nandsim or mtdram)
> -# 2. Flash size is specified in MiB 
> +# 2. Flash size is specified in MiB
>  # 3. PEB size is specified in KiB
>  # 4. Page size is specified in bytes (mtdram ingores this)
>  # 5. VID header offset (mtdram ingores this)
> @@ -98,7 +98,7 @@ run_test()
>  	local peb_size="$3";
>  	local page_size="$4";
>  	local vid_offs="$5"
> -	local fastmap="$6";  
> +	local fastmap="$6";
>  	local fm_supported fm_param mtdnum
>  
>  	print_separator
> diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
> index 1e08b7d..97c0434 100644
> --- a/ubi-utils/libubi.c
> +++ b/ubi-utils/libubi.c
> @@ -792,7 +792,7 @@ int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
>  			req->dev_num = r.ubi_num;
>  			/*
>  			 * The call succeeded. It means that the kernel ignored
> -			 * 'max_beb_per1024' parameter. 
> +			 * 'max_beb_per1024' parameter.
>  			 */
>  			return 1;
>  		} else if (errno != EINVAL)
> -- 
> 1.8.4.2
> 
