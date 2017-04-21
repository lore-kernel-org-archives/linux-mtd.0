Subject: Re: [PATCH 1/5] mtd: nand: gpmi: unify clock handling
To: Stefan Agner <stefan@agner.ch>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, cyrille.pitchen@atmel.com
References: <20170421010755.18025-1-stefan@agner.ch>
 <20170421010755.18025-2-stefan@agner.ch>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@nxp.com, fabio.estevam@freescale.com,
 LW@KARO-electronics.de, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <66b18c07-54f1-a532-5fce-e1759c5d3488@gmail.com>
Date: Fri, 21 Apr 2017 04:02:03 +0200
MIME-Version: 1.0
In-Reply-To: <20170421010755.18025-2-stefan@agner.ch>
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

On 04/21/2017 03:07 AM, Stefan Agner wrote:
> Add device specific list of clocks required, and handle all clocks
> in a single for loop. This avoids further code duplication when
> adding i.MX 7 support.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

[...]

> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> index 4e49a1f5fa27..2e584e18d980 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -130,6 +130,8 @@ struct gpmi_devdata {
>  	enum gpmi_type type;
>  	int bch_max_ecc_strength;
>  	int max_chain_delay; /* See the async EDO mode */
> +	const char * const *clks;
> +	int clks_count;

const int ? :)

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
