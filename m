Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Fo0O-000193-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2001 03:27:36 +0100
Date: Thu, 28 Jun 2001 22:32:25 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: David Woodhouse <dwmw2@infradead.org>, jffs-dev <jffs-dev@axis.com>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 is broken
In-Reply-To: <3B3BC857.7FB81774@daniel.com>
Message-ID: <Pine.LNX.4.33.0106282200140.32406-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Thu, 28 Jun 2001, Vipin Malik wrote:

> So, in other words, if you use JFFS2 in your embedded system, you cannot
> expect a guranteed response to anything in less than 30 seconds if you
> use the stock code.
> If you turn compression off, that time is ~4 seconds.
>
> Note that these times are HIGHLY system speed dependent. My test system
> is a AMD SC520 (486 DX4 w/16MB L1 cache) @133MHz w/ 64MB 66MHz SDRAM.
> (~61 VAX MIPS). 8MB of AMD flash connected 32 bits wide.
>
> The problem is that JFFS2 tries to be a good guy and tries its hand at
> GC'ing dirty flash, _from within a write() system call_
>
> Now, I don't know if this can be made schedulable or not, but at this
> time, *all other* activity in the system stops.
> When the GC is complete, life resumes as before, but more than 30-40
> seconds may have elapsed.

This is completely wrong.  There is no excuse for the compression code to
monopolize the CPU that way.  This, of course, might be solved by the patch
that makes the kernel preemptive.  You could try the patch from
ftp://ftp.mvista.com/pub/Area51/preemptible_kernel/ and see the difference.
Of course the compression will still take a significant amount of CPU time,
but the rest of the system won't be starved.  Without the preemptive kernel
patch, the code executing in kernel mode is following the cooperative model
i.e. you must give up the CPU volontarily after a while.  So the alternative
to the preemptive kernel would be something like inserting this construct
within the inner loop in the compression code:

	if (current->need_resched) schedule();

This should solve the problem with all other activities stalling while
compression is going on.

> To test my hypothesis, I hacked the code, to refuse to try to GC from
> within a write() to the JFFS2 fs. all GC is now done by the gc thread
> (as it should).
> In the compression turned off case, my block times for the task not
> interacting with JFFS2 WENT DOWN TO 49.9 *ms* worst case, with the test
> going
> from an empty JFFS2 to a completely full JFFS2 fs (as in all cases
> above).
>
> Unfortunately, there is a problem with this approach. If write() cannot
> find space and now we refuse to GC inside the write and return with
> -ENOSPC, a lot of stock programs may break. I am returning -ENSPC
> because I just didn't take the time to figure out how to return 0, which
> IMHO is the right thing to do.

In fact, if you're not using aio's, you can't expect any predictable delay
for a write operation.  Even on floppies a write may take several seconds to
complete.  If you really want your process to keep running even while the
write is going on then dispatch the write operation to a separate thread.
HOWEVER the fact that all system activities are stopped while compression is
going on is actually a bug and should be solved by the introduction of the
if(...)  schedule() above into the compression loop at strategic places.

> The only solution, that I think will work, is to find a way to block the
> write() to JFFS2 but allow kernel schedduling to go on. I really don't
> know
> if this is possible under Linux as it exists today, maybe someone else
> can answer this question.

Not only it's possible, but mandatory for long operations like I said above.
You can try inserting the magic line in the compression code.  For instance
it shouldn't hurt even if you add too much or if you don't put it at the
best places, as long as schedule() isn't called from interrupt handlers or
bottom halves which the JFFS2 compression code doesn't have anyway.  This
will certainly give you a different behavior.


Nicolas
