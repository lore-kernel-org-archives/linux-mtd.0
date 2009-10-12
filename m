Date: Mon, 12 Oct 2009 08:36:38 -0700 (PDT)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH] panic.c: export panic_on_oops
In-Reply-To: <20091012153937.0dcd73e5@marrow.netinsight.se>
Message-ID: <alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
	<1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, Ingo Molnar <mingo@elte.hu>,
	David Woodhouse <dwmw2@infradead.org>,
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



On Mon, 12 Oct 2009, Simon Kagstrom wrote:
> 
> Well, this is what my patch [1] aims to fix. What it does is to put all
> messages in a circular buffer, and when an oops or panic occurs it
> writes them out.

Umm. That's wrong. We already _have_ the circular buffer.

It's called 'log_buf'.

I agree with the "save kernel buffer on panic" thing, but I disagree with 
making it anything new, and hooking into "printk()" or the console 
subsystem AT ALL. That's just bogus, stupid, and WRONG.

What you can do is to just flush the 'log_buf' buffer (or as much of it as 
you want - the buffer may be a megabyte in size, and maybe you only want 
to flush the last 8kB or something like that) on oops. And _not_ mix this 
up with anything else. It's a really simple circular buffer, which just 
has

 - log_buf: buffer start
 - log_end: number of characters ever seen
 - log_buf_len: size of buffer (guaranteed to be a power-of-2)

so it's literally as easy as looking at those three values (there's a few 
more that you _can_ look at, but they'd not likely be relevant for a 
"panic_on_oops" thing)

> The current version only collects messages _during_ an
> oops. I'll rework it with using kfifo as per Alans suggestion though.

Don't. kfifo's aren't going to help. You're doing this at all the wrong 
levels ENTIRELY, and we already have the buffer you want to flush.

			Linus
