Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQuEP-0006f5-0X
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 06:14:21 +0000
Received: by mail-vc0-f177.google.com with SMTP id p16so221958vcq.36
 for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2012 23:14:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1350272844-21866-1-git-send-email-shijie8@gmail.com>
References: <1350272844-21866-1-git-send-email-shijie8@gmail.com>
Date: Wed, 24 Oct 2012 14:14:19 +0800
Message-ID: <CAMiH66F8EJP8N0U1RBxKqvR=ik0JKaK5ABxedkr9j6iACE2e2A@mail.gmail.com>
Subject: Re: [PATCH] mtd: use the NAND_STATUS_FAIL to replace the hardcode
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping

On Mon, Oct 15, 2012 at 11:47 AM, Huang Shijie <shijie8@gmail.com> wrote:
> Use the NAND_STATUS_FAIL to replace the hardcode "0x01",
> which make the code more readable.
>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d5ece6e..4569174 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -899,7 +899,7 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
>         /* Call wait ready function */
>         status = chip->waitfunc(mtd, chip);
>         /* See if device thinks it succeeded */
> -       if (status & 0x01) {
> +       if (status & NAND_STATUS_FAIL) {
>                 pr_debug("%s: error status = 0x%08x\n",
>                                         __func__, status);
>                 ret = -EIO;
> @@ -1004,7 +1004,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>         /* Call wait ready function */
>         status = chip->waitfunc(mtd, chip);
>         /* See if device thinks it succeeded */
> -       if (status & 0x01) {
> +       if (status & NAND_STATUS_FAIL) {
>                 pr_debug("%s: error status = 0x%08x\n",
>                                         __func__, status);
>                 ret = -EIO;
> --
> 1.7.4.4
>
