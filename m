Date: Mon, 12 Oct 2009 11:45:15 -0700 (PDT)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] panic.c: export panic_on_oops
In-Reply-To: <20091012182346.GH17138@elte.hu>
Message-ID: <alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
References: <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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



On Mon, 12 Oct 2009, Ingo Molnar wrote:
> 
> * Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > Perhaps oops_enter() is a good place to mark the start of the log, and 
> > flush it within oops_exit().
> 
> Simplest would be to do the last 2K in oops_exit()? That gives the oops, 
> and the history leading up to it. Since the blocking is 2K, the extra 
> log output is for free.

I agree, except I don't think it should be fixed to 2k.

We should just dump as much as is "appropriate" for the dump device. It 
might be the last 2kB, it might be 8kB, it might be 64kB. We don't know, 
we don't care. The device may have its own per-device limits. Any extra 
data we get from before the oops is just gravy (often there might be 
interestign warning messages leadign up to the dump), and if the oops is 
too big for the dump device, it's not something we can do anything about 
anyway.

So the logic should literally be something like this:

 - kernel/printk.c:

	void dump_kmsg(void)
	{
		unsigned long len = ACCESS_ONCE(log_end);
		struct dump_device *dump;
		const char *s1, *s2;
		unsigned long l1, l2;

		s1 = "";
		l1 = 0;
		s2 = log_buf;
		l2 = len;

		/* Have we rotated around the circular buffer? */
		if (len > log_buf_len) {
			unsigned long pos = (len & LOG_BUF_MASK);

			s1 = log_buf + pos;
			l1 = log_buf_len - pos;

			s2 = log_buf;
			l2 = pos;
		}

		list_for_each_entry (dump, dump_list, list) {
			dump->fn(s1, l1, s2, l2);
		}
	}

ie we just always give the whole buffer (as two "sections", since it's a 
circular buffer) to the dumper, and then the dumper can decide how much of 
those buffers it is able to dump sanely.

If the dumper has some hardware limitation where it can only dump a single 
aligned block, it can decide to just look at <s2,l2> which is the "latter" 
part of the dump. It's usually going to be fine, and it should be 
page-aligned (and you can even round up the size to a page, since the 
worst that can happen is that you'll see some old printk output at the 
end)

Look ma, no locking, no buffer allocations, no nothing.

			Linus
