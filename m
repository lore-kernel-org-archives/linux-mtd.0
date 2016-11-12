Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHd-00026W-8n
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:22 +0000
Received: by mail-wm0-x244.google.com with SMTP id u144so5311801wmu.0
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:00 -0800 (PST)
Subject: Re: [PATCH 2/3] mtd: use min_t() to refactor mtd_ooblayout_{get,
 set}_bytes()
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
 <1478657290-9430-3-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b1d59ca4-17c1-872e-fe2e-1471ebd678a4@gmail.com>
Date: Sat, 12 Nov 2016 22:27:47 +0100
MIME-Version: 1.0
In-Reply-To: <1478657290-9430-3-git-send-email-yamada.masahiro@socionext.com>
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
> I hope this will make the code a little more readable.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/mtdcore.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index cf85f2b..ca6a89a 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1283,7 +1283,7 @@ static int mtd_ooblayout_get_bytes(struct mtd_info *mtd, u8 *buf,
>  	while (!ret) {
>  		int cnt;
>  
> -		cnt = oobregion.length > nbytes ? nbytes : oobregion.length;
> +		cnt = min_t(int, nbytes, oobregion.length);
>  		memcpy(buf, oobbuf + oobregion.offset, cnt);
>  		buf += cnt;
>  		nbytes -= cnt;
> @@ -1326,7 +1326,7 @@ static int mtd_ooblayout_set_bytes(struct mtd_info *mtd, const u8 *buf,
>  	while (!ret) {
>  		int cnt;
>  
> -		cnt = oobregion.length > nbytes ? nbytes : oobregion.length;
> +		cnt = min_t(int, nbytes, oobregion.length);
>  		memcpy(oobbuf + oobregion.offset, buf, cnt);
>  		buf += cnt;
>  		nbytes -= cnt;
> 


-- 
Best regards,
Marek Vasut
