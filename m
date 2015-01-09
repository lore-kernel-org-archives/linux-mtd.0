Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9iEC-00030X-Vq
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 22:40:25 +0000
Received: by mail-pd0-f169.google.com with SMTP id z10so19869800pdj.0
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 14:40:02 -0800 (PST)
Date: Fri, 9 Jan 2015 14:39:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: David =?iso-8859-1?Q?M=FCller?= <d.mueller@elsoft.ch>
Subject: Re: [PATCH] mtd: spi-nor: add Micron N25Q064A to list of known SPI
 flashes
Message-ID: <20150109223959.GZ9759@ld-irv-0074>
References: <1418134035-3250-1-git-send-email-d.mueller@elsoft.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1418134035-3250-1-git-send-email-d.mueller@elsoft.ch>
Cc: David Woodhouse <dwmw2@infradead.org>, qiwang@micron.com,
 linux-mtd@lists.infradead.org, beanhuo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch doesn't seem to have made it through to the mailing list.
Also, it does not apply to the latest l2-mtd.git tree. Can you resend?
Thanks.

http://git.infradead.org/l2-mtd.git

On Tue, Dec 09, 2014 at 03:07:15PM +0100, David Müller wrote:
> Signed-off-by: David Müller <d.mueller@elsoft.ch>
> ---
>  drivers/mtd/devices/m25p80.c  | 4 ++--
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ed827cf..7a344b7 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -280,8 +280,8 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"mx25l3205d"},	{"mx25l3255e"},	{"mx25l6405d"},	{"mx25l12805d"},
>  	{"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
>  	{"mx66l1g55g"},
> -	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q256a"},
> -	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
> +	{"n25q064"},	{"n25q064a"},	{"n25q128a11"},	{"n25q128a13"},
> +	{"n25q256a"},	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
>  	{"pm25lv512"},	{"pm25lv010"},	{"pm25lq032"},
>  	{"s25sl032p"},	{"s25sl064p"},	{"s25fl256s0"},	{"s25fl256s1"},
>  	{"s25fl512s"},	{"s70fl01gs"},	{"s25sl12800"},	{"s25sl12801"},
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c51ee52..299371b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -533,6 +533,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>  
>  	/* Micron */
>  	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
> +	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
