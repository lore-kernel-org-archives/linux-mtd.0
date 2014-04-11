Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYT30-0006fV-2H
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 04:26:42 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so4860953pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 21:26:17 -0700 (PDT)
Date: Thu, 10 Apr 2014 21:26:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 03/10] mtd: spi-nor: unify read opcode variants with
 ST SPI FSM
Message-ID: <20140411042613.GH3131@norris-Latitude-E6410>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
 <1397157664-24405-4-git-send-email-computersforpeace@gmail.com>
 <20140411002259.GA3837@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140411002259.GA3837@localhost.localdomain>
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

On Fri, Apr 11, 2014 at 08:23:01AM +0800, Huang Shijie wrote:
> On Thu, Apr 10, 2014 at 12:20:57PM -0700, Brian Norris wrote:
> > serial_flash_cmds.h defines our opcodes a little differently. Let's
> > borrow its naming, since it's borrowed from the SFDP standard, and it's
> > more extensible.
> > 
> > This prepares us for merging serial_flash_cmds.h and spi-nor.h opcode
> > listing.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Acked-by: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 16 ++++++++--------
> >  include/linux/mtd/spi-nor.h   | 24 ++++++++++++++++--------
> you still miss to change the fsl-quadspi.c.
> I am not on office now, and i can not compile this patch.
> did you meet any compiler error with this patch?

Yes, I already noted on patch 8 that I squashed the changes to
fsl-quadspi.c into the wrong patch. So the whole series does compile,
but this particular patch is broken (i.e., the series is not
bisectable). Shame on me (again), and I will resend after taking another
proper look at things.

Brian
