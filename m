Received: from smtp.lynuxworks.com ([207.21.185.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AunI-00085o-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 15:14:09 +0000
Date: Mon, 3 Dec 2001 07:24:40 -0800 (PST)
From: Aleksander Sanochkin <asanochkin@Lnxw.COM>
To: <linux-mtd@lists.infradead.org>
cc: <jffs-dev@axis.com>
Subject: Re: cfi_cmdset_001.c problem
Message-ID: <Pine.LNX.4.33.0112030715100.14716-100000@newbast.lynuxworks.com>
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

> > I see that after write and erase operations, the current version of
> > cfi_cmdset_0001.c driver can left a Flash device not in the READY
> > state. If soft reboot is performed in such a situation, applications
> > that use flash will behave erroneously since they expect that the
> > flash is in the READY state. For instance, if the system is supposed
> > to boot from flash, it will hang.
>
> Thanks for this. One thing that concerns me is that I have a vague
> recollection that Nico once drastically improved the performance of the
> same driver by ripping out all the gratuitous state changes.

I seem to remember this, too. But it was in the read() routine. It used to
switch flash to the status mode and then back to ready even if it had been
ready right away. Our modification affects only write and erase routines.

> I wonder if it would be better to do this with a reboot notifier
> than by changing back to read mode after every other operation?

Probably you are right. The thing is that our modification was originally
made in the context of 2.2.x kernel, which didn't have any reboot
notifiers.

> Also, we need to make sure we do the right thing if the JFFS or JFFS2 GC
> thread is actually in the process of writing to the flash while
> machine_restart() happens on another CPU.

In this case, our patch won't help. A reboot notifier probably would.
