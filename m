Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVW9h-0006Bt-BY
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 22:28:01 +0000
Received: by lagu2 with SMTP id u2so1456573lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2011 14:27:59 -0800 (PST)
Subject: Re: [PATCH] mtd: gpmi: add missing include 'module.h'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Wed, 30 Nov 2011 00:20:00 +0200
In-Reply-To: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
References: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322605202.2150.26.camel@koala>
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-11-23 at 15:57 +0100, Wolfram Sang wrote:
> Fixes:
> 
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_nfc_init':
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: error: 'THIS_MODULE' undeclared (first use in this function)
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: note: each undeclared identifier is reported only once for each function it appears in
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:15: error: expected declaration specifiers or '...' before string constant
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: data definition has no type or storage class
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'

Pushed to l2-mtd-2.6.git, thanks!

Artem.
