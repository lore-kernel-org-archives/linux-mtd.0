Received: from mail-ea0-f175.google.com ([209.85.215.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0caK-00017i-27
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 19:45:11 +0000
Received: by mail-ea0-f175.google.com with SMTP id z10so412021ead.20
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 11:44:42 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com, shijie8@gmail.com
Subject: [PATCH v0] mtd: gpmi: Use cached syndromes to speedup erased region
 bitflip detection.
Date: Tue,  7 Jan 2014 20:44:32 +0100
Message-Id: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

This patch is incremental with respect to 'mtd: gpmi: Deal with bitflips in 
erased regions' currently in its 7th version, which I consider more or less
stable.
The 7th version of that patch removed however a fast path option which 
resulted in a flash throughput decrease. Everytime an erased block is read,
each individual byte has its hamming weight calculated and bitflips corrected
in software. I'm testing this on a poor old i.mx28 which isn't an powerful
beast. 

Hence I've been looking for a way to regain some of the performance which 
was lost (at the cost of making ubifs more reliable). And I've been a bit
insipired by Pekon Gupta's work on omap (where I stole the first hamming 
weight approach). 

Apparently the BCH block has the possibility to write the syndrome data
to auxiliary memory (where also the status bytes are stored) when setting 
the HW_BCH_CTRL:DEBUGSYNDROME). Hence I followed the approach where the 
first time a correctly erase block is found these syndromes are cached 
and future reads of likely-to-be--erased blocks can be identified based
on the comparison of these syndroms as opposed to checking each individual
bytes. For example on my 2k chip I would normally get the hamming weight 
of 4 (chunks) of 512 bytes aka 2k bytes. But with an ecc8 I can replace 
this by a memcmp() of 4x32 bytes. (4 sets of syndromes). The result is 
obviously that the processor is more eager to do this resulting in a 
regaining some of the lost speed.

I did some benchmarking on the following 2k and 4k nand chips:
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT29F4G08ABAEAH4), 512MiB, page size: 4096, OOB size: 224
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAH4), 256MiB, page size: 2048, OOB size: 64

By simply doing time dd if=/dev/mtd8 of=/dev/null bs=1M and calculating 
the throughput (in megabyte/s). This gave the following results:

2k  |4k
========
7.0 |11.3 <- v6 of the bitflips correction path (broken fast path)
4.7 |5.9  <- v7 of the bitflip correction patch (no fast path)
5.9 |8.4  <- with this patch applied.

(Some background info, I expect these chips to be less than half used,
hence plenty of erased blocks, also the NAND timings are already optimized
for these chips).

I have tested this on the chips above on Linux 3.9 and rebased this patch
to l2-mtd (however my test mainly concluded the legacy geometry part). 

A side node, two pair of syndromes are stored, the first syndromes cover 
the first data block AND the metadata (more 0xff's) and the second set only
covers n-1 datablocks.

Any feedback regarding this approach/patch is welcomed.

Thanks
E.


Elie De Brauwer (1):
  mtd: gpmi: Use cached syndromes to speedup erase region bitflip
    detection.

 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  1 +
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  4 ++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 95 ++++++++++++++++++++++++++++++++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  6 +++
 4 files changed, 101 insertions(+), 5 deletions(-)

-- 
1.8.5.2
