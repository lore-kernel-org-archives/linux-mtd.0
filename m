Received: from mail1.cray.com ([136.162.0.111])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgAK8-0007kM-5n
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 18:46:33 -0400
Received: from relaya.us.cray.com (relaya.us.cray.com [192.168.252.144])
	by mail1.cray.com (8.12.10/8.12.10/gw-1.4) with ESMTP id i61MkOLl001249
	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 17:46:24 -0500 (CDT)
Received: from orchid.us.cray.com (orchid.us.cray.com [172.30.27.91])
	by relaya.us.cray.com (8.12.10/8.12.10/hub-1.3) with ESMTP id
	i61MkLBu026008 for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 17:46:21 -0500 (CDT)
Received: from cray.com (troll [192.168.250.5])
	by orchid.us.cray.com (8.12.10/8.12.8/badger-1.4) with ESMTP id
	i61MkKdm2015578 for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 17:46:20 -0500 (CDT)
Message-ID: <40E4941B.7070103@cray.com>
Date: Thu, 01 Jul 2004 17:45:47 -0500
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <40E448BD.8030909@cray.com> <200407012100.28033.tglx@linutronix.de>
In-Reply-To: <200407012100.28033.tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="------------070507070705040101050801"
Subject: Re: nand oob corruption recovery
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070507070705040101050801
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Relevant to this; enclosed is small nandwrite.c patch that fixes 
segfault and at least warns about upcomming OOB destruction in 
large-block devices.

-dbu.

--------------070507070705040101050801
Content-Type: text/x-patch;
 name="nandwrite.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nandwrite.patch"

--- mtd/util/nandwrite.c.orig	2004-07-01 17:09:12.124117544 -0500
+++ mtd/util/nandwrite.c	2004-07-01 17:16:44.497346360 -0500
@@ -42,8 +42,8 @@
 /*
  * Buffer array used for writing data
  */
-unsigned char writebuf[512];
-unsigned char oobbuf[16];
+unsigned char *writebuf;
+unsigned char *oobbuf;
 
 // oob layouts to pass into the kernel as default
 struct nand_oobinfo none_oobinfo = { 
@@ -223,6 +223,19 @@
 		close(fd);
 		exit(1);
 	}
+
+	/* NOW! allocate writebuf and oobbuf.. */
+	writebuf = malloc (meminfo.oobblock);
+	oobbuf = malloc (meminfo.oobsize);
+	if (!writebuf || !oobbuf)
+		perror ("cannot allocate buffers\n");
+	if ((forcejffs2 || forceyaffs || autoplace) && (meminfo.oobsize > 16))
+	{
+		fprintf (stderr, "\nDanger!Danger! Will Robinson, Overriding driver's AUTO_ECC layout for \nlarge-block chips will almost certainly trash OOB!\n Continue? (y/N)\n");
+		if (getchar () != 'y') {
+			exit(1);
+		}
+	}
 	
 	// write without ecc ?
 	if (noecc) {

--------------070507070705040101050801--
