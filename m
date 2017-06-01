MIME-Version: 1.0
In-Reply-To: <1496307679-16245-1-git-send-email-xiaolei.li@mediatek.com>
References: <1496307679-16245-1-git-send-email-xiaolei.li@mediatek.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 1 Jun 2017 21:23:49 +0200
Message-ID: <CAFLxGvze0N37Dpm=Pz3Sivg9VJW41ntA8UVk4GB_uDP3z+oc1g@mail.gmail.com>
Subject: Re: [PATCH] mtd: subpagetest: fix wrong written check in function
 write_eraseblock2
To: xiaolei.li@mediatek.com
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 1, 2017 at 11:01 AM,  <xiaolei.li@mediatek.com> wrote:
> From: Xiaolei Li <xiaolei.li@mediatek.com>
>
> Write size in function write_eraseblock2 is subpgsize * k.
> It is wrong to check whether written is equal to subpgsize after each
> mtd_write.
>
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/tests/subpagetest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
> index aecc6ce..fa2519a 100644
> --- a/drivers/mtd/tests/subpagetest.c
> +++ b/drivers/mtd/tests/subpagetest.c
> @@ -102,7 +102,7 @@ static int write_eraseblock2(int ebnum)
>                 if (unlikely(err || written != subpgsize * k)) {
>                         pr_err("error: write failed at %#llx\n",
>                                (long long)addr);
> -                       if (written != subpgsize) {
> +                       if (written != subpgsize * k) {
>                                 pr_err("  write size: %#x\n",
>                                        subpgsize * k);
>                                 pr_err("  written: %#08zx\n",

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
