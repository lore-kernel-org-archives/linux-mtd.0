Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkOky-0003ms-E2
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 10:59:45 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3u0wcj899.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
	<m3u0wcj899.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Date: Tue, 13 Jul 2004 08:45:38 -0600
Message-Id: <1089729938.8696.115.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-13 at 08:23 -0600, Eric W. Biederman wrote:
> David Woodhouse <dwmw2@infradead.org> writes:
> 
> > On Tue, 2004-07-13 at 01:05 -0600, Eric W. Biederman wrote:
> > > That part does not look to bad...
> > 
> > Would be interesting to know if it works though ... :)
> > 
> > > Although there has been some error handling from cfi_cmdset_0002.c which
> > > disturbs me.  Seeing as I'm good at finding flaky NOR flash parts...
> > 
> > I assume you mean some error handling _removed_ from cfi_cmdset_0002.c 
> > 
> > I don't recall doing that myself... can you elaborate?
> 
> Right.  Basically when Thayne was working on cfi_cmdset_0002 we got it stable
> for the chips we care about.  But the code was so ugly someone rewrote the
> code.  There were other priorities at the time so we have not been able to
> get back and fix things up.
> 
> The primary thing was that the check that the written data is was what
> we actually tried to write was removed.

There's a short list of things that have been removed or changed
significantly (although this is from memory and may not match the
current code):

* read-back check of written data

* retry of failed writes

* unlock address for some chips (although this is likely part of the big
rewrite)

In the end, it's much appreciated that everything was cleaned up - there
were some major things done that I wanted to do but was too timid to do
major overhauling of the code.  Unfortunately it was just continuing to
grow harrier and uglier.
