Received: from taku.hut.fi ([130.233.228.87])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15evNU-0004QU-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 10:23:16 +0100
Received: from kosh.hut.fi (kosh.hut.fi [130.233.228.10])
	by taku.hut.fi (8.9.3/8.9.3) with ESMTP id MAA19681
	for <linux-mtd@lists.infradead.org>; Thu, 6 Sep 2001 12:29:18 +0300 (EET DST)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id MAA10500
	for linux-mtd@lists.infradead.org; Thu, 6 Sep 2001 12:29:18 +0300 (EET DST)
Date: Thu, 6 Sep 2001 09:29:02 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD in kernel 2.4.9
Message-ID: <20010906092901.A20085@kosh.hut.fi>
References: <14713.999728477@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <14713.999728477@redhat.com>; from dwmw2@infradead.org on Wed, Sep 05, 2001 at 11:21:17PM +0100
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

>> of mtd/jffs2 working with kernel 2.4.9?
> 
> It generally ought to work, although I'm not building JFFS2 against
> 2.4.9 so I haven't merged the complete_and_exit() fix yet. Other than that, 

The complete_and_exit() problem I experienced was fixed in the 2.4.9 AC 
kernel by adding the wait queue head initialization just before forking the 
GC thread in jffs2_start_garbage_collect_thread(). That fixed the crashing
GC thread problem in unmount.

I haven't tried copying mtd CVS files over Linus kernels but on current
AC kernels straight copying won't work. At least it will complain about
missing up_and_exit().

Jarkko Lavinen
