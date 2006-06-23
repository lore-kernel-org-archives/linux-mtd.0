Received: from host-84-9-201-23.bulldogdsl.com ([84.9.201.23]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtpLd-000088-Pw
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 13:21:41 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1FtpLW-0004Q3-00
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 18:21:30 +0100
Date: Fri, 23 Jun 2006 18:21:30 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: patch with header files not in mtd includes
Message-ID: <20060623172130.GA12107@home.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have udpates for the s3c2410 nand driver which
includes register updates for the header file
include/asm-arm/arch-s3c2410/regs-nand.h.

Is it ok to send this as one patch, or does it
need the include splitting and sending to rmk?
A seperate split will mean a possible small period
when the driver will not build.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
