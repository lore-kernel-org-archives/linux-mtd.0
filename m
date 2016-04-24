Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auNvY-0006io-Fi
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2016 17:34:37 +0000
Date: Sun, 24 Apr 2016 19:34:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Tony Lindgren <tony@atomide.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: qemu:beagle no longer booting with omap2plus_defconfig in -next
Message-ID: <20160424193414.2bc82d47@bbrezillon>
In-Reply-To: <571CF780.1080308@roeck-us.net>
References: <571BB682.1010806@roeck-us.net>
 <20160423214617.4d0905d2@bbrezillon>
 <571CF780.1080308@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 24 Apr 2016 09:42:40 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> In qemu, it looks like gpmc bit 0 is considered to be the NAND chip select,
> which is distinctly different to a chip ready pin. Guess I would have to try
> finding a chip datasheet to figure out what this pin is supposed to do, and
> what is wrong. Since it is somewhat unlikely that I'll find the time to do that,
> I just disabled MTD_NAND_OMAP2 in my qemu tests instead. Not an ideal solution,
> of course, but the alternative would be to drop the beagle qemu tests entirely.

Here is a patch [1] which should fix your problem. It's obviously not
enough to handle the different use cases we have in in the wild, but
should fix your problem on the beagle board.

Regards,

Boris

[1]http://code.bulix.org/i5c4yc-97598

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
