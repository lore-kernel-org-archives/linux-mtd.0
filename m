Received: from mail-oa0-x22f.google.com ([2607:f8b0:4003:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRUPe-00088S-1o
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 21:56:54 +0000
Received: by mail-oa0-f47.google.com with SMTP id i1so1475231oag.6
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 14:56:32 -0700 (PDT)
Date: Wed, 2 Oct 2013 14:56:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 03/21] mtd: nand: pxa3xx: Use a completion to signal
 device ready
Message-ID: <20131002215628.GW23337@ld-irv-0074.broadcom.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1379606505-2529-4-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1379606505-2529-4-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 19, 2013 at 01:01:27PM -0300, Ezequiel Garcia wrote:
> Apparently, the expected behavior of the waitfunc() NAND chip call
> is to wait for the device to be READY (this is a standard chip line).
> However, the current implementation does almost nothing, which opens
> a possibility to issue a command to a non-ready device.
> 
> Fix this by adding a new completion to wait for the ready event to arrive.
> 
> Because the "is ready" flag is cleared from the controller status
> register, it's needed to store that state in the driver, and because the
> field is accesed from an interruption, the field needs to be of an
> atomic type.

Does it really need to be an atomic type? AIUI, you can hand off exclusive
control to the hardware when you begin a command. So the rest of the driver would be
inactive when the IRQ handler is setting the ready flag. And similarly,
the hardware should be inactive (i.e., no interrupts) when you are
modifying the ready flag in the driver (i.e., in cmdfunc).

Or perhaps I'm misunderstanding something.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 45 +++++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index a8d2ea7..fba91c2 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -35,6 +35,7 @@
>  
>  #include <linux/platform_data/mtd-nand-pxa3xx.h>
>  
> +#define NAND_DEV_READY_TIMEOUT  50
>  #define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
>  #define NAND_STOP_DELAY		(2 * HZ/50)
>  #define PAGE_CHUNK_SIZE		(2048)
> @@ -167,7 +168,7 @@ struct pxa3xx_nand_info {
>  	struct clk		*clk;
>  	void __iomem		*mmio_base;
>  	unsigned long		mmio_phys;
> -	struct completion	cmd_complete;
> +	struct completion	cmd_complete, dev_ready;

Do you really need two completion structures? Does 'device ready' always
follow 'command complete', so that you can just use 'device ready' all
the time? And if so, does it make sense to just use dev_ready?

>  
>  	unsigned int 		buf_start;
>  	unsigned int		buf_count;

Brian
