Received: from mx34.mail.ru ([194.67.23.200] helo=mx27.mail.ru)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HwNHn-0005JE-SD
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 15:04:48 -0400
Date: Thu, 7 Jun 2007 23:04:18 +0400
From: Anton Vorontsov <cbou@mail.ru>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] physmap-concat map platform driver
Message-ID: <20070607190418.GA1150@zarina>
References: <20070526002925.GB801@zarina>
	<20070531212749.GR26191@xi.wantstofly.org>
	<20070531215838.GA1603@zarina>
	<20070607120750.GN2079@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20070607120750.GN2079@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org, kernel-discuss@handhelds.org
Reply-To: cbou@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 07, 2007 at 02:07:51PM +0200, Lennert Buytenhek wrote:
> On Fri, Jun 01, 2007 at 01:58:38AM +0400, Anton Vorontsov wrote:
> 
> > > > This is physmap-concat driver, which is plain sa1100-flash.c
> > > > with factored out arch-specific code. This driver is essential for
> > > > boards using multiple nonindentical chips on the board.
> > > 
> > > Doesn't physmap also support multiple nonidentical chips?
> > 
> > Nope. E.g. if I have two chips, 32M + 16M, second chip will be visible
> > as 32M, which is wrong.
> 
> OK, why is that?  Is that easily fixable?

Don't know why, David said it's what expected in such setup, and that's
indeed what I'm observing. I'm unsure that it needs any fixups though.
For now I'm just registering two physmap devices, per each chip.

> > > What physmap doesn't support is multiple discontiguous memory
> > > regions.
> > 
> > Yes, this is another disadvantage of current physmap.
> > 
> > > Maybe it makes more sense to add that support to physmap
> > > instead?
> > 
> > Well.. more easier solution would be merging physmap-concat to physmap,
> > trying make physmap-concat platform_data-compatible.
> 
> Hmmm, isn't that more or less what I said?  What's the difference?

That's exactly what you've said. I was in hurry and misread your
initial message. Sorry.

> thanks,
> Lennert

Thanks,

-- 
Anton Vorontsov
email: cbou@mail.ru
backup email: ya-cbou@yandex.ru
irc://irc.freenode.org/bd2
