Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqe6y-0004r2-UF
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 11:07:31 +0000
Received: by mail-wr0-x243.google.com with SMTP id u108so26239825wrb.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 04:07:08 -0700 (PDT)
Subject: Re: [PATCH v3, 3/4] mtd: spi-nor: Add Xtensa CPU support for
 cadence-quadspi.
To: Artur Jedrysek <jartur@cadence.com>, linux-mtd@lists.infradead.org
References: <1490008935-28900-1-git-send-email-jartur@cadence.com>
 <1490009193-3023-1-git-send-email-jartur@cadence.com>
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3692b78a-81e7-14a3-8619-6400628a2198@gmail.com>
Date: Wed, 22 Mar 2017 11:02:48 +0100
MIME-Version: 1.0
In-Reply-To: <1490009193-3023-1-git-send-email-jartur@cadence.com>
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

On 03/20/2017 12:26 PM, Artur Jedrysek wrote:
> Cadence Quad SPI driver successfully runs on Xtensa CPU, and Kconfig
> file is updated to indicate that.
> 
> Signed-off-by: Artur Jedrysek <jartur@cadence.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> Changelog:
> v2: This change is extracted from previous patch (updating CQSPI driver).
> ---
> v3: None
> ---
>  drivers/mtd/spi-nor/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 7252087..f195749 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -50,7 +50,7 @@ config SPI_ATMEL_QUADSPI
>  
>  config SPI_CADENCE_QUADSPI
>  	tristate "Cadence Quad SPI controller"
> -	depends on OF && (ARM || COMPILE_TEST)
> +	depends on OF && (ARM || XTENSA || COMPILE_TEST)
>  	help
>  	  Enable support for the Cadence Quad SPI Flash controller.
>  
> 


-- 
Best regards,
Marek Vasut
