Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHF2D-0003nm-LK
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 17:39:26 +0000
Received: by padck2 with SMTP id ck2so104078810pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 10:39:04 -0700 (PDT)
Date: Mon, 20 Jul 2015 10:39:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: r852: make ecc_reg 32-bit in r852_ecc_correct
Message-ID: <20150720173901.GC24125@google.com>
References: <1436061461-30560-1-git-send-email-nicolas.iooss_linux@m4x.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436061461-30560-1-git-send-email-nicolas.iooss_linux@m4x.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 05, 2015 at 09:57:41AM +0800, Nicolas Iooss wrote:
> r852_ecc_correct() reads a 32-bit register into a 16-bit variable,
> ecc_reg, but this variable is later used as if it was larger.  This is
> reported by clang when building the kernel with many warnings:
> 
>     drivers/mtd/nand/r852.c:512:11: error: shift count >= width of type
>     [-Werror,-Wshift-count-overflow]
>                     ecc_reg >>= 16;
>                             ^   ~~
> Fix this by making ecc_reg 32-bit, like the return type of
> r852_read_reg_dword().
> 
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
> ---
> 
> As I haven't got the hardware to test this patch, it is only compile-tested.

Looks good to me. Pushed to l2-mtd.git.

Thanks,
Brian

>  drivers/mtd/nand/r852.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
> index 77e96d2df96c..cc6bac537f5a 100644
> --- a/drivers/mtd/nand/r852.c
> +++ b/drivers/mtd/nand/r852.c
> @@ -466,7 +466,7 @@ static int r852_ecc_calculate(struct mtd_info *mtd, const uint8_t *dat,
>  static int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
>  				uint8_t *read_ecc, uint8_t *calc_ecc)
>  {
> -	uint16_t ecc_reg;
> +	uint32_t ecc_reg;
>  	uint8_t ecc_status, err_byte;
>  	int i, error = 0;
>  
> -- 
> 2.4.5
> 
