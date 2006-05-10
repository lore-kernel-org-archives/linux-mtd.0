Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdlMS-0003Kr-Lc
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 05:52:13 -0400
Message-ID: <4461B7CD.9010100@ru.mvista.com>
Date: Wed, 10 May 2006 13:52:13 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

there had recently been some talks around $Subject... and I'm personally 
interested in implementing that, both professionally and as an 
open-source guy :)

The problem, as most of you know well, is that currently existing 
compressed read-only filesystems don't support bad block handling. OTOH, 
it's quite an attractive idea to use those for root filesystem of an 
embedded device.
As a filesystem is read-only, wear-out can't occur during the normal 
use, only on root filesystem upgrade. Therefore writing it using a tool 
like nandwrite that bypasses bad blocks seems to be enough, and the only 
thing needed is either an in-MTD layer that makes a partition look as if 
there's no babd blocks, or  similar means within a filesystem.

The only known implementation goes the former way (though I recall some 
attempts for squashfs to implement the latter one). It's at 
http://lists.infradead.org/pipermail/linux-mtd/2004-May/009695.html.
The main drawbacks I see in the implementation are:
- adds more functions/vars to struct mtd_info which is apparently a bad 
idea (it's already overcomplicated)
- modifies a lot of generic files (i. e. CFI command set 
implementations, etc.)
- possibly exposed to FTL/NFTL patents

What I'd like to suggest is to rework this patch to get rid of these 
(and probably some more) drawbacks.
Ideas:
1. Implement it on top of NAND layer.
    - use NAND bad block table, but make its construction lazy in order 
to decrease boot time (might be a useful idea anyway)
    - use tree-like structure to calculate the offset between the block 
number supplied and the actual block to read (alternatively, just add 
the how-many-to-add info to BBT entries)
2. Implement it on top of MTD layer.
    - might be reasonable to use mtdblock_ro for that
    - might be reasonable to make bad block table global for all MTD 
devices, not for NAND only and, once again, add an option to construct 
it lazily.

Comments, corrections and suggestions are welcome.

Thx,
   Vitaly
