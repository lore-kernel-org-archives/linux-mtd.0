Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YO34U-0006yV-9t
 for linux-mtd@lists.infradead.org; Wed, 18 Feb 2015 11:45:38 +0000
Message-ID: <54E47ABF.8070306@free-electrons.com>
Date: Wed, 18 Feb 2015 08:42:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] mtd: pxa3xx-nand: handle PIO in threaded interrupt
References: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/17/2015 05:06 PM, Robert Jarzmik wrote:
> Change the handling of the data stage in the driver : don't pump data in
> the top-half interrupt, but rather schedule a thread for non dma cases.
> 
> This will enable latencies in the data pumping, especially if delays are
> required. Moreover platform shall be more reactive as other interrupts
> can be served while pumping data.
> 
> No throughput degradation was observed, at least on the zylonite
> platform, while a slight degradation was being expected.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d..237c92c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -569,11 +569,25 @@ static void start_data_dma(struct pxa3xx_nand_info *info)
>  {}
>  #endif
>  
> +static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
> +{
> +	struct pxa3xx_nand_info *info = data;
> +
> +	handle_data_pio(info);
> +
> +	info->state = STATE_CMD_DONE;

Are you sure you need to set the state here?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
