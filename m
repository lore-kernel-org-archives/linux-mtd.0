Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTr7e-0003UV-Ta
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 12:12:56 +0000
From: rnd4@dave-tech.it
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Use badblockbits-like approach in nand_bbt.c
Date: Fri,  6 Mar 2015 13:12:16 +0100
Message-Id: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
Cc: boris.brezillon@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I'm currenlty working with an MLC NAND (MT29F32G08CBACAWP) on a iMX6 based
platform (kernel 3.10.17).
The first problem I have is about badblock detection. I experienced a lot of bit
flips on badblock marker (some of them probalbly due misuse, e.g. powercut).

By looking into the MDT code, I've found that inside nand_base.c there's support
for badblockbits feature, which, for short, allow to tolerate 1 or more bitflip
when looking for BB.

In my experience usually the marker is 0x00 for bad blocks and 0xFF for good one
(at least this is true for my current component).

Unfortunately this approach is not used into BBT code (nand_bbt.c) and thus I have
a lot of false positive BB.

With the following patches I try to add badblockbits-like approach to nand_bbt.c
code.

The first patch is optional and configure badblockbits depending on SLC vs MLC NAND.

The second patch implements the badblockbits approach into BBT scan.
Please note that this is not usually enough, because many NAND controller override
nand_bbt_descr and thus requires changes also the the specific controller driver.

The patch has been made in collaboration with Boris Brezillon (thank you for you
suggestions Boris).

I tested it on a 3.10.17 kernel, but the second patch applies fine to
v3.10 stable and latest 4.0-rc1 (the first patch needs some changes to apply to this
one).

Feel free to comment it and tell me if something can be done in a better way

Best Regards,

Andrea Scian
DAVE Embedded Systems
