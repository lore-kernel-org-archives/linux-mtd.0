Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkps0-0007UJ-Ni
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 11:00:18 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH v2] mtd-utils: tests: Avoid using less than two blocks in
 nandpagetest
Date: Thu, 24 Aug 2017 12:59:46 +0200
Message-Id: <20170824105946.13740-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forbid the use of less than 2 eraseblocks in nandpagetest. It is obvious
that the test cannot run on zero block, but it cannot run on only one
block neither. The reason is: get_first_and_last_block() will return the
same id for both the first and the last blocks. In erasecrosstest(),
the logic is:
- erase/write/read/verify first block
- erase/write again first block
- erase *last* block
- read/verify first block
When using only one block, 'first' refers to the same block as 'last',
leading to erasing the block before reading it. Hence, the test would
fail with no actual reason.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 tests/mtd-tests/nandpagetest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest.c
index 4145ef7..86c9005 100644
--- a/tests/mtd-tests/nandpagetest.c
+++ b/tests/mtd-tests/nandpagetest.c
@@ -65,7 +65,7 @@ static void usage(int status)
 	"Options:\n"
 	"  -h, --help         Display this help output\n"
 	"  -b, --peb <num>    Index of the first erase block to use\n"
-	"  -c, --count <num>  Number of erase blocks to use (default all)\n"
+	"  -c, --count <num>  Number of erase blocks to use (at least 2, default all)\n"
 	"  -s, --skip <num>   Number of erase blocks to skip\n"
 	"  -S, --seed <num>   Seed for pseudor random number generator\n"
 	"  -k, --keep         Restore existing contents after test\n",
@@ -143,6 +143,8 @@ static void process_options(int argc, char **argv)
 
 	if (optind < argc)
 		usage(EXIT_FAILURE);
+	if (ebcnt < 2)
+		errmsg_die("Cannot run with less than two blocks.");
 	if (peb < 0)
 		peb = 0;
 	if (!(flags & SEED_SET))
-- 
2.11.0
