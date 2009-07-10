Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPBfQ-0005so-ET
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 08:41:23 +0000
Date: Fri, 10 Jul 2009 10:41:03 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: PXA3xx NAND driver trouble with 'conservative' CPU govenor
Message-ID: <20090710084103.GY9464@buzzloop.caiaq.de>
References: <20090709190137.GW19257@buzzloop.caiaq.de>
	<4A569059.4020200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A569059.4020200@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 10, 2009 at 08:50:33AM +0800, Eric Miao wrote:
> Daniel Mack wrote:
> > With the cpu govenor set to 'conservative', the PXA3xx NAND driver fails
> > the tests from drivers/mtd/tests:
> > 
> > sh-3.2# modprobe mtd_torturetest dev=3
> > [  386.367730]
> > [  386.369296] =================================================
> > [  386.375258] mtd_torturetest: Warning: this program is trying to wear out your flash, stop it if this is not wanted.
> > [  386.385811] mtd_torturetest: MTD device: 3
> > [  386.390021] mtd_torturetest: torture 32 eraseblocks (8-39) of mtd3
> > [  386.396238] mtd_torturetest: write verify enabled
> > [  388.675993] double bit error @ page 00000b79
> > [  388.680406] timed out writing command
> > [  388.687925] mtd_torturetest: error -74 while reading EB 36, read 131072
> > [  388.694536] mtd_torturetest: verify failed for 0xFF... pattern
> > [  388.700364] mtd_torturetest: finished after 0 erase cycles
> > [  388.705885] mtd_torturetest: error -74 occurred during torturing
> > [  388.711908] =================================================
> > modprobe: Failed to load module mtd_torturetest: Bad message.
> > 
> > When setting the govenor to 'performance', the test passes. Has anyone
> > seen similar issues? Any idea, anyone?
> 
> What's the current CPU freq when in conservative? cat /proc/cpuinfo?

/proc/cpuinfo shows 34.61 BogoMIPS, and
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq tells me 104MHz.

Judging from the clock diagram, there is either 156MHz or 30MHz (for
ring-oscillator mode) applied to the NAND controller.

I've prepared two patches (which will follow to this mail) that

 a) make the nand driver aware of frequency changes and
 b) report the correct clk rate for RO mode

But unfortunately, they won't solve the problem.

Any other idea?

Daniel
