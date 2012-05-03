Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ1G5-0004dO-G3
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 19:00:10 +0000
Received: by lagy4 with SMTP id y4so1844074lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 12:00:06 -0700 (PDT)
Date: Thu, 3 May 2012 21:59:59 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd-utils: Better document --pagesize of mkfs.jffs2
Message-ID: <20120503215959.374d0c34@halley>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Grant Edwards <grant.b.edwards@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a strict explanation '--pagesize' refers to target system's mm page
size.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---

This is according to the below discussion:
http://lists.infradead.org/pipermail/linux-mtd/2012-May/041233.html

diff --git a/mkfs.jffs2.1 b/mkfs.jffs2.1
index 9b0acc3..47a3ac7 100644
--- a/mkfs.jffs2.1
+++ b/mkfs.jffs2.1
@@ -137,7 +137,8 @@ directory.
 .TP
 .B -s, --pagesize=SIZE
 Use page size SIZE.  The default is 4 KiB.  This size is the
-maximum size of a data node.
+maximum size of a data node.  Set according to target system's memory
+management page size (NOTE: this is NOT related to NAND page size).
 .TP
 .B -e, --eraseblock=SIZE
 Use erase block size SIZE.  The default is 64 KiB.  If you use a erase
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index ad88ac6..d170a04 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1391,7 +1391,9 @@ static const char helptext[] =
 "                          not specified, the output is padded to the end of\n"
 "                          the final erase block\n"
 "  -r, -d, --root=DIR      Build file system from directory DIR (default: cwd)\n"
-"  -s, --pagesize=SIZE     Use page size (max data node size) SIZE (default: 4KiB)\n"
+"  -s, --pagesize=SIZE     Use page size (max data node size) SIZE.\n"
+"                          Set according to target system's memory management\n"
+"                          page size (default: 4KiB)\n"
 "  -e, --eraseblock=SIZE   Use erase block size SIZE (default: 64KiB)\n"
 "  -c, --cleanmarker=SIZE  Size of cleanmarker (default 12)\n"
 "  -m, --compr-mode=MODE   Select compression mode (default: priortiry)\n"
