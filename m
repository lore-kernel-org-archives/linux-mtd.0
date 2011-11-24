Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=AM1EHSOBE002.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTV8w-0001ck-SS
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 08:58:56 +0000
Message-ID: <4ECE074A.7020405@freescale.com>
Date: Thu, 24 Nov 2011 16:58:50 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: gpmi: add missing include 'module.h'
References: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2011=C4=EA11=D4=C223=C8=D5 22:57, Wolfram Sang =D0=B4=B5=C0:
> Fixes:
>
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_nfc_init':
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: error: 'THIS_MODULE' un=
declared (first use in this function)
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: note: each undeclared i=
dentifier is reported only once for each function it appears in
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:15: error: expected declara=
tion specifiers or '...' before string constant
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: data definition=
 has no type or storage class
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: type defaults t=
o 'int' in declaration of 'MODULE_AUTHOR'
>
> and some more...
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
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
> =20
>  /* add our owner bbt descriptor */
Acked-by: Huang Shijie <b32955@freescale.com>
