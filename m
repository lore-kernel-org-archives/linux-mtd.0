Received: from mail-qc0-x234.google.com ([2607:f8b0:400d:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU5yO-0007ZV-MG
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 02:27:33 +0000
Received: by mail-qc0-f180.google.com with SMTP id p19so1267298qcv.25
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 19:27:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87hacq1d5k.fsf@dell.be.48ers.dk>
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-2-git-send-email-sourav.poddar@ti.com>
 <20131009160759.GQ21581@sirena.org.uk> <52558A49.5090904@ti.com>
 <20131009174027.GS21581@sirena.org.uk>
 <87hacq1d5k.fsf@dell.be.48ers.dk>
Date: Wed, 9 Oct 2013 19:27:11 -0700
Message-ID: <CA+7tXii4J_Hie2v-DaSevFHn-YqriiVowhpXCP9H+U51_tbhvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
From: Trent Piepho <tpiepho@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: balbi@ti.com, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Sourav Poddar <sourav.poddar@ti.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 9, 2013 at 12:01 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Mark" == Mark Brown <broonie@kernel.org> writes:
>  Mark> I'm not convinced that this is the most useful API, it sounds like the
>  Mark> hardware can "memory map" the entire flash chip so the whole SPI
>  Mark> framework seems like overhead.
>
>  Mark> It also seems seems like it's going to involve the CPU being
>  Mark> stalled waiting for reads to complete instead of asking the SPI
>  Mark> controller to DMA the data to RAM and allowing the CPU to get on
>  Mark> with other things - replacing the explicit transmission of
>  Mark> commands with memory to memory DMAs might be advantageous but
>  Mark> replacing DMA with memcpy() would need numbers to show that it
>  Mark> was a win.
>
> Indeed. I can see how such a feature could be useful in E.G. a lowlevel
> bootloader (because of simplicity), but am less convinced about it in
> Linux where we could conceivable do something else useful while waiting
> on the spi controller.

I've found that the SPI layer adds rather a lot of overhead to SPI
transactions.  It appears to come mostly from using another thread to
run the queue.  A fast SPI message of a few dozen bytes ends up having
more overhead from the SPI layer than the time it takes the driver to
do the actual transfer.

So memory mapped mode via some kind of SPI hack seems like a bad
design.  All the SPI layer overhead and you don't get DMA.  Memory
mapped SPI could be a win, but I think you'd need to do it at the MTD
layer with a mapping driver that could read the mmapped SPI flash
directly.
