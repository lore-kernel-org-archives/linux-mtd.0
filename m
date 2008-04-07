Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jim5r-00074b-F8
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:48:43 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jim5q-0000SE-4u
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 02:48:42 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jim5k-0001lz-Sv
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 17:48:36 +1000
Date: Mon, 7 Apr 2008 17:48:36 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: choosing a file system to use on NAND/UBI
Message-ID: <20080407074836.GB6317@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron>
	<20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron>
	<20080407073227.GA6317@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080407073227.GA6317@cloud.net.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 07, 2008 at 05:32:27PM +1000, Hamish Moffatt wrote:
> UBI attach time appears to be about 6 seconds.
> 
> [    0.960000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
> [    0.970000] Scanning device for bad blocks
> [    1.020000] Bad eraseblock 494 at 0x03dc0000
> [    1.110000] Bad eraseblock 1300 at 0x0a280000
> [    1.240000] Bad eraseblock 2554 at 0x13f40000
> [    1.280000] Bad eraseblock 2923 at 0x16d60000
> [    1.330000] Bad eraseblock 3349 at 0x1a2a0000
> [    1.370000] Bad eraseblock 3790 at 0x1d9c0000
> [    1.410000] cmdlinepart partition parsing not available
> [    7.210000] UBI: attached mtd9 to ubi0

Less with some NAND glue improvements.

[    0.960000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
[    0.970000] Scanning device for bad blocks
[    1.010000] Bad eraseblock 494 at 0x03dc0000
[    1.060000] Bad eraseblock 1300 at 0x0a280000
[    1.140000] Bad eraseblock 2554 at 0x13f40000
[    1.170000] Bad eraseblock 2923 at 0x16d60000
[    1.200000] Bad eraseblock 3349 at 0x1a2a0000
[    1.230000] Bad eraseblock 3790 at 0x1d9c0000
[    1.260000] cmdlinepart partition parsing not available
[    6.910000] UBI: attached mtd9 to ubi0



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
