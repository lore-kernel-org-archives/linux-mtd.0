Received: from smtp8-g19.free.fr ([212.27.42.65])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJQYw-0005q7-Qn
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 03:41:30 -0500
Received: from [192.168.1.5] (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp8-g19.free.fr (Postfix) with ESMTP id D6A941681F
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Feb 2007 09:41:20 +0100 (CET)
Message-ID: <45DAB42B.5070703@free.fr>
Date: Tue, 20 Feb 2007 09:41:15 +0100
From: Eric BENARD <ebenard@free.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: CFI MinorVersion 5 with P33 Strataflash
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

Hi,

I'm using Intel's Strataflash RC48F440090TB00 on an IXP465 and found
that this chip is returning a CFI MinorVersion of 5 which makes
read_pri_intelext return an error in cfi_cmdset_0001.c and prevent flash
detection.

The following patch is a workaround for this issue but I didn't find any
reference to this value of CFI MinorVersion, even in the datasheet
(which may not be up to date as P33 should be only the full 3V3 version
of P30).

After this change he flash is properly detected and everything is fine
with all the MTD layer.

Eric

diff -Nru -X /home/ebenard/dontdiff-osdl
linux-2.6.20_orig/drivers/mtd/chips/cfi_cmdset_0001.c
linux-2.6.20/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.20_orig/drivers/mtd/chips/cfi_cmdset_0001.c	2007-02-04
19:44:54.000000000 +0100
+++ linux-2.6.20/drivers/mtd/chips/cfi_cmdset_0001.c	2007-02-08
12:11:32.000000000 +0100
@@ -263,7 +263,7 @@
 		return NULL;

 	if (extp->MajorVersion != '1' ||
-	    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
+	    (extp->MinorVersion < '0' || extp->MinorVersion > '5')) {
 		printk(KERN_ERR "  Unknown Intel/Sharp Extended Query "
 		       "version %c.%c.\n",  extp->MajorVersion,
 		       extp->MinorVersion);
