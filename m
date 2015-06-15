Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4bYy-0000nN-BZ
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2015 21:05:01 +0000
Received: by igbsb11 with SMTP id sb11so546478igb.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jun 2015 14:04:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434399606-19228-1-git-send-email-antonynpavlov@gmail.com>
References: <1434399606-19228-1-git-send-email-antonynpavlov@gmail.com>
Date: Mon, 15 Jun 2015 23:04:37 +0200
Message-ID: <CACna6rwkFVezEM3-M0-sVJ5Ad8=9cy4DzO2C_OfwqHWqk4oHvA@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add Spansion S25FL204K support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Antony Pavlov <antonynpavlov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 June 2015 at 22:20, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
> with Uniform 4 kB Sectors.
>
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c  | 2 +-
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 3af137f..85be835 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -281,7 +281,7 @@ static const struct spi_device_id m25p_ids[] = {
>         {"s25fl512s"},  {"s70fl01gs"},  {"s25sl12800"}, {"s25sl12801"},
>         {"s25fl129p0"}, {"s25fl129p1"}, {"s25sl004a"},  {"s25sl008a"},
>         {"s25sl016a"},  {"s25sl032a"},  {"s25sl064a"},  {"s25fl008k"},
> -       {"s25fl016k"},  {"s25fl064k"},  {"s25fl132k"},
> +       {"s25fl016k"},  {"s25fl064k"},  {"s25fl132k"},  {"s25fl204k"},
>         {"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
>         {"sst25vf064c"},{"sst25wf512"}, {"sst25wf010"}, {"sst25wf020"},
>         {"sst25wf040"},

And why do we need it in this table (above)? You didn't add any extra
handling for it. You also didn't call it anything like "nonjedec", so
I guess it supports JEDEC's RD ID.
