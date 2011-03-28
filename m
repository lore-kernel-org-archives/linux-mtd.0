Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q49u9-0002J7-56
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 10:42:37 +0000
Date: Mon, 28 Mar 2011 13:38:16 +0300
From: Phil Carmody <ext-phil.2.carmody@nokia.com>
To: ext Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubifs: debugfs operations may return both ERRs and
	NULLs
Message-ID: <20110328103816.GC2072@esdhcp04044.research.nokia.com>
References: <20110323131614.GC18296@esdhcp04044.research.nokia.com>
	<1300887304-20932-1-git-send-email-ext-phil.2.carmody@nokia.com>
	<1301295087.2816.2.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1301295087.2816.2.camel@localhost>
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28/03/11 09:51 +0300, ext Artem Bityutskiy wrote:
> On Wed, 2011-03-23 at 15:35 +0200, Phil Carmody wrote:
> > I knew I invented IS_ERR_OR_NULL for something, and this was probably
> > it. NULL has lost all information about what the error was, and the most
> > appropriate error code is ENODEV. However, that's the only error code
> > that the debugfs functions can return. So basically, any error = ENODEV.
> 
> This is not true that any error is -ENODEV. There are many other errors
> possible, e.g., due to an invocation of simple_pin_fs().

I meant that once you've thrown away all information about the actual
error by turning it into NULL, then the broadest brush that covers the
failure modes is ENODEV. That's why I was asked "what's the most generic
'something's gone wrong' code" on the chat channel the other day.
 
> I think the right fix would be to fix debugfs and return an error code
> in any case.

Agree. Alas it might require hitting a lot of both active and dead code.
Is that something you want me to look at? If you do it yourself, please
Cc: me, I'll happily review it.

Phil
