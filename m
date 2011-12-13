Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaadL-0007Yu-K9
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2011 22:15:36 +0000
Received: by eekc1 with SMTP id c1so186443eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2011 14:15:33 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: gpmi: add missing include 'module.h'
Date: Tue, 13 Dec 2011 23:15:30 +0100
References: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
 <201112022047.01444.marek.vasut@gmail.com>
In-Reply-To: <201112022047.01444.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201112132315.30532.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Fixes:
> > 
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_nfc_init':
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: error: 'THIS_MODULE'
> > undeclared (first use in this function)
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: note: each undeclared
> > identifier is reported only once for each function it appears in
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:15: error: expected
> > declaration specifiers or '...' before string constant
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: data definition
> > has no type or storage class
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: type defaults to
> > 'int' in declaration of 'MODULE_AUTHOR'
> > 
> > and some more...
> > 
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > ---
> > 
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index 071b634..493ec2f 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -21,9 +21,9 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/slab.h>
> >  #include <linux/interrupt.h>
> > 
> > +#include <linux/module.h>
> > 
> >  #include <linux/mtd/gpmi-nand.h>
> 
> This one is missing too, but I suspect that's the stuff discussed in the
> subsequent emails? When do you plan to get this merged? (or what do I need
> to apply by hand ... patch name or message ID is ok).
> 
> Thanks
> 
> M

BUMP

any updates?
Thanks

M
