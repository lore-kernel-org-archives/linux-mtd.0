Received: from router-100m.swansea.linux.org.uk ([194.168.151.17] helo=the-village.bc.nu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Fu4j-0001UT-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2001 09:56:32 +0100
Subject: Re: JFFS2 is broken
To: vipin.malik@daniel.com (Vipin Malik)
Date: Fri, 29 Jun 2001 10:00:09 +0100 (BST)
Cc: dwmw2@infradead.org (David Woodhouse), jffs-dev@axis.com (jffs-dev),
	linux-mtd@lists.infradead.org (MTD for Linux),
	elw_dev_list@embeddedlinuxworks.com
In-Reply-To: <3B3BC857.7FB81774@daniel.com> from "Vipin Malik" at Jun 28, 2001 07:14:15 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E15Fu8H-0008JI-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> The problem is that JFFS2 tries to be a good guy and tries its hand at
> GC'ing dirty flash, _from within a write() system call_

That in itself is probably fine, write should only hold the inode lock
for that file

> Unfortunately, there is a problem with this approach. If write() cannot
> find space and now we refuse to GC inside the write and return with
> -ENOSPC, a lot of stock programs may break. I am returning -ENSPC
> because I just didn't take the time to figure out how to return 0, which

One thing you can do here is to wake the gc thread and sleep politely on it

> The only solution, that I think will work, is to find a way to block the
> write() to JFFS2 but allow kernel schedduling to go on. I really don't
> know

Well there are two things there.

1.	You could wake the GC and sleep on it  using sleep/wakeup or
	semaphores

2.	Profile the kernel and find out where it is tight looping. I can't
	see any reason for tight loops except for the compression itself
	so it suggests a code bug.

Finally within the compression loops you can check current->need_resched and
if it is set call schedule() to allow the compression to switch to other
tasks at the point it has used its time slice.

Alan
