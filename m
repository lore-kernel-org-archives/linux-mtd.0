Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecKZs-00044R-Hy
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 00:30:42 +0000
Date: Thu, 18 Jan 2018 16:30:18 -0800
From: akpm@linux-foundation.org
To: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org, miquel.raynal@free-electrons.com,
 richard@nod.at, sean.nyekjaer@prevas.dk, w@1wt.eu
Subject: [patch 1/1] include/linux/mtd/rawnand.h: fix build with gcc-4.4.4
Message-ID: <5a613c1a.p+Q5+DVAaEi8ctNz%akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrew Morton <akpm@linux-foundation.org>
Subject: include/linux/mtd/rawnand.h: fix build with gcc-4.4.4

gcc-4.4.4 has issues with anon union initializers.  Work aound this.

drivers/mtd/nand/marvell_nand.c:1936: warning: missing braces around initializer
drivers/mtd/nand/marvell_nand.c:1936: warning: (near initialization for '(anonymous)[1].<anonymous>')
drivers/mtd/nand/marvell_nand.c:1936: error: unknown field 'data' specified in initializer
drivers/mtd/nand/marvell_nand.c:1936: error: unknown field 'addr' specified in initializer
drivers/mtd/nand/marvell_nand.c:1936: warning: missing braces around initializer
drivers/mtd/nand/marvell_nand.c:1936: warning: (near initialization for '(anonymous)[1].<anonymous>')
drivers/mtd/nand/marvell_nand.c:1936: error: unknown field 'data' specified in initializer
drivers/mtd/nand/marvell_nand.c:1936: error: unknown field 'addr' specified in i

Fixes: 02f26ecf8c77275 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/mtd/rawnand.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -puN include/linux/mtd/rawnand.h~include-linux-mtd-rawnandh-fix-build-with-gcc-444 include/linux/mtd/rawnand.h
--- a/include/linux/mtd/rawnand.h~include-linux-mtd-rawnandh-fix-build-with-gcc-444
+++ a/include/linux/mtd/rawnand.h
@@ -975,21 +975,21 @@ struct nand_op_parser_pattern_elem {
 	{							\
 		.type = NAND_OP_ADDR_INSTR,			\
 		.optional = _opt,				\
-		.addr.maxcycles = _maxcycles,			\
+		{ .addr = { .maxcycles = _maxcycles }, },	\
 	}
 
 #define NAND_OP_PARSER_PAT_DATA_IN_ELEM(_opt, _maxlen)		\
 	{							\
 		.type = NAND_OP_DATA_IN_INSTR,			\
 		.optional = _opt,				\
-		.data.maxlen = _maxlen,				\
+		{ .data = { .maxlen = _maxlen, }, },		\
 	}
 
 #define NAND_OP_PARSER_PAT_DATA_OUT_ELEM(_opt, _maxlen)		\
 	{							\
 		.type = NAND_OP_DATA_OUT_INSTR,			\
 		.optional = _opt,				\
-		.data.maxlen = _maxlen,				\
+		{ .data = { .maxlen = _maxlen, }, },		\
 	}
 
 #define NAND_OP_PARSER_PAT_WAITRDY_ELEM(_opt)			\
_
