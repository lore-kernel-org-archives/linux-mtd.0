Received: from postdiluvian.org ([128.30.54.21] helo=porklips.postdiluvian.org)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5hMK-000405-RK
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 16:05:49 +0000
Date: Tue, 12 Oct 2010 12:05:45 -0400
From: Mark Mason <mason@postdiluvian.org>
To: Iwo Mergler <iwo@call-direct.com.au>
Subject: Re: Scheduler latency problems when using NAND
Message-ID: <20101012160544.GB16683@postdiluvian.org>
References: <20100929221401.GA32583@postdiluvian.org>
	<4CA3D92E.9060109@call-direct.com.au>
	<20101009174246.GA19591@postdiluvian.org>
	<4CB39590.3070404@call-direct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4CB39590.3070404@call-direct.com.au>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iwo Mergler <iwo@call-direct.com.au> wrote:

> Mark Mason wrote:
>
> > What I see on a logic analyzer is the BUSY line held by the flash for
> > 200us, a single 32 bit read of the video chip (broken up into two 16
> > bit reads for the 16 bit bus), then another 200us BUSY from the flash,
> > two more 16 bit reads, etc, all the way to the end of the logic
> > analyzer screen.
> 
> I don't know your controller, but I'm surprised that the FLASH write
> can stall the bus like that. It seems a high price to pay for not
> having to implement some FLASH write interrupt or wait. Are you sure
> that this is the recommended way to connect a FLASH?

I don't think it's the controller's fault, it's a signal provided by
the flash, and its purpose is to hold off the controller while the
NAND is busy.  It seems strange that the signal remains asserted when
the chip isn't selected, but if it didn't then the controller would
have to poll the chip by periodically selecting the chip and see if
BUSY had deasserted.  The controller, running in flash mode, requires
the BUSY line to work.

A saner approach might be to connect the BUSY line to an interrupt,
and have the interrupt wake the NAND BGT up, but it's too late for
that now, since the hardware's already built.

Usually NAND is used for things like booting, config and log files,
etc, which is just 200us every now and then, so this wouldn't be a
problem.  It's only a problem since we need really high bandwidth to
the flash.

I got a fast reply from Freescale - this is the way it works and there
is no workaround.

I'll try shutting the FCM off and acccessing the device as a plain
memory device.

Thanks for the help!
