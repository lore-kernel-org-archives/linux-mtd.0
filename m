Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QOZN-00029O-Ql
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 10:40:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3EE8497F.30402@imc-berlin.de>
References: <3EE752EE.8090902@imc-berlin.de>
	 <1055347637.2097.240.camel@passion.cambridge.redhat.com>
	 <3EE84317.1090307@imc-berlin.de>
	 <1055409538.2097.438.camel@passion.cambridge.redhat.com>
	 <3EE8497F.30402@imc-berlin.de>
Message-Id: <1055410866.2097.449.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 12 Jun 2003 10:41:07 +0100
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

On Thu, 2003-06-12 at 10:35, Steven Scholz wrote:

> But the impact on system performance done by kupdated is not as 
> critical as the one that's done by the GC intself, is it?

Assuming your flash supports erase-suspend, no. Certainly it doesn't eat
lots of CPU time like GC can.

> >>I suppose that a few more sectors will be examened and written... 
> >>(10ms, 100ms, 1000ms ...???)

> > 'sector'?  Read http://sources.redhat.com/jffs2/jffs2.pdf
> I meant flash sectors.

Whole erase blocks? God no, we GC one data (or dirent or whatever) node
at a time, which is never going to be larger than about 4KiB.

-- 
dwmw2
