Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJXjl-00036L-Gt
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 03:38:42 +0000
Received: by mail-wj0-x244.google.com with SMTP id o3so1027714wjo.2
 for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2016 19:38:21 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: spi-nor: add support for mx25u3235f
To: John Crispin <john@phrozen.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1482261923-62559-1-git-send-email-john@phrozen.org>
 <1482261923-62559-3-git-send-email-john@phrozen.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Andr=c3=a9_Valentin?= <avalentin@marcant.net>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d9c7a7ec-f497-a0ef-8bf4-a75731f1e9c5@gmail.com>
Date: Wed, 21 Dec 2016 04:38:10 +0100
MIME-Version: 1.0
In-Reply-To: <1482261923-62559-3-git-send-email-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/20/2016 08:25 PM, John Crispin wrote:
> From: André Valentin <avalentin@marcant.net>
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: André Valentin <avalentin@marcant.net>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 171adb3..f9a41dc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -868,6 +868,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024, 64, 0) },

No SECT_4K support here ?

>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> 


-- 
Best regards,
Marek Vasut
