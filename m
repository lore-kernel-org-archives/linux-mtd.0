Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCSk8-0000rL-7J
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 15:58:23 +0000
Subject: NAK: [PATCH][mtd-next] mtd: sharpslpart: fix overflow on block_adr
 calculation
From: Colin Ian King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20171108154649.30096-1-colin.king@canonical.com>
Message-ID: <c69cae0f-0490-20b7-9706-78d2ef2d3c73@canonical.com>
Date: Wed, 8 Nov 2017 15:57:57 +0000
MIME-Version: 1.0
In-Reply-To: <20171108154649.30096-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/11/17 15:46, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Multiplying block_num and mtd->erasesize may potentially overflow
> as they are both unsigned ints and so the multiplication is evaluated
> in unsigned int arithmetic .  Cast block_adr to off_t to ensure
> multiplication is off_t sized to avoid any potential overflow.
> 
> Detected by CoverityScan, CID#1461264 ("Unintentional integer overflow")
> 
> Fixes: fff1e32a50c0 ("mtd: sharpslpart: Add sharpslpart partition parser")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/parsers/sharpslpart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
> index 5fe0079ea5ed..b1d97aa3bac4 100644
> --- a/drivers/mtd/parsers/sharpslpart.c
> +++ b/drivers/mtd/parsers/sharpslpart.c
> @@ -244,7 +244,7 @@ static int sharpsl_nand_read_laddr(struct mtd_info *mtd,
>  		return -EINVAL;
>  
>  	block_num = ftl->log2phy[log_num];
> -	block_adr = block_num * mtd->erasesize;
> +	block_adr = (loff_t)block_num * mtd->erasesize;
>  	block_ofs = mtd_mod_by_eb((u32)from, mtd);
>  
>  	err = mtd_read(mtd, block_adr + block_ofs, len, &retlen, buf);
> 

Sorry, ignore this, there is another place that does this that needs
some attention. I'll sent V2 shortly.
