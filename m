Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkGj2-0002B5-JJ
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 02:25:13 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1089699909.8822.9.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 13 Jul 2004 07:25:09 +0100
Content-Transfer-Encoding: 7bit
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

On Mon, 2004-07-12 at 21:13 -0600, Eric W. Biederman wrote:
> I would like to have the probe functions fill in
> not the CmdSet number but a structure full of function pointers.
> And of course the upper layers need to be modified to cope.

> I have both Intel and AMD chips to test against.  CFI and non CFI
> all being used as motherboard BIOS chips.  So I should be able
> to catch the vast majority of problems in testing.  All but the
> delicate chip interleave case, but I should not actually be touching
> that part of the code, and at least I am aware of the issue.

And I just rewrote that part of the code too :)

> Does anyone have any problems with this refactoring?

No, it seems like a good idea. It'll let us drop half of cfi_cmdset_0020
too.

Once I've done some testing on the new interleave / map access code I
was planning to send an update to Linus this week. That _really_ needs
to happen this week, so if you're going to do this then either do it
today, or wait a month. Personally I favour the former -- the whole
thing needs testing now anyway.

Can you get to #mtd on irc.freenode.net?

-- 
dwmw2
