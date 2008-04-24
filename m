Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jop2t-00021T-Tq
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 00:10:40 +0000
Date: Thu, 24 Apr 2008 10:10:26 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Nancy <nancydreaming@gmail.com>, linux-mtd@lists.infradead.org,
	Bruce_Leonard@selinc.com
Subject: Re: [RFC] slight UBI scan time improvement
Message-ID: <20080424001026.GA13358@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080423124046.GA16201@cloud.net.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 10:40:46PM +1000, Hamish Moffatt wrote:
> On Wed, Apr 23, 2008 at 11:21:04AM +0300, Artem Bityutskiy wrote:
> > Hi,
> > 
> > On Wed, 2008-04-23 at 10:13 +0200, Matthieu CASTET wrote:
> > > > [    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
> > > > [    0.960000] Scanning device for bad blocks
> > > > [    1.000000] Bad eraseblock 494 at 0x03dc0000
> > > > [    1.050000] Bad eraseblock 1300 at 0x0a280000
> > > > [    1.140000] Bad eraseblock 2554 at 0x13f40000
> > > > [    1.160000] Bad eraseblock 2923 at 0x16d60000
> > > > [    1.200000] Bad eraseblock 3349 at 0x1a2a0000
> > > > [    1.230000] Bad eraseblock 3790 at 0x1d9c0000
> > > > [    6.890000] UBI: attached mtd9 to ubi0
> > > > 
> > > > 
> > > > 
> > > > Hamish
> > > 
> > > Do you know when the bad block scanning finish and the ubi scan start ?
> > 
> > Good point Matthieu. Indeed, _at least_ 1.23 sec is spend in the driver
> > for scanning against bad eraseblocks to build in-memory bad block table
> > (BBT). And it is probably more than 1.23 sec. If you start using
> > on-flash bad block table, this should go away. I never used on-flash
> > BBT, but I know MTD supports this and for example OLPC has on-flash BBT.
> 
> Well I think from past use of "time ubiattach ..." that most of
> the missing time is in the attach. 

Here's the evidence:

[    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
[    0.960000] Scanning device for bad blocks
[    1.000000] Bad eraseblock 494 at 0x03dc0000
[    1.050000] Bad eraseblock 1300 at 0x0a280000
[    1.140000] Bad eraseblock 2554 at 0x13f40000
[    1.160000] Bad eraseblock 2923 at 0x16d60000
[    1.200000] Bad eraseblock 3349 at 0x1a2a0000
[    1.230000] Bad eraseblock 3790 at 0x1d9c0000
[    1.250000] UBI: attaching mtd9 to ubi-1
[    6.890000] UBI: attached mtd9 to ubi0
[    6.900000] UBI: MTD device name:            "gen_nand.0"
[    6.900000] UBI: MTD device size:            512 MiB
[    6.910000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    6.910000] UBI: logical eraseblock size:    129024 bytes
[    6.920000] UBI: number of good PEBs:        4090
[    6.920000] UBI: number of bad PEBs:         6
[    6.930000] UBI: smallest flash I/O unit:    2048
[    6.930000] UBI: VID header offset:          512 (aligned 512)
[    6.940000] UBI: data offset:                2048
[    6.940000] UBI: max. allowed volumes:       128
[    6.950000] UBI: wear-leveling threshold:    4096
[    6.950000] UBI: number of internal volumes: 1
[    6.960000] UBI: number of user volumes:     4
[    6.960000] UBI: available PEBs:             0
[    6.970000] UBI: total number of reserved PEBs: 4090
[    6.970000] UBI: number of PEBs reserved for bad PEB handling: 40
[    6.980000] UBI: max/mean erase counter: 29/1
[    6.980000] UBI: background thread "ubi_bgt0d" started, PID 641


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
