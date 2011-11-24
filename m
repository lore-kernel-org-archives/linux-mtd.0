Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
 helo=DB3EHSOBE006.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTPZM-0007PG-LD
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 03:01:49 +0000
Message-ID: <4ECDB398.4030508@freescale.com>
Date: Thu, 24 Nov 2011 11:01:44 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: gpmi: add missing include 'module.h'
References: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram:

The ARCH part of the GPMI is not merged into mainline now.
I do not know why it can not be accepted. :(

How did compile the GPMI driver in such situation?

Best Regards
Huang Shijie
> Fixes:
>
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_nfc_init':
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: error: 'THIS_MODULE' undeclared (first use in this function)
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: note: each undeclared identifier is reported only once for each function it appears in
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:15: error: expected declaration specifiers or '...' before string constant
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: data definition has no type or storage class
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
>
> and some more...
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 071b634..493ec2f 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -21,9 +21,9 @@
>  #include <linux/clk.h>
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
> +#include <linux/module.h>
>  #include <linux/mtd/gpmi-nand.h>
>  #include <linux/mtd/partitions.h>
> -
>  #include "gpmi-nand.h"
>  
>  /* add our owner bbt descriptor */
