Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkOC6-0003RK-0E
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 10:23:42 -0400
To: David Woodhouse <dwmw2@infradead.org>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jul 2004 08:23:46 -0600
In-Reply-To: <1089705743.2899.46.camel@hades.cambridge.redhat.com>
Message-ID: <m3u0wcj899.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Tue, 2004-07-13 at 01:05 -0600, Eric W. Biederman wrote:
> > That part does not look to bad...
> 
> Would be interesting to know if it works though ... :)
> 
> > Although there has been some error handling from cfi_cmdset_0002.c which
> > disturbs me.  Seeing as I'm good at finding flaky NOR flash parts...
> 
> I assume you mean some error handling _removed_ from cfi_cmdset_0002.c 
> 
> I don't recall doing that myself... can you elaborate?

Right.  Basically when Thayne was working on cfi_cmdset_0002 we got it stable
for the chips we care about.  But the code was so ugly someone rewrote the
code.  There were other priorities at the time so we have not been able to
get back and fix things up.

The primary thing was that the check that the written data is was what
we actually tried to write was removed.

> > That time line is a bit challenging.  My safe guess was about a week to get
> > everything written and tested... 
> 
> Yeah, that seems reasonable. I'll sync to Linus this week anyway, then I
> can do it again in August when I get back and the dust has settled on
> your changes.

Sounds sane.

Eric
