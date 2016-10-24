Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byaFq-0003zK-Ef
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 08:05:12 +0000
Received: from mail-lf0-f41.google.com ([209.85.215.41]:32972)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1byaFT-000m9V-0c
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 04:04:48 -0400
Received: by mail-lf0-f41.google.com with SMTP id x79so196024355lff.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 01:04:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1475637910-2324-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
References: <1475637910-2324-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
From: Jagan Teki <jagan@openedev.com>
Date: Mon, 24 Oct 2016 13:34:44 +0530
Message-ID: <CAD6G_RT8s5=vDP2bc__SULyxt=NnqZrLDuepcUkxs75HG9=ZQg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for N25Q256A13
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 tatsuaki.osafune.uv@hitachi.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 5, 2016 at 8:55 AM, Nobuhiro Iwamatsu
<nobuhiro.iwamatsu.kw@hitachi.com> wrote:
> Add Micron N25Q256A13 256Mbit NOR Flash in the list of supported
> devices. This chip is the same structure as the N25Q256A but ID
> is different.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
> ---
>
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..ce67ccd 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -884,6 +884,7 @@ static const struct flash_info spi_nor_ids[] = {
>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +       { "n25q256a13",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },

Since the previous chips follow 'a' notation for bb chips, better to
use n25q256a for bb and n25q256 for ba

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
