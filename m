Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBUqN-0002Er-J0
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 18:38:08 +0000
Received: by mail-ee0-f49.google.com with SMTP id d41so2573332eek.22
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 10:38:05 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] Typo fixes: avaiable -> available and priortiry ->
 priority
Date: Fri,  1 Mar 2013 19:37:40 +0100
Message-Id: <1362163060-5629-5-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
References: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
Cc: eliedebrauwer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
---
 mkfs.jffs2.1 |   10 +++++-----
 mkfs.jffs2.c |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/mkfs.jffs2.1 b/mkfs.jffs2.1
index 47a3ac7..7c57ddc 100644
--- a/mkfs.jffs2.1
+++ b/mkfs.jffs2.1
@@ -105,7 +105,7 @@ or the present directory, if the
 option is not specified.
 
 Each block of the files to be placed into the file system image
-are compressed using one of the avaiable compressors depending
+are compressed using one of the available compressors depending
 on the selected compression mode.
 
 File systems are created with the same endianness as the host,
@@ -209,21 +209,21 @@ successful one. The alternatives are:
 .B -x, --disable-compressor=NAME
 Disable a compressor. Use
 .B -L
-to see the list of the avaiable compressors and their default states.
+to see the list of the available compressors and their default states.
 .TP
 .B -X, --enable-compressor=NAME
 Enable a compressor. Use
 .B -L
-to see the list of the avaiable compressors and their default states.
+to see the list of the available compressors and their default states.
 .TP
 .B -y, --compressor-priority=PRIORITY:NAME
 Set the priority of a compressor. Use
 .B -L
-to see the list of the avaiable compressors and their default priority.
+to see the list of the available compressors and their default priority.
 Priorities are used by priority compression mode.
 .TP
 .B -L, --list-compressors
-Show the list of the avaiable compressors and their states.
+Show the list of the available compressors and their states.
 .TP
 .B -t, --test-compression
 Call decompress after every compress - and compare the result with the original data -, and
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index a33a0d6..7ade078 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1396,14 +1396,14 @@ static const char helptext[] =
 "                          page size (default: 4KiB)\n"
 "  -e, --eraseblock=SIZE   Use erase block size SIZE (default: 64KiB)\n"
 "  -c, --cleanmarker=SIZE  Size of cleanmarker (default 12)\n"
-"  -m, --compr-mode=MODE   Select compression mode (default: priortiry)\n"
+"  -m, --compr-mode=MODE   Select compression mode (default: priority)\n"
 "  -x, --disable-compressor=COMPRESSOR_NAME\n"
 "                          Disable a compressor\n"
 "  -X, --enable-compressor=COMPRESSOR_NAME\n"
 "                          Enable a compressor\n"
 "  -y, --compressor-priority=PRIORITY:COMPRESSOR_NAME\n"
 "                          Set the priority of a compressor\n"
-"  -L, --list-compressors  Show the list of the avaiable compressors\n"
+"  -L, --list-compressors  Show the list of the available compressors\n"
 "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
 "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
 "  -o, --output=FILE       Output to FILE (default: stdout)\n"
-- 
1.7.10.4
