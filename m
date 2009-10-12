Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxQMO-0004Zc-67
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 19:15:13 +0000
Date: Mon, 12 Oct 2009 21:14:53 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012191453.GK17138@elte.hu>
References: <20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> 
> 
> On Mon, 12 Oct 2009, Ingo Molnar wrote:
> > 
> > * Andrew Morton <akpm@linux-foundation.org> wrote:
> > > 
> > > Perhaps oops_enter() is a good place to mark the start of the log, and 
> > > flush it within oops_exit().
> > 
> > Simplest would be to do the last 2K in oops_exit()? That gives the 
> > oops, and the history leading up to it. Since the blocking is 2K, 
> > the extra log output is for free.
> 
> I agree, except I don't think it should be fixed to 2k.

Yeah - i cited 2K only because that is what mtdoops uses.

>       	void dump_kmsg(void)
> [...]
>
> Look ma, no locking, no buffer allocations, no nothing.

Neat ...

This could also be used for a warm-reboot preserve-memory thing as well. 
A well-known 4K (or so) area to preserve and print out during the next 
bootup after a crash. dump_kmsg() could copy the kernel's last will out 
to that area, or so.

That would be cross-kernel compatible and the newly booted kernel image 
wouldnt overwrite this area. (which it does currently via its 
__log_buf[])

	Ingo
