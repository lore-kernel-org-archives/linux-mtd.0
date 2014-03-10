Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WN0ko-00074T-G9
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 14:00:30 +0000
Date: Mon, 10 Mar 2014 10:59:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 4/4] mtd: devices: elm: update DRIVER_NAME as "omap-elm"
Message-ID: <20140310135946.GD5994@arch.cereza>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
 <1394197344-9468-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394197344-9468-5-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, avinashphilipk@gmail.com,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 07, Pekon Gupta wrote:
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
> +#define pr_fmt(fmt)	DRIVER_NAME ": " fmt
> +

As per my previous comment about pr_{} vs. dev_{}, I think
you can now drop the pr_fmt and just leave the name change here.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
