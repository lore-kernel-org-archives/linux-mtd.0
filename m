Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH0ct-0004pt-Vt
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 02:48:36 +0000
Received: by mail-pa0-x232.google.com with SMTP id do7so9045553pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 18:48:15 -0800 (PST)
Date: Wed, 6 Jan 2016 18:48:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] mtd: nand: return consistent error codes in
 ecc.correct() implementations
Message-ID: <20160107024812.GZ109450@google.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
 <1451503927-10831-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451503927-10831-2-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 30, 2015 at 08:32:03PM +0100, Boris Brezillon wrote:
> The error code returned by the ecc.correct() are not consistent over the
> all implementations.
> 
> Document the expected behavior in include/linux/mtd/nand.h and fix
> offending implementations.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel_nand.c   |  2 +-
>  drivers/mtd/nand/bf5xx_nand.c   | 20 ++++++++++++++------
>  drivers/mtd/nand/davinci_nand.c |  6 +++---
>  drivers/mtd/nand/jz4740_nand.c  |  4 ++--
>  drivers/mtd/nand/mxc_nand.c     |  4 ++--
>  drivers/mtd/nand/nand_bch.c     |  2 +-
>  drivers/mtd/nand/nand_ecc.c     |  2 +-
>  drivers/mtd/nand/omap2.c        |  6 +++---
>  drivers/mtd/nand/r852.c         |  4 ++--
>  include/linux/mtd/nand.h        |  8 +++++++-
>  include/linux/mtd/nand_bch.h    |  2 +-
>  11 files changed, 37 insertions(+), 23 deletions(-)

Pushed patch 1, with added commentary about the bf5xx_nand bugfix.

Brian
