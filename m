Date: Mon, 12 Oct 2009 10:46:27 -0700 (PDT)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] panic.c: export panic_on_oops
In-Reply-To: <alpine.LFD.2.01.0910121036330.3438@localhost.localdomain>
Message-ID: <alpine.LFD.2.01.0910121044331.3438@localhost.localdomain>
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
	<alpine.LFD.2.01.0910120837030.3438@localhost.localdomain>
	<1255368557.27022.226.camel@localhost>
	<alpine.LFD.2.01.0910121036330.3438@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Ingo Molnar <mingo@elte.hu>, David Woodhouse <dwmw2@infradead.org>,
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
> Once you do the final flush in a controlled place _after_ you've printed 
> out all the oops information, you simply don't care about locks any more. 
> Because if you were holding critical locks, you're done anyway.
> 
> Sure, maybe you want to do a "trylock()" and skip the oops flush entirely 
> in the mtd layer if you can't do it, but it's the "let's use a workqueue" 
> or something that doesn't seem to make a lot of sense to me.

Side note: I don't actually care deeply. Once it's all inside some driver, 
and once it's not messing up the console layer, I don't think the small 
details matter all that much. I just think it's likely to be a sign of 
something wrong if you need to use workqueues to flush - it probably means 
that the most interesting oopses will never make it to the mtd device in 
the first place.

			Linus
