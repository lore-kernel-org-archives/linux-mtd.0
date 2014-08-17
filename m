Message-ID: <53F0D88E.3040300@infradead.org>
Date: Sun, 17 Aug 2014 09:30:06 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
To: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: fix DocBook warnings on nand_sdr_timings doc
References: <1408264182-31830-1-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1408264182-31830-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/17/14 01:29, Boris BREZILLON wrote:
> Change the comment type (from /** to /*) to prevent DocBook from
> complaining about missing description for nand_sdr_timings fields.
> 
> There is currently no need in documenting those fields because they are
> fully described in the ONFI specification (which is pointed out in the
> comment).
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/mtd/nand.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 3083c53..c300db3 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -949,7 +949,7 @@ static inline int jedec_feature(struct nand_chip *chip)
>  		: 0;
>  }
>  
> -/**
> +/*
>   * struct nand_sdr_timings - SDR NAND chip timings
>   *
>   * This struct defines the timing requirements of a SDR NAND chip.
> 


-- 
~Randy
