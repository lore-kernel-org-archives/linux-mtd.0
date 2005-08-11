Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3Egl-00074x-OE
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 11:09:50 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <42FB5E72.2010402@ru.mvista.com>
References: <42FB5E72.2010402@ru.mvista.com>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 15:09:19 +0000
Message-Id: <1123772959.23647.24.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 18:19 +0400, Vitaly Wool wrote:
> Hello all,

> I've looked through mtd code and found mtd_pm_callback that should be 
> called to handle PM events. This callback should in turn call 
> mtd->suspend/mtd->resume functions, if any. Therefore one evident way of 
> PM stuff implementation for this NAND flash is to provide suspend/resume 
> functions. However, pm_send (that calls mtd_pm_callback) is never called
> on ARM targets. So I doubt if it's appropriate to implement PM for the 
> driver this way since it's looking somehow obsolete.

I have no idea whats the state of those PM functions and why ARM is not
using them.

> So, unfortunately, both methods don't provide the level of integrity I'd 
> like to have. The problem is that nand core has no state machine in its 
> internals so the driver can't track the flash being in suspended state.

As far as I know the nand driver code, there is a member "state" in the
nand_chip private data structure, which is exactly tracking the state of
the device. 

FL_READY, FL_READING, FL_WRITING, FL_ERASING, FL_SYNCING, FL_CACHEDPRG,
are the currently implemented states. Adding FL_SUSPEND is not a big
problem.

All functions which access the FLASH device are serialized by
nand_get_device(), where the state variable is modified. So adding a
suspend/resume function is simple enough.

suspend justs sets the state to FL_SUSPEND and resume releases the
device by calling nand_release_device() which sets the state back to
FL_READY and wakes up the tasks on the wait_queue.

It's discussable, whether suspend is supposed to fail, when a flash
operation is in progress or just waits until the operation is finished,
which is usually only a matter of a couple of ms.

Of course we need an additional board function pointer in struct
nand_chip to have a board specific callback for suspend/resume
operations.

> Could you point me how can I synchronize access requests to the flash 
> with suspend/resume calls (e.g., fail requests when flash is in suspend 
> state) ? 

Fail requests in suspend state needs more modifications. 

The current serialization in nand_get_device would stall the calling
task and add it to the wait_queue and woken up again in the resume /
nand_release_device() path.

>From my POV this is not a bad way to go.

> Isn't it appropriate to implement a state machine here similar 
> to NOR CFI's one?

See above. :)

tglx
