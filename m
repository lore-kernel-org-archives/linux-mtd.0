Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QkPz-0008SE-Td
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 10:00:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Kleine-Budde <kleine-budde@gmx.de>
In-Reply-To: <20030613085457.GA18036@timberwolf.dyndns.org>
References: <20030613085457.GA18036@timberwolf.dyndns.org>
Message-Id: <1055494848.2097.475.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Jun 2003 10:00:49 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: which kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-06-13 at 09:54, Marc Kleine-Budde wrote:
> Hi!
> 
> I'm new to linux-mtd and my question is, which kernel version works
> best with your CVS HEAD?

It should be working fine with both 2.5 and 2.4 kernels. I wouldn't
really recommend that anyone use 2.5 in production though -- so you
should be using 2.4.20 or one of the 2.4.21 release candidates.

It's possible to make it work with kernels as old as 2.4.19 though.

-- 
dwmw2
