Subject: Re: [PATCH 01/12] mtd: nand: remove unneeded of_mtd.h inclusions
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Roger Quadros
 <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Wenyou Yang
 <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459515272-31011-2-git-send-email-boris.brezillon@free-electrons.com>
CC: <linux-omap@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 <bcm-kernel-feedback-list@broadcom.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, <linux-sunxi@googlegroups.com>, Zhou Wang
 <wangzhou1@hisilicon.com>, Alex Smith <alex.smith@imgtec.com>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <56FE7307.6040903@imgtec.com>
Date: Fri, 1 Apr 2016 14:09:27 +0100
MIME-Version: 1.0
In-Reply-To: <1459515272-31011-2-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 01/04/16 13:54, Boris Brezillon wrote:
> Some drivers are including linux/of_mtd.h even if they don't use any of
> the of_get_nand_xxx() helpers.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/mtd/nand/jz4780_nand.c | 1 -
>   drivers/mtd/nand/lpc32xx_mlc.c | 1 -
>   drivers/mtd/nand/qcom_nandc.c  | 1 -
>   drivers/mtd/nand/sunxi_nand.c  | 1 -
>   drivers/mtd/nand/vf610_nfc.c   | 1 -
>   5 files changed, 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index e1c016c..23a1999 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -17,7 +17,6 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/gpio/consumer.h>
> -#include <linux/of_mtd.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/mtd/mtd.h>

Looks good to me.

Acked-by: Harvey Hunt <harvey.hunt@imgtec.com>

Thanks,

Harvey
