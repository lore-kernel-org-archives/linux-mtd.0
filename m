Received: from mailout02.sul.t-online.com ([194.25.134.17] helo=mailout02.sul.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ffcr-0008KS-00
	for <linux-mtd@lists.infradead.org>; Sat, 08 Sep 2001 11:46:13 +0100
Received: from gmx.de (lisa.simpson.priv [192.168.2.131])
	by lisa.simpson.priv (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id f88AqA117797
	for <linux-mtd@lists.infradead.org>; Sat, 8 Sep 2001 12:52:11 +0200
Message-ID: <3B99F85A.274309F0@gmx.de>
Date: Sat, 08 Sep 2001 12:52:10 +0200
From: Thomas Eschenbacher <Thomas.Eschenbacher@gmx.de>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: Re: MTD in kernel 2.4.9
References: <14713.999728477@redhat.com> <20010906092901.A20085@kosh.hut.fi>
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

Jarkko Lavinen wrote:
> [...]
> The complete_and_exit() problem I experienced was fixed in the 2.4.9 AC
> kernel by adding the wait queue head initialization just before forking the
> GC thread in jffs2_start_garbage_collect_thread(). That fixed the crashing
> GC thread problem in unmount.
> 
> I haven't tried copying mtd CVS files over Linus kernels but on current
> AC kernels straight copying won't work. At least it will complain about
> missing up_and_exit().

It seems that Alan has fixed that in his patch-2.4.9-ac9.gz. JFFS2 now
compiles without complaining and even the entries in Configure.in and
the Makefile are present!

Thomas.
