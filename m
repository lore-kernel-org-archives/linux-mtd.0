Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CJXcQ-00076s-Di
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2004 09:32:16 -0400
Date: Mon, 18 Oct 2004 15:32:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Manfred Gruber <gruber.m@utanet.at>
Message-ID: <20041018133205.GA11394@wohnheim.fh-wedel.de>
References: <20041015130518.GE16136@wohnheim.fh-wedel.de>
	<200410180906.08375.gruber.m@utanet.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200410180906.08375.gruber.m@utanet.at>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: phram/slram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 October 2004 09:06:07 +0200, Manfred Gruber wrote:
> 
> 2.6.9 -rc1. When none have the same problem with phram. Than it is a problem 
> on my arm board :-(

Most people have problems with neither phram or slram working.  Below
is a patch for 2.6.8 (should still apply with -rc1) that fixes the
problem.

Will send it to akpm when 2.6.9 is out.

Jörn

-- 
It's not whether you win or lose, it's how you place the blame.
-- unknown


Finally make phram work again:
o Add simple usage example.
o Fix up unit handling (k, M. G).
o Use correct size limit for setup string.
o Remove pointless printk message.
o Fix mtdblock to not allocate a read-modify-write buffer for CAP_RAM
  devices (and fail to do so, returning an error).

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 devices/phram.c |   10 ++++++----
 mtdblock.c      |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)


--- linux-2.6.8cow/drivers/mtd/devices/phram.c~phram_fix	2004-09-05 11:57:14.000000000 +0200
+++ linux-2.6.8cow/drivers/mtd/devices/phram.c	2004-09-05 11:58:00.000000000 +0200
@@ -18,6 +18,9 @@
  * by "k", "M" or "G", the numbers will be interpreted as kilo, mega or
  * gigabytes.
  *
+ * Example:
+ *	phram=swap,896M,110M phram=test,1006M,1M
+ *
  */
 
 #include <asm/io.h>
@@ -184,7 +187,7 @@
 		result *= 1024;
 	case 'k':
 		result *= 1024;
-		endp++;
+		(*endp)++;
 	}
 	return result;
 }
@@ -235,7 +238,7 @@
 	uint32_t len;
 	int i, ret;
 
-	if (strnlen(val, sizeof(str)) >= sizeof(str))
+	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
 		parse_err("parameter too long\n");
 
 	strcpy(str, val);
@@ -283,7 +286,7 @@
 	if (!val || !val[0])
 		parse_err("no arguments to \"slram=\"\n");
 
-	if (strnlen(val, sizeof(str)) >= sizeof(str))
+	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
 		parse_err("parameter too long\n");
 
 	strcpy(str, val);
@@ -342,7 +345,6 @@
 
 int __init init_phram(void)
 {
-	printk(KERN_ERR "phram loaded\n");
 	return 0;
 }
 
--- linux-2.6.8cow/drivers/mtd/mtdblock.c~phram_fix	2004-09-05 11:57:14.000000000 +0200
+++ linux-2.6.8cow/drivers/mtd/mtdblock.c	2004-09-05 11:58:00.000000000 +0200
@@ -248,7 +248,7 @@
 			      unsigned long block, char *buf)
 {
 	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
-	if (unlikely(!mtdblk->cache_data)) {
+	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
 		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
 		if (!mtdblk->cache_data)
 			return -EINTR;
