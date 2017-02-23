Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ch1TV-0008CL-1c
 for linux-mtd@lists.infradead.org; Thu, 23 Feb 2017 22:03:00 +0000
Received: by mail-wr0-x242.google.com with SMTP id q39so419767wrb.2
 for <linux-mtd@lists.infradead.org>; Thu, 23 Feb 2017 14:02:34 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: nandsim: fix spelling mistake: "weakpagess" ->
 "weakpages"
To: Colin King <colin.king@canonical.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <20170223113048.13208-1-colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <bb00b531-3e12-1881-731c-bca745fb56fe@gmail.com>
Date: Thu, 23 Feb 2017 23:00:18 +0100
MIME-Version: 1.0
In-Reply-To: <20170223113048.13208-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/23/2017 12:30 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> trivial fix to spelling mistake in NS_ERR error message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

Thanks

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
> 


-- 
Best regards,
Marek Vasut
