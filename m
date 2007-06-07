Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HwGmR-0008Mo-Gz
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 08:08:15 -0400
Date: Thu, 7 Jun 2007 14:07:51 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Anton Vorontsov <cbou@mail.ru>
Subject: Re: [PATCH] physmap-concat map platform driver
Message-ID: <20070607120750.GN2079@xi.wantstofly.org>
References: <20070526002925.GB801@zarina>
	<20070531212749.GR26191@xi.wantstofly.org>
	<20070531215838.GA1603@zarina>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070531215838.GA1603@zarina>
Cc: linux-mtd@lists.infradead.org, kernel-discuss@handhelds.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 01, 2007 at 01:58:38AM +0400, Anton Vorontsov wrote:

> > > This is physmap-concat driver, which is plain sa1100-flash.c
> > > with factored out arch-specific code. This driver is essential for
> > > boards using multiple nonindentical chips on the board.
> > 
> > Doesn't physmap also support multiple nonidentical chips?
> 
> Nope. E.g. if I have two chips, 32M + 16M, second chip will be visible
> as 32M, which is wrong.

OK, why is that?  Is that easily fixable?


> > What physmap doesn't support is multiple discontiguous memory
> > regions.
> 
> Yes, this is another disadvantage of current physmap.
> 
> > Maybe it makes more sense to add that support to physmap
> > instead?
> 
> Well.. more easier solution would be merging physmap-concat to physmap,
> trying make physmap-concat platform_data-compatible.

Hmmm, isn't that more or less what I said?  What's the difference?


thanks,
Lennert
