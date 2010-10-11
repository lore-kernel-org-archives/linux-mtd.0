Received: from ipmail07.adl2.internode.on.net ([150.101.137.131])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5RG8-0002dt-Hr
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2010 22:54:21 +0000
Message-ID: <4CB39590.3070404@call-direct.com.au>
Date: Tue, 12 Oct 2010 08:54:08 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Mark Mason <mason@postdiluvian.org>
Subject: Re: Scheduler latency problems when using NAND
References: <20100929221401.GA32583@postdiluvian.org>	<4CA3D92E.9060109@call-direct.com.au>
	<20101009174246.GA19591@postdiluvian.org>
In-Reply-To: <20101009174246.GA19591@postdiluvian.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mark Mason wrote:
> The flash driver (fsl_elbc_nand.c) goes to sleep right after it issues
> a page program, and a context switch to another high priority thread
> takes place promptly.  This thread is often one that reads from
> another (video) chip on the same bus as the flash (the MPC8315 LBC).
> The flash asserts its BUSY line while the page program is in
> operation.  When the other thread comes along to read from video chip,
> it's held off for the 200us duration of the page program (the LBC
> controller for the video chip is running in UPM mode, so the BUSY line
> is a BUSY line and not a TA line, in case any 83xx junkies are reading
> this).
> 
> What I see on a logic analyzer is the BUSY line held by the flash for
> 200us, a single 32 bit read of the video chip (broken up into two 16
> bit reads for the 16 bit bus), then another 200us BUSY from the flash,
> two more 16 bit reads, etc, all the way to the end of the logic
> analyzer screen.

I don't know your controller, but I'm surprised that the FLASH write
can stall the bus like that. It seems a high price to pay for not
having to implement some FLASH write interrupt or wait. Are you sure
that this is the recommended way to connect a FLASH?

As you said, it looks like it may be worthwhile to abandon the NAND
controller and implement a software driver via an SRAM bus mode.

Maybe even to the extent of reading the video controller *while*
polling the BUSY line. You could wake up the FLASH thread from the
video driver when the write is done.

> 
> What I think is happening is that the flash background thread is
> running very efficiently - it comes in, issues a page program, and
> relinquishes the CPU.  The thread reading the video chip then runs,
> stalls for 200us waiting for a single read, gets its read, then is
> preempted for the flash BGT.
> 
> My guess is that the scheduler sees the flash background thread as
> running almost not at all, and the video thread as running a lot more,
> although it's stalled for most of the first 200us of its time slice on
> a single bus transaction, so it can't really do anything with its time
> slice.  I further suspect that the scheduler is dynamically adjusting
> the priorities to boost the flash BGT, since it's using much less CPU
> time than the video thread, even though the video thread can't use
> most of its time slice.  Can someone tell me if this makes sense?

I'm not sure about this, but I thought the scheduler only does priority
escalation when running userspace threads. For kernel thread scheduling,
you get extra priority levels where the higher priority thread always
wins if its ready to run.


Best regards,

Iwo
