Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auPjM-0005Zb-6e
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2016 19:30:12 +0000
Date: Sun, 24 Apr 2016 21:28:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Guenter Roeck <linux@roeck-us.net>, Roger Quadros <rogerq@ti.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>
Subject: Re: qemu:beagle no longer booting with omap2plus_defconfig in -next
Message-ID: <20160424212831.3c44d72e@bbrezillon>
In-Reply-To: <20160423214617.4d0905d2@bbrezillon>
References: <571BB682.1010806@roeck-us.net>
 <20160423214617.4d0905d2@bbrezillon>
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

On Sat, 23 Apr 2016 21:46:17 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> And the other question I have for Roger is, do you see a reason why the
> rb-gpio mode would not work?
> 

Forget that one, this bug appeared to be caused by partial emulation of
the GPMC block in qemu.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
