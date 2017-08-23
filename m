Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkWAf-0002nD-0P
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 13:58:23 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd-utils: tests: avoid using only one block in nandpagetest
Date: Wed, 23 Aug 2017 15:57:32 +0200
Message-Id: <20170823135732.12899-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forbid the use of -c1 in nandpagetest which limits the number of blocks
to use at one. In that case, get_first_and_last_block() will return the
same id for both the first and the last blocks. In erasecrosstest(),
the logic is:
- erase/write/read/verify first block
- erase/write again first block
- erase *last* block
- read/verify first block
The case 'first == last' leads to erasing the block before reading it.
Hence the test will fail with no actual reason.

The patch does not forbid the use of -c1 as it could do it in
process_options() with a errmsg_die(). Instead, it warns the user and
uses a second block in order to avoid risking to break existing scripts.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 tests/mtd-tests/nandpagetest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest.c
index 4145ef7..ef6c126 100644
--- a/tests/mtd-tests/nandpagetest.c
+++ b/tests/mtd-tests/nandpagetest.c
@@ -452,6 +452,12 @@ int main(int argc, char **argv)
 	if (ebcnt < 0)
 		ebcnt = (mtd.eb_cnt - peb) / (skip + 1);
 
+	if (ebcnt == 1) {
+		fprintf(stderr,	PROGRAM_NAME
+			" cannot run on a single block, will use 2 instead.\n");
+		ebcnt = 2;
+	}
+
 	if (peb >= mtd.eb_cnt)
 		return errmsg("physical erase block %d is out of range!", peb);
 
-- 
2.11.0
