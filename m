Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jrndn-00039u-25
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 05:17:03 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jrndk-0003Vo-5o
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 00:17:00 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jrndf-0001k5-GB
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 15:16:55 +1000
Date: Fri, 2 May 2008 15:16:55 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: support --squash-uids
Message-ID: <20080502051655.GA6654@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mkfs.jffs2 and genext2fs both have a -U/--squash-uids switch which make
them ignore the uid/gids in the directory and set them to 0:0 instead.

Here's my implementation for mkfs.ubifs.

Signed-off-by: Hamish Moffatt <hamish@cloud.net.au>

--
Those tools also have a -P/--squash-perms switch which I haven't
implemented due to lack of need.

Index: mkfs.ubifs/mkfs.ubifs.c
===================================================================
--- mkfs.ubifs/mkfs.ubifs.c	(revision 4400)
+++ mkfs.ubifs/mkfs.ubifs.c	(working copy)
@@ -98,6 +98,7 @@
 static struct stat root_st;
 static char *output;
 static int out_fd;
+static int squash_owner;
 
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
@@ -120,7 +121,7 @@
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:p:k:x:j:l:j:";
+static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:p:k:x:j:l:j:U";
 
 static const struct option longopts[] = {
 	{"root"        , 1, NULL, 'r'},
@@ -139,6 +140,7 @@
 	{"keyhash"     , 1, NULL, 'k'},
 	{"log-lebs"    , 1, NULL, 'l'},
 	{"orph-lebs"   , 1, NULL, 'p'},
+	{"squash-uids" , 0, NULL, 'U'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -159,6 +161,7 @@
 "  -l, --log-lebs=COUNT    Use COUNT erase blocks for the log\n"
 "  -p, --orph-lebs=COUNT   Use COUNT erase blocks for orphans (default: 1)\n"
 "  -D, --devtable=FILE     Use device table FILE\n"
+"  -U, --squash-uids       Squash owners making all files owned by root\n"
 "  -v, --verbose           Verbose operation\n"
 "  -V, --version           Display version information\n"
 "  -g, --debug=LEVEL       Display debug information (0 - none, 1 - statistics,\n"
@@ -509,6 +512,9 @@
 			if (c->max_bud_bytes < 0)
 				return -1;
 			break;
+		case 'U':
+			squash_owner = 1;
+			break;
 		}
 	}
 
@@ -885,8 +891,8 @@
 	ino->atime.sec  = cpu_to_le32(st->st_atime);
 	ino->ctime.sec  = cpu_to_le32(st->st_ctime);
 	ino->mtime.sec  = cpu_to_le32(st->st_mtime);
-	ino->uid        = cpu_to_le32(st->st_uid);
-	ino->gid        = cpu_to_le32(st->st_gid);
+	ino->uid        = cpu_to_le32((squash_owner) ? 0 : st->st_uid);
+	ino->gid        = cpu_to_le32((squash_owner) ? 0 : st->st_gid);
 	ino->mode       = cpu_to_le32(st->st_mode);
 	ino->flags      = cpu_to_le32(use_flags);
 	ino->data_len   = cpu_to_le32(data_len);
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
