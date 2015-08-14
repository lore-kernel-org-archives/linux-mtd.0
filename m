Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQBoi-0003H4-9O
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 10:02:28 +0000
Received: by oip136 with SMTP id 136so41331917oip.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 03:02:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
Date: Fri, 14 Aug 2015 11:02:07 +0100
Message-ID: <CAPcvp5HB7m47ZTqQ0fE7EV42kNWO=i1EQaysNtgXw6V+oWoUdA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: add read loop
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMLA==?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 10:23, Michal Suchanek <hramrach@gmail.com> wrote:
> mtdblock and ubi do not handle the situation when read returns less data
> than requested. Loop in spi-nor until buffer is filled or an error is
> returned.
>
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e0ae9cf..246fac7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -738,14 +738,22 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>         if (ret)
>                 return ret;
>
> -       ret = nor->read(nor, from, len, buf);
> +       while (len) {
> +               ret = nor->read(nor, from, len, buf);
> +               if (ret <= 0)
> +                       goto read_err;
> +
> +               BUG_ON(ret > len);
> +               *retlen += ret;

Is *retlen initialized to 0 anywhere?

Andrew Murray

> +               buf += ret;
> +               from += ret;
> +               len -= ret;
> +       }
> +       ret = 0;
>
> +read_err:
>         spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
> -       if (ret < 0)
> -               return ret;
> -
> -       *retlen += ret;
> -       return 0;
> +       return ret;
>  }
>
>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
> --
> 2.1.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
