Received: from lilly.ping.de ([83.97.42.2])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM2B4-0006N5-4g
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 17:33:42 +0000
Date: Fri, 26 Nov 2010 18:29:12 +0100
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS oops after remount ro
Message-ID: <20101126172912.GX23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
	<1290785057.2552.14.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1290785057.2552.14.camel@localhost>
From: wolfgang@leila.ping.de (Wolfgang Wegner)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thank you for the hints!

I am currently trying to reproduce the error even without modified
kernel - it seems I changed enough of my init procedure to somehow
avoid the trigger condition. :-(

As soon as I can reproduce the error, I will try what you suggested.

Best regards,
Wolfgang
