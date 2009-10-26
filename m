Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N2KDR-0004I7-Sn
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 07:42:14 +0000
Date: Mon, 26 Oct 2009 08:41:58 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: "Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com>
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091026084158.0644ea85@marrow.netinsight.se>
In-Reply-To: <1256313202.5824.60.camel@atal-desktop>
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
	<20091019125017.GA9030@elte.hu>
	<alpine.LFD.2.00.0910220832580.9771@eeepc.linux-foundation.org>
	<20091022082500.602f9a7d@marrow.netinsight.se>
	<1256313202.5824.60.camel@atal-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Oct 2009 18:53:22 +0300
"Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com> wrote:

> 1. If somebody writes a module that uses dumper for uploading the
> oopses/panics logs via some pay-per-byte medium,  since he has no way
> to know in a module if the panic_on_oops flag is set, he'll have
> to upload both oops and the following panic, because he does not
> know for sure that the panic was caused by the oops. Hence he
> pays twice for the same information, right?
> 
> I can think of a couple of way to figure it out in the module
> itself, but I could not think of any clean way to do it.

This is correct, and the mtdoops driver has some provisions to handle
this. First, there is a parameter to the module to specify whether
oopses should be dumped at all - I added this for the particular case
that someone has panic_on_oops set.

Second, it does not dump oopses directly anyway, but puts it in a work
queue. That way, if panic_on_oops is set, it will store the panic but
the oops (called from the workqueue) will not get written anyway.

> 2. We tried to use panic notifiers mechanism to print additional
> information that we want to see in mtdoops logs and it worked well,
> but having the kmsg_dump(KMSG_DUMP_PANIC) before the
> atomic_notifier_call_chain() breaks this functionality.
> Can we the call kmsg_dump() after the notifiers had been invoked?

Well, it depends I think. The code currently looks like this:

	kmsg_dump(KMSG_DUMP_PANIC);
	/*
	 * If we have crashed and we have a crash kernel loaded let it handle
	 * everything else.
	 * Do we want to call this before we try to display a message?
	 */
	crash_kexec(NULL);
	[... Comments removed]
	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);

And moving kdump_msg() after crash_kexec() will make us miss the
message if we have a kexec crash kernel as well. I realise that these
two approaches might be complementary and are not likely to be used at
the same time, but it's still something to think about.

Then again, maybe it's possible to move the panic notifiers above
crash_kexec() as well, which would solve things nicely.

// Simon
