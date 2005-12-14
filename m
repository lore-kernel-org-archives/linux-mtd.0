Received: from allen.werkleitz.de ([80.190.251.108])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EmXZT-00063d-0Q
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 14:25:31 +0000
Received: from p54bea901.dip0.t-ipconnect.de ([84.190.169.1] helo=void.local)
	by allen.werkleitz.de with esmtpsa
	(TLS-1.0:DHE_RSA_3DES_EDE_CBC_SHA1:24) (Exim 4.60)
	(envelope-from <js@linuxtv.org>) id 1EmXZB-00048j-ME
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 15:25:19 +0100
Received: from js by void.local with local (Exim 3.35 #1 (Debian))
	id 1EmXZA-0002gn-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2005 15:25:12 +0100
Date: Wed, 14 Dec 2005 15:25:12 +0100
From: Johannes Stezenbach <js@linuxtv.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051214142512.GA10310@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Fix mounting jffs2 by mtd name
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Busybox mount insists that mtd: refers to a NFS mount:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00004000 "foo"
# mount mtd:foo /mnt -t jffs2
mount: mtd: Unknown host
mount: nfsmount failed: Connection refused
mount: Mounting mtd:foo on /mnt failed: Invalid argument

I suggest new syntax:

# mount mtd/foo /mnt -t jffs2

Signed-off-by: Johannes Stezenbach <js@linuxtv.org>

Index: fs/jffs2/super.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/super.c,v
retrieving revision 1.112
diff -u -p -r1.112 super.c
--- fs/jffs2/super.c	24 Nov 2005 16:13:25 -0000	1.112
+++ fs/jffs2/super.c	14 Dec 2005 14:05:58 -0000
@@ -208,7 +208,7 @@ static struct super_block *jffs2_get_sb(
 
 	if (dev_name[0] == 'm' && dev_name[1] == 't' && dev_name[2] == 'd') {
 		/* Probably mounting without the blkdev crap */
-		if (dev_name[3] == ':') {
+		if (dev_name[3] == '/') {
 			struct mtd_info *mtd;
 
 			/* Mount by MTD device name */
