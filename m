Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxK8m-00014I-3L
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 12:36:44 +0000
Date: Mon, 12 Oct 2009 14:36:30 +0200
From: Ingo Molnar <mingo@elte.hu>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012123630.GA23285@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
	<1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<1255350798.10605.19.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255350798.10605.19.camel@macbook.infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2009-10-12 at 14:20 +0200, Ingo Molnar wrote:
> > * David Woodhouse <dwmw2@infradead.org> wrote:
> > 
> > > On Mon, 2009-10-12 at 14:09 +0200, Ingo Molnar wrote:
> > > > Also, would it be possible to just simplify the thing and not do any 
> > > > buffering at all? Extra buffering complexity in a console driver is only 
> > > > asking for trouble. Or is flash storage write cycles optimization that 
> > > > important in this case?
> > > 
> > > That and the fact that on NAND flash you have to write full pages at a 
> > > time -- that's 512 bytes, 2KiB or 4KiB depending on the type of chip. 
> > > So we really do want to buffer it where we can.
> > > 
> > > We don't want to write a 2KiB page for every line of printk output.
> > 
> > Then i think the buffering is at the wrong place: we should instead 
> > buffer in the generic layer and pass it to lowlevel if we know that we 
> > have gone past a 2K boundary.
> > 
> > The size of the generic log buffer is always a power of two so detecting 
> > 2K boundaries is very easy. On any emergency the generic console layer 
> > will do faster flushes - this is nothing the console driver itself 
> > should bother with.
> > 
> > And that would avoid the whole workqueue logic - which is fragile to be 
> > done in a printk to begin with.
> > 
> > So what we need is an extension to struct console that sets a buffering 
> > limit. Zero (the default) means unbuffered.
> > 
> > (Btw., things like netconsole might make use of such buffering too.)
> > 
> > Agreed?
> 
> Makes some sense, yes.
> 
> We also use the workqueue logic to allow us to co-ordinate access to 
> the hardware properly -- taking locks where appropriate, etc. We can't 
> do that directly from a console ->write() method.
> 
> Some device drivers do provide a ->panic_write() function which breaks 
> all the locks and just resets the hardware because it knows we're 
> panicking, but we don't want to do that in the common case.

Well other than not using sleeping locks in that codepath it should be 
properly serializable. If the serial driver, netconsole, fbcon and all 
the other non-trivial console drivers can do it then MTD should be able 
to do it too.

Printk via workqueue ... lets not go there, really. (I know you already 
have that but i think it's a mistake on a fundamental level.)

	Ingo
