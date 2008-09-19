Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kgk8j-0003Je-4X
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 17:51:33 +0000
Received: from ben by kira.home.fluff.org with local (Exim 4.69)
	(envelope-from <ben@fluff.org.uk>) id 1Kgk8d-0001gO-Px
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 18:51:27 +0100
Date: Fri, 19 Sep 2008 18:51:27 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Linut MTD <linux-mtd@lists.infradead.org>
Subject: loading cramfs initrd at startup
Message-ID: <20080919175127.GB4322@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am looking at a customer who's system loads an cramfs initrd
from /dev/mtdblock1 (NAND) via a hack that makes mtdblock map
out bad blocks so that the initrd loader does not see errors
during the load.

I was wondering if anyone had any comments about a better way
to do this without patching up drivers/mtd/mtdblock.c?

My initial thoughts are:

1) Add a configuration option to make mtdblock remove any defects
   from a specified parititon (fromalise the hack)

2) Add new block device, possibly named mtdcont which provides an
   read-only interface and a similar function to mtdblock but
   mapping out the defects.

3) Change the initrd loader to understand the block layout of the
   system and skip bad blocks during loading.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
