Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoeHQ-0003HT-Uc
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 12:40:57 +0000
Date: Wed, 23 Apr 2008 22:40:46 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC] slight UBI scan time improvement
Message-ID: <20080423124046.GA16201@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208938864.11721.44.camel@sauron>
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd@lists.infradead.org,
	Bruce_Leonard@selinc.com, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 11:21:04AM +0300, Artem Bityutskiy wrote:
> Hi,
> 
> On Wed, 2008-04-23 at 10:13 +0200, Matthieu CASTET wrote:
> > > [    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
> > > [    0.960000] Scanning device for bad blocks
> > > [    1.000000] Bad eraseblock 494 at 0x03dc0000
> > > [    1.050000] Bad eraseblock 1300 at 0x0a280000
> > > [    1.140000] Bad eraseblock 2554 at 0x13f40000
> > > [    1.160000] Bad eraseblock 2923 at 0x16d60000
> > > [    1.200000] Bad eraseblock 3349 at 0x1a2a0000
> > > [    1.230000] Bad eraseblock 3790 at 0x1d9c0000
> > > [    6.890000] UBI: attached mtd9 to ubi0
> > > 
> > > 
> > > 
> > > Hamish
> > 
> > Do you know when the bad block scanning finish and the ubi scan start ?
> 
> Good point Matthieu. Indeed, _at least_ 1.23 sec is spend in the driver
> for scanning against bad eraseblocks to build in-memory bad block table
> (BBT). And it is probably more than 1.23 sec. If you start using
> on-flash bad block table, this should go away. I never used on-flash
> BBT, but I know MTD supports this and for example OLPC has on-flash BBT.

Well I think from past use of "time ubiattach ..." that most of
the missing time is in the attach. 

I've added a message at start of ubi_attach_mtd_dev(), but I can't test it 
from home as I left my test hardware at the office switched off tonight..
I'll confirm tomorrow.

Would combining the bad block scan with the UBI scan save time? I guess
it would be a bad layering violation however :-)


What sort of speed do you get using
dd if=/dev/mtdblock9 of=/tmp/foo bs=128K count=64
(where mtdblock9 is your raw mtd NAND device). I'm seeing about 6
seconds to read that 8Mb, which is quite long I guess.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
