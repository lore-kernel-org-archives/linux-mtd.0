Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15GmXQ-0005ku-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Jul 2001 20:05:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E15Fu8H-0008JI-00@the-village.bc.nu> 
References: <E15Fu8H-0008JI-00@the-village.bc.nu> 
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: vipin.malik@daniel.com (Vipin Malik), jffs-dev@axis.com (jffs-dev),
    linux-mtd@lists.infradead.org (MTD for Linux),
    elw_dev_list@embeddedlinuxworks.com
Subject: Re: JFFS2 is broken 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 01 Jul 2001 20:10:48 +0100
Message-ID: <5174.994014648@redhat.com>
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

alan@lxorguk.ukuu.org.uk said:
> Well there are two things there.
> 1.	You could wake the GC and sleep on it  using sleep/wakeup or
> 	semaphores

I've tried to keep the GC thread optional. That's not set in stone - but we 
ought to be able to fix this - there's no real reason why the GC in the 
write() path should behave like this.

Thinks... is the BKL still held in write()? Should we be releasing it?

> 2.	Profile the kernel and find out where it is tight looping. I can't
> 	see any reason for tight loops except for the compression itself
> 	so it suggests a code bug.

AFAIR the compression routines aren't turning up on the profiles. But then 
we're getting 71 timer ticks in a 30-second period, according to the 
profiles I saw.

> Finally within the compression loops you can check current->
> need_resched and if it is set call schedule() to allow the compression
> to switch to other tasks at the point it has used its time slice. 

We already do this between each node we move, in the garbage collection
loop. Doing it inside the compression loops would be possible - although
it'd confuse mkfs.jffs2, which just imports those files directly too.

Better still to avoid decompressing and recompressing data when we move 
nodes intact.

I'll poke at this on Monday. 

--
dwmw2
