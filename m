Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uCJA-0003UV-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 14:34:28 +0100
Date: Wed, 25 Sep 2002 15:34:11 +0200 (CEST)
From: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
To: Russ Dill <Russ.Dill@asu.edu>
cc: Srinivasan.Ramasubramaniam@nokia.com, <elf@buici.com>,
   <kenneth.johansson@etx.ericsson.se>, <linux-mtd@lists.infradead.org>
Subject: RE: Interest in DOC and YAFFS? --> YAFFS bootloading
In-Reply-To: <1032943112.23565.15.camel@russ>
Message-ID: <Pine.LNX.4.44.0209251531440.32689-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 25 Sep 2002, Russ Dill wrote:

> the compressed cramfs image will be loaded into ram, and then, from
> there, as pages are needed, they will be decompressed again and put into
> ram (but again, if memory is in a pinch, these pages can be dropped). I
> don't know if an ext2 initrd will do XIP (execute in place), but I
> somehow doubt that anyone has worked on that, meaning that the pages
> would need to be copied again, in which case, a cramfs would use less
> ram.

I have never succeded in getting cramfs to work from a ramdisk.. it does 
something magic with blocksizes that seems to srew up the ramdisk data 
(first blocks get "forgotten").

As the ramdisk is living within the buffer cache a ext2 image most likely 
will do XIP.

Regards
Henrik
