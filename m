Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e00W0-00018Z-Fe
 for linux-mtd@lists.infradead.org; Thu, 05 Oct 2017 07:24:34 +0000
Date: Thu, 5 Oct 2017 09:23:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3] mtd: nand: denali: fix setup_data_interface to meet
 tCCS delay
Message-ID: <20171005092354.302ddb98@bbrezillon>
In-Reply-To: <1506694377-8531-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506694377-8531-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 Sep 2017 23:12:57 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The WE_2_RE register specifies the number of clock cycles inserted
> between the rising edge of #WE and the falling edge of #RE.
> 
> The current setup_data_interface implementation takes care of tWHR,
> but tCCS is missing.  Wait for max(tCSS, tWHR) to meet the spec.
> 
> With setup_data_interface() properly programmed, the Denali NAND
> controller can observe the timing, so NAND_WAIT_TCCS flag is unneeded.
> Clarify this in the comment block.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3:
>   - Remove comment abount NAND_WAIT_TWHR because 1/2 seems NACK
> 
> Changes in v2:
>   - newly added
> 
>  drivers/mtd/nand/denali.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 0b268ec..5124f8a 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1004,8 +1004,14 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
>  	tmp |= FIELD_PREP(RE_2_RE__VALUE, re_2_re);
>  	iowrite32(tmp, denali->reg + RE_2_RE);
>  
> -	/* tWHR -> WE_2_RE */
> -	we_2_re = DIV_ROUND_UP(timings->tWHR_min, t_clk);
> +	/*
> +	 * tCCS, tWHR -> WE_2_RE
> +	 *
> +	 * With WE_2_RE properly set, the Denali controller automatically takes
> +	 * care of the delay; the driver need not set NAND_WAIT_TCCS.
> +	 */
> +	we_2_re = DIV_ROUND_UP(max(timings->tCCS_min, timings->tWHR_min),
> +			       t_clk);
>  	we_2_re = min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
>  
>  	tmp = ioread32(denali->reg + TWHR2_AND_WE_2_RE);
