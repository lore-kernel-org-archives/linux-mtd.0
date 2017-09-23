Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvrhL-0006on-EQ
 for linux-mtd@lists.infradead.org; Sat, 23 Sep 2017 21:10:54 +0000
Received: by mail-wr0-x242.google.com with SMTP id g50so2253024wra.3
 for <linux-mtd@lists.infradead.org>; Sat, 23 Sep 2017 14:10:29 -0700 (PDT)
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
To: Pavel Machek <pavel@ucw.cz>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
References: <20170923201314.GA14742@amd>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b45f83d5-6a0b-64f2-2a3a-708e1a1e7f90@gmail.com>
Date: Sat, 23 Sep 2017 23:10:26 +0200
MIME-Version: 1.0
In-Reply-To: <20170923201314.GA14742@amd>
Content-Type: text/plain; charset=windows-1252
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

On 09/23/2017 10:13 PM, Pavel Machek wrote:
> C++ comments look wrong in kernel tree. Fix one.

AFAIR they are now (sadly) accepted, but this patch works for me.
Would be nice if trivial could pick it.

> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 6cd0f6b..849543f1 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -267,7 +267,7 @@ struct mtd_info {
>  	 */
>  	unsigned int bitflip_threshold;
>  
> -	// Kernel-only stuff starts here.
> +	/* Kernel-only stuff starts here. */
>  	const char *name;
>  	int index;
>  
> 


-- 
Best regards,
Marek Vasut
