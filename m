Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tW5l-0001fn-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 16:25:17 +0100
Message-ID: <20011016083420.A18642@recycle.lbl.gov>
Date: Tue, 16 Oct 2001 08:34:20 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: NAND flash
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

Steven J. Hill wrote:
> First of all, the NAND FLASH driver was written for raw NAND flash
> chips that were IO mapped into the address space.
> ...
> SmartMedia is an entirely different beast in that has a some hardware
> between the CPU and the NAND flash chips inside. It is similar to
> Disk-On-Chip devices which use NAND/NOR flash with wear-leveling,
> error correcting and other things done transparently in the hardware.

I think you should double check that assertion.  My understanding is
that the "Smart" in the name is a bug.  These are actually NAND chips,
consumer-grade packaged, standardized, and marketed, with no smarts at
all.  So you _could_ use the nand.c driver, with the right interface-
specific wrapper layer to get at the device.

Unfortunately, the result would not be content-compatible with other
SmartMedia users, because SmartMedia also has a standard for encoding
blocks on the nand chips.  I tried to read that standard, but the PDF
file is encrypted in a way that is incompatible with xpdf-0.92.  The
URL for that reference material has been posted here before, it's
 http://www.ssfdc.or.jp/spec/english/

      - Larry
