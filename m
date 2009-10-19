Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mzriv-0005zD-My
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 12:52:33 +0000
Date: Mon, 19 Oct 2009 14:50:17 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091019125017.GA9030@elte.hu>
References: <20091015093133.GF10546@elte.hu>
	<20091015161052.0752208e@marrow.netinsight.se>
	<20091015154640.GA11408@elte.hu>
	<20091016094601.4e2c2d3e@marrow.netinsight.se>
	<20091016080935.GA3895@elte.hu>
	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
	<20091016101045.GA3263@elte.hu>
	<20091016140918.3981cfa2@marrow.netinsight.se>
	<1255952922.32489.505.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255952922.32489.505.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
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


* Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2009-10-16 at 14:09 +0200, Simon Kagstrom wrote:
> > The core functionality is implemented as per Linus suggestion from
> > 
> >   http://lists.infradead.org/pipermail/linux-mtd/2009-October/027620.html
> > 
> > (with the kmsg_dump implementation by Linus). A struct kmsg_dumper has
> > been added which contains a callback to dump the kernel log buffers on
> > crashes. The kmsg_dump function gets called from oops_exit() and panic()
> > and invokes this callbacks with the crash reason.
> > 
> > Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> > Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> > Reviewed-by: Ingo Molnar <mingo@elte.hu>
> > ---
> > The bikeshed paint is drying:
> > 
> > ChangeLog:
> > 	* (Ingo Molnar): Flatten lock use
> > 	* (Artem, Aaro): Fix style issues
> > 
> >  include/linux/kmsg_dump.h |   44 ++++++++++++++++++
> >  kernel/panic.c            |    3 +
> >  kernel/printk.c           |  112 +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 159 insertions(+), 0 deletions(-)
> >  create mode 100644 include/linux/kmsg_dump.h
> 
> I wonder, via which tree this should go in. We are going to have mtdoops
> depend on this. Should we go one of these ways:
> 
>    * this patch goes to one of Ingo's tip trees, so we can pull it and
>      work on top.
>    * we have Ingo's / Linus' acks, and this goes via the MTD tree.
> ?

Either way is good to me. Linus, do you have any preferences?

	Ingo
