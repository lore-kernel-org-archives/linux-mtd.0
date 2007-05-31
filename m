Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HtsBW-0003Kk-KP
	for linux-mtd@lists.infradead.org; Thu, 31 May 2007 17:27:58 -0400
Date: Thu, 31 May 2007 23:27:49 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Anton Vorontsov <cbou@mail.ru>
Subject: Re: [PATCH] physmap-concat map platform driver
Message-ID: <20070531212749.GR26191@xi.wantstofly.org>
References: <20070526002925.GB801@zarina>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070526002925.GB801@zarina>
Cc: linux-mtd@lists.infradead.org, kernel-discuss@handhelds.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 26, 2007 at 04:29:25AM +0400, Anton Vorontsov wrote:

> This is physmap-concat driver, which is plain sa1100-flash.c
> with factored out arch-specific code. This driver is essential for
> boards using multiple nonindentical chips on the board.

Doesn't physmap also support multiple nonidentical chips?

What physmap doesn't support is multiple discontiguous memory
regions.  Maybe it makes more sense to add that support to physmap
instead?
