Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1ComYZ-0004ui-Mn
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 12:45:20 -0500
Received: by wproxy.gmail.com with SMTP id 36so608627wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 09:45:18 -0800 (PST)
Message-ID: <9f920bdf05011209455115963b@mail.gmail.com>
Date: Wed, 12 Jan 2005 09:45:18 -0800
From: Dan Post <postster@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1105551293.26551.133.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
	<6934efce050112092246ae9277@mail.gmail.com>
	<1105551293.26551.133.camel@hades.cambridge.redhat.com>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Dan Post <postster@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jan 2005 17:34:53 +0000, David Woodhouse <dwmw2@infradead.org> wrote:
> We ought to be decompressing directly from flash to RAM. It takes 0.5x
> flash, and 1x RAM. And the RAM usage is dynamic -- you can throw the
> page away if memory is tight, and read it back again later.

Which can cause severe application performance problems in
RAM-constrained systems.  Your system will slow to a crawl if the page
cache is thrashed a lot... and I've seen this problem a number of
times.  If the page is always present, there is no page cache penalty
for executing code.

> And takes twice the amount of flash. Yes, it uses less RAM, but I don't
> see how it can reduce the ROM cost.
> I haven't seen a decent analysis of the real-life cost of startup -- the
> CELF numbers at OLS included decompression of the kernel in their
> startup timings.

We'll see what we can do to post numbers.
(No pun intended.)

Dan
