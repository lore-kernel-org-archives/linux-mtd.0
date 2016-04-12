Date: Wed, 13 Apr 2016 00:22:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Wenyou
 Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Kamal
 Dasu <kdasu.kdev@gmail.com>, Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-omap@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Zhou Wang <wangzhou1@hisilicon.com>, Alex
 Smith <alex.smith@imgtec.com>, Harvey Hunt <harvey.hunt@imgtec.com>
Subject: Re: [PATCH 01/12] mtd: nand: remove unneeded of_mtd.h inclusions
Message-ID: <20160413002215.166d4340@bbrezillon>
In-Reply-To: <1459515272-31011-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459515272-31011-2-git-send-email-boris.brezillon@free-electrons.com>
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

On Fri,  1 Apr 2016 14:54:21 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Some drivers are including linux/of_mtd.h even if they don't use any of
> the of_get_nand_xxx() helpers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied.

> ---
>  drivers/mtd/nand/jz4780_nand.c | 1 -
>  drivers/mtd/nand/lpc32xx_mlc.c | 1 -
>  drivers/mtd/nand/qcom_nandc.c  | 1 -
>  drivers/mtd/nand/sunxi_nand.c  | 1 -
>  drivers/mtd/nand/vf610_nfc.c   | 1 -
>  5 files changed, 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index e1c016c..23a1999 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -17,7 +17,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/of_mtd.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/mtd/mtd.h>
> diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
> index d8c3e7a..8e43978 100644
> --- a/drivers/mtd/nand/lpc32xx_mlc.c
> +++ b/drivers/mtd/nand/lpc32xx_mlc.c
> @@ -35,7 +35,6 @@
>  #include <linux/completion.h>
>  #include <linux/interrupt.h>
>  #include <linux/of.h>
> -#include <linux/of_mtd.h>
>  #include <linux/of_gpio.h>
>  #include <linux/mtd/lpc32xx_mlc.h>
>  #include <linux/io.h>
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index f550a57..f3de983 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -21,7 +21,6 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/of_mtd.h>
>  #include <linux/delay.h>
>  
>  /* NANDc reg offsets */
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index 1c03eee..3a97093 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -30,7 +30,6 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_gpio.h>
> -#include <linux/of_mtd.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/mtd/partitions.h>
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 293feb1..a7f2756 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -33,7 +33,6 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/mtd/partitions.h>
> -#include <linux/of_mtd.h>
>  #include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
