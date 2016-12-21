Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJXjk-000369-Ew
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 03:38:41 +0000
Received: by mail-wj0-x242.google.com with SMTP id j10so30316668wjb.3
 for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2016 19:38:19 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: spi-nor: add support for macronix mx25u25635f
To: John Crispin <john@phrozen.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1482261923-62559-1-git-send-email-john@phrozen.org>
 <1482261923-62559-2-git-send-email-john@phrozen.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ash Benz <ash.benz@bk.ru>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <73006194-8842-6ceb-a653-b942b092157e@gmail.com>
Date: Wed, 21 Dec 2016 04:37:49 +0100
MIME-Version: 1.0
In-Reply-To: <1482261923-62559-2-git-send-email-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/20/2016 08:25 PM, John Crispin wrote:
> From: Ash Benz <ash.benz@bk.ru>

Looks fine, but please do add a meaningful commit message.

> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ash Benz <ash.benz@bk.ru>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..171adb3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -872,6 +872,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> +	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, 0) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
> 


-- 
Best regards,
Marek Vasut
