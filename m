Received: from [212.17.98.56] (helo=hofr.at)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0xbI-0001TB-2l
	for linux-mtd@lists.infradead.org; Wed, 10 Mar 2004 06:53:56 +0000
From: Der Herr Hofrat <der.herr@hofr.at>
Message-Id: <200403100651.i2A6pN531062@hofr.at>
In-Reply-To: <Pine.LNX.4.10.10403092009150.21570-100000@mail.hurricane.at>
	from Matthias Gorjup at "Mar 9, 2004 08:14:15 pm"
To: Matthias Gorjup <mgorjup@norik.com>
Date: Wed, 10 Mar 2004 07:51:23 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Writing 4k blocks to flashB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hello,
> 
> we are trying to optimize the speed of writing large files to flash
> (Fujitsu MBM29LV650, 8 MB, 16bit). After using strace to see how long and
> how often system calls are being performed, we have found out that writing
> to flash is being done in 4kB large blocks and that each write
> takes between 0.15 and 0.3 sec. Can we optimize this figures? Would it
> make sense to modify mtd to write larger blocks to flash? Which files do
> we need to change for this modification?
>
check how much time the copy is actually spending in system and how much in 
user (time cp ... a few times should bive you a resonable average) - the 
large variance may also be due to the strace overhead (which is significant - 
your running with PTRACE set).  - it might be that you actually
have a slow flash - the numbers don't tell you what the overhead
of multiple invokations actually are.

the actual invocation times of the system call is most likely 
not the bottle neck. I would guess that the 4k make sense as thats 
alligned with the memory organisation (PAGESIZE). Did you do any comparison
with a ramdisk copy to see if its not the filesystem+flash-device that is
causing the delays ?

hofrat
