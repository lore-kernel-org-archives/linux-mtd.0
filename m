Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPgli-0005zK-2h
 for linux-mtd@lists.infradead.org; Wed, 20 Jul 2016 01:57:51 +0000
Subject: Re: [PATCH] mtd: spi-nor: don't build Cadence QuadSPI on non-ARM
To: Brian Norris <computersforpeace@gmail.com>, Stefan Roese <sr@denx.de>
References: <201607190315.0nkQuD2W%fengguang.wu@intel.com>
 <20160718202026.GB137880@google.com> <578DC294.5090605@denx.de>
 <20160719200541.GA854@google.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kbuild-all@01.org, Graham Moore <grmoore@opensource.altera.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3a769a42-f856-5b48-dd18-ef76a7bf4c91@denx.de>
Date: Wed, 20 Jul 2016 03:50:27 +0200
MIME-Version: 1.0
In-Reply-To: <20160719200541.GA854@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/19/2016 10:05 PM, Brian Norris wrote:
> On Tue, Jul 19, 2016 at 08:03:00AM +0200, Stefan Roese wrote:
>> On 18.07.2016 22:20, Brian Norris wrote:
>>> Hmm, does x86 not define readsl()/writesl()? I can never tell what
>>> accessors are supposed to be "standard" across architectures.
>>>
>>> Either we need to drop the COMPILE_TEST or maybe make it (!X86 &&
>>> COMPILE_TEST).
>>
>> iowrite32_rep() etc should work for x86 as well.
> 
> Looks like it might. I'm not sure the original submitter can retest
> right now (travel), so I'd probably rather just take the easy fix for
> now, and we can widen to COMPILE_TEST later if desired.

Isn't there a generic readsl() and writesl() implementation in
include/asm-generic/io.h ?

> If I could get an ack on something like this, I'll apply it soon:

This is fine, I am making a note to revisit this.

> ---8<---
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Tue, 19 Jul 2016 13:02:40 -0700
> Subject: [PATCH] mtd: spi-nor: don't build Cadence QuadSPI on non-ARM
> 
> This controller driver is used only on ARM but is mostly written
> portably so it can build on other arch'es. Unfortunately, at least x86
> doesn't provibe readsl()/writesl() accessors. We could possibly fix this
> issue in the future by using io{read,write}32_rep() instead, but let's
> just drop the architectures we aren't using for now.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 1e6f037923d9..4a682ee0f632 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -40,7 +40,7 @@ config SPI_ATMEL_QUADSPI
>  
>  config SPI_CADENCE_QUADSPI
>  	tristate "Cadence Quad SPI controller"
> -	depends on OF && (ARM || COMPILE_TEST)
> +	depends on OF && ARM
>  	help
>  	  Enable support for the Cadence Quad SPI Flash controller.
>  
> 


-- 
Best regards,
Marek Vasut
