Received: from mx34.mail.ru ([194.67.23.200] helo=mx27.mail.ru)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Htsfj-0003hd-DM
	for linux-mtd@lists.infradead.org; Thu, 31 May 2007 17:59:20 -0400
Date: Fri, 1 Jun 2007 01:58:38 +0400
From: Anton Vorontsov <cbou@mail.ru>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] physmap-concat map platform driver
Message-ID: <20070531215838.GA1603@zarina>
References: <20070526002925.GB801@zarina>
	<20070531212749.GR26191@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20070531212749.GR26191@xi.wantstofly.org>
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

On Thu, May 31, 2007 at 11:27:49PM +0200, Lennert Buytenhek wrote:
> On Sat, May 26, 2007 at 04:29:25AM +0400, Anton Vorontsov wrote:
> 
> > This is physmap-concat driver, which is plain sa1100-flash.c
> > with factored out arch-specific code. This driver is essential for
> > boards using multiple nonindentical chips on the board.
> 
> Doesn't physmap also support multiple nonidentical chips?

Nope. E.g. if I have two chips, 32M + 16M, second chip will be visible
as 32M, which is wrong. As "workaround" I can register two physmap
devices for each chip. But then I can't concat them, i.e. use two
chips for one partition.

> What physmap doesn't support is multiple discontiguous memory
> regions.

Yes, this is another disadvantage of current physmap.

> Maybe it makes more sense to add that support to physmap
> instead?

Well.. more easier solution would be merging physmap-concat to physmap,
trying make physmap-concat platform_data-compatible.

I can try implement that.

Thanks,

-- 
Anton Vorontsov
email: cbou@mail.ru
backup email: ya-cbou@yandex.ru
irc://irc.freenode.org/bd2
