Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lyrc-0005J0-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 21:31:32 +0100
Message-ID: <20010925134029.A22314@recycle.lbl.gov>
Date: Tue, 25 Sep 2001 13:40:29 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: problems with 28F320B still
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

I have troubles turning on the MTD subsystem on
a Bright Star nanoEngine, one of those infamous
boards with an Intel 28F320B3 (non-CFI-compliant)
chip on it. 

With DEBUG_CFI set in drivers/mtd/chips/cfi_probe.c,
a linux-2.4.9-ac9-rmk1-np1 boot log shows:

physmap flash device: 4194304 at 0
Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode
Number of erase regions: 2
  Erase Region #0: BlockSize 0xFFFF00 bytes, 65536 blocks
  Erase Region #1: BlockSize 0xFFFF00 bytes, 65536 blocks
Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
Primary Algorithm Table at 0035
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
Vpp Minimum: b.4 V
Vpp Maximum: c.6 V
Typical byte/word write timeout: 32 5s
Maximum byte/word write timeout: 512 5s
Full buffer write not supported
Typical block erase timeout: 1024 5s
Maximum block erase timeout: 8192 5s
Chip erase not supported
Device size: 0x0 bytes (0 MiB)
Flash Device Interface description: 0xFFFF
  - Not Allowed / Reserved
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2

.... and then hangs.  If I don't try to turn on MTD support,
this machine boots and runs very nicely, thankyouverymuch.

I won't post my full .config file here, it's pretty normal,
the MTD stuff comes out looking like this:

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_JEDEC=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0
CONFIG_MTD_PHYSMAP_LEN=4194304
CONFIG_MTD_PHYSMAP_BUSWIDTH=2
CONFIG_MTD_SA1100=y

(I had to select CONFIG_MTD_CFI in order to get CONFIG_MTD_SA1100;
is that a bug?)

I read the recent postings from Alex Kremer and Daniel Belz.
I don't see that either of their work has been folded into
the current CVS tree, or I'd try that.  If someone is going
to forward port and merge their work into the CVS tree and
from there to np->rmk->ac->lt, I don't want it to be me.
I have other battles to fight ;-) .

Of course, maybe there is something simpler that I'm doing wrong.
Suggestions, anyone?

       - Larry Doolittle   <LRDoolittle@lbl.gov>

P.S. Hi, Erik -- I see we bump into each other again!
