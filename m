Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB25z-0006wz-M1
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 16:14:28 +0000
Date: Sun, 27 Nov 2016 17:14:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 20/39] mtd: nand: denali_dt: enable HW_ECC_FIXUP
 capability for DT platform
Message-ID: <20161127171406.327c4d6e@bbrezillon>
In-Reply-To: <1480183585-592-21-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-21-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 27 Nov 2016 03:06:06 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The denali_dt.c was split out by Altera for the SOCFPGA port.  The
> Denali IP on SOCFPGA incorporates the hardware ECC fixup feature.
> Newer versions are very likely to support it.  So, it should be OK
> to set DENALI_CAPS_HW_ECC_FIXUP for all DT platforms.

Seems like a bad idea. What's the problem with setting this flag in the
data->caps definition of each revision?

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali_dt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index 293ddb8..9dcd203 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -59,6 +59,8 @@ static int denali_dt_probe(struct platform_device *ofdev)
>  	if (data)
>  		denali->caps = data->caps;
>  
> +	denali->caps |= DENALI_CAPS_HW_ECC_FIXUP;
> +
>  	denali->platform = DT;
>  	denali->dev = &ofdev->dev;
>  	denali->irq = platform_get_irq(ofdev, 0);
