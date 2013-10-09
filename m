Received: from mail-ea0-x231.google.com ([2a00:1450:4013:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTz1b-0005k9-S4
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 19:02:25 +0000
Received: by mail-ea0-f177.google.com with SMTP id f15so635543eak.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 12:02:01 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-2-git-send-email-sourav.poddar@ti.com>
 <20131009160759.GQ21581@sirena.org.uk> <52558A49.5090904@ti.com>
 <20131009174027.GS21581@sirena.org.uk>
Date: Wed, 09 Oct 2013 21:01:59 +0200
In-Reply-To: <20131009174027.GS21581@sirena.org.uk> (Mark Brown's message of
 "Wed, 9 Oct 2013 18:40:27 +0100")
Message-ID: <87hacq1d5k.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: balbi@ti.com, linux-mtd@lists.infradead.org,
 spi-devel-general@lists.sourceforge.net, Sourav Poddar <sourav.poddar@ti.com>,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Mark" == Mark Brown <broonie@kernel.org> writes:

Hi,

 Mark> I'm not convinced that this is the most useful API, it sounds like the
 Mark> hardware can "memory map" the entire flash chip so the whole SPI
 Mark> framework seems like overhead.

 Mark> It also seems seems like it's going to involve the CPU being
 Mark> stalled waiting for reads to complete instead of asking the SPI
 Mark> controller to DMA the data to RAM and allowing the CPU to get on
 Mark> with other things - replacing the explicit transmission of
 Mark> commands with memory to memory DMAs might be advantageous but
 Mark> replacing DMA with memcpy() would need numbers to show that it
 Mark> was a win.

Indeed. I can see how such a feature could be useful in E.G. a lowlevel
bootloader (because of simplicity), but am less convinced about it in
Linux where we could conceivable do something else useful while waiting
on the spi controller.

But if there's number to prove otherwise..

-- 
Bye, Peter Korsgaard
