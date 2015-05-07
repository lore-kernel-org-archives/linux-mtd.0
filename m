Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqFq5-0002sK-Sl
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 07:03:23 +0000
Received: by pdea3 with SMTP id a3so33092678pde.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 00:02:59 -0700 (PDT)
Date: Thu, 7 May 2015 00:02:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Initialize datum before calling
 map_word_load_partial
Message-ID: <20150507070256.GF6055@norris-Latitude-E6410>
References: <1427837363-2782-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427837363-2782-1-git-send-email-christian.riesch@omicron.at>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 31, 2015 at 11:29:22PM +0200, Christian Riesch wrote:
> In do_otp_write we must initialize the variable datum before calling
> map_word_load_partial. Otherwise the upper bits of datum may be undefined,
> which later causes problems in chip_good called by do_write_oneword.

Hmm, are you sure this is actually the problem? It looks to me like the
logic for the "partial write of a word, load old contents" block means
that we *will* initialize datum with old contents, if we're not aligned.
So your initialization actually looks redundant.

Or please help explain, if I'm wrong.

Brian

> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index c50d8cf..c3624eb 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1295,7 +1295,7 @@ static int do_otp_write(struct map_info *map, struct flchip *chip, loff_t adr,
>  		unsigned long bus_ofs = adr & ~(map_bankwidth(map)-1);
>  		int gap = adr - bus_ofs;
>  		int n = min_t(int, len, map_bankwidth(map) - gap);
> -		map_word datum;
> +		map_word datum = map_word_ff(map);
>  
>  		if (n != map_bankwidth(map)) {
>  			/* partial write of a word, load old contents */
> -- 
> 1.7.9.5
> 
