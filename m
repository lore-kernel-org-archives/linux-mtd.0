Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGtkL-0003VX-Oq
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 17:51:04 +0000
Received: by mail-pa0-f48.google.com with SMTP id et14so11396346pad.7
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 10:50:40 -0700 (PDT)
Date: Mon, 11 Aug 2014 10:50:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: nand: Use ULL-suffix for big u64 constant
Message-ID: <20140811175036.GU3711@ld-irv-0074>
References: <1407604073-7484-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1407604073-7484-1-git-send-email-geert@linux-m68k.org>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 09, 2014 at 07:07:53PM +0200, Geert Uytterhoeven wrote:
> drivers/mtd/nand/nand_timings.c:45: warning: integer constant is too large for ‘long’ type

On what compiler / static analyzer?

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/mtd/nand/nand_timings.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
> index 8b36253420fa..e81470a8ac67 100644
> --- a/drivers/mtd/nand/nand_timings.c
> +++ b/drivers/mtd/nand/nand_timings.c
> @@ -42,7 +42,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
>  		.tRHZ_max = 200000,
>  		.tRLOH_min = 0,
>  		.tRP_min = 50000,
> -		.tRST_max = 250000000000,
> +		.tRST_max = 250000000000ULL,

See [1] and [2]. I'm pretty sure it is a bug in your tool to warn about
this. The C standard seems pretty clear that the large literal constant
is automatically promoted to a sufficiently large type, so AIUI there
should be no need for such a warning. A standards-compliant compiler
will do the right thing.

It really seems like this type of warning is only appropriate where a
smaller literal constant is immediately operated on such that it will
overflow. e.g.:

		.tRST_max = 250 * 1000 * 1000 * 1000,

But this usually results in a different type of (correct) warning, like:

  warning: integer overflow in expression [-Woverflow]

However, I could be convinced to apply this, if only to satisfy broken
tools and to avoid addressing this question over and over...

>  		.tWB_max = 200000,
>  		.tRR_min = 40000,
>  		.tWC_min = 100000,

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-July/054750.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/252494.html
