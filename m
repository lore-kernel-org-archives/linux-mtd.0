Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZO4VO-0007Pg-Vu
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 13:49:48 +0000
Date: Sat, 8 Aug 2015 14:47:09 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, eric.y.miao@gmail.com,
 dwmw2@infradead.org, haojian.zhuang@gmail.com,
 linux-mtd@lists.infradead.org, Petr Cvek <petr.cvek@tul.cz>,
 computersforpeace@gmail.com,
 Robert Jarzmik <robert.jarzmik@free.fr>, daniel@zonque.org
Subject: Re: [BUG, RFC] MTD Execute in Place on ARM breaks build
Message-ID: <20150808134708.GK7557@n2100.arm.linux.org.uk>
References: <55C51319.2010901@tul.cz>
 <1564596.BEQS8u7XSM@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564596.BEQS8u7XSM@wuerfel>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 08, 2015 at 01:42:50PM +0200, Arnd Bergmann wrote:
> A cleaner approach might be to replace xip_currtime() with
> ktime_get_ns(), and find some other generic interface to replace
> xip_irqpending.

Definitely not.

The issue here is that the kernel sits in flash.  When we want to write
to flash, we need to switch the flash into a mode where the data
contained in the flash becomes unreadable - reading from it results in
status bytes being returned.  Status bytes are not executable.

To get around that problem, we have a small amount of code in RAM which
does the flash erasing and/or programming.  This code, however, needs
to have access to the interrupt controller and timer.

Calling generic functions that would be part of the paged-out kernel
image is just not possible; doing so will immediately crash the kernel
and break what's being achieved here.  You'd need to mark these functions
and any functions that they then call (including spinlocks, probably
the entire lockdep infrastructure, etc) with __xipram.  I don't think
that's feasible.

In any case, I don't think XIP multiplatform makes any sense what so
ever.  Needless to say, it _could_ be made to work, but you're likely
need some complexity, and given that it has very few users, I don't
think there's much to be gained from putting that work in.  We've even
talked a few times about removing XIP support altogether.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
