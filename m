Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXX7A-0006LO-CB
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 08:40:11 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	n1C8dOFd026964
	for <linux-mtd@lists.infradead.org>; Thu, 12 Feb 2009 10:40:03 +0200
Message-ID: <4993E37E.7070702@nokia.com>
Date: Thu, 12 Feb 2009 10:53:18 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mkfs.ubifs: eliminate compiler warnings
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The warnings were:

lpt.c: In function ‘create_lpt’:
lpt.c:552: warning: format ‘%d’ expects type ‘int’, but argument 3 has type ‘long long int’
mkfs.ubifs.c: In function ‘do_openat’:
mkfs.ubifs.c:251: warning: ignoring return value of ‘chdir’, declared with attribute warn_unused_result
mkfs.ubifs.c: In function ‘get_options’:
mkfs.ubifs.c:542: warning: format not a string literal and no format arguments

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 mkfs.ubifs/lpt.c        |    2 +-
 mkfs.ubifs/mkfs.ubifs.c |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
index c8fb22c..f6d4352 100644
--- a/mkfs.ubifs/lpt.c
+++ b/mkfs.ubifs/lpt.c
@@ -549,7 +549,7 @@ int create_lpt(struct ubifs_info *c)
 	c->nhead_lnum = lnum;
 	c->nhead_offs = ALIGN(len, c->min_io_size);
 
-	dbg_msg(1, "lpt_sz:         %d", c->lpt_sz);
+	dbg_msg(1, "lpt_sz:         %lld", c->lpt_sz);
 	dbg_msg(1, "space_bits:     %d", c->space_bits);
 	dbg_msg(1, "lpt_lnum_bits:  %d", c->lpt_lnum_bits);
 	dbg_msg(1, "lpt_offs_bits:  %d", c->lpt_offs_bits);
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 6c4e912..bedf8a7 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -248,7 +248,8 @@ static int do_openat(int fd, const char *path, int flags)
 	ret = fchdir(fd);
 	if (ret != -1)
 		ret = open(path, flags);
-	chdir(cwd);
+	if (chdir(cwd) && !ret)
+		ret = -1;
 	free(cwd);
 	return ret;
 }
@@ -539,7 +540,7 @@ static int get_options(int argc, char**argv)
 			break;
 		case 'h':
 		case '?':
-			printf(helptext);
+			printf("%s", helptext);
 			exit(0);
 		case 'v':
 			verbose = 1;
-- 
1.5.6.3
