Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IVZc-0006Jo-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 14:23:09 +0100
Message-Id: <5.1.0.14.0.20010706081855.00a676b0@mail.spewey.com>
Date: Fri, 06 Jul 2001 08:40:21 -0500
To: Bjorn Wesen <bjorn.wesen@axis.com>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: On the "safe filesystem" and write() topic
Cc: jffs-dev@axis.com,MTD for Linux <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.21.0107051942540.17972-100000@godzilla.axis.se>
References: <5.1.0.14.0.20010704082022.00a67538@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Hi,

> > Have you guys tested the JFFS fs under
> > power fail? What version are you using and what were your results?
>
>We've tested it but probably not in more than a couple of hundred
>cycles; I've never seen that floating bit error before, perhaps it's just
>some flash chips that get bitten by that and it might depend on the
>hardware as well (resident charge in capacitors etc).

I believe that David also mentioned that he has seen that error also.
It's detection is very proportional to the probability of power failing in 
the middle of a sector erase. So the larger number of sector erases that 
one does, as well as the larger number of power fail one does, the higher 
the probability of seeing it. With a few hundred tests, I'm not surprised 
that you haven't seem it.


>Well apart from compression-code and
>latency; after all you cannot both have synchronous writes, compression
>and expecting the application to not be blocked..

HeHe, well, maybe the fs can (will or may?) block, but in all realistic 
situations it's unacceptable for a real world embedded app to block for 
multiple seconds while the fs is "busy". Where does the app store any data 
value updates it's generating (specially if they have to be stored 
immediately in a non-volatile manner)?



>(The rest of the system should not be blocked though, that's just a matter
>of being able to yield due to need_resched inside the
>compression code)

My latest tests indicate that this is already the case. A POSIX RT task 
(not interacting with JFFS2) does not block (for too long) even if the 
underlying JFFS2 fs is blocked for >40 seconds!


> > >The problems arise from the vague definition of what the desired state
> > >would be - is it the data before the last write(), and what happens if you
> > >receive a signal ?
> >
> > Isn't it the same case as what happens when you get a power fail? (please
> > pardon my lack of understanding of signals in kernels. Can the execution
> > that was interrupted with a signal ever resume at the interrupted point?)
>
>Depends on the system call and underlying filesystem; for a
>normal read/write, they probably just return the number of chars
>read/written up to the point of the signal (just as they can by the
>API). And hence my comment that it's no use trying to enforce atomic
>behaviour for entire write() chunks. Your app can catch a signal, return
>from a half-written write and then crash before you can write() the
>"missing" chars.

I guess you are right. This is best handled as an "out of band" solution- 
i.e. with
ioctl transactions, or a transaction db etc.


>As long as writes are enforced to be sequential, I think that's
>enough. Does not JFFS2 queue writes internally anyway BTW ? And if you
>have O_SYNC (assuming JFFS adheres to it) when fprintf returns you can be
>as guaranteed that the data has been written as if you'd done it yourself
>with a write().

Hmm, I was under the impression that lib fprintf, fread, fwrite etc. all 
work with some delimiter, usually '\n' and specially in the case of 
fprintf(), the data is buffered till a '\n' is detected. I assumed (perhaps 
incorrectly) that a similar mechanism may be at play with the lib file i/o 
calls as well.


> > points in it that are being updated frequently. Each file has an overhead
> > (as well a max # of files limit on the fs). How reasonable is it to put
> > 5000, 8 byte files on a 1MB JFFS(2) fs? (this file would only occupy <50KB
> > in a single (db) file) vs at least 5000*64(file overhead)+5000*8 = 
> 360KB as
> > separate files, assuming that you can even fit 5000 files on your 
> partition.
>
>I think either a transaction mechanism or an entirely different flash
>filesystem (not VFS-based) need to be used if that is a common usage
>scenario.

That's why we are looking at using a transaction db (mird) to provide this 
functionality rather than hack JFFS2 (and or the VFS) to support it.


> > any config or db directly on the fs unreasonable. (if you've been 
> following
> > my jitter tests recently, JFFS2 can block for 10's of seconds when it
> > getting quite full).
>
>Probably possible but that's an implementation problem not a theoretical
>problem. In a "run time" phase (flash is almost all dirty, space exist and
>writes are coming in) there should never need to be more latency that what
>it takes to GC the same amount of space as you want to write.

When the rubber meets the road, implementation problems and theoretical 
problems are indistinguishable :)
The reality is that JFFS2 can block for 10's of seconds on a reasonable 
powerful processor (a 133MHz 486).

Tweaking may get that down to a few seconds, but unless there is a design 
or implementation bug in JFFS2, there will always be some processing 
required to GC when there is no more ready free space on the flash. At this 
time a task updating variables on the FS will block. The question is: How 
long a block is acceptable? IMHO, anything more than a few hundred ms will 
be unacceptable to a reasonable percentage of embedded applications. I know 
it is unacceptable for my application. I generate data updates 5 times a 
seconds and I want that data stored reliability on the flash fs, as well 
not be blocked for more than 200ms.


>One alternative is a completely user-mode flash DB. Have a deamon which
>have access to a raw flash device and implements a transactional database
>on that device. No need for a kernel system really..

The biggest problem with this is the one has to reinvent all the major 
flash interface features of JFFS2. Not a elegant solution IMHO.


> > caching layer that will allow the transaction log to be put on *another*
> > non-volatile medium if such is available in your system. The big advantage
>
>Why would this be necessary ?

To provide for 0 latency writes for tasks updating data values, when the 
underlying fs is blocked and cannot accept any more writes for another 
"few" (at the moment >40) seconds.

Vipin
