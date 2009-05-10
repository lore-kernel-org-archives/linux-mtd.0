Received: from [65.98.92.6] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M32yV-0003OO-7H
	for linux-mtd@lists.infradead.org; Sun, 10 May 2009 06:57:34 +0000
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 9 May 2009 23:41:33 -0700
Subject: [PATCH] mkfs.ubifs: -U option does not take an argument
Message-Id: <372ea0a5bdff3415ed84e5f6666cd42c@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The long form (--squash-uids) is correct, but the short form (-U) is not.

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>

diff -ru mtd-utils.orig/mkfs.ubifs/mkfs.ubifs.c mtd-utils/mkfs.ubifs/mkfs.ubifs.c
--- mtd-utils.orig/mkfs.ubifs/mkfs.ubifs.c	2009-03-17 12:12:09.000000000 -0700
+++ mtd-utils/mkfs.ubifs/mkfs.ubifs.c	2009-05-09 23:37:19.000000000 -0700
@@ -128,7 +128,7 @@
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:P:k:x:X:j:R:l:j:U:";
+static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:P:k:x:X:j:R:l:j:U";
 
 static const struct option longopts[] = {
 	{"root",          1, NULL, 'r'},
