Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eDCHK-0000Vf-67
 for linux-mtd@lists.infradead.org; Fri, 10 Nov 2017 16:35:40 +0000
Received: by mail-wm0-x242.google.com with SMTP id r68so3884562wmr.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2017 08:35:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171108161323.30662-1-colin.king@canonical.com>
References: <20171108161323.30662-1-colin.king@canonical.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 10 Nov 2017 17:35:13 +0100
Message-ID: <CAAQYJAuVYbbg5SyD8ZkANZ201atZATkgF07CfwPet+7SbXXuPQ@mail.gmail.com>
Subject: Re: [PATCH][V2] mtd: sharpslpart: fix overflow on block_adr
 calculation
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 8, 2017 at 5:13 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Multiplying block_num and mtd->erasesize may potentially overflow
> as they are both unsigned ints and so the multiplication is evaluated
> in unsigned int arithmetic.  Cast block_adr to off_t to ensure
> multiplication is off_t sized to avoid any potential overflow.
>
> Detected by CoverityScan, CID#1461264 ("Unintentional integer overflow")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/parsers/sharpslpart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
> index 5fe0079ea5ed..0ddb79ac390d 100644
> --- a/drivers/mtd/parsers/sharpslpart.c
> +++ b/drivers/mtd/parsers/sharpslpart.c
> @@ -192,7 +192,7 @@ static int sharpsl_nand_init_ftl(struct mtd_info *mtd, struct sharpsl_ftl *ftl)
>
>         /* create physical-logical table */
>         for (block_num = 0; block_num < phymax; block_num++) {
> -               block_adr = block_num * mtd->erasesize;
> +               block_adr = (loff_t)block_num * mtd->erasesize;
>
>                 if (mtd_block_isbad(mtd, block_adr))
>                         continue;
> @@ -244,7 +244,7 @@ static int sharpsl_nand_read_laddr(struct mtd_info *mtd,
>                 return -EINVAL;
>
>         block_num = ftl->log2phy[log_num];
> -       block_adr = block_num * mtd->erasesize;
> +       block_adr = (loff_t)block_num * mtd->erasesize;
>         block_ofs = mtd_mod_by_eb((u32)from, mtd);
>
>         err = mtd_read(mtd, block_adr + block_ofs, len, &retlen, buf);
> --
> 2.14.1
>

Thanks for spotting this,

Acked-by: Andrea Adami <andrea.adami@gmail.com>
