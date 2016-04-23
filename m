Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1au3Vv-0001cg-FS
 for linux-mtd@lists.infradead.org; Sat, 23 Apr 2016 19:46:48 +0000
Date: Sat, 23 Apr 2016 21:46:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Tony Lindgren <tony@atomide.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: qemu:beagle no longer booting with omap2plus_defconfig in -next
Message-ID: <20160423214617.4d0905d2@bbrezillon>
In-Reply-To: <571BB682.1010806@roeck-us.net>
References: <571BB682.1010806@roeck-us.net>
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

Hi Guenter,

On Sat, 23 Apr 2016 10:53:06 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Hi,
> 
> since next-20160421, I get the following error and hang when trying to boot
> an omap2plus_defconfig image with qemu, machine 'beagle' and omap3-beagle.dtb.
> multi_v7_defconfig still works, as does machine 'beaglexm' with omap3-beagle-xm.dtb
> and omap2plus_defconfig. This is with Linaro's version of qemu.
> 
> nand: timeout while waiting for chip to become ready
> 
> The message repeats until the test times out.
> 
> Bisect points to "Merge remote-tracking branch 'nand/nand/next'" as the offending
> commit. However, the nand/nand/next branch itself is fine, as is the merge just
> prior to the nand/nand/next merge ("Merge remote-tracking branch 'l2-mtd/master'").
> 
> After some digging, I found that reverting commit "mtd: nand: omap2: Implement
> NAND ready using gpiolib" fixes the problem. What I don't know, though, is why
> the problem is only seen with omap2plus_defconfig, but not with multi_v7_defconfig,
> and why it is only seen with beagle/omap3-beagle.dtb but not with
> beaglexm/omap3-beagle-xm.dtb.
> 
> The 'rb-gpios' property is only defined in omap3-beagle.dts, but not in
> omap3-beagle-xm.dts, which may be part of the explanation. That still doesn't
> explain, though, why multi_v7_defconfig still works, but not omap2plus_defconfig.
> 
> Any ideas, anyone ?

I think you got it right for the DT changes: if rb-gpios is not
defined, it's working because the implementation fallback to "status
polling" mode, which is not relying on the new GPIO controller
implementation.
I don't know why it's working when using multi_v7_defconfig and not
with omap2_plus though (maybe a different probe order making
devm_gpiod_get_optional() return NULL instead of EPROBE_DEFER?).

And the other question I have for Roger is, do you see a reason why the
rb-gpio mode would not work?

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
