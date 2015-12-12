Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7cuP-0003zn-PE
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 05:39:54 +0000
Received: by pfee188 with SMTP id e188so6492134pfe.1
 for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2015 21:39:32 -0800 (PST)
Date: Fri, 11 Dec 2015 21:39:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH for-4.4] mtd: fix cmdlinepart parser, early naming for
 auto-filled MTD
Message-ID: <20151212053918.GA19361@brian-ubuntu>
References: <1449878281-94986-1-git-send-email-computersforpeace@gmail.com>
 <566BA661.9000407@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566BA661.9000407@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 12, 2015 at 05:45:21AM +0100, Heiko Schocher wrote:
> Am 12.12.2015 um 00:58 schrieb Brian Norris:
> >Commit 807f16d4db95 ("mtd: core: set some defaults when dev.parent is
> >set") attempted to provide some default settings for MTDs that
> >  (a) assign the parent device and
> >  (b) don't provide their own name or owner
> >
> >However, this isn't a perfect drop-in replacement for the boilerplate
> >found in some drivers, because the MTD name is used by partition
> >parsers like cmdlinepart, but the name isn't set until add_mtd_device(),
> >after the parsing is completed. This means cmdlinepart sees a NULL name
> >and therefore will not work properly.
> >
> >Fix this by moving the default name and owner assignment to be first in
> >the MTD registration process.
> >
> >Fixes: 807f16d4db95 ("mtd: core: set some defaults when dev.parent is set")
> >Reported-by: Heiko Schocher <hs@denx.de>
> >Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >Cc: Heiko Schocher <hs@denx.de>
> >Cc: Frans Klaver <fransklaver@gmail.com>
> >---
> >Heiko, can you provide testing feedback (e.g., 'Tested-by: ...')?
> 
> Sorry, does not work for me:
> 
> Based on:
> pollux:linux hs [20151212] $ git describe master
> v4.4-rc4-135-gb9d8545
> 
> and this patch, shows the same problem,

[...]

Ugh, I see the problem. In nand_base.c, nand_get_flash_type():

	if (!mtd->name)
		mtd->name = type->name;

Brian
