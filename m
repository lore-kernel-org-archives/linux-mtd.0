Received: from mgw-x1.nokia.com ([131.228.20.21])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1C9KFl-00080r-IF
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 05:14:35 -0400
Received: from esdks004.ntc.nokia.com (esdks004.ntc.nokia.com [172.21.138.159])
	by mgw-x1.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	i8K9EV118229 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2004 12:14:31 +0300 (EET DST)
Received: (from root@localhost)
	by esdks004.ntc.nokia.com (8.12.9/8.12.9) id i8K9EJDd000614
	for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2004 12:14:19 +0300
Received: from [172.21.38.96] (two.research.nokia.com [172.21.38.96])
	by mgw-int1.ntc.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	i8K9EGY02327 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2004 12:14:16 +0300 (EET DST)
From: Juha =?ISO-8859-1?Q?Yrj=F6l=E4?= <juha.yrjola@nokia.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-/i3oAE5HXxACTlgo/s/9"
Date: Mon, 20 Sep 2004 12:14:16 +0300
Message-Id: <1095671656.24922.88.camel@two.research.nokia.com>
Mime-Version: 1.0
Subject: [PATCH] Remove staticness from mtdpart_setup()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/i3oAE5HXxACTlgo/s/9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

Attached is a patch that removes the static and __init keywords from
mtdpart_setup(), so that the mtdpart partition definitions can come from
other sources than the kernel command line.  This is useful if you have
another way of passing information to the kernel, e.g. the ATAG
mechanism on ARM kernels, and do not want to override CONFIG_CMDLINE
from the bootloader.

Cheers,
Juha


--=-/i3oAE5HXxACTlgo/s/9
Content-Disposition: attachment; filename=mtdpart-staticness-patch.diff
Content-Type: text/x-patch; name=mtdpart-staticness-patch.diff;
	charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

===== drivers/mtd/cmdlinepart.c 1.8 vs edited =====
--- 1.8/drivers/mtd/cmdlinepart.c	2004-08-03 13:17:08 +03:00
+++ edited/drivers/mtd/cmdlinepart.c	2004-09-20 11:36:46 +03:00
@@ -339,7 +339,7 @@
  * main.c::checksetup(). Note that we can not yet kmalloc() anything,
  * so we only save the commandline for later processing.
  */
-static int __init mtdpart_setup(char *s)
+int mtdpart_setup(char *s)
 {
 	cmdline = s;
 	return 1;

--=-/i3oAE5HXxACTlgo/s/9--
