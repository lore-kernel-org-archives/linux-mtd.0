Received: from ash.lnxi.com ([207.88.130.242] helo=ash.altatech.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B1Sj-00082M-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 23:25:54 +0000
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: "Wolfgang Denk" <wd@denx.de>,  "Marc Singer" <elf@buici.com>,
	  <linux-mtd@lists.infradead.org>
Subject: Re: crc32() optimization
References: <20021110224142.2F39310162@denx.denx.de>
	<002b01c2890c$f2c058e0$0200a8c0@telia.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 10 Nov 2002 16:56:30 -0700
In-Reply-To: <002b01c2890c$f2c058e0$0200a8c0@telia.com>
Message-ID: <m3k7jl0yj5.fsf@maxwell.default.domain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

"Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se> writes:

> > In message <001301c28909$743f1f40$0200a8c0@telia.com> you wrote:
> > > I could not wait until tomorrow, so I did it now instead.
> > > The result was worse. The best I got was 7% improvement.
> > > I tried 16, 8, 6 and 4 as unrolling steps.
> > 
> > Makes no sense to me.  Should  be  at  least  as  efficient  as  your
> > original code (marginally better).
> 
> I don't understand this either.
> Anyone?

You might try it with 6.  But a lot depends on what gcc can do with
it and gcc may not be like all of those potential entry points.. 

Running gcc -S and checking to see the difference in the generated
assembly might be instructive.

Eric
