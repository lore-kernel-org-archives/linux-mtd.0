Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYQCD-0001w4-Vf
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 01:24:02 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so4708022pbb.33
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 18:23:36 -0700 (PDT)
Date: Fri, 11 Apr 2014 08:23:01 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 03/10] mtd: spi-nor: unify read opcode variants with
 ST SPI FSM
Message-ID: <20140411002259.GA3837@localhost.localdomain>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
 <1397157664-24405-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397157664-24405-4-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 10, 2014 at 12:20:57PM -0700, Brian Norris wrote:
> serial_flash_cmds.h defines our opcodes a little differently. Let's
> borrow its naming, since it's borrowed from the SFDP standard, and it's
> more extensible.
> 
> This prepares us for merging serial_flash_cmds.h and spi-nor.h opcode
> listing.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Acked-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 16 ++++++++--------
>  include/linux/mtd/spi-nor.h   | 24 ++++++++++++++++--------
you still miss to change the fsl-quadspi.c.
I am not on office now, and i can not compile this patch.
did you meet any compiler error with this patch?


thanks
Huang Shijie
