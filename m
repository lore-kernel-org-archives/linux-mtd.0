Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Fysv-0001l0-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2001 15:04:38 +0100
Message-ID: <3B3C8D20.CB1B56DD@daniel.com>
Date: Fri, 29 Jun 2001 09:13:52 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Alan Cox <alan@lxorguk.ukuu.org.uk>,
 	jffs-dev <jffs-dev@axis.com>,
 	MTD for Linux <linux-mtd@lists.infradead.org>,
 	elw_dev_list@embeddedlinuxworks.com
Subject: Re: JFFS2 is broken
References: <E15Fu8H-0008JI-00@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Alan Cox wrote:

>
> One thing you can do here is to wake the gc thread and sleep politely on it
>
> > The only solution, that I think will work, is to find a way to block the
> > write() to JFFS2 but allow kernel schedduling to go on. I really don't
> > know
>
> Well there are two things there.
>
> 1.      You could wake the GC and sleep on it  using sleep/wakeup or
>         semaphores
>
> 2.      Profile the kernel and find out where it is tight looping. I can't
>         see any reason for tight loops except for the compression itself
>         so it suggests a code bug.
>
> Finally within the compression loops you can check current->need_resched and
> if it is set call schedule() to allow the compression to switch to other
> tasks at the point it has used its time slice.

If David is already looking at this, maybe I'll wait for a few days before
bumbling through the code myself ;) David? You've been awfully quite!

Vipin
