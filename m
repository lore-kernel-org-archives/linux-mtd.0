Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBXvt-0003co-4h
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 08:52:37 -0500
Date: Tue, 21 Feb 2006 14:51:45 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060221135145.GA30056@xi.wantstofly.org>
References: <20060212170441.GA28427@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060212170441.GA28427@xi.wantstofly.org>
Subject: Re: [PATCH,RFC] convert physmap to platform driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, Feb 12, 2006 at 06:04:41PM +0100, Lennert Buytenhek wrote:

> After dwmw2 let me know it ought to be done, I rewrote the physmap map
> driver to be a platform driver.  I know zilch about the driver model,
> so I probably botched it in some way, but I've done some tests on an
> ixp23xx board which uses physmap, and it all seems to work.

I wonder whether anyone had a chance to look at this yet?


thanks,
Lennert
