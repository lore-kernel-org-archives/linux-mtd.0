Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JovTB-0006sh-Pc
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 07:02:14 +0000
Date: Thu, 24 Apr 2008 17:02:06 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC] slight UBI scan time improvement
Message-ID: <20080424070206.GA20799@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
	<1208955467.11721.69.camel@sauron>
	<20080423134254.GA17867@cloud.net.au>
	<1208959759.11721.76.camel@sauron>
	<20080424015303.GB13358@cloud.net.au>
	<1209018080.11721.88.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1209018080.11721.88.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 24, 2008 at 09:21:20AM +0300, Artem Bityutskiy wrote:
> On Thu, 2008-04-24 at 11:53 +1000, Hamish Moffatt wrote:
> > Hmm. The software ECC seems to work internally on 256 byte blocks.
> > However it appears that nand_base will always read in a whole page (2K
> > on my flash). It should be ok to read only a 256-byte block as that's
> > all you need for ECC calculation? Not a whole 2K which requires 8 ECC
> > calculations.
> 
> However, there was a patch from Alexey which may certainly help you. It
> was not looked at properly, unfortunately. I'll try to find it in my
> mailbox and will send to you.

Thanks. Yes I found the patch in my linux-mtd folder too. It's very
nice!

Here's my attach time before:

[    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
[    0.960000] Scanning device for bad blocks
[    1.000000] Bad eraseblock 494 at 0x03dc0000
[    1.050000] Bad eraseblock 1300 at 0x0a280000
[    1.140000] Bad eraseblock 2554 at 0x13f40000
[    1.160000] Bad eraseblock 2923 at 0x16d60000
[    1.200000] Bad eraseblock 3349 at 0x1a2a0000
[    1.230000] Bad eraseblock 3790 at 0x1d9c0000
[    6.900000] UBI: attached mtd9 to ubi0

... and now:

[    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
[    0.970000] Scanning device for bad blocks
[    1.000000] Bad eraseblock 494 at 0x03dc0000
[    1.060000] Bad eraseblock 1300 at 0x0a280000
[    1.140000] Bad eraseblock 2554 at 0x13f40000
[    1.170000] Bad eraseblock 2923 at 0x16d60000
[    1.200000] Bad eraseblock 3349 at 0x1a2a0000
[    1.230000] Bad eraseblock 3790 at 0x1d9c0000
[    3.880000] UBI: attached mtd9 to ubi0


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
