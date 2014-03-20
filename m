Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQaj1-0003Qh-4F
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:01:27 +0000
Received: by mail-pa0-f54.google.com with SMTP id lf10so780284pab.13
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:01:05 -0700 (PDT)
Date: Thu, 20 Mar 2014 04:00:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v5 4/4] mtd: devices: elm: update DRIVER_NAME as "omap-elm"
Message-ID: <20140320110059.GO31517@norris-Latitude-E6410>
References: <1393845563-7800-1-git-send-email-pekon@ti.com>
 <1393845563-7800-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1393845563-7800-5-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 03, 2014 at 04:49:23PM +0530, Pekon Gupta wrote:
> use "omap-elm" as DRIVER_NAME
> prefix DRIVER_NAME in debug and error messages
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/devices/elm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index 43fd81d..16e62ae 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
> @@ -15,6 +15,9 @@
>   *
>   */
>  
> +#define	DRIVER_NAME	"omap-elm"

Your spacing is a little off. You have a tab between 'define' and
'DRIVER_NAME'.

> +#define pr_fmt(fmt)	DRIVER_NAME ": " fmt
> +
>  #include <linux/platform_device.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -522,7 +525,7 @@ MODULE_DEVICE_TABLE(of, elm_of_match);
>  
>  static struct platform_driver elm_driver = {
>  	.driver	= {
> -		.name	= "elm",
> +		.name	= DRIVER_NAME,
>  		.owner	= THIS_MODULE,
>  		.of_match_table = of_match_ptr(elm_of_match),
>  		.pm	= &elm_pm_ops,

Brian
