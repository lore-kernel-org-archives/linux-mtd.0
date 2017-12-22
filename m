Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSKGe-0007wo-Cu
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 10:09:29 +0000
Received: by mail-wm0-x241.google.com with SMTP id f9so20709054wmh.0
 for <linux-mtd@lists.infradead.org>; Fri, 22 Dec 2017 02:09:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513748736-165067-1-git-send-email-weiyongjun1@huawei.com>
References: <1513748736-165067-1-git-send-email-weiyongjun1@huawei.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 22 Dec 2017 11:09:15 +0100
Message-ID: <CAAQYJAuOy65Obc+HmtmvwSLB5js-rvLZ5D=6kcDgcxDZQYKebQ@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: sharpslpart: make local function
 sharpsl_nand_cleanup_ftl() static
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Colin Ian King <colin.king@canonical.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 20, 2017 at 6:45 AM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fixes the following sparse warnings:
>
> drivers/mtd/parsers/sharpslpart.c:222:6: warning:
>  symbol 'sharpsl_nand_cleanup_ftl' was not declared. Should it be static?
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/parsers/sharpslpart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
> index 0ddb79a..8893dc8 100644
> --- a/drivers/mtd/parsers/sharpslpart.c
> +++ b/drivers/mtd/parsers/sharpslpart.c
> @@ -219,7 +219,7 @@ static int sharpsl_nand_init_ftl(struct mtd_info *mtd, struct sharpsl_ftl *ftl)
>         return ret;
>  }
>
> -void sharpsl_nand_cleanup_ftl(struct sharpsl_ftl *ftl)
> +static void sharpsl_nand_cleanup_ftl(struct sharpsl_ftl *ftl)
>  {
>         kfree(ftl->log2phy);
>  }
>

Thanks, this should be indeed static like the other functions.

Acked-by: Andrea Adami <andrea.adami@gmail.com>
