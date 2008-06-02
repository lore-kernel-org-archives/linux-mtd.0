Received: from mail16.syd.optusnet.com.au ([211.29.132.197])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3IMs-0002xB-QF
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 22:19:12 +0000
Subject: RE: u-boot reports ecc error on blocks written by nandwrite
From: James <jamessteward@optusnet.com.au>
To: Mark Roths <mroths@softairmicro.com>
In-Reply-To: <01c001c8c4fb$8ac04170$6601a8c0@mrothsduo>
References: <01c001c8c4fb$8ac04170$6601a8c0@mrothsduo>
Content-Type: text/plain
Date: Tue, 03 Jun 2008 08:18:59 +1000
Message-Id: <1212445139.6121.19.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-06-02 at 14:56 -0700, Mark Roths wrote:
> Yes, u-boot can erase, write, and read with no problems on its own.  
> I use the u-boot nand utilities to build my flash with bootloader, u-boot,
> linux and initrd.  All that works fantastically.
> 
> The only time I have problems is when I write a block in my boot partition
> using nandwrite, and then subsequently read it with u-boot on the next boot.
> And the completely strange behavior is that if I request 1 byte using 'nand
> read', it fails the 1st time and then succeeds - all reads succeed after
> that with no ecc errors.

Sounds almost like a cache problem.

> Both the mtdchar driver and u-boot are configured for soft ecc, or so I
> believe from my reading of the code.

Likely.

I've had a plethora of problems using the NAND MT29F2G08AACWP on some
AT91SAM9263-EK boards.  I now feel it might be a timing issue.  Maybe
yours is too!

Regards,
James.
