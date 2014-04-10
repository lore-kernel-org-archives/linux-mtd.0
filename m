Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKkB-00012s-4l
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 19:34:39 +0000
Received: by mail-ig0-f180.google.com with SMTP id c1so4205450igq.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 12:34:15 -0700 (PDT)
Date: Thu, 10 Apr 2014 12:34:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 3/9] mtd: spi-nor: unify read opcode variants with ST SPI
 FSM
Message-ID: <20140410193412.GO32070@ld-irv-0074>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-3-git-send-email-computersforpeace@gmail.com>
 <20140410074711.GG24100@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140410074711.GG24100@localhost>
Cc: Marek Vasut <marex@denx.de>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 10, 2014 at 03:47:13PM +0800, Huang Shijie wrote:
> On Wed, Apr 09, 2014 at 10:32:48AM -0700, Brian Norris wrote:
> > serial_flash_cmds.h defines our opcodes a little differently. Let's
> > borrow its naming, since it's borrowed from the SFDP standard, and it's
> > more extensible.
> > 
> > This prepares us for merging serial_flash_cmds.h and spi-nor.h opcode
> > listing.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 16 ++++++++--------
> >  include/linux/mtd/spi-nor.h   | 24 ++++++++++++++++--------
> Please also change the fsl-quadspi.c which also uses the opcodes.

My bad. I missed compiling this driver. Fixed in v2.

Thanks,
Brian
