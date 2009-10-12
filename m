Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxMbg-0003se-8h
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 15:14:44 +0000
Date: Mon, 12 Oct 2009 17:14:31 +0200
From: Ingo Molnar <mingo@elte.hu>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012151431.GC14004@elte.hu>
References: <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
	<20091012123210.GB22766@elte.hu>
	<20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
	<20091012132503.GD25464@elte.hu>
	<1255354342.30919.17.camel@macbook.infradead.org>
	<20091012142634.GB4565@elte.hu>
	<1255358181.9111.14.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255358181.9111.14.camel@macbook.infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2009-10-12 at 16:26 +0200, Ingo Molnar wrote:

> > Not if the failure is say a s2ram hang that requires a power cycle. 
> > Also there are certain classes of bugs that only occur on cold boot. 
> > Plus there's the "need to unplug the battery to revive the system" 
> > class of bugs (but they are rare).
> 
> So you need to build in enough ECC to cope with the decay which 
> happens when RAM isn't being refreshed for a few seconds... :)

[ hey, i think you should line up with BIOS writers at that wall ;-) ]

> > So i think the MTD / flash stuff is powerful.
> 
> Yeah, definitely. I was just pointing out that we can actually do a 
> lot better on today's commodity hardware too.

I wish it worked on any of the 10+ x86 systems i have. Is there anyone 
who'd be interested in exploring whether warm BIOS reboots work 
_anywhere_?

A simple patch with a new (default-off) CONFIG_DEBUG_ feature that just 
puts a signature into a predictable spot in RAM, switches the reboot 
method over to warm reboot (reboot=w) and prints some friendly "yay, 
this BIOS rocks!" message if the signature is still there after a reboot 
and not zeroed out.

If that works _anywhere_ we could complete it: we could cache the dmesg 
buffer address (__log_buf[]) across reboots (and maybe the printk tail 
offset (log_end)), and that would be an _excellent_ debuggability 
feature for a large class of otherwise undebuggable crashes ...

We could use that to preserve a kernel function trace (or a branch 
execution hardware trace using BTS on Intel CPUs) across crashes, etc. 
etc.

	Ingo
