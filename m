Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JnkTT-0000OT-7B
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 01:05:39 +0000
Date: Mon, 21 Apr 2008 11:05:21 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: [U-Boot-Users] ubi and u-boot
Message-ID: <20080421010521.GA6317@cloud.net.au>
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
	<20080418165957.GG31520@shareable.org>
	<1208546341.6654.8.camel@vader.jdub.homelinux.org>
	<20080420160413.GC14268@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080420160413.GC14268@shareable.org>
Cc: u-boot-users@lists.sourceforge.net, Josh Boyer <jwboyer@gmail.com>,
	Bernard Blackham <bernard@largestprime.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 20, 2008 at 05:04:14PM +0100, Jamie Lokier wrote:
> I was thinking this:
> 
> Hamish Moffatt wrote (Message-ID: <20080407073227.GA6317@cloud.net.au>):
> > Sorry I should've said 512MiB perhaps: 512 megabytes.
> > UBI attach time appears to be about 6 seconds.
> 
> If 6 seconds is as fast as it can be done, annoying but fair enough.
> 
> Adding _another_ 6 seconds to the boot time seems a lot to me.

Yes. I have a prototype system here booting a minimal system from NOR
flash then booting the full system from NAND via kexec. I'm suffering
my 6 seconds of UBI attach time twice each boot.

Six seconds does seem to be abnormal though - I don't have a hardware
NAND controller so it's all software ECC, GPIO for chip selects etc. The
performance is said to be much better with a hardware controller.

> To remove the double scan:
> 
> > > However, if there was a protocol for bootloader to pass the scan
> > > results to the booted kernel, that would be very nice.

That would certainly help my case. Fortunately my device is usually
always-on and therefore boot time is not critical, and we don't
suspend/resume.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
