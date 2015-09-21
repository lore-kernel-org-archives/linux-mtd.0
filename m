Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeAVz-0002R0-V8
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 23:28:56 +0000
Received: by pacex6 with SMTP id ex6so129726140pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 16:28:35 -0700 (PDT)
Date: Mon, 21 Sep 2015 16:28:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>,
 Richard Weinberger <richard@nod.at>, linux-mips@linux-mips.org,
 Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [RESEND PATCH v3 5/5] mtd: nand: remove custom 'erased check'
 implementation
Message-ID: <20150921232832.GG31505@google.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-6-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1441296222-14989-6-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ others

On Thu, Sep 03, 2015 at 06:03:42PM +0200, Boris Brezillon wrote:
> Some drivers are manually checking for 'erased pages' while correcting
> ECC bytes.
> This logic is now done by the core infrastructure, and can thus be removed
> from those drivers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |  8 --------
>  drivers/mtd/nand/diskonchip.c   | 32 ++------------------------------
>  drivers/mtd/nand/jz4740_nand.c  | 18 ------------------
>  3 files changed, 2 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 816ef53..0d6adbe 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -316,14 +316,6 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
>  	unsigned num_errors, corrected;
>  	unsigned long timeo;
>  
> -	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
> -	for (i = 0; i < 10; i++) {
> -		if (ecc_code[i] != 0xff)
> -			goto compare;
> -	}
> -	return 0;
> -
> -compare:
>  	/* Unpack ten bytes into eight 10 bit values.  We know we're
>  	 * little-endian, and use type punning for less shifting/masking.
>  	 */
> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> index 7da266a..eb65769 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c
> @@ -936,37 +936,9 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
>  				calc_ecc[i] = ReadDOC_(docptr, DoC_Mplus_ECCSyndrome0 + i);
>  			else
>  				calc_ecc[i] = ReadDOC_(docptr, DoC_ECCSyndrome0 + i);
> -			if (calc_ecc[i] != empty_read_syndrome[i])
> -				emptymatch = 0;
>  		}
> -		/* If emptymatch=1, the read syndrome is consistent with an
> -		   all-0xff data and stored ecc block.  Check the stored ecc. */
> -		if (emptymatch) {
> -			for (i = 0; i < 6; i++) {
> -				if (read_ecc[i] == 0xff)
> -					continue;
> -				emptymatch = 0;
> -				break;
> -			}
> -		}
> -		/* If emptymatch still =1, check the data block. */
> -		if (emptymatch) {
> -			/* Note: this somewhat expensive test should not be triggered
> -			   often.  It could be optimized away by examining the data in
> -			   the readbuf routine, and remembering the result. */
> -			for (i = 0; i < 512; i++) {
> -				if (dat[i] == 0xff)
> -					continue;
> -				emptymatch = 0;
> -				break;
> -			}
> -		}
> -		/* If emptymatch still =1, this is almost certainly a freshly-
> -		   erased block, in which case the ECC will not come out right.
> -		   We'll suppress the error and tell the caller everything's
> -		   OK.  Because it is. */
> -		if (!emptymatch)
> -			ret = doc_ecc_decode(rs_decoder, dat, calc_ecc);
> +
> +		ret = doc_ecc_decode(rs_decoder, dat, calc_ecc);
>  		if (ret > 0)
>  			printk(KERN_ERR "doc200x_correct_data corrected %d errors\n", ret);
>  	}

I see new warnings:

drivers/mtd/nand/diskonchip.c: At top level:
drivers/mtd/nand/diskonchip.c: In function ‘doc200x_correct_data’:
drivers/mtd/nand/diskonchip.c:915:6: warning: unused variable ‘emptymatch’ [-Wunused-variable]
  int emptymatch = 1;
      ^
drivers/mtd/nand/diskonchip.c:79:15: warning: ‘empty_read_syndrome’ defined but not used [-Wunused-variable]
 static u_char empty_read_syndrome[6] = { 0x26, 0xff, 0x6d, 0x47, 0x73, 0x7a };
               ^

I'd also like test results for these drivers before doing this. And I'm
not sure how to find good testers for these drivers, even it users still
exist.

> diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
> index ba44af3..4d73276 100644
> --- a/drivers/mtd/nand/jz4740_nand.c
> +++ b/drivers/mtd/nand/jz4740_nand.c
> @@ -224,24 +224,6 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
>  	uint32_t t;
>  	unsigned int timeout = 1000;
>  
> -	t = read_ecc[0];
> -
> -	if (t == 0xff) {
> -		for (i = 1; i < 9; ++i)
> -			t &= read_ecc[i];
> -
> -		t &= dat[0];
> -		t &= dat[nand->chip.ecc.size / 2];
> -		t &= dat[nand->chip.ecc.size - 1];
> -
> -		if (t == 0xff) {
> -			for (i = 1; i < nand->chip.ecc.size - 1; ++i)
> -				t &= dat[i];
> -			if (t == 0xff)
> -				return 0;
> -		}
> -	}
> -
>  	for (i = 0; i < 9; ++i)
>  		writeb(read_ecc[i], nand->base + JZ_REG_NAND_PAR0 + i);
>  
> -- 
> 1.9.1
> 
