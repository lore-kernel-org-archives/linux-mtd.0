Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOynP-0008Qa-8O
	for linux-mtd@lists.infradead.org; Thu, 09 Jul 2009 18:56:58 +0000
Date: Thu, 9 Jul 2009 20:56:34 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS trouble
Message-ID: <20090709185634.GA26160@buzzloop.caiaq.de>
References: <20090709175559.GZ26160@buzzloop.caiaq.de>
	<4A56304A.2050507@nokia.com>
	<20090709181114.GB15518@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090709181114.GB15518@buzzloop.caiaq.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 09, 2009 at 08:11:14PM +0200, Daniel Mack wrote:
> > Try the NAND tests in drivers/mtd/tests.
> 
> Hmm. The torture test indees shows a problem now:
> 
> sh-3.2# modprobe mtd_torturetest dev=3
> [  386.367730] 
> [  386.369296] =================================================
> [  386.375258] mtd_torturetest: Warning: this program is trying to wear out your flash, stop it if this is not wanted.
> [  386.385811] mtd_torturetest: MTD device: 3
> [  386.390021] mtd_torturetest: torture 32 eraseblocks (8-39) of mtd3
> [  386.396238] mtd_torturetest: write verify enabled
> [  388.675993] double bit error @ page 00000b79
> [  388.680406] timed out writing command
> [  388.687925] mtd_torturetest: error -74 while reading EB 36, read 131072
> [  388.694536] mtd_torturetest: verify failed for 0xFF... pattern
> [  388.700364] mtd_torturetest: finished after 0 erase cycles
> [  388.705885] mtd_torturetest: error -74 occurred during torturing
> [  388.711908] =================================================
> modprobe: Failed to load module mtd_torturetest: Bad message.

Interesting. I think I solved that issue - it seems to be related to the
selected CPU govenor. Switching from 'conservative' to 'performance'
makes the torture test pass.

I'll discuss that on the ARM mailing list.

Thanks,
Daniel
