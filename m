Date: Mon, 12 Oct 2009 08:44:30 -0700 (PDT)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH] panic.c: export panic_on_oops
In-Reply-To: <alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
Message-ID: <alpine.LFD.2.01.0910120837030.3438@localhost.localdomain>
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



On Mon, 12 Oct 2009, Linus Torvalds wrote:
> 
> Don't. kfifo's aren't going to help. You're doing this at all the wrong 
> levels ENTIRELY, and we already have the buffer you want to flush.

Btw, a few simple rules:

 - if you need to make your device look like a "console device" for 
   dumping at oops time, you're doing things wrong. You don't want line 
   buffered output to begin with, and you don't want to see each line, you 
   only want this at exceptional points.

 - if you need to look at "in_interrupt()" or "panic_on_oops", you're 
   doing things wrong.

 - if you add your own buffers, you're doing things wrong. I have 
   CONFIG_LOG_BUF_SHIFT=18 in my kernel, so I've already got 256kB worth 
   of memory allocated for kernel messages. Sometimes I increase that 
   further, just because I do some silly printk debugging.

IOW, just add a very simple "flush the dmesg buffer on oops" callback to 
the end of the oops printout code (just a single call after the oops thing 
is now known to be in the dmesg buffers!)

It's not just oopses, btw. Maybe people would like to do this as the last 
stage of a reboot/shutdown too. Because some of the final printouts from 
the shutdown will never make it to disk, because 'ksyslogd' has been 
killed, and the root filesystem has been turned read-only.

			Linus
