Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkP9Y-0004AU-Nu
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 11:25:09 -0400
To: David Woodhouse <dwmw2@infradead.org>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jul 2004 09:25:10 -0600
In-Reply-To: <1089699909.8822.9.camel@imladris.demon.co.uk>
Message-ID: <m3658sj5ex.fsf@maxwell.lnxi.com>
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

> On Mon, 2004-07-12 at 21:13 -0600, Eric W. Biederman wrote:
> > I would like to have the probe functions fill in
> > not the CmdSet number but a structure full of function pointers.
> > And of course the upper layers need to be modified to cope.
> 
> > I have both Intel and AMD chips to test against.  CFI and non CFI
> > all being used as motherboard BIOS chips.  So I should be able
> > to catch the vast majority of problems in testing.  All but the
> > delicate chip interleave case, but I should not actually be touching
> > that part of the code, and at least I am aware of the issue.
> 
> And I just rewrote that part of the code too :)
> 
> > Does anyone have any problems with this refactoring?
> 
> No, it seems like a good idea. It'll let us drop half of cfi_cmdset_0020
> too.

Ok recording what the reason for this that I got on irc.

cfi_cmdset_0020 is just a variant on cfi_cmdset_0001 that shares most of
the code.

A data sheet for the M58LW128A ( which erroneously reports cmdset 01 instead of 0x20)
is at:
http://www.st.com/stonline/books/pdf/docs/9229.pdf

cmdset 020 was written for the  M58LW064A and I doesn't currently have a datasheet reference
for on ST site.

Eric
