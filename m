Message-ID: <528307F0.6000805@ti.com>
Date: Wed, 13 Nov 2013 10:32:40 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>, "Shilimkar, Santosh"
 <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King
 <linux@arm.linux.org.uk>
Subject: Re: [PATCH 10/12] mtd: nand: davinci: don't set timings if AEMIF
 is used
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-11-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8D53@DNCE04.ent.ti.com>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8D53@DNCE04.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>,
 Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 11 November 2013 10:40 PM, Khoronzhuk, Ivan wrote:
> If Davinci AEMIF is used we don't need to set timings and bus width.
> It is done by AEMIF driver (drivers/memory/davinci-aemfi.c).
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |   22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 4705214..879e915 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -742,27 +742,35 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>                 goto err_clk_enable;
>         }
> 
> +#if !IS_ENABLED(CONFIG_TI_DAVINCI_AEMIF)

This is a hack! Just because AEMIF driver is enabled, it does not
guarantee that the timings have been setup by it. Instead of configuring
timings in two drivers, why not just convert everyone over to use the
new driver. Dont worry about breaking old platforms, I will help test
and ack them.

Thanks,
Sekhar
