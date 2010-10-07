Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3wAk-0000Vs-Jk
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 19:30:35 +0000
Received: by bwz2 with SMTP id 2so204577bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 12:30:32 -0700 (PDT)
Subject: Re: [PATCH] mtd/nand.h: little more cleanup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20101006210614.GA18551@www.tglx.de>
References: <20101005104101.GA18714@www.tglx.de>
	<20101005182656.GA21067@pengutronix.de>
	<1286304506.1797.2.camel@brekeke>
	<20101006210614.GA18551@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Oct 2010 22:30:29 +0300
Message-ID: <1286479829.1797.12.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-06 at 23:06 +0200, Sebastian Andrzej Siewior wrote:
> - remove tabs between type and name.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/mtd/nand.h |  315 +++++++++++++++++++++------------------------
>  1 files changed, 147 insertions(+), 168 deletions(-)

This one was not compile-tested:

[dedekind@brekeke l2-mtd-2.6]$ make -j2
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC [M]  drivers/mtd/devices/doc2000.o
  CC [M]  drivers/mtd/devices/doc2001.o
  CC [M]  drivers/mtd/devices/doc2001plus.o
  CC [M]  drivers/mtd/devices/docprobe.o
  CC [M]  drivers/mtd/nand/nand_base.o
drivers/mtd/nand/nand_base.c: In function ‘nand_command’:
drivers/mtd/nand/nand_base.c:589: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c: In function ‘nand_command_lp’:
drivers/mtd/nand/nand_base.c:680: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c: In function ‘nand_flash_detect_onfi’:
drivers/mtd/nand/nand_base.c:2890: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c: In function ‘nand_get_flash_type’:
drivers/mtd/nand/nand_base.c:2977: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c:3099: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c:3103: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c:3104: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c:3106: error: ‘struct nand_chip’ has no member named ‘chipsize’
drivers/mtd/nand/nand_base.c: In function ‘nand_scan_ident’:
drivers/mtd/nand/nand_base.c:3216: error: ‘struct nand_chip’ has no member named ‘chipsize’

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
