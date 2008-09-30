Received: from web58905.mail.re1.yahoo.com ([66.196.100.234])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kkji0-0003gW-AH
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 18:12:29 +0000
Date: Tue, 30 Sep 2008 11:12:27 -0700 (PDT)
From: Philip Rakity <prakity@yahoo.com>
Subject: mtdparts= documentation change
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <392584.84807.qm@web58905.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recently I tried to figure out where the name of the mtd disk came from since I was modifying cafe_nand.c to do command line parsing (patch coming for this later in the week).  I could not find an explicit reference so I hacked the code to only find out that it can be easily seen by issuing the command

cat /proc/mtd

I know it also is in the bootup console output (now !)
.

The following patch would help make explicit how to find the name.

--- /Volumes/unix/linux-2.6.26.5/drivers/mtd/cmdlinepart.c      2008-09-08 10:40:20.000000000 -0700
+++ Desktop/cmdlinepart_new.c   2008-09-29 18:00:46.000000000 -0700
@@ -11,6 +11,7 @@
 * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
 * <partdef> := <size>[@offset][<name>][ro][lk]
 * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
+ *              eg: this is the name seen in "cat /proc/mtd/" output
 * <size>    := standard linux memsize OR "-" to denote all remaining space
 * <name>    := '(' NAME ')'
 *

signed off by Philip Rakity



      
