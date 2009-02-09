Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWU3B-0005sF-KS
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 11:11:44 +0000
Message-ID: <49900F6A.1030508@logix.net.nz>
Date: Tue, 10 Feb 2009 00:11:38 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Writing Linux kernel to MTD
References: <498FAE9A.4030208@logix.net.nz>
	<Pine.LNX.4.64.0902091007480.19761@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0902091007480.19761@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> 
> On Mon, 9 Feb 2009, Michal Ludvig wrote:
> 
>> I've got some problems writing a linux kernel image to /dev/mtd1 both
>> using 'dd of=/dev/mtd1' or using nandwrite. In either case the kernel is
>> not bootable after such a write.
>> ...
>> When I write the kernel image directly from u-boot using 'nandw' command
>> it works fine and can be booted. However all attempts to write the image
>> from a running Linux to /dev/mtd1 failed so far. I always ended up with
>> an unbootable system:
>> ...
>> Interestingly even when I dump /dev/mtd1 using 'dd if=/dev/mtd1' or
>> 'nanddump -o' I get something very close to the originally written
>> kernel but not exactly the same. A number of bits here and there are
>> slightly different:
>> ---
> 
> My instinctive reaction is that there may be a difference in the way the
> Linux and u-boot drivers access the NAND device in terms of bus timing
> etc, so that the Linux driver breaks the timing causing bad
> communication with the device. I.e., the timing setup of the Linux
> driver is at fault here.

Interesting idea, however I happily use UBIFS filesystem at the same
time in the same NAND Flash and observe no problems. If it's broken it's
broken in a very reliable and stable way...

> Another similar condition I have experienced is that due to a
> misconfiguration one of the control bits to the NAND flash was
> inadvertently mapped to a network indicator LED, causing NAND read/write
> to fail if network traffic occurred at the same time.

Just in case I disabled network altogether and did the write test from
UBIFSroot instead of from development NFSroot and it's still failing.

Any other ideas?

Michal
