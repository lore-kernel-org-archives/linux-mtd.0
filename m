Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wrWC-0006IJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 21:54:24 +0100
Message-ID: <20011025140330.A3495@recycle.lbl.gov>
Date: Thu, 25 Oct 2001 14:03:30 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: TE28F320B3B madness :(
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Alex Kremer wrote:

> Larry Doolittle recently (couple of weeks ago) added support for the B3
> (Boot Block) line via jedec_probe and cfi_cmdset_001.

Yes, I did this for my own use, but Russell King did so
independently, and his version got checked in to CVS.
Plus, he knows what he's doing, so his version is
better (after I had him clarify the part numbers).

> You will need to replace  "cfi_probe" with "jedec_probe" in do_map_probe()
> from the maps driver (drivers/mtd/maps) you are using.

That's quite true.  Correct me if I'm wrong, but I think it
should _always_ be safe to probe for JEDEC first, and CFI
second.  So _all_ the mtd/maps drivers should do this,
and there should in fact be a systematic method that they
all use.  Like having a "map_flash" virtual probe that calls
first "jedec" and then "cfi_probe", if and only if each in
turn is compiled into the kernel.

      - Larry
