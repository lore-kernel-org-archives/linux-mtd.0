Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNJJ5-0008WS-6V
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 12:30:28 +0000
From: Richard Weinberger <richard@nod.at>
Subject: Cached NAND reads and UBIFS
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <57863449.4070108@nod.at>
Date: Wed, 13 Jul 2016 14:30:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

As discussed on IRC, Boris and I figured that on our target UBIFS is sometimes
very slow.
i.e. deleting a 1GiB file right after a reboot takes more than 30 seconds.

When deleting a file with a cold TNC UBIFS has to lookup a lot of znodes
on the flash.
For every single znode lookup UBIFS requests a few bytes from the flash.
This is slow.

After some investigation we found out that the NAND read cache is disabled
when the NAND driver supports reading subpages.
So we removed the NAND_SUBPAGE_READ flag from the driver and suddenly
lookups were fast. Really fast. Deleting a 1GiB took less than 5 seconds.
Since on our MLC NAND a page is 16KiB many znodes can be read very fast
directly out of the NAND read cache.
The read cache helps here a lot because in the regular case UBIFS' index
nodes are linearly stored in a LEB.

The TNC seems to assume that it can do a lot of short reads since the NAND
read cache will help.
But as soon subpage reads are possible this assumption is no longer true.

Now we're not sure what do do, should we implement bulk reading in the TNC
code or improve NAND read caching?

Thanks,
//richard
