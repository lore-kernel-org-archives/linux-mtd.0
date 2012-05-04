Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQM2a-0003c2-U1
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 17:11:37 +0000
Date: Fri, 4 May 2012 10:11:25 -0700
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Subject: Re: [PATCH v3.4-rc3] MTD: NAND: ams-delta: Fix
 request_mem_region() failure
Message-ID: <20120504171125.GD5613@atomide.com>
References: <1334670557-25640-1-git-send-email-jkrzyszt@tis.icnet.pl>
 <1587089.0XMyH6e1Ic@acer> <1335417678.2290.7.camel@koala>
 <1520744.9xCxNUdyzk@acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520744.9xCxNUdyzk@acer>
Cc: dedekind1@gmail.com, Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Janusz Krzysztofik <jkrzyszt@tis.icnet.pl> [120430 11:15]:
> Dnia czwartek, 26 kwietnia 2012 08:20:59 Artem Bityutskiy pisze:
> > On Wed, 2012-04-25 at 19:01 +0200, Janusz Krzysztofik wrote:
> > > Both drivers use separate subsets of registers that belong to the 
> OMAP1 
> > > MPU I/O device, but are used for controlling different sets of I/O 
> pins. 
> > > The NAND driver reads/writes the folowing registers:
> > > - OMAP_MPUIO_INPUT_LATCH,
> > > - OMAP_MPUIO_OUTPUT,
> > > - OMAP_MPUIO_IO_CNTL,
> > > while the keypad driver - the following:
> > > - OMAP_MPUIO_KBR_LATCH,
> > > - OMAP_MPUIO_KBC,
> > > - OMAP_MPUIO_KBD_MASKIT
> > > - OMAP_MPUIO_GPIO_DEBOUNCING.
> > > Both subsets are non-overlapping, and we rely on the drivers being 
> free 
> > > of bugs and doing their job correctly, not stepping on each others' 
> > > feet, I guess.
> > 
> > First of all, I think this information should be in the commit 
> message.
> > Also, some sort of comment in the driver code would be nice.
> > 
> > If locking the memory region is too coarse approach, the should have a
> > small separate omap-specific MPUIO subsystem which will be used by
> > drivers to access MPUIO?
> > 
> > Another question - should request_mem_region() be also removed from 
> the
> > omap-gpio driver then? I think it is more sensible to put a comment
> > there that it is sharing MPIO with other drivers,  instead of having 
> an
> > illusion of exclusive memory region ownership.
> > 
> > But this is up to the OMAP community - I can take this patch to my
> > l2-mtd tree if you get an ack from Tony or other OMAP guys.
> 
> Tony,
> Would I get your Ack for this fix if I extend the commit message as Artem 
> suggested? If not, what do you think should be a correct way to fix the 
> regression?

Well how about adding some exported functions to drivers/gpio/gpio_omap.c
like omap_mpuio_latch?

For the regression fix, if you guys want to do what Janusz is suggesting,
then assuming the patch description also contains some decent long term
plan to properly fix it:

Acked-by: Tony Lindgren <tony@atomide.com>
