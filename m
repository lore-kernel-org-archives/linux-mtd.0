Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQTiy-0008O0-Kh
	for linux-mtd@lists.infradead.org; Sat, 06 Nov 2004 11:47:38 -0500
Date: Sat, 6 Nov 2004 11:47:33 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Dan Post <postster@gmail.com>
In-Reply-To: <9f920bdf04110522596551a0a4@mail.gmail.com>
Message-ID: <Pine.LNX.4.61.0411061031070.5250@xanadu.home>
References: <Pine.LNX.4.61.0411052041230.5250@xanadu.home>
	<9f920bdf04110522596551a0a4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD and XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 Nov 2004, Dan Post wrote:

> On Fri, 5 Nov 2004 21:08:35 -0500 (EST), Nicolas Pitre <nico@cam.org> wrote:
> > Just to let you all know that I committed to CVS my work on making MTD
> > deal with flash used for XIP purpose.  At the moment it only supports
> > Intel compatible flash on a SA11x0 or PXA2xx based system, but it should
> > be easy to extend to other configurations as well.
> 
> Nicolas,
> This is very cool.  I scanned through the code briefly, and will take
> a look at it first chance I get next week (OK, it might be a little
> later; I am pretty swamped).  I had hoped to get to doing this sort of
> thing in the next few months (i.e. doing XIP support *right* and on a
> *relevant* kernel), so I was glad to see your work.  

Heh, I meant to do that work for a year or two, or more precisely since 
dwmw2 posted his first implementation.

> It looks very
> clean, but I haven't run a fine-tooth comb through it.
> However, the automated post to the CVS list reported:
> ***** Error reading new file: [Errno 2] No such file or directory: 'xip.h'

Dunno what that means -- the file does exist in the repository.

> Do you have a specific reason to always disable write suspend on XIP
> kernels?  That's a pretty big latency hit, and I don't think we need
> to disable it for XIP systems.
> I saw your comment that "the XIP system config appears to have
> problems using write suspend at the moment".  Any specifics?

It was causing me jffs2 corruption problems and I couldn't figure out 
why.  So after two days of bug chasing I gave up and disabled write 
suspend, blaming the hardware.  I measured the IRQ latency hit to be in 
the 400 usec range in that case.

If you want to have a look please be my guest. To reproduce the problem, 
simply comment out the clearing of the write suspend bit and do:

	eraseall /dev/mtd2
	mount -t jffs2 /dev/mtdblock2 /mnt
	cd /mnt
	tar -cvf test.tar /sbin
	tar -xvf test.tar

This was enough for jffs2 to complain about node totlen mismatch errors 
and occasional CRC errors.  When disabling write suspend all those 
problems went away.  And you don't need to have a previous erase suspend 
for the problem to occur -- in fact the generic code doesn't suspend a 
write on interleaved chips if there is a suspended erase already for 
code simplicity (it would require selective write resume depending on 
the suspended state bit but I didn't implement it yet).

> I suppose one of these days I'll have to get around to doing empirical
> measurements on the effect write suspend on busy systems has to write
> throughput.  I seem to remember someone else, perhaps David, did that
> a while back.

It should be inversely proportional to the number of running tasks in 
the system since writes only happen in the writing task's time slice.  
The amount of Peripheral interrupts will also bring the write throughput 
down as well of course.

> What kind of changes does this require to the map file? 

None (for now).

> This does interrupt-pollihg (software-read-while-write, SW/RWW) all 
> the time. (Right?)

Right.

> I think we can add intelligence to the map file, and set a
> bit for each hardware partition that has XIP code in it (e.g. kernel,
> linear^XIP CRAMFS, ...), so, for instance, we don't constantly suspend
> writes / erases to partitions that don't ever have XIP code in them
> just because an interrupt happens in the system.  A la my old kludgy
> version for 2.4.

Indeed.  That's in the TODO comment in xip_disable() already.


Nicolas
