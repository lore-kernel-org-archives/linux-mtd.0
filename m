Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AofNh-00025x-Je
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2004 09:01:05 +0000
Received: from il06exr06.mot.com (il06exr06.mot.com [129.188.137.136])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i15913AH009972
	for <linux-mtd@lists.infradead.org>;
	Thu, 5 Feb 2004 02:01:03 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr06.mot.com (Motorola/il06exr06) with ESMTP id i1590BSC002050
	for <linux-mtd@lists.infradead.org>; Thu, 5 Feb 2004 03:01:02 -0600
From: Li Yang <leoli@motorola.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1075964435.12587.2.camel@imladris.demon.co.uk>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
	 <1074503876.14499.40.camel@imladris.demon.co.uk>
	 <1074509881.14564.3.camel@Gundam>
	 <1074510244.14499.49.camel@imladris.demon.co.uk>
	 <1074572447.14559.23.camel@Gundam>
	 <1074583969.14499.100.camel@imladris.demon.co.uk>
	 <1075950453.12044.7.camel@Gundam>
	 <1075964435.12587.2.camel@imladris.demon.co.uk>
Content-Type: text/plain
Message-Id: <1075971769.28245.60.camel@Gundam>
Mime-Version: 1.0
Date: 05 Feb 2004 17:02:50 +0800
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2+mtd+big endian problem
Reply-To: leoli@motorola.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-05 at 15:00, David Woodhouse wrote:
> On Thu, 2004-02-05 at 11:07 +0800, Li Yang wrote:
> > I have tried to use Jedec_probe instead of sharp driver, but it always
> > recognizes my sharp flash as Intel flash, they have the same vendor id
> > and product id. Ugly.  And then something goes wrong.  So I have to
> > stick to the obsoleted sharp driver.  Thank you for the continued help.
> 
> Hmmm. I'd feel happier if you were to identify the 'something' which
> goes wrong. I was just about to remove the sharp driver from the tree on
> the basis that it's obsolete.
XXXXXXXX flash device: 800000 at fe000000
Search for id:(ff89 ffaa) interleave(2) type(2)
Search for id:(ff89 ffaa) interleave(2) type(2)
Search for id:(ff89 ffaa) interleave(2) type(2)
Search for id:(ff89 ffaa) interleave(2) type(2)
Search for id:(ff89 ffaa) interleave(2) type(2)
Search for id:(89 aa) interleave(2) type(1)
MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
MTD jedec_match(): check unlock addrs 0x0555 0x02aa
MTD jedec_match(): check ID's disappear when not in ID mode
MTD jedec_match(): return to ID mode
MTD jedec_probe_chip(): matched device 0x89,0xaa unlock_addrs: 0x0555
0x02aa
Found: Intel I28F016S3
Flash SIMM: Found 2 x8 devices at 0x0 in 32-bit mode
Probe at addr_unlock2(0x00400000 + 0xc0185aac) past the end of the
map(0x007fffff)
Using word write method
mtd: Giving out device 0 to Flash SIMM
Using XXXXXXXX partition definition
Creating 4 MTD partitions on "Flash SIMM":
0x00000000-0x00600000 : "JFFS"
mtd: partition "JFFS" extends beyond the end of device "Flash SIMM" --
size truncated to 0x400000
mtd: Giving out device 1 to JFFS
0x00600000-0x00700000 : "uImage"
mtd: partition "uImage" is out of reach -- disabled
mtd: Giving out device 2 to uImage
0x00700000-0x00740000 : "u-boot"
mtd: partition "u-boot" is out of reach -- disabled
mtd: Giving out device 3 to u-boot
0x00740000-0x00780000 : "u-boot env"
mtd: partition "u-boot env" is out of reach -- disabled
mtd: Giving out device 4 to u-boot env


> 
> Could it be as simple as disabling the erase suspend?

The Flash SIMM is 8M byte, but it is probed to be 4M only.

-- 
Li Yang <leoli@motorola.com>
Metrowerks
