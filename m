Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HP09N-0008QH-WC
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 12:42:08 -0500
Subject: RE: JFFS2 Support for Large Flash Designs
From: Thomas Gleixner <tglx@linutronix.de>
To: ian@brightstareng.com
In-Reply-To: <200703071223.07485.ian@brightstareng.com>
References: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
	<200703071223.07485.ian@brightstareng.com>
Content-Type: text/plain
Date: Wed, 07 Mar 2007 18:48:07 +0100
Message-Id: <1173289687.24738.654.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-07 at 12:23 -0500, ian@brightstareng.com wrote:
> Some random programs I build that know about the kernel 
> internals: busybox, e2fsprogs, genext2fs, Glibc, net-tools, 
> pthreads, uClibc, util-linux, wireless_tools the list goes on, 
> with plenty of drivers/modules too.

There is an important difference between userland tools which have
kernel knowledge and drivers:

The user space interface is _STABLE_ - the kernel interfaces are _NOT_

That's the reason why out of tree drivers, filesystems ... are often out
of sync and contain more #ifdefs than code to cope with the dozens of
kernel versions.

SoC devices out of tree are a seperate steaming pile of ... I have seen
too many chip vendor kernels explode when you just try to do anything
else than run "hello world" on them.

I share Joerns distrust fully.

	tglx
