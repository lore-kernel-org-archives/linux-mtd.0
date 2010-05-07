Date: Fri, 7 May 2010 12:20:22 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 01/20] pxa3xx_nand: refuse the flash definition get
	from platform
Message-ID: <20100507102022.GL30801@buzzloop.caiaq.de>
References: <u2l771cded01005060201ifacea1f9h8f5f9a1c068b31b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u2l771cded01005060201ifacea1f9h8f5f9a1c068b31b@mail.gmail.com>
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org,
	Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'd like to test this, but ...

On Thu, May 06, 2010 at 05:01:22AM -0400, Haojian Zhuang wrote:
> From 135f6369a9c045e58d2cfa445c72bae2bbc645cd Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Sat, 20 Mar 2010 19:01:23 +0800
> Subject: [PATCH] pxa3xx_nand: refuse the flash definition get from platform
> 
> For current usage, it is little reason to use a platform defined flash info
> for the flash detection. Flash timing through platform should be the same.
> And allow multiple platform to define the same flash chip would be a waste.
> 
> Also condense the flash definition way in the c file to simplify adding a
> new chip.
> 
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> ---
>  arch/arm/plat-pxa/include/plat/pxa3xx_nand.h |   40 ----
>  drivers/mtd/nand/Kconfig                     |    7 -
>  drivers/mtd/nand/pxa3xx_nand.c               |  251 ++++++--------------------
>  3 files changed, 60 insertions(+), 238 deletions(-)
> 

[...]

> +static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[] = {
> +{ 0x46ec, 32, 512, 16, 16, 4096, { 10, 0, 20, 40, 30, 40, 11123, 110, 10, }, },
> +{ 0xdaec, 64, 2048, 8, 8, 2048, { 10, 0, 20, 40, 30, 40, 11123, 110, 10, }, },
> +{ 0xd7ec, 128, 4096, 8, 8, 8192, { 10, 0, 20, 40, 30, 40, 11123, 110, 10, }, },
> +{ 0xa12c, 64, 2048, 8, 8, 1024, { 10, 25, 15, 25, 15, 30, 25000, 60, 10, }, },
> +{ 0xb12c, 64, 2048, 16, 16, 1024, { 10, 25, 15, 25, 15, 30, 25000,
> 60, 10, }, },
> +{ 0xdc2c, 64, 2048, 8, 8, 4096, { 10, 25, 15, 25, 15, 30, 25000, 60, 10, }, },
> +{ 0xcc2c, 64, 2048, 16, 16, 4096, { 10, 25, 15, 25, 15, 30, 25000,
> 60, 10, }, },

That series is line-wrapped. Could you fix this and resend please?

Daniel
