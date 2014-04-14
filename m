Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZlx1-0006lQ-MR
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 18:49:52 +0000
Received: by mail-ie0-f173.google.com with SMTP id rl12so8561196iec.18
 for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2014 11:49:27 -0700 (PDT)
Date: Mon, 14 Apr 2014 11:21:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 00/11] mtd: spi-nor: misc. updates, de-duplication
Message-ID: <20140414182142.GS32070@ld-irv-0074>
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 11, 2014 at 11:59:55AM -0700, Brian Norris wrote:
> A few miscellaneous updates, cleanups, and de-duplications. Mostly trivial
> stuff, but I had a few oversights in the first round...and in the second round 
> too :(
> 
> v3:
>  - move the fsl-quadspi.c rename of
>      SPINOR_OP_QUAD_READ => SPINOR_OP_READ_1_1_4
>    from patch 8 to patch 3, so that the series bisects properly
>  - add new patch 11, caught while testing with sparse
> 
> v2:
>  - opcode renames to fsl-quadspi.c (missed a few; I compiled it this time!)
>  - additional whitespace consistency cleanups
>  - tweak documentation wording/formatting
>  - additonal patch (patch 10), to allow building spi-nor as a module

Pushed the first 10 to l2-mtd.git/spinor. I'll revisit #11 later.

Will rebase on 3.15-rc1 soon, and likely will merge to l2-mtd.git/master
soon enough, so we can get -next coverage and begin informing others of
the M25P80 -> MTD_SPI_NOR dependency.

Brian
