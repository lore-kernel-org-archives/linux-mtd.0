Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QODz-0001ia-Fx
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 10:18:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3EE84317.1090307@imc-berlin.de>
References: <3EE752EE.8090902@imc-berlin.de>
	 <1055347637.2097.240.camel@passion.cambridge.redhat.com>
	 <3EE84317.1090307@imc-berlin.de>
Message-Id: <1055409538.2097.438.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 12 Jun 2003 10:18:58 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Stopping the GC thread?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-12 at 10:08, Steven Scholz wrote:
> 1.) What happens if I send multiple SIGSTOPs or SIGCONTs to the 
> thread? Does she handle (i.e. ignore) that properly?

Should do.

> 2.) What happnens when I send a SIGSTOP in the middle of a running GC?
> Will it stop immediately? Or will it take a while?

It'll finish copying the node it's _currently_ garbage-collecting, which
may involve decompressing up to a page of data, recompressing it and
writing it out elsewhere. It may also need to wait for erases to
complete.

Even after it's stopped, if there are erasable blocks on the queue,
they'll continue to be erased in the background by kupdated. You cannot
prevent that.

> I suppose that a few more sectors will be examened and written... 
> (10ms, 100ms, 1000ms ...???)

'sector'?  Read http://sources.redhat.com/jffs2/jffs2.pdf 

> Will it then just continue after a SIGCONT? Or will start all over again?

It'll just continue.

-- 
dwmw2
