Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ai43c-0001Xo-P6
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2016 17:56:01 +0000
Received: by mail-pf0-x242.google.com with SMTP id x3so31245269pfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2016 10:55:40 -0700 (PDT)
Date: Mon, 21 Mar 2016 10:55:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mtd: spi-nor: add an alternative method to support
 memory >16MiB
Message-ID: <20160321175537.GH2545@google.com>
References: <1458556429-11741-1-git-send-email-cyrille.pitchen@atmel.com>
 <20160321170107.GG2545@google.com> <56F02C70.6050106@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56F02C70.6050106@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 21, 2016 at 06:16:32PM +0100, Cyrille Pitchen wrote:
> Le 21/03/2016 18:01, Brian Norris a écrit :
> > On Mon, Mar 21, 2016 at 11:33:49AM +0100, Cyrille Pitchen wrote:
> >> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> >> index d42c98e1f581..7fae36fc8526 100644
> >> --- a/drivers/mtd/spi-nor/Kconfig
> >> +++ b/drivers/mtd/spi-nor/Kconfig
> >> @@ -29,6 +29,18 @@ config MTD_SPI_NOR_USE_4K_SECTORS
> >>  	  Please note that some tools/drivers/filesystems may not work with
> >>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
> >>  
> >> +config MTD_SPI_NOR_USE_4B_OPCODES
> >> +	bool "Use 4-byte address op codes"
> >> +	default n
> >> +	help
> >> +	  This is an alternative to the "Enter/Exit 4-byte mode" commands and
> >> +	  Base Address Register (BAR) updates to support flash size above 16MiB.
> >> +	  Using dedicated 4-byte address op codes for (Fast) Read, Page Program
> >> +	  and Sector Erase operations avoids changing the internal state of the
> >> +	  SPI NOR memory. Hence if a CPU reset occurs, early bootloaders can
> >> +	  still use regular 3-byte address op codes and read from the very first
> >> +	  16MiB of the flash memory.
> >> +
> > 
> > Why does this need to be a Kconfig option? Can't it just as well be
> > supported by keeping entries in the ID table, to show which flash
> > support these opcodes and which don't? Kconfig is really a bad mechanism
> > for trying to configure your flash.
> 
> Well, the only reason why I've chosen a Kconfig option is to be as safe as
> possible, if for some reason someone still wants to use the former
> implementation. Honestly I don't know why one would do so but I'm cautious
> so I also set "default n". This way no regression is introduced.

I think the main reason is that some manufacturers did not initially
support both methods. So we couldn't just say "all Micron" or "all
Macronix" should use these opcodes. Spansion was the only one to support
them consistently. See [1] for reference.

And actually, your Kconfig option is not "cautious", because you have no
guarantee that people will make intelligent choices here. So you're
making a Kconfig that if someone accidentally turns it on, their flash
might not work any more. That's much less safe than properly labelling
which flash supports which feature.

> If you think it's better to use a dedicated flag like SECT_4K or
> SPI_NOR_QUAD_READ in the spi_nor_ids[] table, I'm perfectly fine with it as
> well.

I think that would be better. (Really, an opt-out would be the least
work in the long-run I think, since IIRC there were only a few
early-generation flash that were both large enough to need 4 byte
addressing and didn't support the dedicated opcodes. But it'll be hard
to track those down now I think, so opt-in probably is most practical.)

> Just let me know your choice then I'll update my patch accordingly if needed.

Brian

[1]
commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Thu Apr 11 01:34:57 2013 -0700

    mtd: m25p80: utilize dedicated 4-byte addressing commands
