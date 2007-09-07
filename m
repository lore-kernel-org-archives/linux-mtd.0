Received: from mga02.intel.com ([134.134.136.20])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ITeZN-00040d-Gk
	for linux-mtd@lists.infradead.org; Fri, 07 Sep 2007 10:12:30 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] CFI support P30 with CFI1.5 enabled
Date: Fri, 7 Sep 2007 18:12:17 +0400
Message-ID: <523F3D8D8C97554AA47E53DF1A05466A01234DF1@nnsmsx411.ccr.corp.intel.com>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Cc: dwmw2@infradead.org, "Anderson, Eric P" <eric.p.anderson@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I faced some issues using P30 with CFI 1.5 in latest Linux kernel.=20
According to the specification the changes between CFI1.4 and CFI 1.5
are minor - and the difference won't affect the CFI code at all except
check of CFI version. So fix is trivial.

Could you please submit this fix?

Thanks,
Alexey

Signed-off-by: Alexey Korolev <alexey.korolev at intel.com>

P30 support with CFI1.5 enabled

diff -aur P30_1.4/drivers/mtd/chips/cfi_cmdset_0001.c
P30_1.5/drivers/mtd/chips/cfi_cmdset_0001.c
--- P30_1.4/drivers/mtd/chips/cfi_cmdset_0001.c	2007-09-07
18:01:19.000000000 +0400
+++ P30_1.5/drivers/mtd/chips/cfi_cmdset_0001.c	2007-09-07
18:00:00.000000000 +0400
@@ -276,7 +276,7 @@
 		return NULL;
=20
 	if (extp->MajorVersion !=3D '1' ||
-	    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
+	    (extp->MinorVersion < '0' || extp->MinorVersion > '5')) {
 		printk(KERN_ERR "  Unknown Intel/Sharp Extended Query "
 		       "version %c.%c.\n",  extp->MajorVersion,
 		       extp->MinorVersion);
