Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHf-00026g-Kc
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:25 +0000
Received: by mail-wm0-x241.google.com with SMTP id a20so5316683wme.2
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:02 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd: remove unneeded initializer in
 mtd_ooblayout_count_bytes()
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
 <1478657290-9430-4-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5795165c-0037-0ee2-9392-9310ba5dbf5e@gmail.com>
Date: Sat, 12 Nov 2016 22:28:04 +0100
MIME-Version: 1.0
In-Reply-To: <1478657290-9430-4-git-send-email-yamada.masahiro@socionext.com>
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

On 11/09/2016 03:08 AM, Masahiro Yamada wrote:
> There is no need to initialize oobregion since it will be filled by
> the iterator.
> 
> This function is called with mtd_ooblayout_free or mtd_ooblayout_ecc
> for the iterator; both of them calls memset() to clear the oobregion.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index ca6a89a..ca661ce 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1354,7 +1354,7 @@ static int mtd_ooblayout_count_bytes(struct mtd_info *mtd,
>  					    int section,
>  					    struct mtd_oob_region *oobregion))
>  {
> -	struct mtd_oob_region oobregion = { };
> +	struct mtd_oob_region oobregion;
>  	int section = 0, ret, nbytes = 0;
>  
>  	while (1) {
> 


-- 
Best regards,
Marek Vasut
