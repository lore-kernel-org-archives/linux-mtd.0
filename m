Received: from web58907.mail.re1.yahoo.com ([66.196.100.236])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KniVo-00086I-F8
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 23:32:12 +0000
Date: Wed, 8 Oct 2008 16:32:11 -0700 (PDT)
From: Philip Rakity <prakity@yahoo.com>
Subject: [PATCH] [MTD] documentation change - explain where mtd-id comes from
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <563213.93552.qm@web58907.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Philip Rakity <prakity@yahoo.com>

--- linux-2.6.26.5/drivers/mtd/cmdlinepart.c.orig       2008-10-08 16:27:30.000000000 -0700
+++ linux-2.6.26.5/drivers/mtd/cmdlinepart.c    2008-10-08 16:29:00.000000000 -0700
@@ -9,6 +9,7 @@
  *
  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
+ *              where <mtd-id> is the name from the "cat /proc/mtd" command
  * <partdef> := <size>[@offset][<name>][ro][lk]
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
~                                                                                                                                                                                                                           


      
