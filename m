Received: from zeus.bridgeport.edu ([216.87.96.66])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8ebf-0004uD-3q
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 09:51:04 -0400
From: itche <itche@bridgeport.edu>
To: linux-mtd@lists.infradead.org
Date: Fri, 26 Aug 2005 09:40:38 -0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200508260940.38685.itche@bridgeport.edu>
Cc: uclinux-dev@uclinux.org
Subject: MTD/uclinux help
Reply-To: itche@bridgeport.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all
I am using the following NAND flash device : Samsung K9F5608UOC
i have tried to add it to the nand_ids.h file with these parameters.
{"Samsung K9F5608UOC",    NAND_MFR_SAMSUNG, 0x75, 25, 0, 2, 0x4000}
However when i boot i get a kernel panic
Any ideas?
thanks in advance
Isack
