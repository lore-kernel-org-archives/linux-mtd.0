Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydhx8-0001WG-Bv
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 16:26:48 +0000
Received: by pdbni2 with SMTP id ni2so94142214pdb.1
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 09:26:24 -0700 (PDT)
Date: Thu, 2 Apr 2015 09:26:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 2/2] mtd: mtd_oobtest: Fix the address offset with
 vary_offset case
Message-ID: <20150402162619.GG32500@ld-irv-0074>
References: <1417792720-3017-1-git-send-email-rogerq@ti.com>
 <1417792720-3017-3-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417792720-3017-3-git-send-email-rogerq@ti.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 05, 2014 at 05:18:40PM +0200, Roger Quadros wrote:
> When vary_offset is set (e.g. test case 3), the offset is not always
> zero so memcmpshow() will show the wrong offset in the print message.
> To fix this we introduce a new function memcmpshowoffset() which takes
> offset as a parameter and displays the right offset and use it in
> the case where offset is non zero.
> 
> The old memcmpshow() functionality is preserved by converting it into
> a macro with offset preset to 0.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  drivers/mtd/tests/oobtest.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
> index 4da877b..0d5e85d 100644
> --- a/drivers/mtd/tests/oobtest.c
> +++ b/drivers/mtd/tests/oobtest.c
> @@ -122,7 +122,8 @@ static int write_whole_device(void)
>   * Display the address, offset and data bytes at comparison failure.
>   * Return number of bitflips encountered.
>   */
> -static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t count)
> +static size_t memcmpshowoffset(loff_t addr, loff_t offset, const void *cs,
> +			       const void *ct, size_t count)
>  {
>  	const unsigned char *su1, *su2;
>  	int res;
> @@ -132,8 +133,9 @@ static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t cou
>  	for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--, i++) {
>  		res = *su1 ^ *su2;
>  		if (res) {
> -			pr_info("error @addr[0x%lx:0x%x] 0x%x -> 0x%x diff 0x%x\n",
> -				(unsigned long)addr, i, *su1, *su2, res);
> +			pr_info("error @addr[0x%lx:0x%lx] 0x%x -> 0x%x diff 0x%x\n",
> +				(unsigned long)addr, (unsigned long)offset + i,
> +				*su1, *su2, res);

This hunk doesn't apply. You seem to have missed this commit:

commit 806b6ef5676a1c6ea78592174aae15f59bb0a923
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Thu Nov 20 01:26:51 2014 -0800

    mtd: oobtest: correct printf() format specifier for 'size_t'

Please rebase this patch on the latest l2-mtd.git.

Brian

>  			bitflips += hweight8(res);
>  		}
>  	}
> @@ -141,6 +143,9 @@ static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t cou
>  	return bitflips;
>  }
>  
> +#define memcmpshow(addr, cs, ct, count) memcmpshowoffset((addr), 0, (cs), (ct),\
> +							 (count))
> +
>  /*
>   * Compare with 0xff and show the address, offset and data bytes at
>   * comparison failure. Return number of bitflips encountered.
> @@ -224,9 +229,10 @@ static int verify_eraseblock(int ebnum)
>  				errcnt += 1;
>  				return err ? err : -1;
>  			}
> -			bitflips = memcmpshow(addr, readbuf + use_offset,
> -					      writebuf + (use_len_max * i) + use_offset,
> -					      use_len);
> +			bitflips = memcmpshowoffset(addr, use_offset,
> +						    readbuf + use_offset,
> +						    writebuf + (use_len_max * i) + use_offset,
> +						    use_len);
>  
>  			/* verify pre-offset area for 0xff */
>  			bitflips += memffshow(addr, 0, readbuf, use_offset);
> -- 
> 2.1.0
> 
