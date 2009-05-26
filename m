Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8tCh-0003pz-Nb
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 09:44:35 +0000
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
	<1243323142.21646.129.camel@localhost.localdomain>
	<72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 May 2009 12:43:51 +0300
Message-Id: <1243331031.21646.134.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gregory CLEMENT <gclement@adeneo.eu>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-26 at 11:40 +0200, simon polette wrote:
> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
> > On Mon, 2009-05-25 at 17:44 +0200, simon polette wrote:
> >> +config       MTD_NAND_ATMEL_FLASH_BBT
> >> +     bool "Use On-Flash Bad Block Table"
> >> +     depends on MTD_NAND_ATMEL
> >> +     help
> >> +       This enables the On-Flash BBT, which mean that the bad blocks
> >> +       will be scanned one time then the BBT will be stored
> >> +       in flash, so scanning Nand flash for bad blocks will be no more
> >> +       necessary for the next boots.
> >> +
> >
> > I do not think you need a config option for this. It should be
> > a module parameter instead.
> >
> > --
> > Best regards,
> > Artem Bityutskiy (Битюцкий Артём)
> >
> >
> 
> Yes, good idea, but do you think that I can keep a config option to
> define the default state of that param, it means doing something like
> :
> #ifdef CONFIG_MTD_NAND_ATMEL_FLASH_BBT
> static int use_on_flash_bbt = 1;
> #else
> static int use_on_flash_bbt = 0;
> #endif
> module_param(use_on_flash_bbt, int, 0);

I think it is generally bad idea if each nand driver will
introduce a separate config option for this kind of stuff.

You may always boot your kernel with something like
atmel_nand.on_flash_bbt=1 in the kernel parameters.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
