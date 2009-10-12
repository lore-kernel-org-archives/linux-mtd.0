Received: from mx2.mail.elte.hu ([157.181.151.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxK4d-0008Jo-8U
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 12:32:27 +0000
Date: Mon, 12 Oct 2009 14:32:10 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012123210.GB22766@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
	<1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091012142714.56362465@marrow.netinsight.se>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:

> > Yes, that looks like the better direction - but 'panic' is still the 
> > wrong trigger condition i think. We generally just crash and dont 
> > panic. Often we'll display a kernel warning and then hang. Etc.
> 
> But how can we detect that? The code above will write to the MTD 
> device either if an oops happens, or if we panic for some reason. If 
> the kernel just hangs (and is reset by the watchdog, if we have one), 
> how should we know when to write the log out?

You shouldnt need to care about that in a console driver - it's up to 
higher layers.

See my reply to David Woodhouse, i think we should add support for 
buffering in kernel/printk.c and that would both fix your problems, 
would simplify the driver (significantly!) and would expose the generic 
buffering capability to other console drivers as well.

	Ingo
