Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KyNwr-0008Ci-7s
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 09:48:13 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KyNwk-0007wn-UC
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 09:48:07 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2008 09:48:06 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2008 09:48:06 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Date: Fri, 07 Nov 2008 10:47:55 +0100
Message-ID: <gf12sb$oo3$1@ger.gmane.org>
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>	<gea0sh$j97$1@ger.gmane.org>
	<49097176.5010506@thomson.net>	<gec051$efd$1@ger.gmane.org>	<49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de>	<20081104114229.GA1673@shareable.org>
	<49105CAB.3000706@imms.de>
	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Trent Piepho wrote:
> I've found that writes do not work with caching enabled.  When the CPU writes
> to the flash and then reads it back, it gets returned what it wrote.  That's
> not what is supposed to happen.  

Sure, writes should be uncached and unbuffered. But I thought the mtd 
layer handles this correctly as there are two different ioremap's in the 
driver:

map.virt = ioremap(..);
map.cached = ioremap_cached(..);
map.inval_cache = inval_cache_fct();

So, calling inval_cache_fct() just before any write operation and then 
using the uncached mapping should do the trick, no? On the other hand, I 
am not sure if the mtd-layer really behaves like that. Can somebody 
confirm this?
Anyway, I tried to write a cramfs-image to a previously (in uboot) 
erased flash area. After that, I could successfully boot the system 
using this cramfs as my root. So I would reason that writes are OK.
Time is another point (cramfs_xip.bin is 1.6MB):

# time cp cramfs_xip.bin /dev/mtd3
real    4m 13.52s
user    0m 0.00s
sys     4m 13.03s

This is around 6,3kB/s. Doing the same write in uboot with cp.b takes 
about 26sec. So this is around 62kB/s.


> I measured by reading flash linearly from beginning to end 32-bits at a time. 
> Since the flash is bigger than the cache, ever read should have come from the
> flash.  If I just read the same 1k over and over that would obviously be much
> faster if it could come from the cache.

I measured by reading from mtd char device, which is not reading the 
same data over and over again.
I copied the whole partition into a ramdisk. mtd3 is 3MB in size so this 
yields to a read speed of 11.53MB/s

# time cp /dev/mtd3 /tmp/test
real    0m 0.26s
user    0m 0.01s
sys     0m 0.24s


> I'm just using the GPCM mode of the Freescale eLBC, which means I have to use
> the same timings both for writes and reads.  There are parts of the timing I
> could make faster for reads, but then they would be too short for writes, and
> vice versa.  It also means I can't use the page burst mode, which would
> speed up reads significantly.

I am not familiar with GPCM and eLBC, but it sounds about the same here. 
Same timings for writes and reads. But I use burst mode (4 words), but 
this only applies to reads.

> The biggest bootup delay I have now is waiting for the ethernet phy to get
> online, which takes almost 3 seconds.

Same here, ethernet phy takes sooo long. Here is what I do: I am using a 
parallel init. On script is just for loading the ethernet-module which 
is done next to the other scripts. So 2sec is cheated, cause ethernet 
isn't really available at this point of time.

Regards,
Andre
