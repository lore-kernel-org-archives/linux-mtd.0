Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N2RdQ-0006aG-6q
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 15:37:33 +0000
Date: Mon, 26 Oct 2009 16:37:19 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: "Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com>
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091026163719.4ab82a4e@marrow.netinsight.se>
In-Reply-To: <1256570007.5822.58.camel@atal-desktop>
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
	<20091026084158.0644ea85@marrow.netinsight.se>
	<1256553393.5822.24.camel@atal-desktop>
	<20091026125316.0283e322@marrow.netinsight.se>
	<1256570007.5822.58.camel@atal-desktop>
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

On Mon, 26 Oct 2009 17:13:27 +0200
"Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com> wrote:

> How about adding KMSG_DUMP_LAST_OOPS_BEFORE_PANIC or something to the
> kmsg_dump_reason enum, and making the kmsg_dump look like
> kmsg_dump(panic_on_oops ? KMSG_DUMP_LAST_OOPS_BEFORE_PANIC : KMSG_DUMP_OOPS);
> in oops_exit. Then let the dumpers decide what they want to do about it.
> Just a thought.

It would also have to take in_interrupt() in account since that will
also lead to a panic.

> And since you have no objections about moving notifiers up, it looks
> like the second issue will be resolved, I believe Artem
> will take care of it. :)

Well, I have no objections to it, but I also know very little of the
reasoning to put it there in the first place, so don't count my vote
for very much here :-)

// Simon
