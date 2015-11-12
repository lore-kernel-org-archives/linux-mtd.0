Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwnGt-0007Qi-F5
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:30:19 +0000
Received: by ioo197 with SMTP id 197so1823105ioo.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 00:29:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1447314579-31374-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1447314579-31374-1-git-send-email-clabbe.montjoie@gmail.com>
Date: Thu, 12 Nov 2015 09:29:57 +0100
Message-ID: <CAGhQ9VyGeYUuaHTOnte--ASX9Wvd5wkDrRDx8mRoD=aJqD7JTA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: atmel_nand: fix a possible NULL dereference
From: Joachim  Eastwood <manabian@gmail.com>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, josh.wu@atmel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 November 2015 at 08:49, LABBE Corentin <clabbe.montjoie@gmail.com> wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later.
>
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/mtd/nand/atmel_nand.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 475c938..f3cf68b 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1495,9 +1495,12 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
>         int ecc_mode;
>         struct atmel_nand_data *board = &host->board;
>         enum of_gpio_flags flags = 0;
> +       const struct of_device_id *of_id;
>
> -       host->caps = (struct atmel_nand_caps *)
> -               of_match_device(atmel_nand_dt_ids, host->dev)->data;
> +       of_id = of_match_device(atmel_nand_dt_ids, host->dev);
> +       if (!of_id)
> +               return -ENODEV;
> +       host->caps = of_id->data;

It might be cleaner to use of_device_get_match_data() here.


regards,
Joachim Eastwood
