Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coReP-0008GG-D9
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 09:24:54 +0000
Date: Thu, 16 Mar 2017 10:24:32 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: nandsim: fix spelling mistake: "weakpagess"
 -> "weakpages"
Message-ID: <20170316102432.2fe610cb@bbrezillon>
In-Reply-To: <20170223113048.13208-1-colin.king@canonical.com>
References: <20170223113048.13208-1-colin.king@canonical.com>
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

On Thu, 23 Feb 2017 11:30:48 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> trivial fix to spelling mistake in NS_ERR error message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/nand/nandsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index c847426..cef818f 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -901,7 +901,7 @@ static int parse_weakpages(void)
>  		zero_ok = (*w == '0' ? 1 : 0);
>  		page_no = simple_strtoul(w, &w, 0);
>  		if (!zero_ok && !page_no) {
> -			NS_ERR("invalid weakpagess.\n");
> +			NS_ERR("invalid weakpages.\n");
>  			return -EINVAL;
>  		}
>  		max_writes = 3;
