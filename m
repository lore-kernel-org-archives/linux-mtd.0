Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8NK3-00061l-J3
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 08:18:00 +0000
Received: by mail-oi0-x242.google.com with SMTP id 128so17755754oih.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 00:17:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161118235149.21275-1-ash.benz@bk.ru>
References: <20161118235149.21275-1-ash.benz@bk.ru>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sun, 20 Nov 2016 09:17:37 +0100
Message-ID: <CACna6ry2Sqx67E8r1VRSMJjq0mCXqvdkjqV0MDLRrv08T_ZM4Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add Macronix mx25u25635f to list of
 known devices.
To: Ash Benz <ash.benz@bk.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 November 2016 at 00:51, Ash Benz <ash.benz@bk.ru> wrote:
> Signed-off-by: Ash Benz <ash.benz@bk.ru>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..4fd3ac8 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -872,6 +872,7 @@ static const struct flash_info spi_nor_ids[] = {
>         { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> +       { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
>         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>         { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },

OK, I see it's hard to say how they are sorted. It seems amount of
blocks is the first sorting criteria, so your patch looks OK, thanks!
