Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTWA-00072U-Q1
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 23:00:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Daniel Walter <dwalter@sigma-star.at>, Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/4] Documentation for ubihealthd
Date: Fri,  6 Nov 2015 00:00:03 +0100
Message-Id: <1446764403-22742-5-git-send-email-richard@nod.at>
In-Reply-To: <1446764403-22742-1-git-send-email-richard@nod.at>
References: <1446764403-22742-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Daniel Walter <dwalter@sigma-star.at>

Add documentation for ubihealthd

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubi-utils/README.ubihealthd | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 ubi-utils/README.ubihealthd

diff --git a/ubi-utils/README.ubihealthd b/ubi-utils/README.ubihealthd
new file mode 100644
index 0000000..da4501a
--- /dev/null
+++ b/ubi-utils/README.ubihealthd
@@ -0,0 +1,39 @@
+# ubihealthd
+
+ubihealthd is a small daemon which monitors ubi devices.
+The main purpose of this daemon is to read and scrub
+all PEBs of a given device over a specified amount of time.
+Additionally if a PEBs was read above a given threshold
+the complete PEB will be read to detect and fix read-disturbs.
+
+## Basic Algorithm
+
+ubihealthd currently uses 2 lists to keep track of the PEB
+which should be read/scrubbed periodically.
+Additionally after each statistics update (default: every 60 seconds)
+a PEB read is performed if the number of reads since the last time
+passes a given threshold.
+In order to allow the daemon to operate after a reboot or restart of
+the daemon, the statistics are written to a given file on shutdown or
+as soon as a SIGUSR1 is received.
+
+## Statistics File format
+The statistics file is a binary format and written as follows.
+    * number of PEBs (int64_t)
+    * next scheduled PEB for reads (int64_t)
+    * next scheduled PEB for scrubbing (int64_t)
+    * dump of all PEBs (struct peb_info)
+
+## Usage:
+ubihealthd [OPTIONS]
+
+OPTIONS
+  -h, --help		Show this message
+  -d, --device		Device to be monitored (default: /dev/ubi0)
+  -f, --file		Path to statistics save file
+  -r, --read_complete	Timeframe for reading all PEBs in seconds
+  -s, --scrub_complete	Timeframe for scrubbing all PEBs in seconds
+  -x, --read_threshold	Number of reads between two stats updates
+                      	which will trigger a PEB read
+  -v, --verbosity	Set log level (0-4)
+
-- 
2.5.0
