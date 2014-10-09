Received: from ec2-54-201-57-178.us-west-2.compute.amazonaws.com
 ([54.201.57.178] helo=ip-172-31-12-36.us-west-2.compute.internal)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcGPI-00035J-86
 for linux-mtd@lists.infradead.org; Thu, 09 Oct 2014 16:17:36 +0000
Date: Thu, 9 Oct 2014 16:17:07 +0000
From: dwalker@fifo99.com
To: Jochen Schaeuble <psionic@psionic.de>
Subject: slram on mapped ram areas
Message-ID: <20141009161707.GA18921@fifo99.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@wh.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It seems that slram was made for access parts of memory not used by the system,
or not mapped (right terminology?). I wanted to use it on memory which is mapped
or memory that can be used by the system. The problem I have is that the system I
work on places a filesystem image in memory someplace, and send the physical address
and size of the area as boot parameters. The memory where the images ends up is not
special memory.

I made the following changes to your driver (somewhat condensed),

1) Added memblock_reserve() on the memory region
2) Added an insert_resource() call to the memory
3) Altered the driver to not use ioremap, instead use __va() conditionally.

This worked. I was able to access the memory via the typical mtd
userspace interface.

So is this something acceptable to add to the slram driver?

Should it go someplace else?

Does the functionality to do this exists someplace already ?

I just wanted to send out feelers before I send any patches..

Daniel
