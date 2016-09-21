Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmi2P-0006FR-U8
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 13:58:14 +0000
Date: Wed, 21 Sep 2016 15:57:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
 Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: nand: mxc: Test CONFIG_OF instead of
 CONFIG_OF_MTD
Message-ID: <20160921155750.4b5939fb@bbrezillon>
In-Reply-To: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Sat, 17 Sep 2016 19:57:10 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> We are about to drop the OF_MTD Kconfig option. Test CONFIG_OF
> activation instead of CONFIG_OF_MTD.

Applied both.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/mxc_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 75c0c0eb52ae..d68314c8c399 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1565,7 +1565,7 @@ static const struct platform_device_id mxcnd_devtype[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, mxcnd_devtype);
>  
> -#ifdef CONFIG_OF_MTD
> +#ifdef CONFIG_OF
>  static const struct of_device_id mxcnd_dt_ids[] = {
>  	{
>  		.compatible = "fsl,imx21-nand",
