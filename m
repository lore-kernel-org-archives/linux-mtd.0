Received: from mail-qa0-x233.google.com ([2607:f8b0:400d:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHqQy-0002Cz-4n
 for linux-mtd@lists.infradead.org; Thu, 14 Aug 2014 08:30:57 +0000
Received: by mail-qa0-f51.google.com with SMTP id k15so695861qaq.38
 for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2014 01:30:32 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <1407998124-3166-1-git-send-email-computersforpeace@gmail.com>
References: <1407998124-3166-1-git-send-email-computersforpeace@gmail.com>
Date: Thu, 14 Aug 2014 10:30:32 +0200
Message-ID: <CABkLOboi7YQhuDjLPeyyf5dDV1mQu02faTe9j8Y8ppH8Tzi+1g@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: check return code for get_chip()
From: Christian Riesch <christian.riesch@omicron.at>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
Thanks for catching this!

On Thu, Aug 14, 2014 at 8:35 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Untested
>
> Coverity CID 1230633
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Christian Riesch <christian.riesch@omicron.at>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
>  1 file changed, 4 insertions(+)

Tested-by: Christian Riesch <christian.riesch@omicron.at>

Regards,
Christian

>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 6da141af9cba..c50d8cf0f60d 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1434,6 +1434,10 @@ static int cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
>
>                                 mutex_lock(&chip->mutex);
>                                 ret = get_chip(map, chip, base, FL_LOCKING);
> +                               if (ret) {
> +                                       mutex_unlock(&chip->mutex);
> +                                       return ret;
> +                               }
>
>                                 /* Enter lock register command */
>                                 cfi_send_gen_cmd(0xAA, cfi->addr_unlock1,
> --
> 1.7.9.5
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
