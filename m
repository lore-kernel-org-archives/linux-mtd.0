Received: from moutng.kundenserver.de ([212.227.126.177])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlRgy-0005WB-HF
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 11:47:40 +0000
Date: Tue, 27 Jan 2004 12:47:34 +0100 (MET)
From: Armin <armin@melware.de>
Sender: <armin@melware.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1075203149.1633.43.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.31.0401271245140.5630-100000@phoenix.one.melware.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jan 2004, David Woodhouse wrote:
> On Mon, 2004-01-26 at 15:26 +0100, Armin Schindler wrote:
> > I thought, that such errors will be fixed, but every time I mount the partition,
> > these errors still exist.
>
> They'll persist until the garbage collection erases the block in
> question. That'll happen naturally in time, although I suppose we
> probably ought to prioritise it so the blocks we complain about are GC'd
> sooner.
>
> It's harmless. I prefer to err on the side of verbosity than to miss
> reporting things which really _could_ be a problem.

Okay, that makes sense.

What is the time the garbage collection starts or finished this?
I waited some time (about 10 minutes) and the messages still occured after
remount.

Armin
