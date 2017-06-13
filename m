Date: Tue, 13 Jun 2017 15:14:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Wenyou Yang
 <wenyou.yang@atmel.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: atmel_nand: drop unused include
Message-ID: <20170613151455.1b458499@bbrezillon>
In-Reply-To: <20170613125842.16422-1-alexandre.belloni@free-electrons.com>
References: <20170613125842.16422-1-alexandre.belloni@free-electrons.com>
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

On Tue, 13 Jun 2017 14:58:42 +0200
Alexandre Belloni <alexandre.belloni@free-electrons.com> wrote:

> The Atmel NAND driver doesn't used anything from
> linux/platform_data/atmel.h, stop including it.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 3b2446896147..6bd61acfc2c8 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -64,7 +64,6 @@
>  #include <linux/of_platform.h>
>  #include <linux/iopoll.h>
>  #include <linux/platform_device.h>
> -#include <linux/platform_data/atmel.h>
>  #include <linux/regmap.h>
>  
>  #include "pmecc.h"
