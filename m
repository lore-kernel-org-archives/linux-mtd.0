Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am8oV-0007dz-5v
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 23:49:15 +0000
Received: by mail-pa0-x22a.google.com with SMTP id fe3so101523336pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 16:48:53 -0700 (PDT)
Date: Fri, 1 Apr 2016 16:48:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "zhaoxiu.zeng" <zhaoxiu.zeng@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 21/31] mtd: use parity16 in ssfdc.c
Message-ID: <20160401234850.GM2545@google.com>
References: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
 <56F78ACB.1010402@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56F78ACB.1010402@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 27, 2016 at 03:24:59PM +0800, zhaoxiu.zeng wrote:
> From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
> 
> Signed-off-by: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>

I'm not CC'd on the rest of this series, where you defined parity16().
And I doubt you've tested this. So I'm not applying.

Brian

>  drivers/mtd/ssfdc.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
> index daf82ba..b4d9144 100644
> --- a/drivers/mtd/ssfdc.c
> +++ b/drivers/mtd/ssfdc.c
> @@ -182,24 +182,10 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
>  	return 0;
>  }
>  
> -/* Parity calculator on a word of n bit size */
> -static int get_parity(int number, int size)
> -{
> - 	int k;
> -	int parity;
> -
> -	parity = 1;
> -	for (k = 0; k < size; k++) {
> -		parity += (number >> k);
> -		parity &= 1;
> -	}
> -	return parity;
> -}
> -
>  /* Read and validate the logical block address field stored in the OOB */
>  static int get_logical_address(uint8_t *oob_buf)
>  {
> -	int block_address, parity;
> +	int block_address;
>  	int offset[2] = {6, 11}; /* offset of the 2 address fields within OOB */
>  	int j;
>  	int ok = 0;
> @@ -215,11 +201,9 @@ static int get_logical_address(uint8_t *oob_buf)
>  
>  		/* Check for the signature bits in the address field (MSBits) */
>  		if ((block_address & ~0x7FF) == 0x1000) {
> -			parity = block_address & 0x01;
>  			block_address &= 0x7FF;
> -			block_address >>= 1;
>  
> -			if (get_parity(block_address, 10) != parity) {
> +			if (!parity16(block_address)) {
>  				pr_debug("SSFDC_RO: logical address field%d"
>  					"parity error(0x%04X)\n", j+1,
>  					block_address);
> -- 
> 2.5.5
> 
