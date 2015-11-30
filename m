Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3X5A-0005Ng-Jv
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 22:38:05 +0000
Received: by iofh3 with SMTP id h3so191531271iof.3
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 14:37:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1448912477-27057-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1448912477-27057-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Mon, 30 Nov 2015 23:37:43 +0100
Message-ID: <CACna6rwH7iQ=xnE1isPx4zASxK+asibvjuMsU6Ntp0jC=Bw9Dg@mail.gmail.com>
Subject: Re: [PATCH v2] spi/nor: Fix error message with unrecognized JEDEC
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 November 2015 at 20:41, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> The error message was:
>
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
>
> The new error message:
>
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00, 00, 00
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>
> v2: Changes by Marek Vasut
>
> Use %02 instead of %.2
>
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index b7c038c75684..f8a9b77aac76 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -890,7 +890,7 @@ static const struct flash_info *spi_nor_read_id(struc=
t spi_nor *nor)
>                                 return &spi_nor_ids[tmp];
>                 }
>         }
> -       dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %2x, %2x\n"=
,
> +       dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\=
n",

Looks fine :)

--=20
Rafa=C5=82
