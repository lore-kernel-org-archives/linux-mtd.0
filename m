Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN7bd-0005T1-W0
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 23:28:34 +0000
Received: by mail-pa0-x232.google.com with SMTP id cy9so60707075pac.0
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 15:28:13 -0800 (PST)
Date: Sat, 23 Jan 2016 15:28:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, kbuild-all@01.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [l2-mtd:next 457/463] DockBook: drivers/mtd/nand/nand_bbt.c:1:
 warning: no structured comments found
Message-ID: <20160123232808.GA32454@localhost>
References: <201601240733.am9qqV5g%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201601240733.am9qqV5g%fengguang.wu@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 24, 2016 at 07:10:38AM +0800, kbuild test robot wrote:
> tree:   git://git.infradead.org/users/dedekind/l2-mtd.git next
> head:   b8b0e465ddb0c9cb16089ddfed68a8569e006465
> commit: 54ca3cd594db58d65b3670f2af452c1104b09ac6 [457/463] mtd: nand: remove EXPORT_SYMBOL of nand_scan_bbt()
> reproduce: make htmldocs
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/mtd/nand/nand_bbt.c:1: warning: no structured comments found
> 
> vim +1 drivers/mtd/nand/nand_bbt.c
> 
> ^1da177e Linus Torvalds 2005-04-16 @1  /*
> ^1da177e Linus Torvalds 2005-04-16  2   *  Overview:
> ^1da177e Linus Torvalds 2005-04-16  3   *   Bad block table support for the NAND driver
> ^1da177e Linus Torvalds 2005-04-16  4   *
> d159c4e5 Fabio Estevam  2012-07-28  5   *  Copyright © 2004 Thomas Gleixner (tglx@linutronix.de)
> ^1da177e Linus Torvalds 2005-04-16  6   *
> ^1da177e Linus Torvalds 2005-04-16  7   * This program is free software; you can redistribute it and/or modify
> ^1da177e Linus Torvalds 2005-04-16  8   * it under the terms of the GNU General Public License version 2 as
> ^1da177e Linus Torvalds 2005-04-16  9   * published by the Free Software Foundation.
> 
> :::::: The code at line 1 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> 
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

I'm not sure why we're getting this report right now... It's definitely
not a "new" warning. I also can't reproduce it when I run 'make
htmldocs'. The comment block in question doesn't use the kerneldoc
format (i.e., beginning with '/**'), so I don't know why this warning
would occur at all.

Brian
