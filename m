Date: Mon, 12 Oct 2009 11:09:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-Id: <20091012110954.67d7d8d8.akpm@linux-foundation.org>
In-Reply-To: <alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
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
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Ingo Molnar <mingo@elte.hu>, David Woodhouse <dwmw2@infradead.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Oct 2009 08:36:38 -0700 (PDT) Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I agree with the "save kernel buffer on panic" thing, but I disagree with 
> making it anything new, and hooking into "printk()" or the console 
> subsystem AT ALL. That's just bogus, stupid, and WRONG.
> 
> What you can do is to just flush the 'log_buf' buffer (or as much of it as 
> you want - the buffer may be a megabyte in size, and maybe you only want 
> to flush the last 8kB or something like that) on oops. And _not_ mix this 
> up with anything else.

What he said.  I did it that way in the Digeo kernel back in 2002. 
Worked good.  

Doing it via a console is rather weird.  It will need core kernel
changes to do it properly.

Perhaps oops_enter() is a good place to mark the start of the log, and
flush it within oops_exit().
