Received: from na3sys009aog103.obsmtp.com ([74.125.149.71])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMnec-0005e2-4O
	for linux-mtd@lists.infradead.org; Wed, 18 May 2011 20:47:38 +0000
Received: by mail-vx0-f181.google.com with SMTP id 39so1565189vxb.26
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2011 13:47:31 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: don't fail on -EBADMSG when fixing free space
Date: Wed, 18 May 2011 16:47:27 -0400
Message-Id: <1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
In-Reply-To: <1305196419.2713.84.camel@localhost>
References: <1305196419.2713.84.camel@localhost>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The free space fixup was introduced so that UBIFS on NAND flashes where the
empty pages at the end need to be dropped when flashing or else -74
(aka -EBADMSG) failures will occur -- but due to the limited functionality of
flash-programming facilities the emtpy pages cannot be dropped.

In fixup_leb, which is called during free space fixup, the now-expected return
code of -EBADMSG is treated as a failure.

Don't fail when -EBADMSG is encountered during ubi_read.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Matthew L. Creech <mlcreech@gmail.com>

---
I tested this patch on-top-of l2 head : 'bbf2b37 UBIFS: fix extremely rare
mount failure' using Matthew's 'mkfs.ubifs: add "-F" option for "free-space
fixup"' patch to create the UBIFS image with the flag set.

The test system was a da850evm, the image was flashed with U-boot's plain-old
'nand write' and the rootfs is mounted with 'ubi.mtd=X,2048 root=ubi0:rootfs
rootfstype=ubifs' bootargs.

Without this patch the first attemp to start fixing free space fails
with -EBADMSG:

UBIFS: start fixing up free space
UBI error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 18:4096, read 4096 bytes
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
[...]

---
 fs/ubifs/sb.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index c606f01..6e7da54 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -1,3 +1,4 @@
+#define DEBUG
 /*
  * This file is part of UBIFS.
  *
@@ -679,7 +680,12 @@ static int fixup_leb(struct ubifs_info *c, int lnum, int len)
 
 	dbg_mnt("fixup LEB %d, data len %d", lnum, len);
 	err = ubi_read(c->ubi, lnum, c->sbuf, 0, len);
-	if (err)
+	/*
+	 * Don't fail on -EBADMSG since these are precisely the error codes that
+	 * are returned by ubi_red in the cases where free-space fix-ups are
+	 * required.
+	 */
+	if (err && err != -EBADMSG)
 		return err;
 
 	return ubi_leb_change(c->ubi, lnum, c->sbuf, len, UBI_UNKNOWN);
-- 
1.7.4.1
