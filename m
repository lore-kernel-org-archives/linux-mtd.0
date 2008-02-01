Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKwbC-0003lm-Mw
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 14:10:40 +0000
Date: Fri, 1 Feb 2008 17:10:35 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] physmap-concat map platform driver
Message-ID: <20080201141035.GA11347@localhost.localdomain>
References: <20070526002925.GB801@zarina>
	<20070531212749.GR26191@xi.wantstofly.org>
	<20070531215838.GA1603@zarina> <200802011405.05999.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <200802011405.05999.sr@denx.de>
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 01, 2008 at 02:05:05PM +0100, Stefan Roese wrote:
> Hi Anton,
> 
> On Thursday 31 May 2007, Anton Vorontsov wrote:
> > > Maybe it makes more sense to add that support to physmap
> > > instead?
> >
> > Well.. more easier solution would be merging physmap-concat to physmap,
> > trying make physmap-concat platform_data-compatible.
> >
> > I can try implement that.
> 
> Did you make any progress here?

Nope, sorry. I needed this for some ARM machine, but recently had no
time to work on it.

> Just checking, since I have the same problem 
> supporting the Intel 48F4400 which consists of two non-identical NOR chips 
> with different geometries. If you don't have anything yet, I'll come up with 
> a patch to extend the physmap driver to support multiple regions.

That would be great.


Thanks,

p.s. removing kernel-disscuss@handhelds.org from Cc: since it's dead
for months for unknown reason.

-- 
Anton Vorontsov
email: cbou@mail.ru
backup email: ya-cbou@yandex.ru
irc://irc.freenode.net/bd2
