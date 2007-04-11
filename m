Received: from 203-96-159-182.paradise.net.nz ([203.96.159.182]
	helo=hayes.bluewaternz.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbTHx-0001Ao-6L
	for linux-mtd@lists.infradead.org; Tue, 10 Apr 2007 23:14:30 -0400
Message-ID: <461C5290.6090202@bluewatersys.com>
Date: Wed, 11 Apr 2007 15:14:24 +1200
From: Andre Renaud <andre@bluewatersys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] Casting bug in nand_default_block_markbad
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a slight bug in nand_default_block_markbad, where the offset is
cast to an integer, prior to being shifted. This means that on large
offsets, it is incorrectly doing a signed shift & losing bits. Fixed
this by doing the cast after the shift (as is done elsewhere in the code).

Signed-off-by: Andre Renaud <andre@bluewatersys.com>

Index: drivers/mtd/nand/nand_base.c
===================================================================
--- drivers/mtd/nand/nand_base.c        (revision 957)
+++ drivers/mtd/nand/nand_base.c        (working copy)
@@ -355,7 +355,7 @@
        int block, ret;

        /* Get block number */
-       block = ((int)ofs) >> chip->bbt_erase_shift;
+       block = (int)(ofs >> chip->bbt_erase_shift);
        if (chip->bbt)
                chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);

-- 
Bluewater Systems Ltd - ARM Technology Solutions Centre

       Andre Renaud                             Bluewater Systems Ltd
Phone: +64 3 3779127 (Aus 1 800 148 751)        Level 17, 119 Armagh St
Fax:   +64 3 3779135                            PO Box 13889
Email: arenaud@bluewatersys.com                 Christchurch
Web:   http://www.bluewatersys.com              New Zealand
