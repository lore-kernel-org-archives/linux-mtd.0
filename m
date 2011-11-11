Received: from saturn.retrosnub.co.uk
 ([2001:470:9321:f003:bc9d:1dff:fe9b:7466])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROuYd-0007vE-UB
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2011 17:06:28 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [Regression PATCH] pxa2xx-flash.c: Not falling back to partition
 table as it previously did.
Date: Fri, 11 Nov 2011 17:06:19 +0000
Message-Id: <1321031180-6153-1-git-send-email-jic23@kernel.org>
Cc: dbaryshkov@gmail.com, Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
 Jonathan Cameron <jic23@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd: pxa2xx-flash.c: use mtd_device_parse_register 

changed the behaviour, at least for stargate2.

Previously it used the contents of flash->partitions
to init the partitions. Now those are ignored.
The following is a trivial fix. I have no idea if
this is the right fix though.

If I've missed a patch fixing this, sorry for the noise.

Jonathan

Jonathan Cameron (1):
  mtd: pxa2xx-flash.c: It used to fall back to provided table.

 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.7.2
