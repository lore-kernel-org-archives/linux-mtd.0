Received: from alt42.smtp-out.videotron.ca ([23.233.128.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLXfR-0006EN-RB
 for linux-mtd@lists.infradead.org; Thu, 15 Jun 2017 16:30:48 +0000
Date: Thu, 15 Jun 2017 12:30:18 -0400 (EDT)
From: Nicolas Pitre <nico@linaro.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Does XIP_MTD really exist?
In-Reply-To: <SG2PR06MB11657F2D01E82DBA288C16948AC00@SG2PR06MB1165.apcprd06.prod.outlook.com>
Message-ID: <alpine.LFD.2.20.1706151220060.29475@knanqh.ubzr>
References: <SG2PR06MB11657F2D01E82DBA288C16948AC00@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 15 Jun 2017, Chris Brandt wrote:

> In the MTD directory, there are hints that an XIP from MTD exits, but 
> mostly only to make code run from RAM when modifying a parallel NOR flash.
> 
> Is this code all abandoned?

It used to work on some SA1100 and PXA targets... more than 10 years 
ago. No idea if it is still 
in use. Last time I suggested ripping it out entirely, someone raised a 
hand to say they're still relying on it. That too was a few years back.

> Also, I don't really see of any mainline filesystem driver that would 
> make use of it.

Upon a time, the cramfs filesystem had the ability to flag some files 
that would not be compressed, aligned to a page boundary, and be mapped 
directly out of flash. I might have to revive that functionality in the 
near future if no longer available.

> Since as of v4.0, filemap_xip.c was removed (from the guys that added 
> DAX) which broke AXFS which I had been using.
> 
> So, now I'm trying to decide if I need to rework AXFS to work with a 
> mainline kernel (basically by adding filemap_xip.c back in under an fs/axfs
> directory), or if there is some other obvious XIP file system method 
> that I'm missing.
> 
> The NO_MMU + XIP_KERNEL people must be using something for a file 
> system....I'm just not sure what that is.

So far I've seen initramfs packaged with the kernel. The kernel is XIP 
but user space ends up living in RAM forever.


Nicolas
