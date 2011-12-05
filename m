Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXS8R-00006x-LM
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:34:44 +0000
Received: by laai10 with SMTP id i10so1299157laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:34:41 -0800 (PST)
Subject: Re: [PATCH] mtd: gpmi: add missing include 'module.h'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>, dwmw2@infradead.org
Date: Mon, 05 Dec 2011 08:34:38 +0200
In-Reply-To: <201112022047.01444.marek.vasut@gmail.com>
References: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
 <201112022047.01444.marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323066880.2316.20.camel@koala>
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-12-02 at 20:47 +0100, Marek Vasut wrote:
> This one is missing too, but I suspect that's the stuff discussed in the 
> subsequent emails? When do you plan to get this merged? (or what do I need to 
> apply by hand ... patch name or message ID is ok).

Ah, right, this should be merged ASAP. Let's ask David to merge this
patch from my l2-mtd-2.6.git tree:

commit 63c646f21ef5bcde88a81b2695a450c4665857d4
Author: Wolfram Sang <w.sang@pengutronix.de>
Date:   Wed Nov 23 15:57:06 2011 +0100

    mtd: gpmi: add missing include 'module.h'
    
    Fixes:
    
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_nfc_init':
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: error: 'THIS_MODULE' undeclared (first use in this function)
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: note: each undeclared identifier is reported only once for each function it appears in
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:15: error: expected declaration specifiers or '...' before string constant
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: data definition has no type or storage class
    drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
    
    and some more...
    
    Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
    Acked-by: Huang Shijie <b32955@freescale.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@intel.com>

Artem.
