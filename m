Received: from [65.117.135.105] (helo=yoda.timesys)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKfQr-0000do-UN
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 12:04:54 -0400
Date: Thu, 21 Oct 2004 12:04:27 -0400
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20041021160427.GA26048@yoda.timesys>
References: <20041020233921.62536A00099@mail.murgatroid.com>
	<Pine.LNX.4.61.0410202011020.26473@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0410202011020.26473@xanadu.home>
From: Scott Wood <scott@timesys.com>
Cc: Christopher Hoover <ch@murgatroid.com>, 'Scott Wood' <scott@timesys.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Interleave order while probing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 20, 2004 at 08:11:37PM -0400, Nicolas Pitre wrote:
> On Wed, 20 Oct 2004, Christopher Hoover wrote:
> 
> > > I don't think there are any situations
> > > where that would produce a false positive (short of having QRY as the
> > > actual flash data at the relevant addresses).
> >
> > That would be a problem.  It's a block device: you can store whatever you
> > want, wherever you want.

Yes, but that's always been a problem.  Perhaps the device could be
asked to produce a status word as an additional check?

In any case, a prohibition on having zeroes there is worse than a
prohibition on having "QRY".

> Not in query mode though.

But if you've guessed the wrong interleave, you could be seeing some
non-query-mode data for the chips that didn't get the query command.

-Scott
