Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOdEe-0000dj-2q
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 18:50:48 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m6VIohvM012323 for <linux-mtd@lists.infradead.org>;
	Thu, 31 Jul 2008 11:50:44 -0700 (MST)
Received: from ld0162-tx32.am.freescale.net (ld0162-tx32.am.freescale.net
	[10.82.19.112])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m6VIohnS001434
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Jul 2008 13:50:43 -0500 (CDT)
Date: Thu, 31 Jul 2008 13:50:43 -0500
From: Scott Wood <scottwood@freescale.com>
To: Nigel Hathaway <Nigel.Hathaway@ubiquisys.com>
Subject: Re: [U-Boot-Users] U-boot and UBI
Message-ID: <20080731185042.GB6876@ld0162-tx32.am.freescale.net>
References: <094A73044298734FB7D58CAAA319E1D6FA5EEE@UBIQ-SERV1.ubiquisys.local>
	<4890AC5A.5010803@largestprime.net>
	<094A73044298734FB7D58CAAA319E1D6FEFC5F@UBIQ-SERV1.ubiquisys.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <094A73044298734FB7D58CAAA319E1D6FEFC5F@UBIQ-SERV1.ubiquisys.local>
Cc: pgssgp <pradep@gmail.com>, Bernard Blackham <bernard@largestprime.net>,
	linux-mtd@lists.infradead.org, u-boot-users@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 31, 2008 at 12:01:18PM +0100, Nigel Hathaway wrote:
> I have been playing around with a board from Olimex: the SAM9-L9260 (it
> has an Atmel AT91SAM9260 on it). This has a ROMboot with U-Boot in NAND
> flash. The board I am using has an interesting feature: the block which
> U-Boot is configured to use for storing its environment just happens to
> be a bad block, so I can't change and store the U-Boot environment
> parameters on it.

There's a patch in the testing branch of u-boot-nand-flash to allow a
range of blocks to be specified for the environment, with bad blocks
being skipped.  Another patch has been posted to allow the location of
the environment to be specified in the OOB area of the boot block (which
is guaranteed to be good).

-Scott
