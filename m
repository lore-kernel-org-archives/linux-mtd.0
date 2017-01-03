Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOEpS-0001Ly-M0
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 02:28:00 +0000
Received: by mail-wm0-x244.google.com with SMTP id m203so84474794wma.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jan 2017 18:27:38 -0800 (PST)
Subject: Re: [PATCH] mtd/redboot: avoid null pointer deref
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20161221232528.26534-1-Jason@zx2c4.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8267e170-e3ae-06dd-c859-17712785071a@gmail.com>
Date: Tue, 3 Jan 2017 03:22:28 +0100
MIME-Version: 1.0
In-Reply-To: <20161221232528.26534-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/2016 12:25 AM, Jason A. Donenfeld wrote:
> By giving a bogus partition name, it's possible to trigger a null
> pointer dereference.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Nice catch. It'd be great to have the condition which can be used to
trigger this problem in the commit message. I presume this happens if
buf[i].name[0] = 0xff for all $i, right ?

So please expand the explanation and add my Ack for V2:
Acked-by: Marek Vasut <marek.vasut@gmail.com>

Thanks

> ---
>  drivers/mtd/redboot.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
> index 7623ac5fc586..53949ef80d36 100644
> --- a/drivers/mtd/redboot.c
> +++ b/drivers/mtd/redboot.c
> @@ -212,6 +212,10 @@ static int parse_redboot_partitions(struct mtd_info *master,
>  
>  		nrparts++;
>  	}
> +	if (!fl) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>  #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
>  	if (fl->img->flash_base) {
>  		nrparts++;
> 


-- 
Best regards,
Marek Vasut
