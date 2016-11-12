Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHc-00026F-53
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:21 +0000
Received: by mail-wm0-x242.google.com with SMTP id a20so5316494wme.2
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:55:58 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/3] mtd: remove unneeded initializer in
 mtd_ooblayout_{get, set}_bytes()
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
 <1478657290-9430-2-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Message-ID: <384118b4-fac8-715d-d2ef-9d56a58764d8@gmail.com>
Date: Sat, 12 Nov 2016 22:25:38 +0100
MIME-Version: 1.0
In-Reply-To: <1478657290-9430-2-git-send-email-yamada.masahiro@socionext.com>
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
> There is no need to initialize oobregion and section since they will
> be filled by mtd_ooblayout_find_region().
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/mtdcore.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index d46e4ad..cf85f2b 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1274,8 +1274,8 @@ static int mtd_ooblayout_get_bytes(struct mtd_info *mtd, u8 *buf,
>  					    int section,
>  					    struct mtd_oob_region *oobregion))
>  {
> -	struct mtd_oob_region oobregion = { };
> -	int section = 0, ret;
> +	struct mtd_oob_region oobregion;
> +	int section, ret;
>  
>  	ret = mtd_ooblayout_find_region(mtd, start, &section,
>  					&oobregion, iter);
> @@ -1317,8 +1317,8 @@ static int mtd_ooblayout_set_bytes(struct mtd_info *mtd, const u8 *buf,
>  					    int section,
>  					    struct mtd_oob_region *oobregion))
>  {
> -	struct mtd_oob_region oobregion = { };
> -	int section = 0, ret;
> +	struct mtd_oob_region oobregion;
> +	int section, ret;
>  
>  	ret = mtd_ooblayout_find_region(mtd, start, &section,
>  					&oobregion, iter);
> 


-- 
Best regards,
Marek Vasut
