Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Clq3v-0002Ry-MT
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2005 09:53:33 -0500
Date: Tue, 4 Jan 2005 14:53:22 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: Fabrizio Grasso <f.grasso@custom.it>
Message-ID: <20050104145322.GF29522@home.fluff.org>
References: <5.0.2.1.2.20050104145418.00b425b8@192.168.2.9>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5.0.2.1.2.20050104145418.00b425b8@192.168.2.9>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND Partitions on ARM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 04, 2005 at 02:59:29PM +0100, Fabrizio Grasso wrote:
> 
> 
> Hi all,
> I'm using S3C2410A from Samsung and SMDK2410 from Aiji System. Kernel is 
> 2.4.18 from MIZI and bootloader is VIVI version 0.1.4 .
> I'm trying to partition my NAND flash (64MB) by using VIVI commands. The 
> result I obtained is:

Really, you should be using a 2.6 kernel, but since no-one seems to
care enough about the support, there has been little work done on
the smdk2410 boards.

pre 2.4.26 is far too old, and all the work is being applied to
the 2.6 series. At least someone has loaned me an smdk2440 to
allow better support for that board.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
